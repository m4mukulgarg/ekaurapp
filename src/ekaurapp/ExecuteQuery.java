package ekaurapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public final class ExecuteQuery {
	/**b2674e642689a3:9804ed0c
	 * JDBC driver name and database URL
	 */
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://us-cdbr-iron-east-04.cleardb.net:3306/heroku_a00603a252ed839?reconnect=true";
//	private static final String DB_URL = "jdbc:mysql://localhost:3306/ekaurapp?useSSL=false";

	/**
	 *   Database credentials
	 */
	private static final String USER = "b2674e642689a3";
	private static final String PASS = "9804ed0c";
	
	
	private static ResultSet rs = null;
	public static Connection conn = null;
	public static Statement stmt = null; 
	private ExecuteQuery () {}
	
	/**
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public static ResultSet executeSQL(String sql) throws Exception {
		try {
			// Register JDBC driver
			Class.forName(JDBC_DRIVER).newInstance();

			// Open a connection
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			// Execute SQL query
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			stmt.closeOnCompletion();
			
		} catch(Exception e) {
			throw new Exception(e);
		}
		return rs;
	}
	
	/**
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public static int executeInsert(String sql) throws Exception {
		int success;
		try {
			// Register JDBC driver
			Class.forName(JDBC_DRIVER).newInstance();

			// Open a connection
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			// Execute SQL query
			stmt = conn.createStatement();
			success = stmt.executeUpdate(sql);
			conn.close();
		} catch(Exception e) {
			throw new Exception(e);
		}
		return success;
	}

	/**
	 * 
	 */
	public static void closeConnection() {

		try {
			if(!ExecuteQuery.conn.isClosed())
				ExecuteQuery.conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
