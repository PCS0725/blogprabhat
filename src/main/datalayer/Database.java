package main.datalayer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import main.Config;
import main.model.Article;

import java.util.ArrayList;

/*
 *The  data access layer (DAO)
 *All accesses to database are made by this class only. It provides simple interfaces(functions) to
 *perform various operations on the underlying database
 *Achieves decoupling, hence more options for including other databases
 *All the methods are static and establish their own connections with the database.
 */
public class Database {
	
	static final String url =  "jdbc:mysql://localhost:3306/blog"; //the url is unique for each db
	static final String username = Config.dbName;         
	static final String password = Config.dbPass;  
	
	public static Article getById(int id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  //include these drivers in WEB_INF lib folder(a jar file)
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement(); 
			String sql = "SELECT* FROM articles WHERE id ="+id;  //painful part, Hibernate, where are you..
			ResultSet rs = st.executeQuery(sql);
			rs.next();// this thing took 3-5 hours to get right. Positioning the cursor at first row before reading.
			Article result = new Article(rs.getInt("id"),rs.getDate("publicationDate"),rs.getString("title"),rs.getString("summary"),rs.getString("content"));
			rs.close();
			st.close();
			con.close();
			return result;
			}catch(Exception e2) {
				System.out.println("Couldn't connect to database");
				return null;
		}
	}
	public static ArrayList<Article> getList(int numRows){
		ArrayList<Article> result=new ArrayList<Article>(numRows);  //numRows sets the limit on number of results to get from the query
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();    
			String sql = "SELECT* FROM articles ORDER BY publicationDate DESC LIMIT "+ numRows;
			ResultSet rs = st.executeQuery(sql);   
			while(rs.next()) {
				result.add(new Article(rs.getInt("id"),rs.getDate("publicationDate"),rs.getString("title"),rs.getString("summary"),rs.getString("content")));
			}
			rs.close();
			st.close();
			con.close();
			}catch(Exception e) {
				System.out.println("Couldn't connect to database");
			}
		return result;
	}
	
	public static int insert(Article article) { //returns the id of last inserted article
		if(article.getId()==0)
			return -1;	
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
			Date date = new Date();
			java.text.SimpleDateFormat sdf = 
				     new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");   //these dates and formats are another form of devil
			String dte = sdf.format(date);
			//because the datetime type in sql for publicationDate accepts date in sdf format.
			String sql = "INSERT INTO articles ( publicationDate, title, summary, content ) VALUES ('"+dte+"','"+article.getTitle()+"','"+article.getSummary()+"','"+article.getContent()+"')";
			//System.out.println(sql);
			st.execute(sql);  //No result is expected in return, do not use ResultSet here.
			st.close();
			con.close();
			return 1;
		}catch(Exception e2) {
			System.out.println("Couldn't connect to database");
			return -1;
		}
	}
	
	public static int update(Article article) { 
		if(article.getId()==0) //if no article with this id exists
			return -1;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement(); 
			Date date = new Date();
			java.text.SimpleDateFormat sdf = 
				     new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String dte = sdf.format(date);
			String sql = "UPDATE articles SET publicationDate='"+dte+"', title= '"+article.getTitle()+"', summary= '"+article.getSummary()+"', content= '"+article.getContent() +"'  WHERE id = "+article.getId();
			//System.out.println(sql);
			st.execute(sql);
			st.close();
			con.close();
			return 1;
		}catch(Exception e2) {
			System.out.println("Couldn't connect to database");
			return -1;
		}
	}
	public static int delete(int id) {
		if(id==0) //no such article
			return -1;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement(); 
			String sql = "DELETE FROM articles WHERE id = "+id;
			//System.out.println(sql);
			st.execute(sql);
			st.close();
			con.close();
			return 1;
		}catch(Exception e2) {
			System.out.println("Couldn't connect to database");
			return -1;
		}
	}
}
