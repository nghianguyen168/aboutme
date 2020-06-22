package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.News;
import model.NewsCat;
import utils.DBConnectionUtil;

public class NewsCatDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public List<NewsCat> getItems() {
		List<NewsCat> newsCatList = new ArrayList<NewsCat>();
		final String sql="SELECT * FROM news_cat";
		conn=DBConnectionUtil.getConnection();
		try {
			st=conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				NewsCat newsCat = new NewsCat(rs.getInt("id"), rs.getString("news_name"),rs.getInt("parent_id"));
				newsCatList.add(newsCat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return newsCatList;
	}
	public List<NewsCat> getItems2() {
		List<NewsCat> newsCatList = new ArrayList<NewsCat>();
		final String sql="SELECT * FROM news_cat WHERE parent_id=0";
		conn=DBConnectionUtil.getConnection();
		try {
			st=conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				NewsCat newsCat = new NewsCat(rs.getInt("id"), rs.getString("news_name"),rs.getInt("parent_id"));
				newsCatList.add(newsCat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return newsCatList;
	}
	
	public List<NewsCat> getICatChild(int pid) {
		List<NewsCat> newsCatList = new ArrayList<NewsCat>();
		final String sql="SELECT * FROM news_cat WHERE parent_id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, pid);
			rs=pst.executeQuery();
			while(rs.next()) {
				NewsCat newsCat = new NewsCat(rs.getInt("id"), rs.getString("news_name"),rs.getInt("parent_id"));
				newsCatList.add(newsCat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return newsCatList;
	}
	public static void main(String[] args) {
		System.out.println(new NewsCatDAO().getItems().size());
	}
	public int addItem(String name) {
		int result=0;
		int parent_id=0;
		final String sql="INSERT INTO news_cat(news_name,parent_id) VALUES(?,?)";
		conn=DBConnectionUtil.getConnection();
		
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setInt(2, parent_id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return result;
	}
	public NewsCat getItem(int id) {
		NewsCat newsCat=null;
		final String sql="SELECT * FROM news_cat WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				 newsCat = new NewsCat(rs.getInt("id"), rs.getString("news_name"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return newsCat;
	}
	public int editItem(int id, String name) {
		int result=0;
		final String sql="UPDATE news_cat SET news_name=? WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setInt(2, id);
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
		final String sql="DELETE FROM news_cat WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return result;
	}
	public NewsCat checkNewsCat(String name) {
		NewsCat newscat=null;
		final String sql="SELECT * FROM news_cat WHERE news_name=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			rs = pst.executeQuery();
			if(rs.next()) {
				newscat = new NewsCat(rs.getInt("id"), rs.getString("news_name")); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
			
		}
		
		
		return newscat;
	}
	public int addItem(int pid, String childname) {
		int result=0;
		final String sql="INSERT INTO news_cat(news_name,parent_id) VALUES(?,?)";
		conn=DBConnectionUtil.getConnection();
		
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, childname);
			pst.setInt(2, pid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		return result;
	}

	public int delChildItem(int id) {
		int result=0;
		final String sql="DELETE FROM news_cat WHERE parent_id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			
			pst.setInt(1, id);
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
