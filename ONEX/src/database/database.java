package database;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class database {
	public static Connection getDBConnection()
	{
	Connection con = null;
	try
	{
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?serverTimezone=UTC","root","");
	System.out.println("establised");
	}
	catch(ClassNotFoundException e)
	{
	System.out.println("Driver not loaded");
	}
	catch(SQLException e)
	{
	System.out.println("Connection not established");
	}
	return con;
	}
}