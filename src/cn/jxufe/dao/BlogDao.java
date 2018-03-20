package cn.jxufe.dao;

import java.util.List;

import cn.jxufe.domain.Blog;
import cn.jxufe.domain.Blog_Comment;

public interface BlogDao {


	int deleteBlog(int blog_id) ;

	int addBlog(Blog blog) throws Exception;

	List<Blog> queryBlogs(String blog_type_name, int user_id);

	List<Blog> queryBlogs(int user_id);

	Blog queryBlog(int blog_id);

	int alterBlog(Blog blog);

	List<Blog> queryBlogs();

	int isRecommend(int blog_id) throws Exception;

	String changeRecommend(int blog_id, int flag);

	List<Blog> queryRecomBlogs(int user_id);

	int alterCount(int blog_id)throws Exception;

	List<Blog> countRank(int user_id)throws Exception;

	List<String> getBlog_TypeList(int user_id)throws Exception;

	int addBlog_Type(String blog_type_name, int blog_user_id)throws Exception;

	

}
