package cn.jxufe.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.dao.BlogDao;
import cn.jxufe.domain.Blog;
import cn.jxufe.domain.User;


@Service
@Transactional
public class BlogServiceImpl implements BlogService {

	@Autowired
	public BlogDao blogDao;
	@Override
	public int addBlog(Blog blog) throws Exception{
		blogDao.addBlog(blog);
		
		return 1;
	}
	//分页处理
	@Override
	public List<Blog> showBlogListByPage(User user,int startPos,int pageSize){
		List<Blog> temps=blogDao.queryBlogs(user.getUser_id());
		List<Blog> blogs=new ArrayList<>();
		for(int i= startPos;temps.size() > i && i<startPos+pageSize ;i++){
			blogs.add(temps.get(i));
		}
		return blogs;
	}
	@Override
	public List<Blog> showBlogListByPage(int startPos,int pageSize){
		List<Blog> temps=blogDao.queryBlogs();
		List<Blog> blogs=new ArrayList<>();
		for(int i= startPos;temps.size() > i && i<startPos+pageSize ;i++){
			blogs.add(temps.get(i));
		}
		return blogs;
	}
	@Override
	public int getCount(User user){	
		return blogDao.queryBlogs(user.getUser_id()).size();
	}
	@Override
	public int getCount(){
		return blogDao.queryBlogs().size();
	}
	@Override
	public int getCount(int user_id){
		return blogDao.queryRecomBlogs(user_id).size();
	}
	@Override
	public Blog showBlog(int blog_id){
		
		return blogDao.queryBlog(blog_id);
	}

	@Override
	public int deleteBlog(int blog_id){
		return blogDao.deleteBlog(blog_id);
	}
	@Override
	public String changeRecommend(int blog_id) throws Exception{
		
		return blogDao.changeRecommend(blog_id, blogDao.isRecommend(blog_id));
		
	}
	@Override
	public int isRecommend(int blog_id) throws Exception{
		return blogDao.isRecommend(blog_id);
	}
	@Override
	public int editBlog(Blog blog){
		
		return blogDao.alterBlog(blog);
	}
	@Override
	public List<Blog> showRecomBlogs(int user_id,int startPos,int pageSize){
		List<Blog> temps=blogDao.queryRecomBlogs(user_id);
		List<Blog> blogs=new ArrayList<>();
		for(int i= startPos;temps.size() > i && i<startPos+pageSize ;i++){
			blogs.add(temps.get(i));
		}
		
		return blogs;
	}
	//阅读量
	@Override
	public int readTimesCount(int blog_id) throws Exception{
		return blogDao.alterCount(blog_id);
	}
	//阅读排名,获取前五个
	@Override
	public List<Blog> readTimesRank(int user_id) throws Exception{
		return blogDao.countRank(user_id);
	}
	@Override
	public List<String> getBlog_TypeList(int user_id) throws Exception{
		return blogDao.getBlog_TypeList(user_id);
	}
	@Override
	public int addBlog_Type(String blog_type_name,int blog_user_id) throws Exception{
		return blogDao.addBlog_Type(blog_type_name, blog_user_id);
	}
}
