package net.fuzui.StudentInfo.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.fuzui.StudentInfo.pojo.Survey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.fuzui.StudentInfo.service.CoursePlanService;
import net.fuzui.StudentInfo.service.CourseService;
import net.fuzui.StudentInfo.service.SurveyService;
import net.fuzui.StudentInfo.service.StudentService;
import net.fuzui.StudentInfo.service.TeacherService;

@Controller
@RequestMapping("/AjaxHandler")
public class AjaxHandler {
	@Autowired
    CourseService courseService;
	@Autowired
	StudentService studentService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	CoursePlanService coursePlanService;
	@Autowired
	SurveyService surveyService;
	
	/**
	 * ajax验证课程编号是否存在
	 * @param cid
	 * @param response
	 * @param request
	 * @throws IOException
	 */
	@RequestMapping(value="/existCid",method = RequestMethod.POST)
	public void existCid(@RequestParam("cid") String cid,HttpServletResponse response,HttpServletRequest request) throws IOException{
		System.out.println("课程编号="+cid);
 
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		System.out.println(cid+"----------");
		PrintWriter out=null;
		
		out=response.getWriter();
		if(courseService.getByCouCid(cid) != null && cid !=null && !"".equals(cid)){
			out.println("课程编号已存在");
		}else if(cid !=null && !"".equals(cid)){
			out.println("此课程编号可以使用");
		}else {
			out.println("课程编号不能为空");
		}
		out.flush();
		out.close();
		
	}
	
	@RequestMapping(value="/existSid",method = RequestMethod.POST)
	public void existSid(@RequestParam("sid") String sid,HttpServletResponse response,HttpServletRequest request) throws IOException{
		System.out.println("学号="+sid);
 
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out=null;
		
		out=response.getWriter();
		if(studentService.getByStuSid(sid) != null && sid.length()==10){
			out.println("学号已存在");
		}else if(sid.length() ==10){
			out.println("学号可以使用");
		}else {
			out.println("学号必须是10位");
		}
		out.flush();
		out.close();
		
	}

	// 课程评价
	@RequestMapping(value = "/updateSurvey", method = RequestMethod.POST)
	public void updateSurvey(Survey survey, HttpServletResponse response,HttpServletRequest request)  throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out=null;
		out=response.getWriter();
		if (surveyService.updateSurvey(survey) != 0) {
			out.println("success");
		}
		out.flush();
		out.close();
	}
	// 开启课中评价
	@RequestMapping(value = "/updateCoursePlanComment", method = RequestMethod.POST)
	public void updateSurvey(@RequestParam("courseclass") String courseclass, HttpServletResponse response,HttpServletRequest request)  throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out=null;
		out=response.getWriter();
		if (coursePlanService.updateCoursePlanComment(courseclass) != 0) {
			out.println("success");
		}
		System.out.println(courseclass);
		out.flush();
		out.close();
	}

	//ajax验证教师id
	@RequestMapping(value="/existTid",method = RequestMethod.POST)
	public void existTid(@RequestParam("tid") String tid,HttpServletResponse response,HttpServletRequest request) throws IOException{
 
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out=null;
		
		out=response.getWriter();
		if(teacherService.getByTeaTid(tid) != null && tid.length() <=5){
			out.println("教师编号已存在");
		}else if(tid.length() <=12){
			out.println("教师编号可以使用");
		}else {
			out.println("教师编号必须小于等于5位");
		}
		out.flush();
		out.close();
		
	}

	
	@RequestMapping(value="/existTime",method = RequestMethod.POST)
	public void existTime(@RequestParam("coursetime") String coursetime,@RequestParam("courseweek") String courseweek,
			@RequestParam("classroom") String classroom,HttpServletResponse response,HttpServletRequest request) throws IOException{
 
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out=null;
		System.out.println("--------------------------");
		System.out.println(coursetime+"---"+courseweek+"---"+classroom);
		out=response.getWriter();
		if(coursePlanService.ajaxGetCoursePlan(coursetime,courseweek,classroom) != null){
			out.println("此功能排重正在开发中.....");
		}else {
			out.println("此功能排重正在开发中.....");
		}
		out.flush();
		out.close();
		
	}
	
}
