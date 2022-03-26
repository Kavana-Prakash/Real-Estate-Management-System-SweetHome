/** Copyright Kavana to present
All Rights reserved.
*/
package Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entities.Property;
import entities.Status;

public class StatusDao {
	Connection con;
	public StatusDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean insertStatus(int propid,int oid,int cid) {
		boolean flag=false;
		try 
		{
			String query="insert into status(propertyid,ownerid,clientid) values(?,?,?)";
			PreparedStatement p=this.con.prepareStatement(query);
			p.setInt(1, propid);
			p.setInt(2, oid);
			p.setInt(3, cid);
			p.executeUpdate();
			flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public int countNumberOfRequests(int pid) {
		int count=0;
		try {
			String q="select count(*) from status where ownerid=? and status!='sold' and propertyid in (select pid from property)";
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1, pid);
			ResultSet rs=p.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public int countNumberOfRequestsHistory(int pid) {
		int count=0;
		try {
			String q="select count(*) from status where ownerid=? and status='sold'";
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1, pid);
			ResultSet rs=p.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public boolean isAddProperty(int pid,int cid) {
		boolean flag=false;
		try {
			String q="select * from status where propertyid=? and clientid=?";
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2, cid);
			ResultSet rs=p.executeQuery();
			if(rs.next()) {
				flag=true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	
	public boolean deletebought(int propid,int cid) {
		boolean flag=false;
		try {
			String q="delete from status where propertyid=? and clientid=?";
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1, propid);
			p.setInt(2, cid);
			p.executeUpdate();
				flag=true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public List<Status> getStatusbyclientid(int cid){
		List<Status> list=new ArrayList<Status>();
		Status p=null;
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from status where clientid=? and propertyid in (select pid from property)");
			pst.setInt(1,cid);
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int oid=rs1.getInt("ownerid");
				String status=rs1.getString("status");
				int pid=rs1.getInt("propertyid");
				p=new Status(pid,oid,cid,status);
				list.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Status> getStatusbyownerid(int oid){
		List<Status> list=new ArrayList<Status>();
		Status p=null;
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from status where ownerid=? and propertyid in (select pid from property)" + 
					"");
			pst.setInt(1,oid);
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int cid=rs1.getInt("clientid");
				String status=rs1.getString("status");
				int pid=rs1.getInt("propertyid");
				p=new Status(pid,oid,cid,status);
				list.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Status getStatusByclientidandpropertyid(int cid,int pid) {
		Status p=null;
		try {
			PreparedStatement pst=this.con.prepareStatement("select * from status where clientid=? and propertyid=?");
			pst.setInt(1,cid);
			pst.setInt(2, pid);
			ResultSet rs1=pst.executeQuery();
			while(rs1.next()) {
				int oid=rs1.getInt("ownerid");
				String status=rs1.getString("status");
				p=new Status(pid,oid,cid,status);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return p;
	}
	public boolean EditStatus(Status stat) {
		boolean flag=false;
		try {
			String query="update status set ownerid=?,clientid=?,status=? where propertyid=?";
		     PreparedStatement pst=con.prepareStatement(query);
		     pst.setInt(1, stat.getOwnerid());
		     pst.setInt(2, stat.getClientid());
		     pst.setString(3, stat.getStatus());
		     pst.setInt(4, stat.getPropid());
		     pst.executeUpdate();
		     flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
