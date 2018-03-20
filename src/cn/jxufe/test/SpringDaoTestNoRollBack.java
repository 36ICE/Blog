package cn.jxufe.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jxufe.dao.ArticleDao;
import cn.jxufe.domain.Article;

public class SpringDaoTestNoRollBack {
	@Test
	public void demo1(){
		ClassPathXmlApplicationContext applicationContext = new  ClassPathXmlApplicationContext("applicationContext.xml");
		ArticleDao dao=(ArticleDao)applicationContext.getBean("articleDaoImpl");
		Article a=new Article();
		a.setTitle("测试文章~~~~");
		a.setContent("测试文章内容~~~~~~");
		a.setArticleClass("001");
		a.setAuthor("普通用户");
		int flag;
		try {
			flag = dao.addArticle(a);
			assertEquals(1,flag);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
