package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Project;
import utils.DBConnectionUtil;

public class ProjectDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public List<Project> getItems() {
	List<Project> projectList = new ArrayList<Project>();
	final String sql="SELECT p.id,p.name,picture,link,description,p.cat_id,pc.name AS cat,visit FROM project AS p INNER JOIN project_cat AS pc ON p.cat_id=pc.id ORDER BY id DESC";
	conn=DBConnectionUtil.getConnection();
	try {
		st=conn.createStatement();
		rs = st.executeQuery(sql);
		while(rs.next()) {
			Project project = new Project(rs.getInt("id"), rs.getString("name"), rs.getString("picture"), 
					rs.getString("link"), rs.getString("description"), rs.getInt("cat_id"),rs.getString("cat"),rs.getInt("visit"));
			projectList.add(project);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		DBConnectionUtil.close(conn, pst, rs);
	}

	
	return projectList;
	}
	
	
	public static void main(String[] args) {
		System.out.println(new ProjectDAO().getItems().size());
	}


	public int addItem(Project project) {
		int resutl=0;
		final String sql = "INSERT INTO project(name,picture,link,description,cat_id) VALUES(?,?,?,?,?)";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, project.getName());
			pst.setString(2, project.getPicture());
			pst.setString(3, project.getLink());
			pst.setString(4, project.getDescription());
			pst.setInt(5, project.getCat_id());
			resutl = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return resutl;
	}


	public Project getItem(int id) {
		Project project=null;
		final String sql="SELECT p.id,p.name,picture,link,description,p.cat_id,pc.name AS cat,visit FROM project AS p INNER JOIN project_cat AS pc ON p.cat_id=pc.id "
				+ "WHERE p.id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				 project = new Project(rs.getInt("id"), rs.getString("name"), rs.getString("picture"), 
						rs.getString("link"), rs.getString("description"), rs.getInt("cat_id"),rs.getString("cat"),rs.getInt("visit"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, st, rs);
		}

		
		return project;
	}


	public int EditItem(Project project) {
		int resutl=0;
		final String sql = "UPDATE project SET name=?,picture=?,link=?,description=?,cat_id=? WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, project.getName());
			pst.setString(2, project.getPicture());
			pst.setString(3, project.getLink());
			pst.setString(4, project.getDescription());
			pst.setInt(5, project.getCat_id());
			pst.setInt(6, project.getId());
			resutl = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return resutl;
	}


	public int delItem(int id) {
		int resutl=0;
		final String sql ="DELETE FROM project WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			resutl=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resutl;
	}
}
