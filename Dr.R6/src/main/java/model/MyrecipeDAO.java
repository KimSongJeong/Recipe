package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyrecipeDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private int cnt = 0;

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

	public int save_recipe(int recipe_code, String id) {

		try {

			connection();

			// 3. 쿼리문 실행
			String sql = "insert into myrecipe values(myrecipe_num.nextval,?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, recipe_code);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 무조건적으로 실행되는 finally
			close();
		} // end finally

		return cnt;
	}

	public int search_recipe(int recipe_code, String id) {

		try {
			connection();

			String sql = "select myrecipe_recipe from myrecipe where myrecipe_id = ? and myrecipe_recipe = ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, recipe_code);
			rs = psmt.executeQuery();

			if (rs.next()) {
				cnt = 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 무조건적으로 실행되는 finally
			close();
		}
		return cnt;
	}

	public int delete_recipe(int recipe_code, String id) {

		try {

			connection();

			// 3. 쿼리문 실행
			String sql = "delete from myrecipe where myrecipe_id = ? and myrecipe_recipe = ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, recipe_code);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 무조건적으로 실행되는 finally
			close();
		} // end finally

		return cnt;
	}

	
	public ArrayList<Integer> select_recipe(String id) {

		ArrayList<Integer> recipe_code = new ArrayList<>();
		
		try {

			connection();

			String sql = "select myrecipe_recipe from myrecipe where myrecipe_id = ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int getRecipe = rs.getInt(1);
				recipe_code.add(getRecipe);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close();
		} // end finally

		return recipe_code;
	}
}
