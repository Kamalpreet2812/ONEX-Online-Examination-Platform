package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import database.*;
import entities.Answers;
import entities.Exams;

public class result {
	final  static Connection con=database.getDBConnection();
	PreparedStatement ps = null;
	
	public void insertAnswer(int eId,int qid,String question,String ans){
        try {
            ps=con.prepareStatement("insert into answers(exam_id,question,answer,correct_answer,status) "
                    + "Values(?,?,?,?,?)");
           ps.setInt(1, eId);
            ps.setString(2, question);
            ps.setString(3, ans);
            	PreparedStatement ps1=con.prepareStatement("Select correct from questions where question_id=?");
            	ps1.setInt(1, qid);
            	ResultSet rs=ps1.executeQuery();
            	String a="";
                while(rs.next()){
                    a=rs.getString(1);
                }
            ps.setString(4,a);
	            if(ans.equals(a))
	            	 ps.setString(5, "correct");
		        else
		        	 ps.setString(5, "incorrect");
		        
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
   } 
  
	  
	  public void calculateResult(int eid,int tMarks,String endTime,int size){
	        
	        try {
	            String sql="update exams set obt_marks=?, end_time=?,status=? where exam_id=?";
	            ps=con.prepareStatement(sql);
	            	
	            	PreparedStatement ps1=con.prepareStatement("select count(answer_id) from answers where exam_id=? and status='correct'");
	            	ps1.setInt(1, eid);
		            ResultSet rs=ps1.executeQuery();
		            int m=0;
		            while(rs.next())
		            {
			           m = rs.getInt(1);
			        }
		            float rat=(float)tMarks/size;
			        rat=m*rat;
			        
	            ps.setFloat(1, rat);
	            ps.setString(2,endTime);
	            float percent=((rat*100)/tMarks);
	            if(percent>=45.0){
	                ps.setString(3,"Pass");
	            }else{
	                ps.setString(3,"Fail");
	            }
	            ps.setInt(4, eid);
	            ps.executeUpdate();
	        } 
	        catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	  
	  
	  
	  public ArrayList getAllResultsFromExams(int stdId){
	        ArrayList list=new ArrayList();
	        Exams exam=null;
	        try {
	            ps=con.prepareStatement("select * from exams where std_id=? order by date desc");
	            ps.setInt(1, stdId);
	            ResultSet rs=ps.executeQuery();
	            while(rs.next()){
	                exam=new Exams(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
	                ,rs.getString(6),getFormatedTime(rs.getString(7)),getFormatedTime(rs.getString(8)),rs.getString(9),rs.getString(10));
	                list.add(exam);
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	        return list;
	        
	    }
	  
	  String getFormatedTime(String time)
	    {
	        if(time!=null)
	        {
	            LocalTime localTime=LocalTime.parse(time);
	            return  localTime.format(DateTimeFormatter.ofPattern("hh:mm a"));
	        }
	        else
	        {    
		        return  "-";
		    }
	    }
	 
	  
	  public ArrayList getAllAnswersByExamId(int examId){
	        ArrayList list=new ArrayList();
	        try {
	            
	            String sql="Select * from answers where exam_id=?";
	            ps=con.prepareStatement(sql);
	            ps.setInt(1,examId);
	            ResultSet rs=ps.executeQuery();
	            Answers a;
	            while(rs.next()){
	               a = new Answers(
	                       rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
	                    ); 
	               list.add(a);
	            }
	            ps.close();
	        } catch (SQLException ex) {
	           ex.printStackTrace();
	        }
	        return list;
	    }
}
