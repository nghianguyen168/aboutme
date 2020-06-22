package model;

public class Home {
	private int id;
	private String title;
	private String 	description;
	private String picture;
	private int status;
	public Home() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Home(int id, String title, String description, String picture, int status) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.picture = picture;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
