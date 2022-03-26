/** Copyright Kavana to present
All Rights reserved.
*/
package entities;

public class Status {
	private int id;
    private int propid;
    private int ownerid;
    private int clientid;
    private String status;
	public Status(int id, int propid, int ownerid, int clientid, String status) {
		super();
		this.id = id;
		this.propid = propid;
		this.ownerid = ownerid;
		this.clientid = clientid;
		this.status = status;
	}
	public Status(int propid, int ownerid, int clientid, String status) {
		super();
		this.propid = propid;
		this.ownerid = ownerid;
		this.clientid = clientid;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPropid() {
		return propid;
	}
	public void setPropid(int propid) {
		this.propid = propid;
	}
	public int getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
	public int getClientid() {
		return clientid;
	}
	public void setClientid(int clientid) {
		this.clientid = clientid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
    
}
