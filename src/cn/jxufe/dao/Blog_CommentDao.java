package cn.jxufe.dao;

import java.util.List;

import cn.jxufe.domain.Blog_Comment;

public interface Blog_CommentDao {

	int addComment(Blog_Comment blog_Comment) throws Exception;

	List<Blog_Comment> queryComment(int blog_id);

	int delete(int[] blogcom_ids);

	List<Blog_Comment> queryChildComment(int blogcom_id);

	
}
