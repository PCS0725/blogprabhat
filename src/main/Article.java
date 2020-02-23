package main;

import java.util.Date;
/*
 Model class for representing an article object
 */
public class Article {
	private int id;   //a unique id for each article. We'll never set it, it will be set by the database
	private Date publicationDate;
	private String title;
	private String summary;
	private String content;
	public Article() {
		
	}
	public Article(int id, Date publicationDate, String title, String summary, String content) {
		super();
		this.id = id;
		this.publicationDate = publicationDate;
		this.title = title;
		this.summary = summary;
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
