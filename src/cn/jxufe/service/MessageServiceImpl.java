package cn.jxufe.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.dao.Message_CommentDao;
import cn.jxufe.domain.Blog_Comment;
import cn.jxufe.domain.Message_Comment;
import temp.MessageDao;


@Service
@Transactional
public class MessageServiceImpl implements MessageService{

	@Autowired
	public  Message_CommentDao message_CommentDao;
	
	
	@Override
	public List<Message_Comment> getMessage_Comment(int blog_id){
		
		List<Message_Comment> RootNodes=message_CommentDao.queryComment(blog_id);
		
		for(Message_Comment item:RootNodes){
			
			item.setChildNodes(getChildMessage_Comment( item, item.getMessagecom_id()));
		}
		return RootNodes;
	}
	@Override
	public List<Message_Comment> getChildMessage_Comment(Message_Comment node,int messagecom_id){
		List<Message_Comment> treeNodes=new ArrayList<>();
		
		List<Message_Comment> childNodes=message_CommentDao.queryChildComment(messagecom_id);
		
		if(childNodes.size()>0){
			
			for(Message_Comment item:childNodes){
				
				item.setChildNodes(getChildMessage_Comment( item,item.getMessagecom_id()));
			}
			treeNodes.addAll(childNodes);
			return treeNodes;
		}else{
			return treeNodes;
		}
	}
	@Override
	public int addComment(Message_Comment message_Comment)throws Exception{
		return message_CommentDao.addComment(message_Comment);
	}
}
