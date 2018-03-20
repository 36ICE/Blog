package cn.jxufe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import cn.jxufe.domain.Article;

@Repository
public class ArticleDaoImpl implements ArticleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	/**
	 * 添加文章
	 */
	public int addArticle(Article article) throws Exception{
		
		String sql = "insert into blog(blog_type_name,blog_title,blog_content,user_id,blog_time)"
				+ " values(?,?,?,?,now())";
		Object[] args = new Object[] { article.getArticleClass(),
				article.getTitle(), article.getContent(), article.getAuthor() };
		return jdbcTemplate.update(sql, args);
	}

	@Override
	public Article queryArticle(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from t_article where id=?";
		final Article article = new Article();
		jdbcTemplate.query(sql, new Object[] { id }, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				article.setId(rs.getInt("id"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setAuthor(rs.getString("author"));
				article.setInputTime(rs.getDate("inputTime"));
			}
		});
		return article;
	}
	//通用的查询！
	@Override
	public Object findUniqueBeanByArray(final String sql,Class<?> clazz,Object... parameters){
		try{
			if(parameters!=null){
				return jdbcTemplate.queryForObject(sql, resultBeanMapper(clazz), parameters);
			}
		}catch (EmptyResultDataAccessException ere) {
			return null;
		}catch (Exception e) {
			return null;
		}
		return jdbcTemplate.queryForObject(sql,clazz);
	}
	
	protected RowMapper<?> resultBeanMapper(Class<?> clazz) {
		return ParameterizedBeanPropertyRowMapper.newInstance(clazz);
	}

}
