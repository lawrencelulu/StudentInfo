package net.fuzui.StudentInfo.pojo;

public class SC implements java.io.Serializable {
    /**
     *  序列化
     */
    private static final long serialVersionUID = 1L;
    //id主键
    private Integer id;
    //学号
    private String sid;
    //课程编号
    private String cid;
    private String Courseclass;
    // 课程成绩
    private int grade;

    /**
     * 默认构造方法
     */
    public SC() {

    }

    /**
     *  置取方法
     */
    public String getCourseclass() {
        return Courseclass;
    }
    public void setCourseclass(String courseclass) {
        this.Courseclass = courseclass;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

}


