package temp;

import java.sql.Timestamp;

public class Message {

	
	private int message_id;
	private String message_content;
	private Timestamp message_time;
	//是否已读状态 是 或 否
	private String  message_state;
	//博主编号
	private int receiver_id;
	//父留言
	private int message_parentid;
	//留言人
	private int message_userid;

}
