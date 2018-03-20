package cn.jxufe.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.jxufe.dao.Message_CommentDao;
import cn.jxufe.domain.Blog;
import cn.jxufe.domain.Blog_Comment;
import cn.jxufe.domain.Message_Comment;
import cn.jxufe.domain.User;
import cn.jxufe.service.BlogService;
import cn.jxufe.service.MessageService;
import cn.jxufe.service.UserService;
import cn.jxufe.util.MyTime;
import cn.jxufe.util.TreeInJsp;



/**
 * 
 * 
 * 留言控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private BlogService blogService;
	@Autowired
	private MessageService messageService;

	@Autowired
	private UserService userService;
	/**
	 * 创建留言
	 * @return  利用ajax 刷新局部留言
	 */
	@RequestMapping("/createMessage")
	public String craeateMessage(HttpServletRequest request,int message_userid,ModelMap model,int messagecom_parentid){
		String messagecom_content=request.getParameter("messagecom_content");
		
		try {
			messagecom_content=URLDecoder.decode(messagecom_content,"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session =request.getSession();
		User myuser=(User)session.getAttribute("myuser");
		
		Message_Comment message_Comment=new Message_Comment();
		message_Comment.setMessage_userid(message_userid);
		message_Comment.setMessagecom_replyuserid(myuser.getUser_id());
		message_Comment.setMessagecom_content(messagecom_content);
		message_Comment.setMessagecom_state("否");
		message_Comment.setMessagecom_time(new MyTime().getNowTimestamp());
		message_Comment.setMessagecom_parentid(messagecom_parentid);
		
		try {
			messageService.addComment(message_Comment);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		
		
		
		User user = userService.getUser(message_userid);	
		model.addAttribute("user", user);
		List<Message_Comment> message_Comments=messageService.getMessage_Comment(message_userid);	
		TreeInJsp treeInjsp=new TreeInJsp();
		String data =treeInjsp.showMessageTree(message_Comments,user);
		model.addAttribute("data", data);
		
		
		//显示分类模块
		try {
			List<String> strBlog_TypeList=blogService.getBlog_TypeList(user.getUser_id());
			model.addAttribute("strBlog_TypeList", strBlog_TypeList);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(myuser.getUser_id());
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "message/showMessage";
	}
	
	/**
	 * 
	 * 回复留言即评论
	 * 
	 * @param 回复的留言id
	 * @return  利用ajaxg局部刷新评论
	 */
	@RequestMapping("/createReply")
	public String createReply(){
		
		
		return "showReply";
	}
	/**
	 * 
	 * 删除留言信息
	 * @return
	 */
	@RequestMapping("/deleteMessage")
	public String deleteMessage(){
		return "deleteMessageSuccess";
	}
	/**
	 * 删除回复信息
	 * @return   ajax局部刷新
	 * 
	 */
	@RequestMapping("deleteReply")
	public String deleteReply(){
		return "";
	}
	@RequestMapping("showMessage")
	public String showMessage(HttpServletRequest request ,ModelMap model,int user_id){	
		User user = userService.getUser(user_id);	
		model.addAttribute("user", user);
		
		HttpSession session =request.getSession();
		User myuser=(User)session.getAttribute("myuser");
		
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(user_id);
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//显示分类模块
		try {
			List<String> strBlog_TypeList=blogService.getBlog_TypeList(user.getUser_id());
			model.addAttribute("strBlog_TypeList", strBlog_TypeList);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		List<Message_Comment> message_Comments=messageService.getMessage_Comment(user_id);	
		TreeInJsp treeInjsp=new TreeInJsp();
		String data =treeInjsp.showMessageTree(message_Comments,user);
		model.addAttribute("data", data);
		return "message/showMessage";
	}
	
	
	
}
