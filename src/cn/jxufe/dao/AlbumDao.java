package cn.jxufe.dao;

import java.util.List;

import cn.jxufe.domain.Album;

public interface AlbumDao {

	int addAlbum(Album album) ;

	List<Album> queryAlbum(int user_id);

	int delete(int album_id);

	int alteralbum(int album_id, String album_name);

	Album getAlbum(int album_id);

}
