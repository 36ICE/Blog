package cn.jxufe.test;

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.dao.ArticleDao;
import cn.jxufe.domain.Article;

@RunWith(SpringJUnit4ClassRunner.class)
//defaultRollback=true 则默认回滚
@TransactionConfiguration(transactionManager = "txManager", defaultRollback = true)
@Transactional
/**读取配置文件到运行环境。注意：file的路径 */
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class SpringDaoTest {
	@Autowired
	ArticleDao articleDao;

	//@Test
	public void demo1() {
		Article a = new Article();
		a.setTitle("测试文章~~~~");
		a.setContent("测试文章内容~~~~~~");
		a.setArticleClass("001");
		a.setAuthor("普通用户");
		int flag;
		try {
			flag = articleDao.addArticle(a);
			assertEquals(1, flag);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
	//@Test
	public void query1(){
		Article a = new Article();
		a=articleDao.queryArticle(1);
		System.out.println(a.getTitle());
		System.out.println(a.getInputTime());
	}
	@Test
	public void queryGeneric(){
		Article a = new Article();
		String sql="select * from T_article where id=?";
		a=(Article) articleDao.findUniqueBeanByArray(sql, Article.class, new Object[]{1});
		System.out.println(a.getTitle());
		System.out.println(a.getInputTime());
		 sql="select * from T_article order by id desc limit 0,1 ";
		a=(Article) articleDao.findUniqueBeanByArray(sql, Article.class);
		System.out.println(a.getId());
		System.out.println(a.getTitle());
		System.out.println(a.getInputTime());
	}

}
