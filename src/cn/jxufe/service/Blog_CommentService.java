package cn.jxufe.service;

import java.util.List;

import cn.jxufe.domain.Blog_Comment;

public interface Blog_CommentService {

	List<Blog_Comment> getChildBlog_Comment(Blog_Comment node, int blogcom_id);

	int addBlog_Comment(Blog_Comment blog_Comment) throws Exception;

	List<Blog_Comment> getBlog_Comment(int blog_id);

}
