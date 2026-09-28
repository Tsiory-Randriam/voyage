package dao;

import java.sql.SQLException;
import common.AccesBdd;
import java.sql.ResultSet;

public class UserDao {
	private ResultSet resultat;
	public boolean verifByUser(String login,String password)throws SQLException
	{
		boolean validation = false;
		AccesBdd  acces = new AccesBdd();
		acces.loadDriver();
		String sql = "SELECT * FROM user WHERE login='"+login+"' and password='"+password+"' LIMIT 1";
		ResultSet resultat = (ResultSet) acces.executeSelect(sql);
		while(resultat.next()) //valeur par ligne
		{
			validation = true;
		}
		acces.closeConnection();
		return validation;
	}
	public void InsertionStylo(String marque,String color,int nombre)throws SQLException
	{
		AccesBdd acces = new AccesBdd();
		acces.loadDriver();
		String sql = "INSERT INTO stylo(marque,color,nombre) VALUES ('"+marque+"','"+color+"','"+nombre+"');";
		try {
			int resultat =  acces.executeInsert(sql);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		acces.closeConnection();
	}

public void InsertionUser(String login,String password)throws SQLException
{
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String sql = "INSERT INTO user(login,password) VALUES ('"+login+"','"+password+"');";
	try {
		int resultat =  acces.executeInsert(sql);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	
	acces.closeConnection();
}


public String VerifStatus(String login,String password){
	AccesBdd acces = new AccesBdd();
	acces.loadDriver();
	String status = "SELECT status from user where login='"+login+"' and password = '"+password+"'";
	ResultSet resultat = (ResultSet) acces.executeSelect(status);
	System.out.println(resultat);
	return status;
}


}
