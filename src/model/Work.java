package model;

public class Work {
	private int id;
	private String name;
	private String timefrom;
	private String timeto;
	private String description;
	public Work() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Work(String name, String timefrom, String timeto, String description) {
		super();
		this.name = name;
		this.timefrom = timefrom;
		this.timeto = timeto;
		this.description = description;
	}
	
	public Work(int id, String name, String timefrom, String timeto, String description) {
		super();
		this.id = id;
		this.name = name;
		this.timefrom = timefrom;
		this.timeto = timeto;
		this.description = description;
	}
	public String getName() {
		return name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTimefrom() {
		return timefrom;
	}
	public void setTimefrom(String timefrom) {
		this.timefrom = timefrom;
	}
	public String getTimeto() {
		return timeto;
	}
	public void setTimeto(String timeto) {
		this.timeto = timeto;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
