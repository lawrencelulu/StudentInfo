package net.fuzui.StudentInfo.pojo;

import java.util.List;

public class Survey implements java.io.Serializable {
	/**
	 *  序列化
	 */
	private int id;
	private static final long serialVersionUID = 1L;
	private String courseclass;
	private String sid;
	private String tid;
	private String tname;
	private String cname;
	private String feedback;
	private String reply;
	private Integer slevel;
	public Survey() {

	}

	/**
	 *  置取方法
	 */
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public String getCourseclass() {
		return courseclass;
	}
	public void setCourseclass(String courseclass) {
		this.courseclass = courseclass;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getCname() {
		return cname;
	}
}

