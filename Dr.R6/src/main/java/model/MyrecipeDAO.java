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

	// �����ͺ��̽� �������, ������
	public Connection connection() {
		try {
			conn = null;
			// 1.����Ŭ ����̹� ���� �ε� = �����Ҷ� ã�ư��ٴ� ��
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2.�����ͺ��̽� ����
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
		// 4. �����ͺ��̽� ��������
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

			// 3. ������ ����
			String sql = "insert into myrecipe values(myrecipe_num.nextval,?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, recipe_code);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // ������������ ����Ǵ� finally
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
		} finally { // ������������ ����Ǵ� finally
			close();
		}
		return cnt;
	}

	public int delete_recipe(int recipe_code, String id) {

		try {

			connection();

			// 3. ������ ����
			String sql = "delete from myrecipe where myrecipe_id = ? and myrecipe_recipe = ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, recipe_code);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // ������������ ����Ǵ� finally
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
