package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class add_delCourse {
	final  static Connection con=database.getDBConnection();
	PreparedStatement ps = null;
	
	public void addNewCourse(String courseName,int tMarks,String time,String testkey){
        try {
            String sql="INSERT into courses(course_name,total_marks,time,testkey) Values(?,?,?,?)";
            ps=con.prepareStatement(sql);
            ps.setString(1, courseName);
            ps.setInt(2,tMarks);
            ps.setString(3,time);
            ps.setString(4,testkey);
            ps.executeUpdate();
        } 
        catch (SQLException ex) {
           ex.printStackTrace();
        }
    }
    public void delCourse(String cName){
        try {
            String sql="DELETE from courses where course_name=?";
            
            ps=con.prepareStatement(sql);
            ps.setString(1,cName);
            ps.executeUpdate();
            ps.close();
        } 
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    
    public ArrayList getAllCourses(){
        ArrayList list=new ArrayList();
        try {
            String sql="SELECT * from courses";
            ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                list.add(rs.getString(1));
                list.add(rs.getInt(2));
            }
            
        } catch (SQLException ex) {
        ex.printStackTrace();    
        }
        return list;
    }
    
    public boolean checkTestKey(String testkey, String cName) throws SQLException 
    {
    	String sql="SELECT testkey FROM courses WHERE course_name=?";
	    ps=con.prepareStatement(sql);
	    ps.setString(1,cName);
	    ResultSet rs=ps.executeQuery();
	    while(rs.next())
	    {
	            if( rs.getString("testkey").equals(testkey))
	               return true; 
	    }
	    return false;
    }
}
