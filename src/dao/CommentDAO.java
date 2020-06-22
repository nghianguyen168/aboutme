package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Comment;
import model.News;
import utils.DBConnectionUtil;
import utils.DefineUtil;

public class CommentDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public int addComment(String id, String cmname, String comment,int parent_id) {
		int result=0;
		final String sql ="INSERT INTO comment(news_id,name,comment,parent_id) VALUES(?,?,?,?)";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, cmname);
			pst.setString(3, comment);
			pst.setInt(4, parent_id);
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
			
		}
		
		return result;
	}
	public List<Comment> getItems(int id) {
		List<Comment> commentList  = new ArrayList<Comment>();
		final String sql ="SELECT * FROM comment WHERE news_id=? AND parent_id=0 ORDER BY time DESC";
		conn=DBConnectionUtil.getConnection();
		try {
			pst  = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment(rs.getInt("id"),rs.getInt("news_id"), rs.getString("name"), rs.getString("comment"),rs.getTimestamp("time"),rs.getInt("parent_id"));
				commentList.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return commentList;
	}
	public List<Comment> getCommentChild(int id) {
		List<Comment> commentList  = new ArrayList<Comment>();
		final String sql ="SELECT * FROM comment WHERE parent_id=? ORDER BY time DESC";
		conn=DBConnectionUtil.getConnection();
		try {
			pst  = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment(rs.getInt("id"),rs.getInt("news_id"), rs.getString("name"), rs.getString("comment"),rs.getTimestamp("time"),rs.getInt("parent_id"));
				commentList.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return commentList;
	}
	public List<Comment> getItems() {
		List<Comment> commentList  = new ArrayList<Comment>();
		final String sql ="SELECT c.id,c.name,c.comment,c.time , n.name AS news_name FROM comment AS c INNER JOIN news AS n ON c.news_id=n.id ORDER BY id DESC";
		conn=DBConnectionUtil.getConnection();
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				Comment comment = new Comment(rs.getInt("id"),rs.getString("name"), rs.getString("comment"),rs.getTimestamp("time"),rs.getString("news_name"));
				commentList.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return commentList;
	}
	
	public int delItem(int id) {
		int result=0;
		final String sql="DELETE FROM comment WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return result;
	}
	public List<Comment> getItemsByPageAdmin(int offset) {
		List<Comment> commentListByPage  = new ArrayList<Comment>();
		final String sql ="SELECT c.id,c.name,c.comment,c.time , n.name AS news_name FROM comment AS c INNER JOIN news AS n ON c.news_id=n.id ORDER BY id DESC LIMIT ?,?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE_Comment);
			rs=pst.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment(rs.getInt("id"),rs.getString("name"), rs.getString("comment"),rs.getTimestamp("time"),rs.getString("news_name"));
				commentListByPage.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return commentListByPage;
	}
}
