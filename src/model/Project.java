package model;

public class Project {
	private int id;
	private String name;
	private String picture;
	private String link;
	private String description;
	private int cat_id;
	private String cat;
	private int visit;
	
	public Project(int id, String name, String picture, String link, String description, int cat_id) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.link = link;
		this.description = description;
		this.cat_id = cat_id;
		
	}
	
	public Project(int id, String name, String picture, String link, String description, int cat_id, String cat) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.link = link;
		this.description = description;
		this.cat_id = cat_id;
		this.cat = cat;
	}
	

	public Project(int id, String name, String picture, String link, String description, int cat_id, String cat,
			int visit) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.link = link;
		this.description = description;
		this.cat_id = cat_id;
		this.cat = cat;
		this.visit = visit;
	}

	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	
	public int getVisit() {
		return visit;
	}

	public void setVisit(int visit) {
		this.visit = visit;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}

	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	
	
}
