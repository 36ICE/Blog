package cn.jxufe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.jxufe.domain.Blog;
import cn.jxufe.domain.Page;
import cn.jxufe.domain.User;
import cn.jxufe.service.BlogService;


@Controller
@RequestMapping("")
public class InitController {

	@Autowired
	private BlogService blogService;
	/**
	 * 初始化整体页面的显示 
	 * @return
	 */

	@RequestMapping("/home")
	public String home(HttpServletRequest request,ModelMap model){
		
		String pageNow = request.getParameter("pageNow");
		Page page = null;
		int totalCount = blogService.getCount();
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));

			model.addAttribute("page", page);
			// 返回请求页
			List<Blog> blogList = blogService.showBlogListByPage(page.getStartPos(), page.getPageSize());
			request.setAttribute("blogList", blogList);
		} else {
			page = new Page(totalCount, 1);
			model.addAttribute("page", page);
			// 返回请求页
			List<Blog> blogList = blogService.showBlogListByPage(page.getStartPos(), page.getPageSize());
			request.setAttribute("blogList", blogList);
		}
		return "home";
	}
}
