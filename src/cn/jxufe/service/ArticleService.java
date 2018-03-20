package cn.jxufe.service;

import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.domain.Article;
public interface ArticleService {
	//查询文章
	public Article queryArticle();
	//添加文章 
	public int addArticle(Article article) throws Exception ;
}
