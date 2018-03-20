package cn.jxufe.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import cn.jxufe.domain.Article;
import cn.jxufe.domain.Blog;
import cn.jxufe.domain.Blog_Comment;
import cn.jxufe.domain.Blog_type;
import cn.jxufe.domain.Page;
import cn.jxufe.domain.User;
import cn.jxufe.service.BlogService;
import cn.jxufe.service.Blog_CommentService;
import cn.jxufe.service.UserService;
import cn.jxufe.util.MyTime;
import cn.jxufe.util.TreeInJsp;
import cn.jxufe.util.ValidationUtils;

@Controller
@RequestMapping("blog")
public class BlogController {

	@Autowired
	private BlogService blogService;
	@Autowired
	private Blog_CommentService blog_CommentService;
	@Autowired
	private UserService userService;
	//修改博文
	@RequestMapping("/editBlogPage")
	public String editBlogPage(HttpServletRequest request,int blog_id,ModelMap model){
		Map<String, Object> map=new HashMap<String, Object>();
		
		String strblog_type="";
		if(blog_id!=0){
			Blog blog=blogService.showBlog(blog_id);
			
			model.addAttribute("blog", blog);
			strblog_type=blog.getBlog_type_name();
			
		}else{
			Blog_type blog_type=new Blog_type();
			blog_type.setBlog_type_name("请选择");
			model.addAttribute("blog_type", blog_type);
		}
		HttpSession session = request.getSession();
		User myuser=(User)session.getAttribute("myuser");
	
		
		//显示分类模块
		try {
			List<String> strBlog_TypeList=blogService.getBlog_TypeList(myuser.getUser_id());
			model.addAttribute("strBlog_TypeList", strBlog_TypeList);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		//评论排行
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(myuser.getUser_id());
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user", myuser);

		 Map<String, String> blog_typeMap = new HashMap<String, String>();  
		 //select默认值得
		 try {
			 List<String> blog_TypeList=blogService.getBlog_TypeList(myuser.getUser_id());
			int i=0;
			if(blog_id!=0){
				blog_typeMap.put(strblog_type, strblog_type);
			}
			
			for (String blog_type:blog_TypeList) {
				i++;
				if(blog_type!=strblog_type){
					blog_typeMap.put(blog_type, blog_type);
				}
			}
			model.addAttribute("blog_typeMap", blog_typeMap);
			   
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		  
		return"article/editBlog";
	}
	@RequestMapping("/manageBlogPage")
	public String manageBlogPage(HttpServletRequest request,ModelMap model){
		Map<String, Page> map = new HashMap<String, Page>();
		String pageNow = request.getParameter("pageNow");
		Page page = null;	
			HttpSession session = request.getSession();
			User myuser=(User)session.getAttribute("myuser");
		
			model.addAttribute("user", myuser);
			
			
			//显示所有博客分类
			 try {
				List<String> blog_TypeList=blogService.getBlog_TypeList(myuser.getUser_id());
				
				request.setAttribute("blog_TypeList", blog_TypeList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			int totalCount = blogService.getCount(myuser);
			
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
				//map.put("page",page);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(myuser,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			} else {
				page = new Page(totalCount, 1);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(myuser,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			}
		return "article/manageBlog";
	}
	
	
	@RequestMapping("/changeRecommend")
	public String changeRecommend(HttpServletRequest request, ModelMap model,int blog_id) {

		try {
			blogService.changeRecommend(blog_id);
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		String pageNow = request.getParameter("pageNow");
		Page page = null;
		HttpSession session = request.getSession();
		User myuser = (User) session.getAttribute("myuser");

		model.addAttribute("user", myuser);

		
		
		
		//显示所有博客分类
		 try {
			List<String> blog_TypeList=blogService.getBlog_TypeList(myuser.getUser_id());
			
			request.setAttribute("blog_TypeList", blog_TypeList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		int totalCount = blogService.getCount(myuser);

		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			// map.put("page",page);
			model.addAttribute("page", page);
			// 返回请求页
			List<Blog> blogList = blogService.showBlogListByPage(myuser,
					page.getStartPos(), page.getPageSize());
			request.setAttribute("blogList", blogList);
		} else {
			page = new Page(totalCount, 1);
			model.addAttribute("page", page);
			// 返回请求页
			List<Blog> blogList = blogService.showBlogListByPage(myuser,
					page.getStartPos(), page.getPageSize());
			request.setAttribute("blogList", blogList);
		}
		return "article/manageBlog";

	}

	@RequestMapping("/editBlog")
	public String editBlog(HttpServletRequest request, Blog blog, ModelMap model) {

		HttpSession session = request.getSession();
		User myuser=(User)session.getAttribute("myuser");
		model.addAttribute("user", myuser);
		
		User user = userService.getUser(myuser.getUser_id());
		
		blog.setUser_id(myuser.getUser_id());
		blogService.editBlog(blog);
		model.addAttribute("blog", blog);
		
		// 评论排行
		try {
			List<Blog> rankBlogList = blogService.readTimesRank(myuser
					.getUser_id());
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
		
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(user.getUser_id());
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("user", user);
	
		List<Blog_Comment> blog_Comments=blog_CommentService.getBlog_Comment(blog.getBlog_id());
		
		//model.addAttribute("blog_Comments", blog_Comments);
		
		TreeInJsp treeInjsp=new TreeInJsp();
		String data =treeInjsp.showTree(blog_Comments,user);
		model.addAttribute("data", data);
		return "article/showBlog";
	}
	
	//增加博文
	@RequestMapping("/addBlog")
	public String addBlog(HttpServletRequest request, ModelMap model,Blog blog) throws Exception{
		List<String> errors = ValidationUtils.validator(blog);
		HttpSession session = request.getSession();
		User myuser=(User)session.getAttribute("myuser");
		if (errors == null) {
			
			blog.setUser_id(myuser.getUser_id());
			blog.setBlog_recommend("否");
			
			blog.setBlog_time(new MyTime().getNowTimestamp());
	        
			blogService.addBlog(blog);
			request.setAttribute("blog", blog);
			model.addAttribute("user", myuser);
			
			// 评论排行
			try {
				List<Blog> rankBlogList = blogService.readTimesRank(myuser
						.getUser_id());
				request.setAttribute("rankBlogList", rankBlogList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//显示分类模块
			try {
				List<String> strBlog_TypeList=blogService.getBlog_TypeList(myuser.getUser_id());
				model.addAttribute("strBlog_TypeList", strBlog_TypeList);
				
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return "article/showBlog";
		} else {
			request.setAttribute("errors", errors);
			return "article/showBlog";
		}
	}
	@RequestMapping("/showBlog")
	public String showBlog(HttpServletRequest request ,ModelMap model,int blog_id,int blog_userid){
		
		Blog blog=blogService.showBlog(blog_id);
		
		model.addAttribute("blog", blog);
		
		User user = userService.getUser(blog_userid);
		
		
		// 评论排行
		try {
			List<Blog> rankBlogList = blogService.readTimesRank(user.getUser_id());
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			blogService.readTimesCount(blog_id);
			
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
		
		
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(blog_userid);
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("user", user);
	
		List<Blog_Comment> blog_Comments=blog_CommentService.getBlog_Comment(blog_id);
		
		//model.addAttribute("blog_Comments", blog_Comments);
		
		TreeInJsp treeInjsp=new TreeInJsp();
		String data =treeInjsp.showTree(blog_Comments,user);
		model.addAttribute("data", data);
		return "article/showBlog";
	}
	
	//显示摘要视图  按照不同分类或者不分类查询显示
	@RequestMapping("/showBlogList")
	public String showBlogList(){


		
		return "article/showBlogList";
	}

	@RequestMapping("/deleteBlog")
	public String deleteBlog(HttpServletRequest request,ModelMap model,int blog_id){

		//删除
		blogService.deleteBlog(blog_id);
		
		Map<String, Page> map = new HashMap<String, Page>();
		String pageNow = request.getParameter("pageNow");
		Page page = null;
			
			HttpSession session = request.getSession();
			User myuser=(User)session.getAttribute("myuser");
		
			model.addAttribute("user", myuser);
			
			int totalCount = blogService.getCount(myuser);
			
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
				//map.put("page",page);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(myuser,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			} else {
				page = new Page(totalCount, 1);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(myuser,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			}
			try {
				List<Blog> rankBlogList =blogService.readTimesRank(myuser.getUser_id());
				request.setAttribute("rankBlogList", rankBlogList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//可以返回到初始
		return "article/manageBlog";
	}
	//ajax局部刷新
	//删除评论
	@RequestMapping("/deleteComment")
	public String deleteComment(){
		
		return "article/showBlog";
	}
	//增加评论
	@RequestMapping("/addComment")
	public String addComment(HttpServletRequest request ,ModelMap model,int blog_id,int user_id,int blogcom_parentid){
		
		String blogcom_content=(String)request.getParameter("blogcom_content");
		//避免js以url方式传中文时乱码
		try {
			blogcom_content=URLDecoder.decode(blogcom_content,"utf-8");
			
		} catch (UnsupportedEncodingException e1) {			
			e1.printStackTrace();
		}
		//Blog_Comment实例
		Blog_Comment blog_Comment=new Blog_Comment();
	    blog_Comment.setBlogcom_content(blogcom_content);
		blog_Comment.setBlogcom_parentid(blogcom_parentid);
		blog_Comment.setBlogcom_userid(user_id);
		blog_Comment.setBlog_id(blog_id);
		blog_Comment.setBlogcom_time(new MyTime().getNowTimestamp());
		blog_Comment.setBlogcom_state("否");
		try {
			blog_CommentService.addBlog_Comment(blog_Comment);			
		} catch (Exception e) {			
			e.printStackTrace();
		}	
		
		Blog blog=blogService.showBlog(blog_Comment.getBlog_id());	
		model.addAttribute("blog", blog);		
		
		HttpSession session = request.getSession();
		User myuser=(User)session.getAttribute("myuser");	
		User user = userService.getUser(user_id);		
		model.addAttribute("user", user);	
		List<Blog_Comment> blog_Comments=blog_CommentService.getBlog_Comment(blog_Comment.getBlog_id());
		
		TreeInJsp treeInjsp=new TreeInJsp();
		String data =treeInjsp.showTree(blog_Comments,user);
		model.addAttribute("data", data);	
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(user_id);
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "article/showBlog";
	}
	//删除回复
	public String deleteReply(){
		
		return"article/showBlog";
	}
	
	//增加回复
	public String addreply(){
		
		return "article/showBlog";
	}
	

	@RequestMapping("/showRecommend")
	public String showRecommend(HttpServletRequest request,ModelMap model,int blog_userid){
		Map<String, Page> map = new HashMap<String, Page>();
		String pageNow = request.getParameter("pageNow");
		Page page = null;	
			HttpSession session = request.getSession();
			User myuser=(User)session.getAttribute("myuser");
		
			User user=userService.getUser(blog_userid);
			model.addAttribute("user", user);
			
			int totalCount = blogService.getCount(user);
			
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
				//map.put("page",page);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showRecomBlogs(blog_userid,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			} else {
				page = new Page(totalCount, 1);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showRecomBlogs(blog_userid,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			}
			try {
				List<Blog> rankBlogList =blogService.readTimesRank(blog_userid);
				request.setAttribute("rankBlogList", rankBlogList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "article/showRecommend";
	}
	@RequestMapping("/addBlog_Type")
	public String addBlog_Type(HttpServletRequest request,String blog_type_name,ModelMap model){
		
		
		Map<String, Page> map = new HashMap<String, Page>();
		String pageNow = request.getParameter("pageNow");
		Page page = null;	
			HttpSession session = request.getSession();
			User myuser=(User)session.getAttribute("myuser");
		
			model.addAttribute("user", myuser);
				
			//增加博客类别
			try {
				blogService.addBlog_Type(blog_type_name, myuser.getUser_id());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//显示所有博客分类
			 try {
				List<String> blog_TypeList=blogService.getBlog_TypeList(myuser.getUser_id());
				
				request.setAttribute("blog_TypeList", blog_TypeList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int totalCount = blogService.getCount(myuser);
			
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
				//map.put("page",page);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(myuser,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			} else {
				page = new Page(totalCount, 1);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(myuser,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			}
		
		return "article/manageBlog";
	}

}
