package model;

import java.sql.Timestamp;

public class Comment {
	private int id;
	private int news_id;
	private String name;
	private String comment;
	private Timestamp time;
	private String news_name;
	private int parent_id;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int news_id, String name, String comment) {
		super();
		this.news_id = news_id;
		this.name = name;
		this.comment = comment;
	}
	
	
	public Comment(int id, int news_id, String name, String comment, Timestamp time, String news_name, int parent_id) {
		super();
		this.id = id;
		this.news_id = news_id;
		this.name = name;
		this.comment = comment;
		this.time = time;
		this.news_name = news_name;
		this.parent_id = parent_id;
	}
	public Comment(int id, int news_id, String name, String comment, Timestamp time, String news_name) {
		super();
		this.id = id;
		this.news_id = news_id;
		this.name = name;
		this.comment = comment;
		this.time = time;
		this.news_name = news_name;
	}
	
	public Comment(int id, String name, String comment, Timestamp time, String news_name) {
		super();
		this.id = id;
		this.name = name;
		this.comment = comment;
		this.time = time;
		this.news_name = news_name;
	}
	public Comment(int news_id, String name, String comment, Timestamp time) {
		super();
		this.news_id = news_id;
		this.name = name;
		this.comment = comment;
		this.time = time;
	}
	
	
	
	public Comment(int id, int news_id, String name, String comment, Timestamp time) {
		super();
		this.id = id;
		this.news_id = news_id;
		this.name = name;
		this.comment = comment;
		this.time = time;
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getTime() {
		return time;
	}
	
	public String getNews_name() {
		return news_name;
	}
	public void setNews_name(String news_name) {
		this.news_name = news_name;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public String getName() {
		return name;
	}
	
	public Comment(int id, int news_id, String name, String comment, Timestamp time, int parent_id) {
		super();
		this.id = id;
		this.news_id = news_id;
		this.name = name;
		this.comment = comment;
		this.time = time;
		this.parent_id = parent_id;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
