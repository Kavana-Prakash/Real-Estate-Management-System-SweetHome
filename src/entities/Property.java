/** Copyright Kavana to present
All Rights reserved.
*/
package entities;

public class Property {
    private int pid;
    private String type;
    private String squarefeet;
    private int ownerid;
    private String price;
    private String street;
    private String city;
    private String state;
    private String pincode;
    private String bedroom;
    private String bathroom;
    private String age;
    private int balcony;
    private int pool;
    private int backyard;
    private int garage;
    private String text;
    private String img;
    private Categories category;
    
	public Property(String type, String squarefeet, int ownerid, String price, String street, String city, String state,
			String pincode, String bedroom, String bathroom, String age, int balcony, int pool,
			int backyard, int garage, String text, String img, Categories category) {
		super();
		this.type = type;
		this.squarefeet = squarefeet;
		this.ownerid = ownerid;
		this.price = price;
		this.street = street;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.age = age;
		this.balcony = balcony;
		this.pool = pool;
		this.backyard = backyard;
		this.garage = garage;
		this.text = text;
		this.img = img;
		this.category = category;
	}
	public Property(int pid, String type, String squarefeet, int ownerid, String price, String street,String city, String state,
			String pincode, String bedroom, String bathroom, String age, int balcony, int pool, int backyard,
			int garage, String text,String img) {
		super();
		this.pid = pid;
		this.type = type;
		this.squarefeet = squarefeet;
		this.ownerid = ownerid;
		this.price = price;
		this.street = street;
		this.city=city;
		this.state = state;
		this.pincode = pincode;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.age = age;
		this.balcony = balcony;
		this.pool = pool;
		this.backyard = backyard;
		this.garage = garage;
		this.text = text;
		this.img=img;
	}
	public Property() {
		super();
	}
	public Property(String type, String squarefeet, int ownerid, String price, String street,String city, String state,
			String pincode, String bedroom, String bathroom, String age, int balcony, int pool, int backyard,
			int garage, String text,String img) {
		super();
		this.type = type;
		this.squarefeet = squarefeet;
		this.ownerid = ownerid;
		this.price = price;
		this.street = street;
		this.city=city;
		this.state = state;
		this.pincode = pincode;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.age = age;
		this.balcony = balcony;
		this.pool = pool;
		this.backyard = backyard;
		this.garage = garage;
		this.text = text;
		this.img=img;
	}
	
	
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSquarefeet() {
		return squarefeet;
	}
	public void setSquarefeet(String squarefeet) {
		this.squarefeet = squarefeet;
	}
	public int getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getBedroom() {
		return bedroom;
	}
	public void setBedroom(String bedroom) {
		this.bedroom = bedroom;
	}
	public String getBathroom() {
		return bathroom;
	}
	public void setBathroom(String bathroom) {
		this.bathroom = bathroom;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	public int getBalcony() {
		return balcony;
	}
	public void setBalcony(int balcony) {
		this.balcony = balcony;
	}
	public int getPool() {
		return pool;
	}
	public void setPool(int pool) {
		this.pool = pool;
	}
	public int getBackyard() {
		return backyard;
	}
	public void setBackyard(int backyard) {
		this.backyard = backyard;
	}
	public int getGarage() {
		return garage;
	}
	public void setGarage(int garage) {
		this.garage = garage;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Categories getCategory() {
		return category;
	}
	public void setCategory(Categories category) {
		this.category = category;
	}
    
}
