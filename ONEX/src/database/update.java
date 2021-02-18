package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class update {

	final  static Connection con=database.getDBConnection();
	PreparedStatement ps = null;
	
	public void updateStudent(int uId,String fName,String lName,String uName,String email,String pass,String contact,String city,String address,String userType){
        try {
            String sql="Update users set first_name=?,last_name=?,user_name=?,email=?,password=?,user_type=?,contact_no=?,city=?,address=? where user_id=?";
            
            ps=con.prepareStatement(sql);
            ps.setString(1,fName);
            ps.setString(2,lName);
            ps.setString(3,uName);
            ps.setString(4,email);
            ps.setString(5,pass);
            ps.setString(6,userType);
            ps.setString(7,contact);
            ps.setString(8,city);
            ps.setString(9,address);
            ps.setInt(10,uId);
            ps.executeUpdate();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }	
}
