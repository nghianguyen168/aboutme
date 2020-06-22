package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Skill;
import utils.DBConnectionUtil;

public class SkillDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public List<Skill> getItems() {
		List<Skill> skillList = new ArrayList<Skill>();
		final String sql="SELECT id,name,level FROM skill ORDER BY id DESC";
		conn=DBConnectionUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Skill skill= new Skill(rs.getInt("id"),rs.getString("name"), rs.getInt("level"));
				skillList.add(skill);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
		return skillList;
	}
	public static void main(String[] args) {
		System.out.println(new SkillDAO().getItems().size());
	}
	public int addItem(Skill skill) {
		int result=0;
		conn=DBConnectionUtil.getConnection();
		final String sql="INSERT INTO skill(name,level) VALUES(?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, skill.getName());
			pst.setInt(2, skill.getLevel());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		
		return result;
	}
	public int delItem(int id) {
		int result=0;
		conn=DBConnectionUtil.getConnection();
		final String sql="DELETE FROM skill WHERE id=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1,id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return result;
	}
	public int updateItem(int id, int level) {
		int result=0;
		conn=DBConnectionUtil.getConnection();
		final String sql="UPDATE skill SET level=? WHERE id=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1,level);
			pst.setInt(2,id);
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
