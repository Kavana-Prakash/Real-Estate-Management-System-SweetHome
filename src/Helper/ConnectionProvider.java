/** Copyright Kavana to present
All Rights reserved.
*/
package Helper;
import java.sql.*;
public class ConnectionProvider {
   private static Connection con;
   public static Connection getConnection() {
		 
	   try {
		   if(con==null) {
			   Class.forName("com.mysql.jdbc.Driver");
		       con=DriverManager.getConnection("jdbc:mysql://localhost:3306/realestate?autoReconnect=true&useSSL=false","root","root"); 
		      
		       
		       
		   }
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
	   return con;
   }
}
