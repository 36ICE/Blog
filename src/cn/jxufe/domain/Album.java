package cn.jxufe.domain;

import java.sql.Timestamp;


/**
 * 相册的实体
 * @author Administrator
 *
 */
public class Album {

	//相册id
	private int album_id;
	//相册名
	private String album_name;
	//博主id
	private int user_id;


	private Timestamp album_time;
	
	private String album_islocked;
	
	private String album_password;

	private String album_pic;
	
	public String getAlbum_pic() {
		return album_pic;
	}

	public void setAlbum_pic(String album_pic) {
		this.album_pic = album_pic;
	}

	public int getAlbum_id() {
		return album_id;
	}

	public void setAlbum_id(int album_id) {
		this.album_id = album_id;
	}

	public String getAlbum_name() {
		return album_name;
	}

	public void setAlbum_name(String album_name) {
		this.album_name = album_name;
	}

	

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Timestamp getAlbum_time() {
		return album_time;
	}

	public void setAlbum_time(Timestamp album_time) {
		this.album_time = album_time;
	}

	public String getAlbum_islocked() {
		return album_islocked;
	}

	public void setAlbum_islocked(String album_islocked) {
		this.album_islocked = album_islocked;
	}

	public String getAlbum_password() {
		return album_password;
	}

	public void setAlbum_password(String album_password) {
		this.album_password = album_password;
	}
	
	
	
}
