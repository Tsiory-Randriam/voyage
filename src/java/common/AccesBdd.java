package common;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import config.Config;
public class AccesBdd 
{
	public Connection 	conn 			= null; //etablir la relation avec le base de donner
	public ResultSet 	resultSet 		= null; //valeur table
	public String driver;
	public String url;
	public  String user; // variable local
	public String password;
	public AccesBdd() //constructeur 
	{
		Config	config	=	new Config() ;
		this.driver 	= 	config.driver; //variable globale
		this.url 		= 	config.url;
		this.user 		= 	config.user;
		this.password 	= 	config.password;
	}
	/**
	 * @param args
	 */
	public void loadDriver() 
	{
		try //if
		{
			//chargement Driver
			Class.forName(driver); //chargement
		}
		catch(ClassNotFoundException e)
		{
			System.err.println("Driver non trouv�");
		}
		catch(Exception e) //autre problem
		{
			e.printStackTrace();
		}
	}

	public Connection getConnection()
	{
		if (conn == null)
		{
			try
			{
				//Connexion
				conn = DriverManager.getConnection(url,user,password);
			}
			catch(SQLException e)
			{
				System.err.println("Probl�me de connexion  : "+ e.getMessage());
			}
		}
		else
		{
			try 
			{
				if (conn.isClosed())
					conn = DriverManager.getConnection(url,user,password);
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return conn;
	}
	
	public ResultSet executeSelect(String sql)
	{
		Statement statement;
		try {
			if (resultSet != null)
				resultSet.close();
			statement = getConnection().createStatement();
			resultSet = statement.executeQuery(sql);
			
			return resultSet ;
		} 
		catch (Exception e) {
			//throw new RuntimeException(e);
			System.out.println(e);
		}
		return resultSet;
	}
	public void executeUpdate(String sql)
	{
		Statement statement;
		try {
			statement = getConnection().createStatement();
			statement.executeUpdate(sql);
		} 
		catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void closeConnection()
	{
		try 
		{
			if (resultSet != null)
				resultSet.close();
			if (conn != null)
				conn.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int executeInsert(String sql) {
		{
			Statement statement;
			try {
				if (resultSet != null){
					resultSet.close();
				}
				statement = getConnection().createStatement();				
		        int rowsAffected = statement.executeUpdate(sql);
		        
		        return rowsAffected;
			} 
			catch (Exception e) {
				//throw new RuntimeException(e);
				System.out.println(e);
			}
			return 0;
	}
}
}
