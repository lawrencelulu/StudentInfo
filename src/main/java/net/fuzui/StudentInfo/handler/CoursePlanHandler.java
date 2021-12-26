package net.fuzui.StudentInfo.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.fuzui.StudentInfo.pojo.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.fuzui.StudentInfo.pojo.Course;
import net.fuzui.StudentInfo.pojo.Teacher;
import net.fuzui.StudentInfo.pojo.CoursePlan;
import net.fuzui.StudentInfo.service.CoursePlanService;
import net.fuzui.StudentInfo.service.CourseService;
import net.fuzui.StudentInfo.service.TeacherService;

@Controller
@RequestMapping("/CoursePlanHandler")
public class CoursePlanHandler {

	@Autowired
	CoursePlanService coursePlanService;
	@Autowired
    CourseService courseService;
	@Autowired
	TeacherService teacherService;

	//添加课程方案
	@RequestMapping("/doaddcouplan")
	public ModelAndView addCoursePlan(@RequestParam("cid") String cid, @RequestParam("tid") String tid, @RequestParam("courseclass") String courseclass, @RequestParam("semester") String semester, Model model,HttpSession httpSession) {
		if (tid == "") return new ModelAndView(new RedirectView("/StudentInfo/fail.jsp"));
		String[] tidList = tid.split(",");
		for (String tidItem : tidList) {
			CoursePlan courselan = new CoursePlan();
			courselan.setCid(cid);
			courselan.setTid(tidItem);
			courselan.setSemester(semester);
			courselan.setCourseclass(courseclass);
			if (coursePlanService.insertCoursePlan(courselan) != 0) {
				System.out.println(courselan);
			} else {
				return new ModelAndView(new RedirectView("/StudentInfo/fail.jsp"));
			}
		}
		return new ModelAndView(new RedirectView("/StudentInfo/AdminHandler/managecou/1"));
	}

	//查询课程方案
	@RequestMapping(value = "/querycouplan/{cid}", method = RequestMethod.GET)
	public String deleteStudent(@PathVariable(value = "cid") String cid, Model model, HttpSession session, HttpServletRequest request) {
		
//		if(coursePlanService.existsCoursePlan(cid) != null) {
//			request.setAttribute("msg", "该课程已经有老师代课，无法选择此课程！");
//			return "fail";
//		}
		List<Teacher> teacherList = new ArrayList<Teacher>();
		teacherList = teacherService.selectTeacherBySql(1,10);
		request.setAttribute("teacherList", teacherList);
		model.addAttribute("cid", cid);
		System.out.println(cid);
		return "admin/newClass";

	}

	//跳转
	@RequestMapping("/addquery/{pn}")
	public String adStudent(@PathVariable(value = "pn") String pn,Model model,HttpSession httpSession) {
		int no = Integer.parseInt(pn);
		List<Course> courseList = new ArrayList<Course>();
		PageHelper.startPage(no, 5);
		courseList = courseService.selectCourseBySql(1,10);
		pageIn(model, courseList);
		httpSession.setAttribute("courseList", courseList);
		return "admin/addClass";
	}
	
	
	public void pageIn(Model model,List list) {
 		PageInfo page = new PageInfo(list, 5);
	 	model.addAttribute("pageInfo", page);
 	}
	
	//查询所有课程方案
	@RequestMapping(value = "/queryy/{pn}", method = RequestMethod.GET)
	public String redirect(@RequestParam("serc") String serc, @RequestParam("condition") String condition,
			Model model, HttpSession httpSession,@PathVariable(value = "pn") String pn,HttpServletRequest request) {

		int no = Integer.parseInt(pn);
		List<Course> courseList = new ArrayList<Course>();
		PageHelper.startPage(no, 5);
		request.setAttribute("serc", serc);
		request.setAttribute("condition", condition);
		
		
		if (serc.equals("all")) {

			courseList = courseService.selectCourseBySql(1,10);
			pageIn(model, courseList);
			httpSession.setAttribute("courseList", courseList);
			System.out.println(courseList);
			return "teacher/addCou";

		} else if (serc.equals("sid")) {

			courseList = courseService.getByCourseCid(1,10,condition);
			pageIn(model, courseList);
			httpSession.setAttribute("courseList", courseList);
			System.out.println("sid");

			return "teacher/addCou";

		} else if (serc.equals("nam")) {
			courseList = courseService.getByCourseCname(1,10,condition);
			pageIn(model, courseList);
			httpSession.setAttribute("courseList", courseList);
			System.out.println(courseList);
			System.out.println("cla");
			return "teacher/addCou";

		} else if (serc.equals("col")) {
			courseList = courseService.getByCourseCol(1,10,condition);
			pageIn(model, courseList);
			httpSession.setAttribute("courseList", courseList);
			System.out.println(courseList);
			System.out.println("col");
			return "teacher/addCou";

		} else if (serc.equals("type")) {
			courseList = courseService.getByCourseType(1,10,condition);
			pageIn(model, courseList);
			httpSession.setAttribute("courseList", courseList);
			System.out.println(courseList);
			System.out.println("pro");
			return "teacher/addCou";

		} else {

			courseList = courseService.selectCourseBySql(1,10);
			pageIn(model, courseList);
			httpSession.setAttribute("courseList", courseList);
			System.out.println(courseList);
			return "teacher/addCou";

		}

	}

	//修改课程方案
	@RequestMapping("/modicouplan/{courseclass}")
	public String modiCouPlan(@PathVariable(value = "courseclass") String courseclass, Model model,
			HttpSession httpSession) {
		
		List<CoursePlan> cPlanList = new ArrayList<CoursePlan>();

		cPlanList = coursePlanService.getByCoursePlanCourseclass(1,10,courseclass);

		if (cPlanList != null) {
			httpSession.setAttribute("cPlanList", cPlanList);
			System.out.println(cPlanList);
			return "admin/modCouPlan";

		} else {
			return "fail";
		}

	}

	//修改
	@RequestMapping("/moditycouplan/{tid}")
	public ModelAndView modityCouPlan(@PathVariable(value = "tid") String tid, CoursePlan coursePlan) {

		if (coursePlanService.modifyCoursePlan(coursePlan) != 0) {
			return new ModelAndView(new RedirectView("/StudentInfo/TeacherHandler/managecou/{tid}/1"));
		} else {

			return new ModelAndView(new RedirectView("/StudentInfo/fail.jsp"));
		}
	}

	//删除
	@RequestMapping("/delcouplan/{courseclass}")
	public ModelAndView modityCouPlan(@PathVariable(value = "courseclass") String courseclass,
			HttpSession httpSession) {
		

		if (coursePlanService.deleteCoursePlan(courseclass) != 0) {
			
			httpSession.removeAttribute("couList");
			httpSession.removeAttribute("coursePlanList");
			return new ModelAndView(new RedirectView("/StudentInfo/AdminHandler/managecou/1"));
		} else {

			return new ModelAndView(new RedirectView("/StudentInfo/fail.jsp"));
		}
	}

}
