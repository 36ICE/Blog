package cn.jxufe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.dao.ArticleDao;
import cn.jxufe.domain.Article;
@Service
@Transactional
public  class ArticleServiceImpl implements ArticleService {
	@Autowired
	public ArticleDao articleDao;
	@Override
	public Article queryArticle() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int addArticle(Article article) throws Exception{

			articleDao.addArticle(article);
			Article article2=new Article();
			article2.setArticleClass("1212121212");
			article2.setTitle("abc");
			articleDao.addArticle(article2);
		return 1;
	}

}
