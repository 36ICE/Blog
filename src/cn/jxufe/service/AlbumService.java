package cn.jxufe.service;

import java.util.List;

import cn.jxufe.domain.Album;
import cn.jxufe.domain.Photo;

public interface AlbumService {

	List<Album> showAlbumList(int user_id);

	int deleteAlbum(int album_id);

	

	int deletePhoto(int photo_id);

	Album getAlbum(int album_id);

	int addAlbum(Album album);

	List<Photo> showPhoto(int album_id);

	int [] addPhotos(List<Photo> photos);

}
