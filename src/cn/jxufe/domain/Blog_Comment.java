package cn.jxufe.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Blog_Comment {

	
	private int blogcom_id;
	private String blogcom_content;
	private Timestamp blogcom_time;
	private String blogcom_state;
	
	//评论者id
	
	private int blogcom_userid;
	
	//评论父id
	private int blogcom_parentid;
	//博客id
	private int  blog_id;
	
	private List childNodes=new ArrayList<>();
	
	public int getBlogcom_userid() {
		return blogcom_userid;
	}
	public void setBlogcom_userid(int blogcom_userid) {
		this.blogcom_userid = blogcom_userid;
	}

	public List getChildNodes() {
		return childNodes;
	}
	public void setChildNodes(List childNodes) {
		this.childNodes = childNodes;
	}
	public int getBlogcom_id() {
		return blogcom_id;
	}
	public void setBlogcom_id(int blogcom_id) {
		this.blogcom_id = blogcom_id;
	}
	public String getBlogcom_content() {
		return blogcom_content;
	}
	public void setBlogcom_content(String blogcom_content) {
		this.blogcom_content = blogcom_content;
	}
	public Timestamp getBlogcom_time() {
		return blogcom_time;
	}
	public void setBlogcom_time(Timestamp blogcom_time) {
		this.blogcom_time = blogcom_time;
	}
	public String getBlogcom_state() {
		return blogcom_state;
	}
	public void setBlogcom_state(String blogcom_state) {
		this.blogcom_state = blogcom_state;
	}
	
	public int getBlogcom_userId() {
		return blogcom_userid;
	}
	public void setBlogcom_userId(int blogcom_userId) {
		this.blogcom_userid = blogcom_userId;
	}
	public int getBlogcom_parentid() {
		return blogcom_parentid;
	}
	public void setBlogcom_parentid(int blogcom_parentid) {
		this.blogcom_parentid = blogcom_parentid;
	}
	public int getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}

}
