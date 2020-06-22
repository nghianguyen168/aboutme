package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Home;
import utils.DBConnectionUtil;

public class HomeDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public Home getItem() {
		Home home=null;
		final String sql="SELECT * FROM home";
		conn=DBConnectionUtil.getConnection();
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) {
				home = new Home(rs.getInt("id"), rs.getString("title"), rs.getString("description"), rs.getString("picture"), rs.getInt("status"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return home;
	}
	public Home getItem(int id) {
		Home home=null;
		final String sql="SELECT * FROM home WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
		pst=conn.prepareStatement(sql);
		pst.setInt(1, id);
		rs=pst.executeQuery();
			if(rs.next()) {
				home = new Home(rs.getInt("id"), rs.getString("title"), rs.getString("description"), rs.getString("picture"), rs.getInt("status"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		return home;
	}
	public int editItem(Home home1) {
		int result=0;
		final String sql="UPDATE home SET title=?,description=?,picture=? WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, home1.getTitle());
			pst.setString(2, home1.getDescription());
			pst.setString(3, home1.getPicture());
			pst.setInt(4, home1.getId());
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
