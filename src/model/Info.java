package model;

public class Info {
	private String name;
	private int age;
	private int experience;
	private String place;
	private String email;
	private String phone;
	private String description;
	private String image;
	private String cv;
	public Info() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Info(String name, int age, int experience, String place, String email, String phone, String description) {
		super();
		this.name = name;
		this.age = age;
		this.experience = experience;
		this.place = place;
		this.email = email;
		this.phone = phone;
		this.description = description;
	}
	
	
	public Info(String name, int age, int experience, String place, String email, String phone, String description,
			String image, String cv) {
		super();
		this.name = name;
		this.age = age;
		this.experience = experience;
		this.place = place;
		this.email = email;
		this.phone = phone;
		this.description = description;
		this.image = image;
		this.cv = cv;
	}
	public Info(String name, int age, int experience, String place, String email, String phone, String description,
			String image) {
		super();
		this.name = name;
		this.age = age;
		this.experience = experience;
		this.place = place;
		this.email = email;
		this.phone = phone;
		this.description = description;
		this.image = image;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getCv() {
		return cv;
	}
	public void setCv(String cv) {
		this.cv = cv;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
