/** Copyright Kavana to present
All Rights reserved.
*/
package Dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import entities.*;
import Dao.*;
import Helper.ConnectionProvider;
public class PropertyDao {
	private Connection con;
	public PropertyDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean saveProperty(Property property) {
		 boolean flag=false;
		 try {
			 String query="insert into property(type,squarefeet,ownerid,price,street,city,state,pincode,bedroom,bathroom,age,balcony,pool,backyard,garage,description,image) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			 PreparedStatement pstmt=this.con.prepareStatement(query);
			 pstmt.setString(1, property.getType());
			 pstmt.setString(2, property.getSquarefeet());
			 pstmt.setInt(3, property.getOwnerid());
			 pstmt.setString(4, property.getPrice());
			 pstmt.setString(5, property.getStreet());
			 pstmt.setString(6, property.getCity());
			 pstmt.setString(7, property.getState());
			 pstmt.setString(8, property.getPincode());
			 pstmt.setString(9, property.getBedroom());
			 pstmt.setString(10, property.getBathroom());
			 pstmt.setString(11, property.getAge());
			 pstmt.setInt(12, property.getBalcony());
		     pstmt.setInt(13, property.getPool());
		     pstmt.setInt(14, property.getBackyard());
			 pstmt.setInt(15, property.getGarage());
			 pstmt.setString(16, property.getText());
			 pstmt.setString(17, property.getImg());
			 pstmt.executeUpdate();
			 flag=true;
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		 return flag;
	 }
	
	
	public ArrayList<Categories> getAllCategories(){
		Statement st;
    	ResultSet rs;
		String query="select * from categories";
		ArrayList<Categories> list=new ArrayList<>();
		try {
			st=this.con.createStatement();
			rs=st.executeQuery(query);
			
			while(rs.next()) {
				
				int cid=rs.getInt("cid");
				String cname=rs.getString("cname");
				String cdescription=rs.getString("description");
				Categories c=new Categories(cid,cname,cdescription);
				list.add(c);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
    	
    return list;
    }
	//get all property
	public List<Property> getAllProperty(){
		List<Property> list=new ArrayList<>();
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from property where pid not in (select propertyid from status where status=\"sold\" ) ");
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int pid=rs1.getInt("pid");
				String ptype=rs1.getString("type");
				String sqft=rs1.getString("squarefeet");
				int oid=rs1.getInt("ownerid");
				String price=rs1.getString("price");
				String street=rs1.getString("street");
				String city=rs1.getString("city");
				String state=rs1.getString("state");
				String pincode=rs1.getString("pincode");
				String bedroom=rs1.getString("bedroom");
				String bathroom=rs1.getString("bathroom");
				String age=rs1.getString("age");
				String description=rs1.getString("description");
				int balcony=rs1.getInt("balcony");
				int pool=rs1.getInt("pool");
				int backyard=rs1.getInt("backyard");
				int garage=rs1.getInt("garage");
				String img=rs1.getString("image");
				Property p=new Property(pid,ptype,sqft,oid,price,street,city,state,pincode,bedroom,bathroom,age,balcony,pool,backyard,garage,description,img);
				list.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Property> getPropertybycatname(String catname){
		List<Property> list=new ArrayList<>();
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from property where type=? and pid not in (select propertyid from status where status=\"sold\" )");
			pst.setString(1,catname);
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int pid=rs1.getInt("pid");
				String sqft=rs1.getString("squarefeet");
				int oid=rs1.getInt("ownerid");
				String price=rs1.getString("price");
				String street=rs1.getString("street");
				String city=rs1.getString("city");
				String state=rs1.getString("state");
				String pincode=rs1.getString("pincode");
				String bedroom=rs1.getString("bedroom");
				String bathroom=rs1.getString("bathroom");
				String age=rs1.getString("age");
				String description=rs1.getString("description");
				int balcony=rs1.getInt("balcony");
				int pool=rs1.getInt("pool");
				int backyard=rs1.getInt("backyard");
				int garage=rs1.getInt("garage");
				String img=rs1.getString("image");
				Property p=new Property(pid,catname,sqft,oid,price,street,city,state,pincode,bedroom,bathroom,age,balcony,pool,backyard,garage,description,img);
				list.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Property> getPropertybyownerid(int oid){
		List<Property> list=new ArrayList<>();
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from property where ownerid=?");
			pst.setInt(1,oid);
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int pid=rs1.getInt("pid");
				String catname=rs1.getString("type");
				String sqft=rs1.getString("squarefeet");
				
				String price=rs1.getString("price");
				String street=rs1.getString("street");
				String city=rs1.getString("city");
				String state=rs1.getString("state");
				String pincode=rs1.getString("pincode");
				String bedroom=rs1.getString("bedroom");
				String bathroom=rs1.getString("bathroom");
				String age=rs1.getString("age");
				String description=rs1.getString("description");
				int balcony=rs1.getInt("balcony");
				int pool=rs1.getInt("pool");
				int backyard=rs1.getInt("backyard");
				int garage=rs1.getInt("garage");
				String img=rs1.getString("image");
				Property p=new Property(pid,catname,sqft,oid,price,street,city,state,pincode,bedroom,bathroom,age,balcony,pool,backyard,garage,description,img);
				list.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Property getPropertybypropertyid(int pid){
		Property p=null;
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from property where pid=?");
			pst.setInt(1,pid);
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int oid=rs1.getInt("ownerid");
				String catname=rs1.getString("type");
				String sqft=rs1.getString("squarefeet");
				String price=rs1.getString("price");
				String street=rs1.getString("street");
				String city=rs1.getString("city");
				String state=rs1.getString("state");
				String pincode=rs1.getString("pincode");
				String bedroom=rs1.getString("bedroom");
				String bathroom=rs1.getString("bathroom");
				String age=rs1.getString("age");
				String description=rs1.getString("description");
				int balcony=rs1.getInt("balcony");
				int pool=rs1.getInt("pool");
				int backyard=rs1.getInt("backyard");
				int garage=rs1.getInt("garage");
				String img=rs1.getString("image");
				p=new Property(pid,catname,sqft,oid,price,street,city,state,pincode,bedroom,bathroom,age,balcony,pool,backyard,garage,description,img);
				return p;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	
	
	public List<User> getAllUser(){
		List<User> list=new ArrayList<>();
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from user");
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int id=rs1.getInt("id");
				String username=rs1.getString("username");
				String password=rs1.getString("password");
				String firstname=rs1.getString("firstname");
				String lastname=rs1.getString("lastname");
				String gender=rs1.getString("gender");
				String phoneno=rs1.getString("phoneno");
				String email=rs1.getString("email");
				String city=rs1.getString("city");
				String state=rs1.getString("state");
				String zip=rs1.getString("zip");
				String type=rs1.getString("type");
				String about=rs1.getString("about");
				Timestamp rdate=rs1.getTimestamp("rdate");
				String profile=rs1.getString("profile");
				User p=new User(id,username,password,firstname,lastname,gender,phoneno,email,city,state,zip,type,about,rdate,profile);
				list.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean EditProperty(Property prop) {
		boolean flag=false;
		try {
			String query="update property set type=?,squarefeet=?,ownerid=?,price=?,street=?,city=?,state=?,pincode=?,bedroom=?,bathroom=?,age=?,balcony=?,pool=?,backyard=?,garage=?,description=?,image=? where pid=?";
		     PreparedStatement pst=con.prepareStatement(query);
		     pst.setString(1, prop.getType());
		     pst.setString(2, prop.getSquarefeet());
		     pst.setInt(3, prop.getOwnerid());
		     pst.setString(4, prop.getPrice());
		     pst.setString(5, prop.getStreet());
		     pst.setString(6, prop.getCity());
		     pst.setString(7, prop.getState());
		     pst.setString(8, prop.getPincode());
		     pst.setString(9, prop.getBedroom());
		     pst.setString(10, prop.getBathroom());
		     pst.setString(11, prop.getAge());
		     pst.setInt(12, prop.getBalcony());
		     pst.setInt(13, prop.getPool());
		     pst.setInt(14, prop.getBackyard());
		     pst.setInt(15, prop.getGarage());
		     pst.setString(16, prop.getText());
		     pst.setString(17, prop.getImg());
		     pst.setInt(18, prop.getPid());
		     pst.executeUpdate();
		     flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public boolean deleteProperty(int propertyID) {
		  PreparedStatement pst;
			 String deleteQuery="delete from property where pid=?";
			 
			 try {
				pst=con.prepareStatement(deleteQuery);
				pst.setInt(1, propertyID);
				return(pst.executeUpdate()>0);
				
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}	
	  }
	public int getOwneridfrompid(int pid) {
		PreparedStatement pst;
		int oid=0;
		String query="select ownerid from property where pid=?";
		try {
			pst=con.prepareStatement(query);
			pst.setInt(1, pid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				oid=rs.getInt("ownerid");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return oid;
	}
	
}



