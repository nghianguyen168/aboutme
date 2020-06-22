package model;

public class NewsCat {
	private int id;
	private String name;
	private int parent_id;
	public NewsCat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NewsCat(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public NewsCat(int id, String name, int parent_id) {
		super();
		this.id = id;
		this.name = name;
		this.parent_id = parent_id;
	}
	
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public int getId() {
		return id;
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
	
	
}
