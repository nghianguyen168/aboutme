package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Work;
import model.Education;
import model.ProjectCat;
import utils.DBConnectionUtil;

public class WorkDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public List<Work> getItem() {
		List<Work> workList = new ArrayList<Work>();
		final String sql ="SELECT * FROM experience ORDER BY id DESC";
		conn=DBConnectionUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Work work=new Work(rs.getInt("id"), rs.getString("name"), rs.getString("timefrom"), rs.getString("timeto"), rs.getString("description"));
				workList.add(work);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return workList;
	}
	public static void main(String[] args) {
		System.out.println(new WorkDAO().getItem().size());
	}
	public int addItem(Work work) {
		int result=0;
		final String sql ="INSERT INTO experience(name,timefrom,timeto,description) VALUES(?,?,?,?)";
		conn=DBConnectionUtil.getConnection();
		
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, work.getName());
			pst.setString(2, work.getTimefrom());
			pst.setString(3, work.getTimeto());
			pst.setString(4, work.getDescription());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return result;
	}
	public Work getwork(int id) {
		Work work = null;
		final String sql ="SELECT * FROM experience WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
			 work=new Work(rs.getInt("id"), rs.getString("name"), rs.getString("timefrom"), rs.getString("timeto"), rs.getString("description"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return work;
	}
	public int editItem(Work work) {
		int result = 0;
		final String sql ="UPDATE experience SET name=?,timefrom=?,timeto=?,description=? WHERE id=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, work.getName());
			pst.setString(2, work.getTimefrom());
			pst.setString(3, work.getTimeto());
			pst.setString(4, work.getDescription());
			pst.setInt(5, work.getId());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public int delItem(int id) {
		int result = 0;
		final String sql ="DELETE FROM experience WHERE id=?";
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
	public Work getWork(int id) {
		Work work = null;
		final String sql ="SELECT * FROM experience WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
			 work=new Work(rs.getInt("id"), rs.getString("name"), rs.getString("timefrom"), rs.getString("timeto"), rs.getString("description"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return work;
	}

}
