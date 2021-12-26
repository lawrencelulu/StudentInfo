package net.fuzui.StudentInfo.pojo;

public class Course implements java.io.Serializable{
    /**
     *  序列化
     */
    private static final long serialVersionUID = 1L;
    //课程编号
    private String cid;
    //课程名称
    private String cname;
    // 课程学分
    private int cscore;
    //课程先编号
    private String cpid;
    // 课程先修课
    private String cprecourse;
    // 课程先修课名称
    private String cpname;
    //课程介绍
    private String cintroduction;
    //类型
    private String type;
    //所属学院
    private String belongcoll;
    //所属专业
    private String belongpro;

    /**
     * 默认构造方法
     */
    public Course() {

    }

    /**
     *  置取方法
     */
    public String getCid() {
        return cid;
    }
    public void setCid(String cid) {
        this.cid = cid;
    }
    public String getCpid() {
        return cpid;
    }
    public void setCpid(String cpid) {
        this.cpid = cpid;
    }
    public String getCname() {
        return cname;
    }
    public void setCscore(int cscore) {
        this.cscore = cscore;
    }
    public int getCscore() {
        return cscore;
    }
    public void setCname(String cname) {
        this.cname = cname;
    }
    public String getCprecourse() {
        return cprecourse;
    }
    public String getCpname() {
        return cpname;
    }
    public void setCpname(String cpname) {
        this.cpname = cpname;
    }
    public void setCprecourse(String cprecourse) {
        this.cprecourse = cprecourse;
    }
    public String getCintroduction() {
        return cintroduction;
    }
    public void setCintroduction(String cintroduction) {
        this.cintroduction = cintroduction;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getBelongcoll() {
        return belongcoll;
    }
    public void setBelongcoll(String belongcoll) {
        this.belongcoll = belongcoll;
    }
    public String getBelongpro() {
        return belongpro;
    }
    public void setBelongpro(String belongpro) {
        this.belongpro = belongpro;
    }


}

