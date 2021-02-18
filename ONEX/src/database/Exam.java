package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class Exam {
	final  static Connection con=database.getDBConnection();
	PreparedStatement ps = null;
	
	public int startExam(String cName,int sId){
        int examId=0;
        try {
            String sql="INSERT into exams(course_name,date,start_time,exam_time,std_id,total_Marks) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,cName);	
            ps.setString(2,getFormatedDate(LocalDate.now().toString()));
            ps.setString(3,LocalTime.now().toString());
            ps.setString(4,getCourseTimeByName(cName));
            ps.setInt(5,sId);
            ps.setInt(6, getTotalMarksByName(cName));
            ps.executeUpdate();
            ps.close();
            examId=getLastExamId();
        } 
        catch (SQLException ex) {
           ex.printStackTrace();
        }
        return examId;
    }
	
	 public String getFormatedDate(String date)
	 {
	        LocalDate localDate=LocalDate.parse(date);
	        return localDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
	 }
	 
    public String getNormalDate(String date)
    {
        String[] d=date.split("-");
        return d[2]+"-"+d[1]+"-"+d[0];
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
    
    public String getCourseTimeByName(String cName){
        String c=null;
        try{
            ps=con.prepareStatement("Select time from courses where course_name=?");
            ps.setString(1,cName);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                c=rs.getString(1);
            }
            ps.close();
        }
        catch(Exception e){
             e.printStackTrace();
        }
        
        return c;
       }
    
       public int getTotalMarksByName(String cName){
        int marks=0;
        try{
            ps=con.prepareStatement("Select total_marks from courses where course_name=?");
            ps.setString(1,cName);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                marks=rs.getInt(1);
                System.out.println(rs.getInt(1));
            }
            ps.close();
        }
        catch(Exception e){
             e.printStackTrace();
        }     
        return marks;
       }
       
       public int getLastExamId(){
           int id=0;
            try {
               
               String sql="Select * from exams";
               ps=con.prepareStatement(sql);
               ResultSet rs=ps.executeQuery();
               
               while(rs.next()){
                  id=rs.getInt(1);
               }
               ps.close();
           } catch (SQLException ex) {
        	   ex.printStackTrace();
           }
            return id;
       }
       
       
       public int getRemainingTime(int examId){
           int time=0;
           try {
               
               String sql="Select start_time,exam_time from exams where exam_id=?";
               ps=con.prepareStatement(sql);
               ps.setInt(1, examId);
               ResultSet rs=ps.executeQuery();
               while(rs.next()){
                   time=Integer.parseInt(rs.getString(2))-(int)Math.abs((Duration.between(LocalTime.now(),LocalTime.parse(rs.getString(1))).getSeconds()/60));
               }
               ps.close();
           } catch (SQLException ex) {
               ex.printStackTrace();
           }
           System.out.println(time);
           return time;
       }
       
       
       
}
