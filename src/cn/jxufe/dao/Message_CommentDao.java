package cn.jxufe.dao;

import java.util.List;

import cn.jxufe.domain.Message_Comment;

public interface Message_CommentDao {

	int addComment(Message_Comment message_Comment)throws Exception ;

	

	int delete(int[] messagecom_ids);

	List<Message_Comment> queryComment(int message_userid);



	List<Message_Comment> queryChildComment(int messagecom_id);

}
