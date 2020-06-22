package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.DatabaseMetaData;

public class TestSQL {
	public static void main(String[] args) {
		try {
			String dbURL = "jdbc:sqlserver://DESKTOP-PPOG0J8:1433;databaseName=HRM;user=sa;password=123456";
			Connection conn = DriverManager.getConnection(dbURL);
			if (conn != null) {
				System.out.println("Connected");
				DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();
				System.out.println("Driver name: " + dm.getDriverName());
				System.out.println("Driver version: " + dm.getDriverVersion());
				System.out.println("Product name: " + dm.getDatabaseProductName());
				System.out.println("Product version: " + dm.getDatabaseProductVersion());
			}
		} catch (SQLException ex) {
			System.err.println("Cannot connect database, " + ex);
		}
	}

}
