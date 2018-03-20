package cn.jxufe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import cn.jxufe.domain.Photo;
import cn.jxufe.domain.Photo_Comment;

@Repository
public class PhotoDaoImpl implements PhotoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	/**
	 * 批量增加
	 */
	@Override
	  public int[] addPhotos(final List<Photo> photos) {
	    List<Object[]> batch = new ArrayList<Object[]>();
	    for (Photo photo : photos) {
	      Object[] values = new Object[] {
	    		  photo.getAlbum_id(),
	    		  photo.getPhoto_path()};
	      batch.add(values);
	    }
	    int[] updateCounts = jdbcTemplate.batchUpdate(
	        "insert into  photo (album_id,photo_path) values(?,?)",
	        batch);
	    return updateCounts;
	  }
	/**
	 * 删除照片
	 * @param photo_id
	 * @return
	 */
	  @Override
	  public int delete(int photo_id){
		  
		  String sql_delete="delete from photo where photo_id=?";
		  jdbcTemplate.update(sql_delete, new Object[]{photo_id});
		  return 1;
	  }
	  
	  /**
	   * 查询 某相册
	   */
	  @Override
	  public List<Photo> queryPhoto(int album_id){
		  
		  String sql = "select * from photo where album_id=?";
			final List<Photo> photos = new ArrayList<Photo>();
			jdbcTemplate.query(sql, new Object[] { album_id }, new RowCallbackHandler() {
				public void processRow(ResultSet rs) throws SQLException {	
					Photo photo=new Photo();
					photo.setAlbum_id(rs.getInt("album_id"));
					photo.setPhoto_id(rs.getInt("photo_id"));
					photo.setPhoto_path(rs.getString("photo_path"));
					photos.add(photo);
				}
			});
		  return photos;
	  }
	  /**
	   * 修改相片所属相册
	   */
	  @Override
	  public int alterPhoto(int album_id,int photo_id){
		  String sql_delete="update  photo set album_id=? where photo_id=?";
		  jdbcTemplate.update(sql_delete, new Object[]{album_id,photo_id});
		  return 1;
	  }
}
