package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;
import model.UserGuest;
import utils.DBConnectionUtil;

public class UserGuestDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public UserGuest checkUser(String username, String password) {
		UserGuest userGuest = null;
		final String sql = "SELECT * FROM user_guest WHERE username=? AND password=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()) {
				userGuest = new UserGuest(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return userGuest;
	}
	
	public UserGuest checkStrung(String username) {
		UserGuest userGuest = null;
		final String sql = "SELECT * FROM user_guest WHERE username=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
		
			rs = pst.executeQuery();
			if(rs.next()) {
				userGuest = new UserGuest(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return userGuest;
	}
	public int addItem(String username, String pass, String fullname) {
		int result=0;
		final String sql="INSERT INTO user_guest(username,password,fullname)"
				+ "VALUES(?,?,?)";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, pass);
			pst.setString(3, fullname);
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return result;
	}

	public List<UserGuest> findAll() {
		List<UserGuest> userList = new ArrayList<UserGuest>();
		final String sql="SELECT id,username,password,fullname FROM user_guest";
		conn=DBConnectionUtil.getConnection();
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				UserGuest user=new UserGuest(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"));
				userList.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		return userList;
	}

	public  int delItem(int id) {
		int result=0;
		final String sql="DELETE FROM user_guest WHERE id=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result= pst.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return result;
	}
	
}
