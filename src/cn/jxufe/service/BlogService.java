package cn.jxufe.service;

import java.util.List;

import cn.jxufe.domain.Blog;
import cn.jxufe.domain.User;

public interface BlogService {

	public int addBlog(Blog blog) throws Exception ;

	int getCount(User user);

	List<Blog> showBlogListByPage(User user, int startPos, int pageSize);

	Blog showBlog(int blog_id);

	int getCount();

	List<Blog> showBlogListByPage(int startPos, int pageSize);

	String changeRecommend(int blog_id) throws Exception;

	int isRecommend(int blog_id) throws Exception;

	int editBlog(Blog blog);

	List<Blog> showRecomBlogs(int user_id, int startPos, int pageSize);

	int getCount(int user_id);

	int deleteBlog(int blog_id);

	int readTimesCount(int blog_id) throws Exception;

	List<Blog> readTimesRank(int user_id) throws Exception;

	List<String> getBlog_TypeList(int user_id)throws Exception;

	int addBlog_Type(String blog_type_name, int blog_user_id)throws Exception;
}
