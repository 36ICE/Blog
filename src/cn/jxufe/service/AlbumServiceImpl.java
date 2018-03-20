package cn.jxufe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.dao.AlbumDao;
import cn.jxufe.dao.PhotoDao;
import cn.jxufe.domain.Album;
import cn.jxufe.domain.Photo;
@Service
@Transactional
public class AlbumServiceImpl implements AlbumService{


	@Autowired
	public AlbumDao albumDao;
	@Autowired
	public PhotoDao photoDao;
	@Override
	public List<Album> showAlbumList(int user_id){
		
		
		return albumDao.queryAlbum(user_id);
	}
	@Override
	public int deleteAlbum(int album_id){
		return albumDao.delete(album_id);
	}
	@Override
	public List<Photo> showPhoto(int album_id){
		return photoDao.queryPhoto(album_id);
	}
	@Override
	public int deletePhoto(int photo_id){
		return photoDao.delete(photo_id);
	}
	@Override
	public int[] addPhotos(List<Photo> photos){
		
		return  photoDao.addPhotos(photos);
	}
	@Override
	public Album getAlbum(int album_id){
		return albumDao.getAlbum(album_id);
	}
	@Override
	public int addAlbum(Album album){
		
		return albumDao.addAlbum(album);
	}
}
