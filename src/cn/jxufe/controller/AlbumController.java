package cn.jxufe.controller;



import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.jxufe.domain.Album;
import cn.jxufe.domain.Blog;
import cn.jxufe.domain.Photo;
import cn.jxufe.domain.User;
import cn.jxufe.service.AlbumService;
import cn.jxufe.service.BlogService;
import cn.jxufe.service.UserService;
import cn.jxufe.util.MyTime;



@Controller
@RequestMapping("/album")
public class AlbumController {

	@Autowired
	private BlogService blogService;
	@Autowired
	private UserService userService;
	@Autowired
	private AlbumService albumService;
	

	/**
	 * 
	 * 上传照片
	 * @param request
	 * @return
	 */
	@RequestMapping("/uploadPhoto")
	public String uploadPhoto(HttpServletRequest request,String photoPaths,int album_id,ModelMap model){
		
		
		HttpSession session =request.getSession();
		User myuser=(User)session.getAttribute("myuser");
		List<Photo> photos=new ArrayList<>();
		//for(int i=0;i< photoPaths.size();i++){
			Photo photo=new Photo();
			photo.setAlbum_id(album_id);
			photo.setPhoto_path(photoPaths);
			photos.add(photo);
		//}
		albumService.addPhotos(photos);
		
		//显示照片
		List<Photo> photoList=albumService.showPhoto(album_id);
		model.addAttribute("photoList", photoList);
		
		
	 	request.setAttribute("user", myuser);
	 	
	 	Album album=albumService.getAlbum(album_id);
	 	model.addAttribute("album", album);
		
		//显示分类模块
		try {
			List<String> strBlog_TypeList=blogService.getBlog_TypeList(myuser.getUser_id());
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
		return "album/showAlbum";
	}
	
	/**
	 * 
	 * 显示相片
	 * @return
	 */
	@RequestMapping("/showAlbum")
	public String showAlbum(HttpServletRequest request,int album_id,int user_id,ModelMap model){
		
		List<Photo> photoList=albumService.showPhoto(album_id);
		model.addAttribute("photoList", photoList);
		User user=userService.getUser(user_id);	 
	 	request.setAttribute("user", user);
		//显示分类模块
		try {
			List<String> strBlog_TypeList=blogService.getBlog_TypeList(user.getUser_id());
			model.addAttribute("strBlog_TypeList", strBlog_TypeList);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(user_id);
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 	Album album=albumService.getAlbum(album_id);
	 	model.addAttribute("album", album);
		return "album/showAlbum";
	}
	/**
	 * 删除照片
	 * @return
	 */
	@RequestMapping("/deletePhoto")
	public String deletePhoto(HttpServletRequest request,int album_id,int photo_id, int user_id,ModelMap model){
		albumService.deletePhoto(photo_id);
		
		List<Photo> photoList=albumService.showPhoto(album_id);
		model.addAttribute("photoList", photoList);
		
		
		
		User user=userService.getUser(user_id);	 
	 	request.setAttribute("user", user);
	 	Album album=albumService.getAlbum(album_id);
	 	model.addAttribute("album", album);
		//显示分类模块
		try {
			List<String> strBlog_TypeList=blogService.getBlog_TypeList(user.getUser_id());
			model.addAttribute("strBlog_TypeList", strBlog_TypeList);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(user_id);
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "album/showAlbum";
	}
	/**
	 * 
	 * 删除相册
	 * @return
	 */
	@RequestMapping("/deleteAlbum")
	public String deleteAlbum(HttpServletRequest request,int album_id,int user_id,ModelMap model){
		
		albumService.deleteAlbum(album_id);
		
		List<Album> albumList=albumService.showAlbumList(user_id);
		model.addAttribute("albumList", albumList);
		User user=userService.getUser(user_id);	 
	 	request.setAttribute("user", user);
		//显示分类模块
		try {
			List<String> strBlog_TypeList=blogService.getBlog_TypeList(user.getUser_id());
			model.addAttribute("strBlog_TypeList", strBlog_TypeList);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(user_id);
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "album/showAlbumList";
	}
	/**
	 * 显示相册
	 * @return
	 */
	@RequestMapping("/showAlbumList")
	public String showAlbum(HttpServletRequest request,int user_id,ModelMap model){
		
		List<Album> albumList=albumService.showAlbumList(user_id);
		model.addAttribute("albumList", albumList);
		
		User user=userService.getUser(user_id);	 
	 	request.setAttribute("user", user);
		//显示分类模块
		try {
			List<String> strBlog_TypeList=blogService.getBlog_TypeList(user.getUser_id());
			model.addAttribute("strBlog_TypeList", strBlog_TypeList);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			List<Blog> rankBlogList =blogService.readTimesRank(user_id);
			request.setAttribute("rankBlogList", rankBlogList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "album/showAlbumList";
	}
	
	
	/**
	 * 
	 * 创建相册
	 * @return
	 */
	@RequestMapping(value="/createAlbum",produces = "text/html;charset=UTF-8")
	public String createAlbum(HttpServletRequest request,ModelMap model){
		
		String album_name=(String)request.getParameter("album_name");
		try {
			album_name=URLDecoder.decode(album_name,"utf-8");
			
			HttpSession session =request.getSession();
			User myuser=(User)session.getAttribute("myuser");
			Album album=new Album();
			album.setAlbum_name(album_name);
			album.setAlbum_time(new MyTime().getNowTimestamp());
			album.setUser_id(myuser.getUser_id());
			album.setAlbum_islocked("否");
			album.setAlbum_pic("/Blog/img/pic-none.png");
			albumService.addAlbum(album);
			
			int user_id=myuser.getUser_id();
			
			List<Album> albumList=albumService.showAlbumList(user_id);
			model.addAttribute("albumList", albumList);
			
			User user=userService.getUser(user_id);	 
		 	request.setAttribute("user", user);
			//显示分类模块
			try {
				List<String> strBlog_TypeList=blogService.getBlog_TypeList(user.getUser_id());
				model.addAttribute("strBlog_TypeList", strBlog_TypeList);
				
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				List<Blog> rankBlogList =blogService.readTimesRank(user_id);
				request.setAttribute("rankBlogList", rankBlogList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
		
		return "album/showAlbumList";
	}
	
	
	/**
	 * 修改相册名之类的或者分类名
	 * @return
	 */
	@RequestMapping(value="alterAlbum",method=RequestMethod.POST)
	public String alterAlbum(){
		
		
		return "alterAlbumSuccess";
	}
}
