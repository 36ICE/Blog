package cn.jxufe.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.dao.Blog_CommentDao;
import cn.jxufe.domain.Blog_Comment;

@Service
@Transactional
public class Blog_CommentServiceImpl implements Blog_CommentService {

	@Autowired
	private Blog_CommentDao blog_CommentDao;
	
	@Override
	public List<Blog_Comment> getBlog_Comment(int blog_id){
		//List<Blog_Comment> TreeNodes=new ArrayList<>();
		
		List<Blog_Comment> RootNodes=blog_CommentDao.queryComment(blog_id);
		
		for(Blog_Comment item:RootNodes){
			
			item.setChildNodes(getChildBlog_Comment( item, item.getBlogcom_id()));
		}
		return RootNodes;
	}
	@Override
	public List<Blog_Comment> getChildBlog_Comment(Blog_Comment node,int blogcom_id){
		List<Blog_Comment> treeNodes=new ArrayList<>();
		
		List<Blog_Comment> childNodes=blog_CommentDao.queryChildComment(blogcom_id);
		
		if(childNodes.size()>0){
			
			for(Blog_Comment item:childNodes){
				
				item.setChildNodes(getChildBlog_Comment( item,item.getBlogcom_id()));
			}
			treeNodes.addAll(childNodes);
			return treeNodes;
		}else{
			return treeNodes;
		}
	}
	@Override
	public int addBlog_Comment(Blog_Comment blog_Comment) throws Exception{
		
		return blog_CommentDao.addComment(blog_Comment);
	}
}
