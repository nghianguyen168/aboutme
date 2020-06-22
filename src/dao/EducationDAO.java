package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Education;
import model.ProjectCat;
import utils.DBConnectionUtil;

public class EducationDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public List<Education> getItem() {
		List<Education> eduList = new ArrayList<Education>();
		final String sql ="SELECT * FROM education ORDER BY id DESC";
		conn=DBConnectionUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Education edu=new Education(rs.getInt("id"), rs.getString("name"), rs.getString("timefrom"), rs.getString("timeto"), rs.getString("description"));
				eduList.add(edu);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return eduList;
	}
	public static void main(String[] args) {
		System.out.println(new EducationDAO().getItem().size());
	}
	public int addItem(Education edu) {
		int result=0;
		final String sql ="INSERT INTO education(name,timefrom,timeto,description) VALUES(?,?,?,?)";
		conn=DBConnectionUtil.getConnection();
		
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, edu.getName());
			pst.setString(2, edu.getTimefrom());
			pst.setString(3, edu.getTimeto());
			pst.setString(4, edu.getDescription());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return result;
	}
	public Education getEdu(int id) {
		Education edu = null;
		final String sql ="SELECT * FROM education WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
			 edu=new Education(rs.getInt("id"), rs.getString("name"), rs.getString("timefrom"), rs.getString("timeto"), rs.getString("description"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return edu;
	}
	public int editItem(Education edu) {
		int result = 0;
		final String sql ="UPDATE education SET name=?,timefrom=?,timeto=?,description=? WHERE id=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, edu.getName());
			pst.setString(2, edu.getTimefrom());
			pst.setString(3, edu.getTimeto());
			pst.setString(4, edu.getDescription());
			pst.setInt(5, edu.getId());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public int delItem(int id) {
		int result = 0;
		final String sql ="DELETE FROM education WHERE id=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
