package cn.jxufe.controller;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.support.RequestContext;

import cn.jxufe.common.Constant;
import cn.jxufe.core.utils.PropertiesUtil;
import cn.jxufe.domain.Article;
import cn.jxufe.domain.User;
import cn.jxufe.service.ArticleService;
import cn.jxufe.util.ValidationUtils;

@Controller
@RequestMapping("/article")
public class ArticleController {
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/index")
	public String testIndex()throws Exception{
		return "index";
	}
	@RequestMapping("/save")
	public String addArticle(HttpServletRequest request, Article article) throws Exception{
		List<String> errors = ValidationUtils.validator(article);
		if (errors == null) {
			System.out.println("标题：" + article.getTitle());
			articleService.addArticle(article);
			request.setAttribute("article", article);
			return "article/addSuccess";
		} else {
			request.setAttribute("errors", errors);
			return "article/addSuccess";
		}

	}

	@RequestMapping("/beforeAdd")
	public String beforeAdd() {
		return "article/beforeAdd";
	}

	@RequestMapping("/beforeAdd2")
	public String beforeAdd2() {
		return "article/beforeAddByAttach";
	}

	/**
	 * 文件上传
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save2", method = RequestMethod.POST)
	public String uploadFile(MultipartHttpServletRequest request,
			Article article) {
		try {
			System.out.println("标题:" + article.getTitle());
			PropertiesUtil pUtil = PropertiesUtil
					.createPropertiesUtil(Constant.UPLOADPATH_FILE);
			List<MultipartFile> files = request.getFiles("myFile");
			
			System.out.println("文件的个数：" + files.size());
			// 通过配置文件得到上传路径
			String uploadpath = request.getSession().getServletContext()
					.getRealPath(pUtil.getProperty(Constant.UPLOADPATH_PATH));
			System.out.println("uploadpath :" + uploadpath);
			List<String> fileNameList = new ArrayList<String>();
			int no = 1;
			for (MultipartFile file : files) {
				if (file.isEmpty())
					continue;
				System.out.println("文件名称：" + file.getOriginalFilename());
				fileNameList.add(file.getOriginalFilename());
				//FileOutputStream fileOS = new FileOutputStream(uploadpath + "/"
				//		+ file.getOriginalFilename());
				// 一般来说需要对文件进行改名,下面的为时间+序号
				 FileOutputStream fileOS = new FileOutputStream(uploadpath +
				 "/"
				 + (new Date()).getTime()+"_"+no+"_"+file.getOriginalFilename());
				fileOS.write(file.getBytes());
				fileOS.close();
				no = no + 1;
			}
			request.setAttribute("fileNameList", fileNameList);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return "article/addSuccess";
	}

	/**
	 * ajax文件上传
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajaxUpload", method = RequestMethod.POST)
	@ResponseBody
	public String ajaxUploadFile(MultipartHttpServletRequest request,
			Article article) throws Exception {
		System.out.println("标题:" + article.getTitle());
		PropertiesUtil pUtil = PropertiesUtil
				.createPropertiesUtil(Constant.UPLOADPATH_FILE);
		List<MultipartFile> files = request.getFiles("myFile");
		System.out.println("文件的个数：" + files.size());
		// 通过配置文件得到上传路径
		String uploadpath = request.getSession().getServletContext()
				.getRealPath(pUtil.getProperty(Constant.UPLOADPATH_PATH));
		System.out.println("uploadpath :" + uploadpath);
		List<String> fileNameList = new ArrayList<String>();
		int no = 1;
		for (MultipartFile file : files) {
			if (file.isEmpty())
				continue;
			System.out.println("文件名称：" + file.getOriginalFilename());
			fileNameList.add(file.getOriginalFilename());
			// fileOS = new FileOutputStream(uploadpath + "/"
			//		+ file.getOriginalFilename());
			// 一般来说需要对文件进行改名,下面的为时间+序号
			 FileOutputStream fileOS = new FileOutputStream(uploadpath + "/"
			 + (new Date()).getTime()+"_"+no+"_"+file.getOriginalFilename());
			fileOS.write(file.getBytes());
			fileOS.close();
			no = no + 1;
		}
		return "article/ajaxSuccess";
	}

	/**
	 * 测试Session方式的国际化配置
	 * 
	 * @param request
	 * @param model
	 * @param langType
	 * @return
	 */
	@RequestMapping(value = "/test", method = { RequestMethod.GET })
	public String test(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model,
			@RequestParam(value = "langType", defaultValue = "zh") String langType) {
		System.out.println("--------------------" + langType);
		if (!model.containsAttribute("contentModel")) {

			if (langType.equals("zh")) {
				Locale locale = new Locale("zh", "CN");
				// request.getSession().setAttribute(
				// SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,
				// locale);
				// (new CookieLocaleResolver()).setLocale (request, response,
				// locale);
			} else if (langType.equals("en")) {
				Locale locale = new Locale("en", "US");
				// request.getSession().setAttribute(
				// SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,
				// locale);
				// (new CookieLocaleResolver()).setLocale (request, response,
				// locale);
			} else {
				// request.getSession().setAttribute(
				// SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,
				// LocaleContextHolder.getLocale());
				// (new CookieLocaleResolver()).setLocale (request, response,
				// LocaleContextHolder.getLocale());
			}
			// 从后台代码获取国际化信息

			RequestContext requestContext = new RequestContext(request);

			model.addAttribute("title", requestContext.getMessage("title"));
			model.addAttribute("content", requestContext.getMessage("content"));

			Article formatModel = new Article();
			formatModel.setTitle("测试文章标题");
			formatModel.setContent("测试文章内容");

			model.addAttribute("contentModel", formatModel);
		}
		System.out.println("--------------------");
		return "article/globaltest";
	}
	/**
	 * json数据的测试
	 * @param article
	 * @return
	 */
	@RequestMapping(value = "/ajax",method = {RequestMethod.POST })  
	@ResponseBody
	public Map<String,Object> ajax(@RequestBody Article article ){
		System.out.println("------"+article);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("code", "001");
		map.put("name", "张三");
		List list=new ArrayList();
		list.add("abc");
		list.add("ddd");
		map.put("user", list);
		map.put("article", article);
		System.out.println(article.getContent());
		return map;
	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception ex, HttpServletRequest request) {
		Map<Object, Object> model = new HashMap<Object, Object>();
		if (ex instanceof MaxUploadSizeExceededException) {
			model.put("errors", "文件应不大于 "
					+ getFileKB(((MaxUploadSizeExceededException) ex)
							.getMaxUploadSize()));
		} else {
			System.out.println(ex.getMessage());
			model.put("errors", "未知错误: " + ex.getMessage());
		}
		return new ModelAndView("article/beforeAddByAttach", (Map) model);

	}

	private String getFileKB(long byteFile) {
		if (byteFile == 0)
			return "0KB";
		long kb = 1024;
		return "" + byteFile / kb + "KB";
	}

	private String getFileMB(long byteFile) {
		if (byteFile == 0)
			return "0MB";
		long mb = 1024 * 1024;
		return "" + byteFile / mb + "MB";
	}

	/**
	 * 阅读量排行
	 * @return
	 */
	@RequestMapping("/rankArticle")
	public String rankArticle(){
		
		return "";
	}
	
	/**
	 * 评论量排行
	 * @param  用户
	 * @return
	 */
	@RequestMapping("/rankComment")
	public String rankComment(){
		
		return "";
	}
	
	/**
	 * 模板页的初始化，返回数据
	 * @param   用户
	 * @return
	 */
	@RequestMapping("/template")
	public String template(){
		return "";
	}
}
