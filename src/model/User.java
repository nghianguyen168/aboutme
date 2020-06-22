package model;

public class User {
	private int id;
	private String name;
	private String password;
	private String fullname;
	private int role_id;
	private String role_name;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id, String name, String password, int role_id) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.role_id = role_id;
	}
	
	public User(int id, String name, String password, String role_name) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.role_name = role_name;
	}
	
	
	
	public User(int id, String name, String password, String fullname, int role_id) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.fullname = fullname;
		this.role_id = role_id;
	}
	public User(int id, String name, String password, String fullname, String role_name) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.fullname = fullname;
		this.role_name = role_name;
	}
	
	public User(int id, String name, String password, String fullname, int role_id, String role_name) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.fullname = fullname;
		this.role_id = role_id;
		this.role_name = role_name;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public int getId() {
		return id;
	}
	
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	
	
}
