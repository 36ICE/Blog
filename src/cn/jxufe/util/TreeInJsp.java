package cn.jxufe.util;

import java.util.List;

import cn.jxufe.domain.Blog_Comment;
import cn.jxufe.domain.Message_Comment;
import cn.jxufe.domain.User;

public class TreeInJsp {

	
	public String  showTree(List<Blog_Comment> blog_Comments,User user){
		String data=new String();
		int floor=0;
		for(Blog_Comment blog_Comment:blog_Comments){
			
			floor++;
			data+="<div class=\" panel panel-default\" style=\"\"><div class=\"panel-heading\">";
			//3楼 qq_23052951 昨天 00:50发表
			data+="<span style=\"background:gray;\"><p>"+floor+"楼 用户:"+blog_Comment.getBlogcom_userId() +"  在"+
			blog_Comment.getBlogcom_time()+"发表        ";
			//回复图标
			data+="<button type=\"button\" class=\"btn btn-default btn-sm\""+"id=\""+blog_Comment.getBlogcom_id()+"\""+
			" onclick=\"myrep(this.id)\"><span class=\"glyphicon glyphicon-pencil\""  +"aria-hidden=\"true\"></span>回复</button>";
			//是否有权限删除  博客评论的评论id等于现在的userid  或者博客的用户id等于现在的userid
			if(user.getUser_id()==blog_Comment.getBlogcom_userId()){
				//删除图标
				data+="<button type=\"button\" class=\"btn btn-default btn-sm\"><span class=\"glyphicon glyphicon-remove\"  "+"aria-hidden=\"true\"></span>删除</button>";
			}
			//显示内容
			data+="<p></span></div>"+"<div class=\"panel-body\"><p>评论: "+blog_Comment.getBlogcom_content()+"</p>";
			
			data+=addNode(blog_Comment,floor);
			
			
			data+="</div></div>";
		}
		
		
		return data;
	}
	//评论树的生成
	public String addNode(Blog_Comment blog_Comment,int floor){
		String dataChild="";
		if(blog_Comment.getChildNodes().size()>0){
			
			List<Blog_Comment> items=blog_Comment.getChildNodes();
			for(Blog_Comment item:items){
				
				dataChild+="<div class=\" panel panel-default\" style=\"width:98%;float:right;\"><div class=\"panel-heading\">";
				
				dataChild+="<span><p>"+item.getBlogcom_userId() +"  "+item.getBlogcom_time()+"发表          ";
				//回复图标
				dataChild+="<button type=\"button\" class=\"btn btn-default btn-sm\""+"id=\""+item.getBlogcom_id()+"\""+ "onclick=\"myrep(this.id)\"><span class=\"glyphicon glyphicon-pencil\"  "+"aria-hidden=\"true\" ></span>回复</button>";
				//删除图标
				dataChild+="<button type=\"button\" class=\"btn btn-default btn-sm\" ><span class=\"glyphicon glyphicon-remove\"  "+
				" aria-hidden=\"true\"></span>删除</button>";
				//显示内容
				dataChild+="<p></span></div> <div class=\"panel-body\"><p>回复"+blog_Comment.getBlogcom_userid()+":"+item.getBlogcom_content()+"</p>";
								
				dataChild+=addNode(item,  floor);
				
				dataChild+="</div></div>";
			}
			return dataChild;
		}else{
			return "";
		}
	}
	
	
	/**
	 * 留言树
	 */
	public String  showMessageTree(List<Message_Comment> message_Comments,User user){
		String data=new String();
		int floor=0;
		for(Message_Comment message_Comment:message_Comments){
			
			floor++;
			data+="<div class=\" panel panel-default\" style=\"\"><div class=\"panel-heading\">";
			//3楼 qq_23052951 昨天 00:50发表
			data+="<span style=\"background:gray;\"><p>"+floor+"楼 用户:"+message_Comment.getMessagecom_replyuserid() +"  在"+message_Comment.getMessagecom_time()+"发表        ";
			//回复图标
			data+="<button type=\"button\" class=\"btn btn-default btn-sm\""+"id=\""+message_Comment.getMessagecom_id()+"\""+" onclick=\"myrep(this.id)\"><span class=\"glyphicon glyphicon-pencil\""  +"aria-hidden=\"true\"></span>回复</button>";
			//是否有权限删除  博客评论的评论id等于现在的userid  或者博客的用户id等于现在的userid
			/*if(user.getUser_id()==message_Comment.getMessagecom_replyuserid() && message_Comment.getMessage_userid()==message_Comment.getMessagecom_replyuserid()){
				//删除图标
				data+="<button type=\"button\" class=\"btn btn-default btn-sm\"><span class=\"glyphicon glyphicon-remove\"  "+"aria-hidden=\"true\"></span>删除</button>";
			}*/
			//显示内容
			data+="<p></span></div>"+"<div class=\"panel-body\"><p>评论: "+message_Comment.getMessagecom_content()+"</p>";	
			data+=messageTreeAddNode(message_Comment,floor);
			data+="</div></div>";
		}
		
		
		return data;
	}
	//评论树的生成
	public String messageTreeAddNode(Message_Comment message_Comment,int floor){
		String dataChild="";
		if(message_Comment.getChildNodes().size()>0){			
			List<Message_Comment> items=message_Comment.getChildNodes();
			for(Message_Comment item:items){				
				dataChild+="<div class=\" panel panel-default\" style=\"width:98%;float:right;\"><div class=\"panel-heading\">";				
				dataChild+="<span><p>"+item.getMessagecom_replyuserid() +"  "+item.getMessagecom_time()+"发表          ";
				//回复图标
				dataChild+="<button type=\"button\" class=\"btn btn-default btn-sm\""+"id=\""+item.getMessagecom_id()+"\""+ "onclick=\"myrep(this.id)\"><span class=\"glyphicon glyphicon-pencil\"  "+"aria-hidden=\"true\" ></span>回复</button>";
				//删除图标
				/*dataChild+="<button type=\"button\" class=\"btn btn-default btn-sm\" ><span class=\"glyphicon glyphicon-remove\"  "+" aria-hidden=\"true\"></span>删除</button>";*/
				//显示内容
				dataChild+="<p></span></div> <div class=\"panel-body\"><p>回复:"+item.getMessagecom_content()+"</p>";								
				dataChild+=messageTreeAddNode(item,  floor);
				dataChild+="</div></div>";
			}
			return dataChild;
		}else{
			return "";
		}
	}
}
