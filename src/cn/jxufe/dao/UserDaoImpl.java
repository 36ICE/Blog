package cn.jxufe.dao;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import cn.jxufe.domain.Blog;
import cn.jxufe.domain.User;
@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	@SuppressWarnings("deprecation")
	@Override
	public int checkUser_name(String user_name){
		String sql = "select count(*) num from User where user_name=?";
		return jdbcTemplate.queryForInt(sql,
				new Object[] { user_name });

	}
	@SuppressWarnings("deprecation")
	@Override
	public int checkUser(User user){
		String sql = "select count(*) num from User where user_name=? and user_password=?";
		return jdbcTemplate.queryForInt(sql,
				new Object[] { user.getUser_name() ,user.getUser_password()});

	}
	@Override
	public int checkoldPassword(int user_id,String oldPassword){
		String sql = "select count(*) num from User where user_id=? and user_password=?";
		return jdbcTemplate.queryForInt(sql,
				new Object[] { user_id ,oldPassword});
	}
	/**
	 * 增加用户
	 */
	@Override
	public int addUser(User user){
		//验证用户名是否存在
		if(checkUser(user)>0){
			return 0;
		}else{
			String sql="insert into user(user_name,user_password,user_registertime,user_birthday,user_mail,user_job,user_sex)"+
					"values(?,?,?,?,?,?,?)";
			Object[] args=new Object[]{user.getUser_name(),user.getUser_password(),user.getUser_registertime(),user.getUser_birthday(),
					user.getUser_mail(),user.getUser_job(),user.getUser_sex()};
			return jdbcTemplate.update(sql, args);
		}	
	}
	/*
	 * 修改个人信息
	 * 
	 * @see cn.jxufe.dao.UserDao#alteruser(cn.jxufe.domain.User)
	 */
	@Override
	public int alteruser(User user){
		String sql_alter="update user set user_birthday=?,user_mail=?,user_job=?,user_sex=? where user_id=?";
		jdbcTemplate.update(sql_alter, new Object[]{user.getUser_birthday(),
				user.getUser_mail(),user.getUser_job(),user.getUser_sex(),user.getUser_id()});
		return 1;
	}
	/**
	 * 修改密码
	 * @param newPassword
	 * @param user
	 * @return
	 */
	@Override
	public int alterpassword(String newPassword,User user){
		String sql_alter="update user set user_password =? where user_id=?";
		jdbcTemplate.update(sql_alter, new Object[]{newPassword,user.getUser_id()});
		return 1;
	}


	/**
	 * 根据用户名查询
	 */
	@Override
	public User queryUser(String user_name){
		String sql = "select * from user where user_name=?";
		 final User user=new User();
			jdbcTemplate.query(sql, new Object[] {  user_name}, new RowCallbackHandler() {
				public void processRow(ResultSet rs) throws SQLException {						
					user.setUser_birthday(rs.getDate("user_birthday"));
					user.setUser_id(rs.getInt("user_id"));
					user.setUser_job(rs.getString("user_job"));
					user.setUser_mail(rs.getString("user_mail"));
					user.setUser_name(rs.getString("user_name"));
					user.setUser_password(rs.getString("user_password"));
					user.setUser_registertime(rs.getTimestamp("user_registertime"));
					user.setUser_sex(rs.getString("user_sex"));					
				}
			});
		return user;
	}
	@Override
	public User queryUser(int user_id){
		String sql = "select * from user where user_id=?";
		 final User user=new User();
			jdbcTemplate.query(sql, new Object[] {  user_id}, new RowCallbackHandler() {
				public void processRow(ResultSet rs) throws SQLException {						
					user.setUser_birthday(rs.getDate("user_birthday"));
					user.setUser_id(rs.getInt("user_id"));
					user.setUser_job(rs.getString("user_job"));
					user.setUser_mail(rs.getString("user_mail"));
					user.setUser_name(rs.getString("user_name"));
					user.setUser_password(rs.getString("user_password"));
					user.setUser_registertime(rs.getTimestamp("user_registertime"));
					user.setUser_sex(rs.getString("user_sex"));					
				}
			});
		return user;
	}
}
