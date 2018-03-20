package cn.jxufe.dao;

import java.util.List;

import cn.jxufe.domain.Photo_Comment;

public interface Photo_CommentDao {

	int addComment(Photo_Comment photo_Comment) throws Exception;

	List<Photo_Comment> queryComment(int photo_id);

	int delete(int[] photocom_ids);

}
