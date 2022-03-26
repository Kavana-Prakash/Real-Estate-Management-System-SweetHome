/** Copyright Kavana to present
All Rights reserved.
*/
package entities;

import java.util.ArrayList;
import java.util.List;

public class Categories {
 private int category_id;
 private String category_name;
 private String category_description;
 private List<Property> products=new ArrayList<>();
public Categories(int category_id, String category_name, String category_description) {
	super();
	this.category_id = category_id;
	this.category_name = category_name;
	this.category_description = category_description;
}
public Categories(String category_name, String category_description) {
	super();
	this.category_name = category_name;
	this.category_description = category_description;
}
public Categories() {
	super();
}

public Categories(String category_name, String category_description, List<Property> products) {
	super();
	this.category_name = category_name;
	this.category_description = category_description;
	this.products = products;
}
public int getCategory_id() {
	return category_id;
}
public void setCategory_id(int category_id) {
	this.category_id = category_id;
}
public String getCategory_name() {
	return category_name;
}
public void setCategory_name(String category_name) {
	this.category_name = category_name;
}
public String getCategory_description() {
	return category_description;
}
public void setCategory_description(String category_description) {
	this.category_description = category_description;
}
public List<Property> getProducts() {
	return products;
}
public void setProducts(List<Property> products) {
	this.products = products;
}
 
}
