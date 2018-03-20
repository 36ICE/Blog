package cn.jxufe.domain;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;



public class Article {
	private Integer id;
	
	@NotNull(message="标题不能为空")
	@Size(min=6,max=10,message="标题应该在6，10之间")
	private String title;
	
	private String articleClass;
	private String content;
	private String author;
	private Date inputTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArticleClass() {
		return articleClass;
	}

	public void setArticleClass(String articleClass) {
		this.articleClass = articleClass;
	}

	public Date getInputTime() {
		return inputTime;
	}

	public void setInputTime(Date inputTime) {
		this.inputTime = inputTime;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAuthor() {
		return author;
	}

}
