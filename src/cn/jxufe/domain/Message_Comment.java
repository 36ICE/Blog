package cn.jxufe.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Message_Comment {

	
	private int messagecom_id;
	private String messagecom_content;
	private Timestamp messagecom_time;
	//是否已读状态 是 或 否
	private String  messagecom_state;
	//留言人id
	private int messagecom_replyuserid;
	//父留言
	private int messagecom_parentid;
	//博主id
	private int message_userid;
	private List childNodes=new ArrayList<>();
	
	public List getChildNodes() {
		return childNodes;
	}
	public void setChildNodes(List childNodes) {
		this.childNodes = childNodes;
	}
	public int getMessagecom_id() {
		return messagecom_id;
	}
	public void setMessagecom_id(int messagecom_id) {
		this.messagecom_id = messagecom_id;
	}
	public String getMessagecom_content() {
		return messagecom_content;
	}
	public void setMessagecom_content(String messagecom_content) {
		this.messagecom_content = messagecom_content;
	}
	public Timestamp getMessagecom_time() {
		return messagecom_time;
	}
	public void setMessagecom_time(Timestamp messagecom_time) {
		this.messagecom_time = messagecom_time;
	}
	public String getMessagecom_state() {
		return messagecom_state;
	}
	public void setMessagecom_state(String messagecom_state) {
		this.messagecom_state = messagecom_state;
	}
	public int getMessagecom_replyuserid() {
		return messagecom_replyuserid;
	}
	public void setMessagecom_replyuserid(int messagecom_replyuserid) {
		this.messagecom_replyuserid = messagecom_replyuserid;
	}
	public int getMessagecom_parentid() {
		return messagecom_parentid;
	}
	public void setMessagecom_parentid(int messagecom_parentid) {
		this.messagecom_parentid = messagecom_parentid;
	}
	public int getMessage_userid() {
		return message_userid;
	}
	public void setMessage_userid(int message_userid) {
		this.message_userid = message_userid;
	}
	
	
}
