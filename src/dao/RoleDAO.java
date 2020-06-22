package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Role;
import utils.DBConnectionUtil;

public class RoleDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public List<Role> getItem() {
		List<Role> roleList = new ArrayList<Role>();
		final String sql="SELECT * FROM role";
		conn=DBConnectionUtil.getConnection();
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				Role role=new Role(rs.getInt("id"), rs.getString("role_name"));
				roleList.add(role);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
 		return roleList;
	}
	
}
