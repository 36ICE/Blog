package cn.jxufe.controller;

import java.nio.channels.FileChannel.MapMode;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import cn.jxufe.domain.Blog;
import cn.jxufe.domain.Page;
import cn.jxufe.domain.User;
import cn.jxufe.domain.UserList;
import cn.jxufe.service.BlogService;
import cn.jxufe.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	private UserService userService;

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/quitLogin")
	public String quitLogin(HttpServletRequest request){
		HttpSession session = request.getSession();
		//去除登录信息，变为游客
		session.removeAttribute("myuser");
		return "user/login";
	}
	
	@RequestMapping("/login")
	public String login(){
		
		return "user/login";
	}
	@RequestMapping("/index")
	public String index(HttpServletRequest request,ModelMap model,int  blog_userid ){
		Map<String, Page> map = new HashMap<String, Page>();
		String pageNow = request.getParameter("pageNow");
		Page page = null;

		if(blog_userid !=0){
			User user = userService.getUser(blog_userid);
			int totalCount = blogService.getCount(user);

			model.addAttribute("user", user);
			try {
				List<Blog> rankBlogList =blogService.readTimesRank(blog_userid);
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
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(user,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			} else {
				page = new Page(totalCount, 1);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(user,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			}
			//return "home";
			return "user/index";
		}else{
			return "home";
		}
	}
	/**
	 * 
	 * @param userName userPassword 验证用户名和密码的正确性
	 * @return  首页登录成功跳转到首页
	 */
	@RequestMapping("/checkUser")
	public String  checkUser(HttpServletRequest request,ModelMap model,User user){
		Map<String, Page> map = new HashMap<String, Page>();
		String pageNow = request.getParameter("pageNow");
		Page page = null;

		if (userService.checkUser(user) != 0) {

			user = userService.getUser(user.getUser_name());
			HttpSession session = request.getSession();
			session.setAttribute("myuser", user);
		
			model.addAttribute("user", user);
			
			int totalCount = blogService.getCount(user);
			
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
				//map.put("page",page);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(user,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			} else {
				page = new Page(totalCount, 1);
				model.addAttribute("page", page);
				// 返回请求页
				List<Blog> blogList = blogService.showBlogListByPage(user,
						page.getStartPos(), page.getPageSize());
				request.setAttribute("blogList", blogList);
			}

			try {
				List<Blog> rankBlogList =blogService.readTimesRank(user.getUser_id());
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
			return "user/index";

		} else {
			return "errors/all";

		}
		
	}
	
	
	@RequestMapping("/checkUser_name")
	public Map<String, String> checkUser(HttpServletRequest request,String  user_name){
		 Map<String, String> map = new HashMap<String, String>(); 
	        
		if(userService.checkUser_name(user_name)!=0){
			
			map.put("message", "正确"); 
	        
		}else{
			map.put("message", "错误"); 
	      
		}
		return map;
	}
	/**
	 * 修改用户信息
	 * @param request 
	 * @param user  用户
	 * @return
	 */
	@RequestMapping("/alterUserInfo")
	public  String  alterUserUInfo(HttpServletRequest request ,ModelMap model){

		HttpSession session = request.getSession();
		User myuser = (User) session.getAttribute("myuser");

		 String struser_birthday=request.getParameter("user_birthday");
		Timestamp user_birthday= Timestamp.valueOf(struser_birthday);
		String user_mail = (String) request.getParameter("user_mail");
		String user_job = (String) request.getParameter("user_job");
		String user_sex = (String) request.getParameter("user_sex");

		User user = new User();
		user.setUser_id(myuser.getUser_id());
		user.setUser_birthday(user_birthday);
		user.setUser_job(user_job);
		user.setUser_mail(user_mail);
		user.setUser_sex(user_sex);

		System.out.println("alterUserInfo" + user_mail + user_job + user_sex);
		if (userService.alterUser(user) == 1) {
			myuser = userService.getUser(myuser.getUser_id());
			request.setAttribute("myuser", myuser);
			request.setAttribute("user", myuser);
			//显示分类模块
			try {
				List<String> strBlog_TypeList=blogService.getBlog_TypeList(myuser.getUser_id());
				model.addAttribute("strBlog_TypeList", strBlog_TypeList);
			} catch (Exception e1) {
						// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return "user/showInfo";
		} else {
			return "erros/all";
		}
	        
	}
   
	@InitBinder
	public void initBinder(HttpServletRequest request,
            ServletRequestDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}
 
	@RequestMapping("/alterUserPage")
	public String alterUserPage(HttpServletRequest request,ModelMap model){
		
		HttpSession session=request.getSession();
		User myuser=(User)session.getAttribute("myuser");
		model.addAttribute("user", myuser);
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(myuser.getUser_id());
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
		return "user/alterUserPage";
	}
	@RequestMapping("/showInfo")
	public String showinfo(HttpServletRequest request,int user_id,ModelMap model){
		User user=userService.getUser(user_id);	 
	 	request.setAttribute("user", user);
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
		return "user/showInfo";
	}

	/**
	 * 修改用户密码
	 * @param request
	 * @param user 用户
	 * @return 返回用户信息界面 userInfo
	 */
	@RequestMapping("/alterPassword")
	public String alterUserPassword(HttpServletRequest request,String newPassword,ModelMap model){
		HttpSession session=request.getSession();
		User myuser=(User)session.getAttribute("myuser");
		if(userService.alterUserPassword(newPassword, myuser)==1){
			myuser=userService.getUser(myuser.getUser_id());
			request.setAttribute("myuser", myuser);
	 		request.setAttribute("user", myuser);
		}
		
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(myuser.getUser_id());
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
        return "user/showInfo";
	}
	
	//Spring MVC中使用JSON，先必需引用两个包：jackson-core-asl-1.9.13.jar、jackson-mapper-asl-1.9.13.jar
	@RequestMapping(value="/checkoldPassword",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkoldPassword(HttpServletRequest request,
			 String oldPassword,ModelMap model){
		 Map<String, String> map = new HashMap<String, String>(); 
		 HttpSession session=request.getSession();
			User myuser=(User)session.getAttribute("myuser");
			System.out.println(oldPassword);
			if(userService.checkoldPassword(myuser.getUser_id(), oldPassword)==1){
				map.put("message", "true");   
			}
			//显示分类模块
			try {
				List<String> strBlog_TypeList=blogService.getBlog_TypeList(myuser.getUser_id());
				model.addAttribute("strBlog_TypeList", strBlog_TypeList);
				
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return map;
	}

	@RequestMapping("alterUserPasswordPage")
	public String alterUserPasswordPage(HttpServletRequest request,ModelMap model){
		HttpSession session=request.getSession();
		User myuser=(User)session.getAttribute("myuser");
		model.addAttribute("user", myuser);
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(myuser.getUser_id());
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
		return "user/alterUserPasswordPage";
	}
	@RequestMapping("/register")
	public String register(){
		
		
		return "user/register";
	}
	@RequestMapping("/checkRegister")
	public String checkRegister(HttpServletRequest request,User user){
		if(userService.register(user)!=0){
			return "user/login";
		}else{
			return "errors/all";
		}
		
	}
}
