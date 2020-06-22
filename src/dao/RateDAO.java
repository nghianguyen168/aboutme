package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Rate;
import utils.DBConnectionUtil;

public class RateDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public int addItem(Rate rate) {
		int result=0;
		final String sql="INSERT INTO rate(username,star,news_id) VALUES(?,?,?)";
		conn = DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, rate.getUsername());
			pst.setInt(2, rate.getStar());
			pst.setInt(3, rate.getNews_id());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return result;
	}
	public int checkRate(Rate rate) {
		int result=0;
		final String sql = "SELECT * FROM rate WHERE news_id=? AND username=?";
		conn= DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rate.getNews_id());
			pst.setString(2, rate.getUsername());
			rs = pst.executeQuery();
			if(rs.next()) {
				result=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return result;
	}
	
	public int sumRate(int id) {
		int result=0;
		final String sql = "SELECT * FROM rate WHERE news_id=?";
		conn= DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while(rs.next()) {
				result++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return result;
	}
	public int sumRate(int star,int id) {
		int result=0;
		final String sql = "SELECT * FROM rate WHERE star=? AND news_id=?";
		conn= DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, star);
			pst.setInt(2,id );
			rs = pst.executeQuery();
			while(rs.next()) {
				result++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return result;
	}
	public static void main(String[] args) {
	
	}
}
