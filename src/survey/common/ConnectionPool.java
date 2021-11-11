package survey.common;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionPool {
	
	private static ConnectionPool instance= null;
	private static DataSource ds= null;
	
	private ConnectionPool() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/myOracle");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ConnectionPool getInstance() {
		if (instance== null) {
			instance= new ConnectionPool();
		}
		return instance;
	}
	
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
}
