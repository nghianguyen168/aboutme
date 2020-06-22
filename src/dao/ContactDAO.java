package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Contact;
import model.News;
import utils.DBConnectionUtil;
import utils.DefineUtil;

public class ContactDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public int additem(Contact contact) {
		int result=0;
		final String sql="INSERT INTO contact(name,email,phone,message) VALUES(?,?,?,?)";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, contact.getName());
			pst.setString(2, contact.getEmail());
			pst.setString(3, contact.getPhone());
			pst.setString(4, contact.getMessage());
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst);
		}
		
		return result;
	}
	public  List<Contact> getItems() {
		List<Contact> contactList = new ArrayList<Contact>();
		final String sql ="SELECT * FROM contact ORDER BY id DESC";
		conn=DBConnectionUtil.getConnection();
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				Contact contact = new Contact(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("phone"), rs.getString("message"));
				contactList.add(contact);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return contactList;
	}
	public int delItem(int id) {
		int result=0;
		final String sql="DELETE FROM contact WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public List<Contact> getItemsByPageAdmin(int offset) {
		List<Contact> contactList = new ArrayList<Contact>();
		final String sql ="SELECT * FROM contact ORDER BY id DESC LIMIT ?,?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE_CONTACT);
			rs=pst.executeQuery();
			while(rs.next()) {
				Contact contact = new Contact(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("phone"), rs.getString("message"));
				contactList.add(contact);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return contactList;
	}
}
