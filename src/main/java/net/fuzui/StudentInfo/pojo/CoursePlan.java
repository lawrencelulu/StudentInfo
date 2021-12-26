package net.fuzui.StudentInfo.pojo;

import java.util.List;

public class CoursePlan implements java.io.Serializable {
    /**
     *  序列化
     */
    private static final long serialVersionUID = 1L;
    private int cpid;
    //开课班级
    private String courseclass;
    //上课时间
    private String coursetime;
    //上课周
    private String courseweek;
    //课程编号
    private String cid;
    //课程编号
    private String cname;
    //课程先修课Id
    private String precourse;
    private String precourseName;
    //教师编号
    private String tid;
    //教师名称
    private String tname;
    // 上课学期
    private String semester;
    //上课教室
    private String classroom;
    //学分
    private String credits;
    //学时
    private String period;
    //总人数
    private String totalnum;

    //先修课列表
    private List<Course> precourseList;

    /**
     * 默认构造方法
     */
    public CoursePlan() {

    }

    /**
     *  置取方法
     */
    public void setCpid(int cpid) {
        this.cpid = cpid;
    }
    public int getCpid() {
        return cpid;
    }
    public List<Course> getPrecourseList() {
        return precourseList;
    }
    public void setPrecourseList(List<Course> precourseList) {
        this.precourseList = precourseList;
    }
    public String getCourseclass() {
        return courseclass;
    }

    public void setCourseclass(String courseclass) {
        this.courseclass = courseclass;
    }

    public String getCoursetime() {
        return coursetime;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public void setCoursetime(String coursetime) {
        this.coursetime = coursetime;
    }

    public String getCourseweek() {
        return courseweek;
    }

    public void setCourseweek(String courseweek) {
        this.courseweek = courseweek;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public String getPrecourse() {
        return precourse;
    }
    public String getPrecourseName() {
        return precourseName;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public String getCredits() {
        return credits;
    }

    public void setCredits(String credits) {
        this.credits = credits;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getTotalnum() {
        return totalnum;
    }

    public void setTotalnum(String totalnum) {
        this.totalnum = totalnum;
    }

}

