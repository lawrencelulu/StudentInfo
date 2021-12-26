package net.fuzui.StudentInfo.pojo;

public class StuExitSelect implements java.io.Serializable {


    /**
     *  序列化
     */
    private static final long serialVersionUID = 1L;
    //课程编号
    private String cid;
    private String courseclass;
    //课程名称
    private String Cname;
    //学号
    private String sid;
    private String tname;
    private String semester;
    //总人数
    private Integer totalNum;
    private Integer cscore;
    //学生总数
    private Integer stuSum;
    // 课程成绩
    private int grade;
    private int isFeedback;
    private int isComment;

    public int getIsFeedback() {
        return isFeedback;
    }
    public void setIsFeedback(int isFeedback) {
        this.isFeedback = isFeedback;
    }
    public int getIsComment() {
        return isComment;
    }
    public void setIsComment(int isComment) {
        this.isComment = isComment;
    }
    public int getGrade() {
        return grade;
    }
    public void setGrade(int grade) {
        this.grade = grade;
    }
    public String getCourseclass() {
        return courseclass;
    }

    public void setCourseclass(String courseclass) {
        this.courseclass = courseclass;
    }
    public String getSemester() {
        return semester;
    }
    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }
    public String getCid() {
        return cid;
    }
    public void setCid(String cid) {
        this.cid = cid;
    }
    public String getCname() {
        return Cname;
    }
    public void setCname(String cname) {
        Cname = cname;
    }
    public String getSid() {
        return sid;
    }
    public void setSid(String sid) {
        this.sid = sid;
    }
    public void setStuSum(Integer stuSum) {
        this.stuSum = stuSum;
    }
    public Integer getStuSum() {
        return this.stuSum;
    }
    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }
    public Integer getTotalNum() {
        return this.totalNum;
    }
    public Integer getCscore() {
        return this.cscore;
    }

}

