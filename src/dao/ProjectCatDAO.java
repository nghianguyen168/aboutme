package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.ProjectCat;
import utils.DBConnectionUtil;

public class ProjectCatDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public List<ProjectCat> getItems() {
		List<ProjectCat> projectCatList = new ArrayList<ProjectCat>();
		final String sql ="SELECT * FROM project_cat";
		conn=DBConnectionUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ProjectCat projectCat = new ProjectCat(rs.getInt("id"), rs.getString("name"));
				projectCatList.add(projectCat);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return projectCatList;
	}
	
	public static void main(String[] args) {
		System.out.println(new ProjectCatDAO().getItems().size());
	}
}
