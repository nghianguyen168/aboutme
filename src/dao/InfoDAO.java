package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Info;
import utils.DBConnectionUtil;

public class InfoDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public Info getItem() {
		Info info = null;
		final String sql ="SELECT * FROM info";
		conn= DBConnectionUtil.getConnection();
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				info = new Info(rs.getString("name"), rs.getInt("age"), rs.getInt("experience"), rs.getString("place"), rs.getString("email"), rs.getString("phone"), rs.getString("description"),rs.getString("images"),rs.getString("cv"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		return info;
	}
	public static void main(String[] args) {
		System.out.println(new InfoDAO().getItem().getEmail());
	}
	public int updateInfo(Info info) {
		int result=0;
		conn=DBConnectionUtil.getConnection();
		final String sql = "UPDATE info SET name=?,age=?,experience=?,place=?,email=?,phone=?,description=?,images=?,cv=?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, info.getName());
			pst.setInt(2, info.getAge());
			pst.setInt(3, info.getExperience());
			pst.setString(4, info.getPlace());
			pst.setString(5, info.getEmail());
			pst.setString(6, info.getPhone());
			pst.setString(7, info.getDescription());
			pst.setString(8, info.getImage());
			pst.setString(9, info.getCv());
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
