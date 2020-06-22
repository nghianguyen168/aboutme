package model;

public class Skill {
	private int id;
	private String name;
	private int level;
	public Skill() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Skill(String name, int level) {
		super();
		this.name = name;
		this.level = level;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Skill(int id, String name, int level) {
		super();
		this.id = id;
		this.name = name;
		this.level = level;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
}
