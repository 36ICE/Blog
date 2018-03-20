package cn.jxufe.domain;

import java.sql.Timestamp;

public class Photo_Comment {

	private int photocom_id;
	private String photocom_content;
	private Timestamp photocom_time;
	private String photocom_state;
	//父评论者编号
	private int photocom_parentid;
	//图片编号
	private int photo_id;
	//评论者id
	private int photocom_userid;
	public int getPhotocom_id() {
		return photocom_id;
	}
	public void setPhotocom_id(int photocom_id) {
		this.photocom_id = photocom_id;
	}
	public String getPhotocom_content() {
		return photocom_content;
	}
	public void setPhotocom_content(String photocom_content) {
		this.photocom_content = photocom_content;
	}
	public Timestamp getPhotocom_time() {
		return photocom_time;
	}
	public void setPhotocom_time(Timestamp photocom_time) {
		this.photocom_time = photocom_time;
	}
	public String getPhotocom_state() {
		return photocom_state;
	}
	public void setPhotocom_state(String photocom_state) {
		this.photocom_state = photocom_state;
	}
	public int getPhotocom_parentid() {
		return photocom_parentid;
	}
	public void setPhotocom_parentid(int photocom_parentid) {
		this.photocom_parentid = photocom_parentid;
	}
	public int getPhoto_id() {
		return photo_id;
	}
	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}
	public int getPhotocom_userid() {
		return photocom_userid;
	}
	public void setPhotocom_userid(int photocom_userid) {
		this.photocom_userid = photocom_userid;
	}

	
}
