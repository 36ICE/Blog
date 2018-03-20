package cn.jxufe.dao;

import java.util.List;

import cn.jxufe.domain.Photo;

public interface PhotoDao {

	int[] addPhotos(List<Photo> photos);

	int delete(int photo_id);

	List<Photo> queryPhoto(int album_id);

	int alterPhoto(int album_id, int photo_id);

}
