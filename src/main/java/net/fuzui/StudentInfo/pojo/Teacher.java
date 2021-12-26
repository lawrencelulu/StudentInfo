package net.fuzui.StudentInfo.pojo;

public class Teacher implements java.io.Serializable{
    //序列化
    private static final long serialVersionUID = 1L;
    //教师编号
    private String tid;
    //教师姓名
    private String tname;
    //级别
    private String tlevel;
    // 手机号
    private String tphone;
    // 生日
    private String tbirthday;
    //教师密码
    private String tpassword;
    //教师性别
    private String tsex;
    //教师简介
    private String introduction;

    /**
     * 默认构造方法
     */
    public Teacher() {

    }

    /**
     *  置取方法
     */
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

    public String getTlevel() {
        return tlevel;
    }

    public void setTlevel(String tlevel) {
        this.tlevel = tlevel;
    }
    public String getTphone() {
        return tphone;
    }

    public void setTphone(String tphone) {
        this.tphone = tphone;
    }

    public String getTbirthday() {
        return tbirthday;
    }

    public void setTbirthday(String tbirthday) {
        this.tbirthday = tbirthday;
    }

    public String getTpassword() {
        return tpassword;
    }

    public void setTpassword(String tpassword) {
        this.tpassword = tpassword;
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

}
