package cn.jxufe.service;

import java.util.List;

import cn.jxufe.domain.Message_Comment;

public interface MessageService {

	List<Message_Comment> getChildMessage_Comment(Message_Comment node,
			int messagecom_id);

	List<Message_Comment> getMessage_Comment(int blog_id);

	int addComment(Message_Comment message_Comment)throws Exception;

}
