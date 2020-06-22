"package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import constant.CommonConstant;
import model.News;
import utils.DBConnectionUtil;
import utils.DefineUtil;

public class NewsDAO {
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public int addItems(News news) {
		int result=0;
		final String sql="INSERT INTO news(name,picture,description,detail,author,cat_id,status) "
				+ "VALUES(?,?,?,?,?,?,?)";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, news.getName());
			pst.setString(2, news.getPicture());
			pst.setString(3, news.getDescription());
			pst.setString(4, news.getDetail());
			pst.setString(5, news.getAuthor());
			pst.setInt(6, news.getCat_id());
			pst.setInt(7, news.getStatus());
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnectionUtil.close(conn, pst);
		}
		return result;
	}
	public List<News> getItems() {
		List<News> newsList = new ArrayList<News>();
		final String sql ="SELECT n.id,name,picture,date_creat,description,detail,link,author,nc.id AS cat_id, "
				+ "nc.news_name AS cat,author,status FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id ORDER BY id DESC";
		conn = DBConnectionUtil.getConnection();
		try {
			st =conn.createStatement();
			rs =st.executeQuery(sql);
			while(rs.next()) {
				News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"));
				newsList.add(news);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newsList;
	}
	public List<News> getItemsActive(){
		List<News> newsList = new ArrayList<News>();
		final String sql ="SELECT n.id,name,picture,date_creat,description,detail,link,author,nc.id AS cat_id, "
				+ "nc.news_name AS cat,author,status,view,num_comment FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE status=1 ORDER BY id DESC";
		conn = DBConnectionUtil.getConnection();
		try {
			st =conn.createStatement();
			rs =st.executeQuery(sql);
			while(rs.next()) {
				News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"),rs.getInt("view"),rs.getInt("num_comment"));
				newsList.add(news);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newsList;
	}
	public int editItem(String id, int sta) {
		int result=0;
		final String sql="UPDATE news SET status=? WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, sta);
			pst.setString(2, id);
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public News getItem(int id) {
		News news=null;
		final String sql ="SELECT n.id,name,picture,date_creat,description,detail,link,author,nc.id AS cat_id, "
				+ "nc.news_name AS cat,author,status FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE n.id=?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs =pst.executeQuery();
			if(rs.next()) {
				 news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		return news;
	}
	public int EditItems(News news) {
		int result=0;
		final String sql ="UPDATE news SET name=?,picture=?,description=?,detail=?,author=?,cat_id=? WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, news.getName());
			pst.setString(2, news.getPicture());
			pst.setString(3, news.getDescription());
			pst.setString(4, news.getDetail());
			pst.setString(5, news.getAuthor());
			pst.setInt(6, news.getCat_id());
			pst.setInt(7, news.getId());
			result=pst.executeUpdate();
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
		final String sql="DELETE FROM news WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public List<News> getListRelated(int id, int cat_id) {
		List<News> newsListRelated = new ArrayList<News>();
		final String sql="SELECT n.id,name,picture,date_creat,description,detail,"
				+ "link,author,nc.id AS cat_id,nc.news_name AS cat,author,status "
				+ "FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE "
				+ "status=1 AND n.cat_id=? AND n.id<>? ORDER BY id DESC LIMIT 3";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, cat_id);
			pst.setInt(2, id);
			rs=pst.executeQuery();
			while(rs.next()) {
				News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"));
				newsListRelated.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return newsListRelated;
	}
	public List<News> getListMost(int id) {
		List<News> newListMost = new ArrayList<News>();
		final String sql="SELECT n.id,name,picture,date_creat,description,detail,"
				+ "link,author,nc.id AS cat_id,nc.news_name AS cat,author,status "
				+ "FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE "
				+ "status=1 AND n.id<>? ORDER BY view DESC LIMIT 3";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while(rs.next()) {
				News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"));
				newListMost.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return newListMost;
	}
	public List<News> getListMostViews() {
		List<News> newListMost = new ArrayList<News>();
		final String sql="SELECT n.id,name,picture,date_creat,description,detail,"
				+ "link,author,nc.id AS cat_id,nc.news_name AS cat,author,status "
				+ "FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE "
				+ "status=1 ORDER BY view DESC LIMIT 4";
		conn=DBConnectionUtil.getConnection();
		try {
			st=conn.createStatement();
			
			rs=st.executeQuery(sql);
			while(rs.next()) {
				News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"));
				newListMost.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(conn, pst, rs);
		}
		
		return newListMost;
	}
	public List<News> getListByCat(int id) {
		List<News> newListByCat = new ArrayList<News>();
		final String sql="SELECT n.id,name,picture,date_creat,description,detail,"
				+ "link,author,nc.id AS cat_id,nc.news_name AS cat,author,status "
				+ "FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE "
				+ "status=1 AND n.cat_id=? ORDER BY num_comment DESC";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while(rs.next()) {
				News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"));
				newListByCat.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return newListByCat;
	}
	
	public News newsMax(int id) {
		News news = null;
		final String sql="SELECT n.id,name,picture,date_creat,description,detail,"
				+ "link,author,nc.id AS cat_id,nc.news_name AS cat,author,status "
				+ "FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE "
				+ "status=1 AND n.cat_id=? ORDER BY num_comment DESC LIMIT 1";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			if(rs.next()) {
				 news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return news;
	}
	
	public List<News> getNexrNews(int id) {
		List<News> newsNextList = new ArrayList<News>();
		final String sql="SELECT n.id,name,picture,date_creat,description,detail,"
				+ "link,author,nc.id AS cat_id,nc.news_name AS cat,author,status "
				+ "FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE "
				+ "status=1 AND n.cat_id=? ORDER BY num_comment DESC LIMIT 2,2";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while(rs.next()) {
				News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"));
				newsNextList.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return newsNextList;
	}
	public int updateViews(int id) {
		int result =0;
		final String sql ="UPDATE news SET view = view+1 WHERE id=?";
		conn=DBConnectionUtil.getConnection();
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public List<News> getItemsByPageAdmin(int offset) {
		List<News> newsListByPageAdmin = new ArrayList<News>();
		final String sql ="SELECT n.id,name,picture,date_creat,description,detail,link,author,nc.id AS cat_id, "
				+ "nc.news_name AS cat,author,status FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id  ORDER BY n.id DESC LIMIT ?,?";
		conn = DBConnectionUtil.getConnection();
		try {
			pst =conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs =pst.executeQuery();
			while(rs.next()) {
				News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
						rs.getString("date_creat"), rs.getString("description"),
						rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
						rs.getString("cat"), rs.getInt("status"));
				newsListByPageAdmin.add(news);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return newsListByPageAdmin;
	}
	
public int delItemByCid(int id) {
	int result=0;
	final String sql="DELETE FROM news WHERE cat_id=?";
	conn=DBConnectionUtil.getConnection();
	try {
		pst=conn.prepareStatement(sql);
		pst.setInt(1, id);
		result=pst.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return result;
}
public List<News> getListSearch(String searchText, int nid,int month) {
	List<News> newsListSearch = new ArrayList<News>();
	conn = DBConnectionUtil.getConnection();
	String sql = "SELECT n.id,name,picture,date_creat,description,detail,link,author,nc.id AS cat_id,nc.news_name AS cat,author,status FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE 1 ";
	
	
	 if (!"".equals(searchText)) { 
		 sql += "AND n.name LIKE ? ";
		
	  System.out.println(sql); 
	  }
	 
	if (nid > 0) {
		sql +="AND n.cat_id = "+nid;
		System.out.println("id là:"+nid);
	}
	
	if (month > 0) {
		sql +=" AND MONTH(date_creat) = "+month;
		System.out.println("id là:"+nid);
	}
	
	
	try {
		pst = conn.prepareStatement(sql);
		
		 if (!"".equals(searchText)) { pst.setString(1, "%" + searchText + "%"); }
		 rs = pst.executeQuery();
		while (rs.next()) {
			News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
					rs.getString("date_creat"), rs.getString("description"),
					rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
					rs.getString("cat"), rs.getInt("status"));
			newsListSearch.add(news);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		DBConnectionUtil.close(conn, pst, rs);
	}
	return newsListSearch;
}
public List<News> newsListSearchByPage(String searchText, int nid, int month, int offset) {
	List<News> newsListSearch = new ArrayList<News>();
	conn = DBConnectionUtil.getConnection();
	String sql = "SELECT n.id,name,picture,date_creat,description,detail,link,author,nc.id AS cat_id,nc.news_name AS cat,author,status FROM news As n INNER JOIN news_cat AS nc ON n.cat_id=nc.id WHERE 1 ";
	
	
	 if (!"".equals(searchText)) { 
		 sql += "AND n.name LIKE ? ";
		
	  System.out.println(sql); 
	  }
	 
	if (nid > 0) {
		sql +="AND n.cat_id = "+nid;
		System.out.println("id là:"+nid);
	}
	
	if (month > 0) {
		sql +=" AND MONTH(date_creat) = "+month;
		System.out.println("id là:"+nid);
	}
	
	sql+=" LIMIT "+offset+","+DefineUtil.NUMBER_PER_PAGE_CONTACT;
	
	try {
		pst = conn.prepareStatement(sql);
		
		 if (!"".equals(searchText)) { pst.setString(1, "%" + searchText + "%"); }
		 rs = pst.executeQuery();
		while (rs.next()) {
			News news = new News(rs.getInt("id"), rs.getString("name"), rs.getString("picture"),
					rs.getString("date_creat"), rs.getString("description"),
					rs.getString("detail"), rs.getString("link"), rs.getString("author"), rs.getInt("cat_id"),
					rs.getString("cat"), rs.getInt("status"));
			newsListSearch.add(news);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		DBConnectionUtil.close(conn, pst, rs);
	}
	return newsListSearch;
}

}
