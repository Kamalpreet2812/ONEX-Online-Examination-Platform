package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Questions;

public class questions {
	final  static Connection con=database.getDBConnection();
	PreparedStatement ps = null;
	
	public void addQuestion(String cName,String question,String opt1,String opt2,String opt3,String opt4,String correct){
			try {
				
				String sql="INSERT into questions( `question`, `opt1`, `opt2`, `opt3`, `opt4`, `correct`,course_name)"
				+ " VALUES (?,?,?,?,?,?,?)";
				ps=con.prepareStatement(sql);
				ps.setString(1,question);
				ps.setString(2,opt1 );
				ps.setString(3,opt2 );
				ps.setString(4, opt3);
				ps.setString(5,opt4 );
				ps.setString(6,correct );
				ps.setString(7,cName);
				ps.executeUpdate();
			} 
			catch (SQLException ex) {
				ex.printStackTrace();
			}
}
	
	public void delQuestion(int qId){
        try {
            String sql="DELETE from questions where question_id=?";
            ps=con.prepareStatement(sql);
            ps.setInt(1,qId);
            ps.executeUpdate();
           } 
        catch (SQLException ex) {
        ex.printStackTrace();
        }
    }
	
	public ArrayList getQuestions(String courseName,int questions){
        ArrayList list=new ArrayList();
        try {
            
            String sql="Select * from questions where course_name=? ORDER BY RAND() LIMIT ?";
            ps=con.prepareStatement(sql);
            ps.setString(1,courseName);
            ps.setInt(2,questions);
            ResultSet rs=ps.executeQuery();
            Questions question;
            while(rs.next()){
               question = new Questions(rs.getInt(1),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(2)); 
               list.add(question);
            }
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
        return list;
    }
	
	
	public ArrayList getAllQuestions(String courseName){
        ArrayList list=new ArrayList();
        try {
            
            String sql="Select * from questions where course_name=?";
            ps=con.prepareStatement(sql);
            ps.setString(1,courseName);
            ResultSet rs=ps.executeQuery();
            Questions question;
            while(rs.next()){
               question = new Questions(rs.getInt(1),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(2)); 
               list.add(question);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
}
