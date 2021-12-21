package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyfoodDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private int cnt;

	// 데이터베이스 연동기능, 종료기능
	public Connection connection() {
		try {
			conn = null;
			// 1.오라클 드라이버 동적 로딩 = 실행할때 찾아간다는 뜻
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2.데이터베이스 연동
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "cgi_3_3";
			String password = "smhrd3";

			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;

	}

	public void close() {
		// 4. 데이터베이스 연결종료
		try {

			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String[] select_not(String id) {

		String[] list = new String[5];

		try {

			connection();

			String sql = "select myfood_not1, myfood_not2, myfood_not3, myfood_not4, myfood_not5 from MYFOOD where myfood_id = ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				list[0] = rs.getString(1);
				list[1] = rs.getString(2);
				list[2] = rs.getString(3);
				list[3] = rs.getString(4);
				list[4] = rs.getString(5);
			} else {
				for (int i = 0; i < list.length; i++) {
					list[i] = null;
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	
	// insert
	public int insert_not(String user) {

		try {

			connection();

			String sql = "insert into MYFOOD(myfood_id) values(?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 못먹는 식재료 입력하는 DAO
	public int update_not(String notfood, String id, int size) {

		try {

			connection();

			String sql = "";

			sql = "update myfood set myfood_not" + (size+1) + "=? where myfood_id = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, notfood);
			psmt.setString(2, id);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int delete_not(String id, String not, int index) {

		try {

			connection();

			String sql = "";

			sql = "update myfood set myfood_not" + (index+1) + "=null where myfood_id = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public String[] select_no(String id) {

		String[] list = new String[5];

		try {

			connection();

			String sql = "select myfood_ref1, myfood_ref2, myfood_ref3, myfood_ref4, myfood_ref5 from MYFOOD where myfood_id = ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				list[0] = rs.getString(1);
				list[1] = rs.getString(2);
				list[2] = rs.getString(3);
				list[3] = rs.getString(4);
				list[4] = rs.getString(5);
			} else {
				for (int i = 0; i < list.length; i++) {
					list[i] = null;
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public int update_no(String nofood, String id, int size) {

		try {

			connection();

			String sql = "";

			sql = "update myfood set myfood_ref" + (size+1) + "=? where myfood_id = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nofood);
			psmt.setString(2, id);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int delete_no(String id, String no, int index) {

		try {

			connection();

			String sql = "";

			sql = "update myfood set myfood_ref" + (index+1) + "=null where myfood_id = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	
	
	
	
	
	
	

}