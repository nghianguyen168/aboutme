package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;
import utils.DBConnectionUtil;

public class UserDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public User checkUser(String username, String password) {
		User user =null;
		final String sql="SELECT u.id,username,password,fullname,r.role_name AS role_name  FROM user AS u INNER JOIN role "
				+ "AS r ON u.role_id=r.id   WHERE username=? AND password =?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("role_name"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			return user;
	}
	public List<User> getItem() {
		List<User> userList = new ArrayList<User>();
		final String sql="SELECT u.id AS id,username,password,fullname,r.role_name AS role_name FROM user AS u INNER JOIN role AS r ON u.role_id=r.id";
		conn=DBConnectionUtil.getConnection();
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				User user=new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("role_name"));
				userList.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return userList;
	}
	public int addItem(User user) {
		int result=0;
		final String sql="INSERT INTO user(username,password,fullname,role_id) VALUES(?,?,?,?)";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getFullname());
			pst.setInt(4, user.getRole_id());
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public User checkTrungUser(String username) {
		User user =null;
		final String sql="SELECT u.id,username,password,fullname,r.role_name AS role_name  FROM user AS u INNER JOIN role "
				+ "AS r ON u.role_id=r.id   WHERE username=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if(rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("role_name"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			return user;
	}
	public int delItem(int id) {
		int result=0;
		final String sql="DELETE FROM user WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public User getItemById(int id) {
		User user=null;
		final String sql="SELECT u.id AS id,r.id AS role_id,username,password,fullname,r.role_name AS role_name FROM user AS u INNER JOIN role AS r ON u.role_id=r.id WHERE u.id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				user=new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"),rs.getInt("role_id"),rs.getString("role_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return user;
	}
	public int update(User user) {
		int result=0;
		String sql="UPDATE user SET password=?,fullname=?, role_id=? WHERE id=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
	
			pst.setString(1, user.getPassword());
			pst.setString(2, user.getFullname());
			pst.setInt(3, user.getRole_id());
			pst.setInt(4, user.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return result;
	}
	public int updateNoPass(User user) {
		int result=0;
		String sql="UPDATE user SET fullname=?, role_id=? WHERE id=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
	
			pst.setString(1, user.getFullname());
			pst.setInt(2, user.getRole_id());
			pst.setInt(3, user.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return result;
	}
	
}
