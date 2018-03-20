package cn.jxufe.domain;

import java.sql.Timestamp;


public class Blog {

	//博客id
	private int blog_id;
	
	//博客名
	private String blog_title;
	//博客内容
	private String blog_content;
	
	/*
	 * 
	          对应java中的java.sql.Timestamp类型（注意命名空间）。
		保存到数据库这样做：
		Timestamp.valueOf("时间");注意时间的格式为：yyyy-MM-dd hh:mm:ss
		从数据库取值用Timestamp保存即可。
	 */
	//创建博客时间
	private Timestamp blog_time;
	//阅读次数
	private int blog_readtimes;
	//blog_type_id;
	private int user_id;
	//是否被推荐 是 或 否
	private String blog_recommend;
	//博客类型
	private String blog_type_name;
	public int getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}
	public String getBlog_title() {
		return blog_title;
	}
	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}
	public String getBlog_content() {
		return blog_content;
	}
	public void setBlog_content(String blog_content) {
		this.blog_content = blog_content;
	}
	public Timestamp getBlog_time() {
		return blog_time;
	}
	public void setBlog_time(Timestamp blog_time) {
		this.blog_time = blog_time;
	}
	public int getBlog_readtimes() {
		return blog_readtimes;
	}
	public void setBlog_readtimes(int blog_readtimes) {
		this.blog_readtimes = blog_readtimes;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getBlog_recommend() {
		return blog_recommend;
	}
	public void setBlog_recommend(String blog_recommend) {
		this.blog_recommend = blog_recommend;
	}
	public String getBlog_type_name() {
		return blog_type_name;
	}
	public void setBlog_type_name(String blog_type_name) {
		this.blog_type_name = blog_type_name;
	}

	
}
