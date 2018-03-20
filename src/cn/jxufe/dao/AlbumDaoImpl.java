package cn.jxufe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import cn.jxufe.domain.Album;


@Repository
public class AlbumDaoImpl implements AlbumDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/*
	 * 
	 * 增加一个相册
	 */
	@Override
	public int addAlbum(Album album){
		String sql = "insert into album(album_name,album_time,album_islocked,album_password,user_id,album_pic)"
				+ " values(?,?,?,?,?,?)";
		Object[] args = new Object[] { album.getAlbum_name(),
				album.getAlbum_time(), album.getAlbum_islocked(), album.getAlbum_password(),
				album.getUser_id(),album.getAlbum_pic()};
		return jdbcTemplate.update(sql, args);
	}
	
	/**
	 * 修改相册名
	 */
	@Override
	public int alteralbum(int album_id,String album_name){
		 String sql_delete="update  album set album_name=? where album_id=?";
		  jdbcTemplate.update(sql_delete, new Object[]{album_name,album_id});
		return 1;
	}
	
	
	/**
	 * 删除相册
	 */
	@Override
	public int delete(int album_id){
		
		 String sql_delete="delete from album where album_id=?";
		  jdbcTemplate.update(sql_delete, album_id);
		  return 1;
	}
	
	/**
	 * 查找相册
	 */
	@Override
	public List<Album> queryAlbum(int user_id){
		String sql = "select * from album where user_id=?";
		final List<Album> albums=new ArrayList<>();
		jdbcTemplate.query(sql, new Object[] { user_id }, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {	
				Album album=new Album();
				album.setAlbum_id(rs.getInt("album_id"));
				album.setAlbum_islocked(rs.getString("album_islocked"));
				album.setAlbum_name(rs.getString("album_name"));
				album.setAlbum_password(rs.getString("album_password"));
				album.setAlbum_time(rs.getTimestamp("album_time"));
				album.setUser_id(rs.getInt("user_id"));
				album.setAlbum_pic(rs.getString("album_pic"));
				albums.add(album);
			}
		});
		
		return albums;
	}
	@Override
	public Album getAlbum(int album_id){
		String sql = "select * from album where album_id=?";
		final Album album=new Album();
		jdbcTemplate.query(sql, new Object[] { album_id }, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {	
				
				album.setAlbum_id(rs.getInt("album_id"));
				album.setAlbum_islocked(rs.getString("album_islocked"));
				album.setAlbum_name(rs.getString("album_name"));
				album.setAlbum_password(rs.getString("album_password"));
				album.setAlbum_time(rs.getTimestamp("album_time"));
				album.setUser_id(rs.getInt("user_id"));
				album.setAlbum_pic(rs.getString("album_pic"));
				
			}
		});
		
		return album;
	}
}
