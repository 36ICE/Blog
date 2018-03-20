package cn.jxufe.dao;


import cn.jxufe.domain.Article;

//文章类操作原子接口
public interface ArticleDao {
	//添加文章--用对象传参数
	public int addArticle(Article article) throws Exception;
	//通过ID查询文章
	public Article queryArticle(int id);
	//通用的查询
	public Object findUniqueBeanByArray(final String sql,Class<?> clazz,Object... parameters);
}
