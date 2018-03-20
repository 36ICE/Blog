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
import cn.jxufe.domain.Message_Comment;
@Repository
public class Message_CommentDaoImpl implements Message_CommentDao {

	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	/**
	 * 增加评论   评论内容和父id ，没有则为 0，评论时间 ，博客id
	 */
	@Override
	public int addComment(Message_Comment message_Comment){
		
		String sql = "insert into message_comment(messagecom_content,messagecom_time,messagecom_state,messagecom_replyuserid,messagecom_parentid,message_userid)"
				+ " values(?,?,?,?,?,?)";
		Object[] args = new Object[] { message_Comment.getMessagecom_content(),
				message_Comment.getMessagecom_time(), message_Comment.getMessagecom_state(), message_Comment.getMessagecom_replyuserid(),
				message_Comment.getMessagecom_parentid(),message_Comment.getMessage_userid() };
		return jdbcTemplate.update(sql, args);
	}
	/**
	 * 全部留言查询
	 */
	@Override
	public List<Message_Comment> queryComment(int message_userid) {
		String sql = "select * from message_comment where message_userid = ? and messagecom_parentid =0";
		final List<Message_Comment> message_Comments = new ArrayList<Message_Comment>();
		jdbcTemplate.query(sql, new Object[] {  message_userid}, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {	
				Message_Comment message_Comment=new Message_Comment();
				
				message_Comment.setMessagecom_id(rs.getInt("messagecom_id"));
				message_Comment.setMessagecom_content(rs.getString("messagecom_content"));
				message_Comment.setMessagecom_replyuserid(rs.getInt("messagecom_replyuserid"));
				message_Comment.setMessagecom_parentid(rs.getInt("messagecom_parentid"));
				message_Comment.setMessagecom_state(rs.getString("messagecom_state"));
				message_Comment.setMessagecom_time(rs.getTimestamp("messagecom_time"));
				message_Comment.setMessage_userid(rs.getInt("message_userid"));
				message_Comments.add(message_Comment);
			}
		});
		return message_Comments;
	}
	@Override
	public List<Message_Comment> queryChildComment(int messagecom_id){
		String sql = "select * from message_comment where messagecom_parentid=?";
		final List<Message_Comment> message_Comments = new ArrayList<Message_Comment>();
		jdbcTemplate.query(sql, new Object[] { messagecom_id }, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {	
				Message_Comment message_Comment=new Message_Comment();
				message_Comment.setMessagecom_id(rs.getInt("messagecom_id"));
				message_Comment.setMessagecom_content(rs.getString("messagecom_content"));
				message_Comment.setMessagecom_replyuserid(rs.getInt("messagecom_replyuserid"));
				message_Comment.setMessagecom_parentid(rs.getInt("messagecom_parentid"));
				message_Comment.setMessagecom_state(rs.getString("messagecom_state"));
				message_Comment.setMessagecom_time(rs.getTimestamp("messagecom_time"));
				message_Comment.setMessage_userid(rs.getInt("message_userid"));
				message_Comments.add(message_Comment);
			}
		});
		return message_Comments;
		
		
	}
	/**
	  * 批量删除留言评论
	  * @param blogcom_ids  评论ids 该节点及子节点全部删除
	  */
	@Override
	 public int delete(int ... messagecom_ids){
		  String sql_delete="delete from message_comment where messagecom_id=?";
		  List<Object[]> paramsList = new ArrayList<Object[]>();
		  for(int messagecom_id : messagecom_ids)
		   paramsList.add(new Object[]{messagecom_id});
		  jdbcTemplate.batchUpdate(sql_delete, paramsList);
		  return 1;
	 }
	
}
