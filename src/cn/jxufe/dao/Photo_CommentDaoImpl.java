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
import cn.jxufe.domain.Photo_Comment;
@Repository
public class Photo_CommentDaoImpl implements Photo_CommentDao {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	/**
	 * 增加评论   评论内容和父id ，没有则为 0，评论时间 相片id
	 */
	@Override
	public int addComment(Photo_Comment photo_Comment)throws Exception{
		
		String sql = "insert into photo_comment(photocom_content,photocom_time,photocom_state,photocom_manid,photo_id,photocom_userid)"
				+ " values(?,?,?,?,?)";
		Object[] args = new Object[] { photo_Comment.getPhotocom_content(),
				photo_Comment.getPhotocom_time(), photo_Comment.getPhotocom_state(), photo_Comment.getPhotocom_parentid(),
				photo_Comment.getPhoto_id(),photo_Comment.getPhotocom_userid() };
		return jdbcTemplate.update(sql, args);
	}
	/**
	 * 查询相片的评论
	 */
	@Override
	public List<Photo_Comment> queryComment(int photo_id) {
		String sql = "select * from photo_comment where photo_id=?";
		final List<Photo_Comment> photo_Comments = new ArrayList<Photo_Comment>();
		jdbcTemplate.query(sql, new Object[] { photo_id }, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {	
				Photo_Comment photo_Comment=new Photo_Comment();
				photo_Comment.setPhotocom_id(rs.getInt("photocom_id"));
				photo_Comment.setPhotocom_content(rs.getString("photocom_content"));
				photo_Comment.setPhoto_id(rs.getInt("photo_id"));
				photo_Comment.setPhotocom_parentid(rs.getInt("photocom_parentid"));
				photo_Comment.setPhotocom_state(rs.getString("photocom_state"));
				photo_Comment.setPhotocom_time(rs.getTimestamp("photocom_time"));
				photo_Comment.setPhotocom_userid(rs.getInt("photocom_userId"));
				photo_Comments.add(photo_Comment);
			}
		});
		return photo_Comments;
	}
	
	
	/**
	  * 批量删除相片评论
	  * @param blogcom_ids  评论ids 该节点及子节点全部删除
	  */
	@Override
	 public int delete(int ... photocom_ids){
		  String sql_delete="delete from photo_comment where photocom_id=?";
		  List<Object[]> paramsList = new ArrayList<Object[]>();
		  for(int photocom : photocom_ids)
		   paramsList.add(new Object[]{photocom});
		  jdbcTemplate.batchUpdate(sql_delete, paramsList);
		  return 1;
	 }
}
