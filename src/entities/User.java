/** Copyright Kavana to present
All Rights reserved.
*/
package entities;
import java.sql.Timestamp;
import java.sql.*;
public class User {
  private int id;
  private String username;
  private String password;
  private String firstname;
  private String lastname;
  private String gender;
  private String phoneno;
  private String email;
  private String city;
  private String state;
  private String zip;
  private String type;
  private String about;
  private Timestamp rdate;
  private String profile;
  public User(int id, String username, String password, String firstname, String lastname, String gender, String phoneno,
		String email, String city, String state, String zip, String type, String about, Timestamp rdate,String profile) {
	super();
	this.id = id;
	this.username = username;
	this.password = password;
	this.firstname = firstname;
	this.lastname = lastname;
	this.gender = gender;
	this.phoneno = phoneno;
	this.email = email;
	this.city = city;
	this.state = state;
	this.zip = zip;
	this.type = type;
	this.about = about;
	this.rdate = rdate;
	this.profile=profile;
}
public User() {
	super();
}
public User(String username, String password, String firstname, String lastname, String gender, String phoneno,
		String email, String city, String state, String zip, String type, String about) {
	super();
	this.username = username;
	this.password = password;
	this.firstname = firstname;
	this.lastname = lastname;
	this.gender = gender;
	this.phoneno = phoneno;
	this.email = email;
	this.city = city;
	this.state = state;
	this.zip = zip;
	this.type = type;
	this.about = about;
	
}

public User(int id, String username, String password, String firstname, String lastname, String gender, String phoneno,
		String email, String city, String state, String zip, String type, String about, String profile) {
	super();
	this.id = id;
	this.username = username;
	this.password = password;
	this.firstname = firstname;
	this.lastname = lastname;
	this.gender = gender;
	this.phoneno = phoneno;
	this.email = email;
	this.city = city;
	this.state = state;
	this.zip = zip;
	this.type = type;
	this.about = about;
	this.profile = profile;
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
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getFirstname() {
	return firstname;
}
public void setFirstname(String firstname) {
	this.firstname = firstname;
}
public String getLastname() {
	return lastname;
}
public void setLastname(String lastname) {
	this.lastname = lastname;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getPhoneno() {
	return phoneno;
}
public void setPhoneno(String phoneno) {
	this.phoneno = phoneno;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
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
public String getZip() {
	return zip;
}
public void setZip(String zip) {
	this.zip = zip;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getAbout() {
	return about;
}
public void setAbout(String about) {
	this.about = about;
}
public Timestamp getRdate() {
	return rdate;
}
public void setRdate(Timestamp rdate) {
	this.rdate = rdate;
}
public String getProfile() {
	return profile;
}
public void setProfile(String profile) {
	this.profile = profile;
}
  

}
