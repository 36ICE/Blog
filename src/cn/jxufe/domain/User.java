package cn.jxufe.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;
/**
 * 
 * @author Administrator
 * 博主的个人信息
 */
public class User {

	@NotNull(message = "不为空")
	private int user_id;
	
	@NotNull(message = "用户名不为空")
	private String user_name;
	
	@NotNull(message = "密码不为空")
	private String user_password;
	
	private Timestamp user_registertime;
	//private int age;
	
	private Date user_birthday;
	
	private String user_sex;
	
	private String user_mail;
	
	private String user_job;

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public Timestamp getUser_registertime() {
		return user_registertime;
	}

	public void setUser_registertime(Timestamp user_registertime) {
		this.user_registertime = user_registertime;
	}

	public Date getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(Date user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	public String getUser_job() {
		return user_job;
	}

	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}
	
	

	
}

