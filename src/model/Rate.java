package model;

public class Rate {
	private int id;
	private String username;
	private int star;
	private int news_id;
	String news_name;
	
	public Rate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Rate(int id, String username, int star, int news_id, String news_name) {
		super();
		this.id = id;
		this.username = username;
		this.star = star;
		this.news_id = news_id;
		this.news_name = news_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getNews_id() {
		return news_id;
	}

	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}

	public String getNews_name() {
		return news_name;
	}

	public void setNews_name(String news_name) {
		this.news_name = news_name;
	}

	
	
	
	
	
}
