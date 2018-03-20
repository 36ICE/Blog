package cn.jxufe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import cn.jxufe.domain.Article;
import cn.jxufe.domain.Blog;
import cn.jxufe.domain.Photo;
@Repository
public class BlogDaoImpl implements BlogDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 添加文章
	 */
	@Override
	public int addBlog(Blog blog) throws Exception{
	
		String sql = "insert into blog(blog_type_name,blog_title,blog_content,user_id,blog_time)"+ 
		" values(?,?,?,?,?)";
		
		Object[] args = new Object[] { blog.getBlog_type_name(),
				blog.getBlog_title(), blog.getBlog_content() , blog.getUser_id() ,blog.getBlog_time() };
		return jdbcTemplate.update(sql, args);
	}

	/**
	 * 根据文章id删除文章
	 */
	@Override
	public int deleteBlog(int blog_id){
		String sql_delete = "delete from blog where blog_id=?";
		jdbcTemplate.update(sql_delete, new Object[] { blog_id });
		return 1;
	}
	
	/**
	 * 根据类别查找文章
	 */
	@Override
	public List<Blog> queryBlogs(String blog_type_name,int user_id){
		
		 String sql = "select * from blog where blog_type_name=? and user_id=?";
			final List<Blog> blogs=new ArrayList<>();
			jdbcTemplate.query(sql, new Object[] { blog_type_name ,user_id}, new RowCallbackHandler() {
				public void processRow(ResultSet rs) throws SQLException {	
					Blog blog=new Blog();
					blog.setBlog_id(rs.getInt("blog_id"));
					
					blog.setBlog_content((String) rs.getString("blog_content"));
					blog.setBlog_readtimes(rs.getInt("blog_readtimes"));
					blog.setBlog_recommend(rs.getString("blog_recommend"));
					blog.setBlog_time(rs.getTimestamp("blog_time"));
					blog.setBlog_title(rs.getString("blog_title"));
					blog.setBlog_type_name(rs.getString("blog_type_name"));
					blog.setUser_id(rs.getInt("user_id"));
					
					
					blogs.add(blog);
				}
			});
		return blogs;
	}
	
	/*
	 * 查找某博主的全部博文
	 */
	@Override
	public List<Blog> queryBlogs(int user_id){
		
		 String sql = "select * from blog where user_id=?";
			final List<Blog> blogs=new ArrayList<>();
			jdbcTemplate.query(sql, new Object[] {  user_id}, new RowCallbackHandler() {
				public void processRow(ResultSet rs) throws SQLException {	
					Blog blog=new Blog();
					blog.setBlog_id(rs.getInt("blog_id"));
					blog.setBlog_content((String) rs.getString("blog_content"));
					blog.setBlog_readtimes(rs.getInt("blog_readtimes"));
					blog.setBlog_recommend(rs.getString("blog_recommend"));
					blog.setBlog_time(rs.getTimestamp("blog_time"));
					blog.setBlog_title(rs.getString("blog_title"));
					blog.setBlog_type_name(rs.getString("blog_type_name"));
					blog.setUser_id(rs.getInt("user_id"));
					
					//blog.getBlog_content().substring(0, 300);
					blogs.add(blog);
				}
			});
		return blogs;
	}
	
	/**
	 * 查看某一博文具体内容
	 */
	@Override
	public Blog queryBlog(int blog_id){
		
		 String sql = "select * from blog where blog_id=?";
		 final Blog blog=new Blog();
			jdbcTemplate.query(sql, new Object[] {  blog_id}, new RowCallbackHandler() {
				public void processRow(ResultSet rs) throws SQLException {	
					
					blog.setBlog_id(rs.getInt("blog_id"));
					blog.setBlog_content(rs.getString("blog_content"));
					blog.setBlog_readtimes(rs.getInt("blog_readtimes"));
					blog.setBlog_recommend(rs.getString("blog_recommend"));
					blog.setBlog_time(rs.getTimestamp("blog_time"));
					blog.setBlog_title(rs.getString("blog_title"));
					blog.setBlog_type_name(rs.getString("blog_type_name"));
					blog.setUser_id(rs.getInt("user_id"));
					
					
				}
			});
		return blog;
	}
	/**
	 * 修改博文
	 */
	@Override
	public int alterBlog(Blog blog){
		 String sql_alter="update  blog set blog_title=?,blog_content=?,blog_type_name=? where blog_id=?";
		  jdbcTemplate.update(sql_alter, new Object[]{blog.getBlog_title(),blog.getBlog_content() ,
				  blog.getBlog_type_name(), blog.getBlog_id()});
		return 1;
	}
	
	/**
	 * 查找数据库全部的博文
	 */
	@Override
	public List<Blog> queryBlogs(){
		
		 String sql = "select * from blog";
			final List<Blog> blogs=new ArrayList<>();
			jdbcTemplate.query(sql, new Object[] { }, new RowCallbackHandler() {
				public void processRow(ResultSet rs) throws SQLException {	
					Blog blog=new Blog();
					blog.setBlog_id(rs.getInt("blog_id"));
					blog.setBlog_content(rs.getString("blog_content"));
					blog.setBlog_readtimes(rs.getInt("blog_readtimes"));
					blog.setBlog_recommend(rs.getString("blog_recommend"));
					blog.setBlog_time(rs.getTimestamp("blog_time"));
					blog.setBlog_title(rs.getString("blog_title"));
					blog.setBlog_type_name(rs.getString("blog_type_name"));
					blog.setUser_id(rs.getInt("user_id"));
					blogs.add(blog);
				}
			});
		return blogs;
	}
	
	@Override
	public String changeRecommend(int blog_id,int flag){
		//改为推荐
		if(flag==0){
			String sql_alter="update  blog set blog_recommend='是' where blog_id=?";
			  jdbcTemplate.update(sql_alter, new Object[]{ blog_id});
			  return "设为未推荐";
		}else{
			//改为未推荐
			String sql_alter="update  blog set blog_recommend='否' where blog_id=?";
			  jdbcTemplate.update(sql_alter, new Object[]{ blog_id});
		}
		return "设为推荐";
	}
	/**
	 * 
	 * @param blog_id
	 * @return 0未推荐  1推荐
	 */
	@Override
	public int isRecommend(int blog_id)throws Exception{
		
		String sql = "select count(*) from blog where blog_id=? and blog_recommend='是'";
		final List<Blog> blogs=new ArrayList<>();
		
		return jdbcTemplate.queryForInt(sql, new Object[] { blog_id});
	 
	}
	@Override
	public List<Blog> queryRecomBlogs(int user_id){
		
		 String sql = "select * from blog where user_id=? and blog_recommend='是'";
			final List<Blog> blogs=new ArrayList<>();
			jdbcTemplate.query(sql, new Object[] {  user_id}, new RowCallbackHandler() {
				public void processRow(ResultSet rs) throws SQLException {	
					Blog blog=new Blog();
					blog.setBlog_id(rs.getInt("blog_id"));
					blog.setBlog_content((String) rs.getString("blog_content"));
					blog.setBlog_readtimes(rs.getInt("blog_readtimes"));
					blog.setBlog_recommend(rs.getString("blog_recommend"));
					blog.setBlog_time(rs.getTimestamp("blog_time"));
					blog.setBlog_title(rs.getString("blog_title"));
					blog.setBlog_type_name(rs.getString("blog_type_name"));
					blog.setUser_id(rs.getInt("user_id"));
					
					blogs.add(blog);
				}
			});
		return blogs;
	}
	//访问量加1
	@Override
	public int alterCount(int blog_id){
		 String sql_alter="update  blog set blog_readtimes=blog_readtimes+1 where blog_id=?";
		 return jdbcTemplate.update(sql_alter, new Object[]{blog_id});
		
	}
	//按访问量排行
	@Override
	public List<Blog> countRank(int user_id){
		
		String sql = "select * from (select * from blog  where user_id=? order by blog_readtimes desc limit 100) as tmp limit 5";
		final List<Blog> blogs=new ArrayList<>();
		jdbcTemplate.query(sql, new Object[] {  user_id}, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {	
				Blog blog=new Blog();
				blog.setBlog_id(rs.getInt("blog_id"));
				blog.setBlog_content((String) rs.getString("blog_content"));
				blog.setBlog_readtimes(rs.getInt("blog_readtimes"));
				blog.setBlog_recommend(rs.getString("blog_recommend"));
				blog.setBlog_time(rs.getTimestamp("blog_time"));
				blog.setBlog_title(rs.getString("blog_title"));
				blog.setBlog_type_name(rs.getString("blog_type_name"));
				blog.setUser_id(rs.getInt("user_id"));
				
				//blog.getBlog_content().substring(0, 300);
				blogs.add(blog);
			}
		});
	return blogs;
	}
	//获取用户的博客类别list
	@Override
	public List<String> getBlog_TypeList(int user_id){
		 String sql = "select * from blog_type where blog_user_id=? ";
		 final List<String> type_list=new ArrayList<>();
			jdbcTemplate.query(sql, new Object[] {  user_id}, new RowCallbackHandler() {
				public void processRow(ResultSet rs) throws SQLException {	
					
					type_list.add(rs.getString("blog_type_name"));
				}
			});
		return type_list;
	}
	
	//增加博客类别
	@Override
	public int addBlog_Type(String blog_type_name,int blog_user_id){
		String sql = "insert into blog_type(blog_type_name,blog_user_id)"+ 
				" values(?,?)";
		Object[] args = new Object[] { blog_type_name ,blog_user_id};
		return jdbcTemplate.update(sql, args);
	}
}
