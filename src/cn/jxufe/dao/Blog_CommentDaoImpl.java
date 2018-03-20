package cn.jxufe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;
import cn.jxufe.domain.Blog_Comment;


@Repository
public class Blog_CommentDaoImpl implements Blog_CommentDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	/**
	 * 增加评论   评论内容和父id ，没有则为 0，评论时间 ，博客id
	 */
	@Override
	public int addComment(Blog_Comment blog_Comment)throws Exception{
		
		String sql = "insert into blog_comment(blogcom_content,blogcom_time,blogcom_state,blogcom_parentid,blog_id,blogcom_userid)"
				+ " values(?,?,?,?,?,?)";
		
		//System.out.println(sql);
		Object[] args = new Object[] { blog_Comment.getBlogcom_content(),
				blog_Comment.getBlogcom_time(), blog_Comment.getBlogcom_state(), blog_Comment.getBlogcom_parentid(),
				blog_Comment.getBlog_id(),blog_Comment.getBlogcom_userId() };
		return jdbcTemplate.update(sql, args);
	}
	/**
	 * 查询博客的评论，按博客id查
	 */
	@Override
	public List<Blog_Comment> queryComment(int blog_id) {
		String sql = "select * from blog_comment where blog_id=? and blogcom_parentid=0";
		final List<Blog_Comment> blog_Comments = new ArrayList<Blog_Comment>();
		jdbcTemplate.query(sql, new Object[] { blog_id }, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {	
				Blog_Comment blog_Comment=new Blog_Comment();
				blog_Comment.setBlogcom_id(rs.getInt("blogcom_id"));
				blog_Comment.setBlogcom_content(rs.getString("blogcom_content"));
				blog_Comment.setBlog_id(rs.getInt("blog_id"));
				blog_Comment.setBlogcom_parentid(rs.getInt("blogcom_parentid"));
				blog_Comment.setBlogcom_state(rs.getString("blogcom_state"));
				blog_Comment.setBlogcom_time(rs.getTimestamp("blogcom_time"));
				blog_Comment.setBlogcom_userId(rs.getInt("blogcom_userId"));
				blog_Comments.add(blog_Comment);
			}
		});
		return blog_Comments;
	}
	
	/**
	 * 查找子评论
	 * @param blogcom_parentid
	 * @return
	 */
	@Override
	public List<Blog_Comment> queryChildComment(int blogcom_id){
		String sql = "select * from blog_comment where blogcom_parentid=?";
		final List<Blog_Comment> blog_Comments = new ArrayList<Blog_Comment>();
		jdbcTemplate.query(sql, new Object[] { blogcom_id }, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {	
				Blog_Comment blog_Comment=new Blog_Comment();
				blog_Comment.setBlogcom_id(rs.getInt("blogcom_id"));
				blog_Comment.setBlogcom_content(rs.getString("blogcom_content"));
				blog_Comment.setBlog_id(rs.getInt("blog_id"));
				blog_Comment.setBlogcom_parentid(rs.getInt("blogcom_parentid"));
				blog_Comment.setBlogcom_state(rs.getString("blogcom_state"));
				blog_Comment.setBlogcom_time(rs.getTimestamp("blogcom_time"));
				blog_Comment.setBlogcom_userId(rs.getInt("blogcom_userId"));
				blog_Comments.add(blog_Comment);
			}
		});
		return blog_Comments;
		
		
	}
	
	
	/**
	  * 批量删除博客评论
	  * @param blogcom_ids  评论ids 该节点及子节点全部删除
	  */
	@Override
	 public int delete(int ... blogcom_ids){
		  String sql_delete="delete from blog_comment where blogcom_id=?";
		  List<Object[]> paramsList = new ArrayList<Object[]>();
		  for(int blogcom_id : blogcom_ids)
		   paramsList.add(new Object[]{blogcom_id});
		  jdbcTemplate.batchUpdate(sql_delete, paramsList);
		  return 1;
	 }
	
	
}
