package model;


public class News {
	private int id;
	private String name;
	private String picture;
	private String date_create;
	private String 	description;
	private String detail;
	private String link;
	private String author;
	private int cat_id;
	private String cat;
	private int status;
	private int view;
	private int num_comment;
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	public News(int id, String name, String picture, String date_create, String description, String link, int cat_id) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.date_create = date_create;
		this.description = description;
		this.link = link;
		this.cat_id = cat_id;
	}
	
	public News(int id, String name, String picture, String date_create, String description, String link, String author,
			int cat_id) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.date_create = date_create;
		this.description = description;
		this.link = link;
		this.author = author;
		this.cat_id = cat_id;
	}
	
	public News(int id, String name, String picture, String date_create, String description, String detail, String link,
			String author, int cat_id) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.date_create = date_create;
		this.description = description;
		this.detail = detail;
		this.link = link;
		this.author = author;
		this.cat_id = cat_id;
	}
	
	public News(int id, String name, String picture, String date_create, String description, String detail, String link,
			String author, int cat_id, String cat) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.date_create = date_create;
		this.description = description;
		this.detail = detail;
		this.link = link;
		this.author = author;
		this.cat_id = cat_id;
		this.cat = cat;
	}
	
	
	public News(int id, String name, String picture, String date_create, String description, String detail, String link,
			String author, int cat_id, String cat, int status) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.date_create = date_create;
		this.description = description;
		this.detail = detail;
		this.link = link;
		this.author = author;
		this.cat_id = cat_id;
		this.cat = cat;
		this.status = status;
	}
	
	public News(int id, String name, String picture, String date_create, String description, String detail, String link,
			String author, int cat_id, String cat, int status, int view, int num_comment) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.date_create = date_create;
		this.description = description;
		this.detail = detail;
		this.link = link;
		this.author = author;
		this.cat_id = cat_id;
		this.cat = cat;
		this.status = status;
		this.view = view;
		this.num_comment = num_comment;
	}
	
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public int getNum_comment() {
		return num_comment;
	}
	public void setNum_comment(int num_comment) {
		this.num_comment = num_comment;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
		
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getDate_create() {
		return date_create;
	}
	public void setDate_create(String date_create) {
		this.date_create = date_create;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	
	
	
	
}
