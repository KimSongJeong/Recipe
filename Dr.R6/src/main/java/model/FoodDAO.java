package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

public class FoodDAO {

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

	public ArrayList<FoodDTO> season_food(int month) {

		ArrayList<FoodDTO> list = new ArrayList<FoodDTO>();

		try {

			connection();

			// 3. 쿼리문 실행
			String sql = "select food_code, food_name, food_image, food_good from Food where food_month=? ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, month);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int getFoodCode = rs.getInt(1);
				String getName = rs.getString(2);
				String getImage = rs.getString(3);
				String getGood = rs.getString(4);

				FoodDTO food = new FoodDTO(getFoodCode, getName, getImage, getGood);
				list.add(food);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 무조건적으로 실행되는 finally
			close();
		} // end finally
		return list;
	}

	public ArrayList<FoodDTO> all_food() {

		ArrayList<FoodDTO> list = new ArrayList<FoodDTO>();

		try {

			connection();

			// 3. 쿼리문 실행
			String sql = "select * from Food order by food_name";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int getFoodCode = rs.getInt(1);
				String getName = rs.getString(2);
				String getContent = rs.getString(3);
				String getImage = rs.getString(4);
				int getMonth = rs.getInt(5);
				String getGood = rs.getString(6);

				FoodDTO food = new FoodDTO(getFoodCode, getName, getContent, getImage, getMonth, getGood);
				list.add(food);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 무조건적으로 실행되는 finally
			close();
		} // end finally
		return list;
	}

	
	public ArrayList<FoodDTO> custom_food(String disease) {

		ArrayList<FoodDTO> list = new ArrayList<FoodDTO>();
		

		try {
			connection();

			// 3. 쿼리문 실행
			String sql = "select distinct food_name, food_content, food_image, food_good from food where food_good like ? order by food_name";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, '%'+disease+'%');
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				String food_name = rs.getString(1);
				String food_content = rs.getString(2);
				String food_image = rs.getString(3);
				String food_good = rs.getString(4);

				FoodDTO food = new FoodDTO(food_name, food_content, food_image, food_good);

				list.add(food);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return list;
	}

	

	// 제철음식 뽑을때 사용하는 DAO

	public FoodDTO seasonal_food(int MONTH) {

		ArrayList<FoodDTO> list = new ArrayList<FoodDTO>();
		FoodDTO season = null;

		try {
			connection();

			// 3. 쿼리문 실행

			String sql = "select * from food where FOOD_MONTH = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, MONTH);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int FOOD_CODE = rs.getInt("FOOD_CODE");
				String FOOD_NAME = rs.getString("FOOD_NAME");
				String FOOD_CONTENT = rs.getString("FOOD_CONTENT");
				String FOOD_IMAGE = rs.getString("FOOD_IMAGE");
				int FOOD_MONTH = rs.getInt("FOOD_MONTH");
				String FOOD_GOOD = rs.getString("FOOD_GOOD");

				FoodDTO food = new FoodDTO(FOOD_CODE, FOOD_NAME, FOOD_CONTENT, FOOD_IMAGE, FOOD_MONTH, FOOD_GOOD);

				list.add(food);
			}
			
			
			season = list.get(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return season;
	}

	public ArrayList<FoodDTO> food_custom(ArrayList<String> arr, String[] myfood) {
		ArrayList<FoodDTO> list = new ArrayList<>();

		int size = arr.size() - 2;
		String[] con = { "and", "and", "and" };
		String[] con2 = { "or", "or", "or", "or" };

		while (size >= 0) {
			con[size] = "or";
			size -= 1;
		}

		for (int i = myfood.length - 1; i >= 0; i--) {
			if (myfood[i] != null) {
				for (int j = 0; j < i; j++)
					con2[j] = "and";
			}
		}

		try {
			connection();

			
			String sql = "select distinct food_name, food_good, food_content, food_image from (select * from food where food_name not like ? "
					+ con2[0] + " food_name not like ? " + con2[1] + " food_name not like ? " + con2[2]
					+ " food_name not like ? " + con2[3] + " food_name not like ?)  " + "where food_good like ? "
					+ con[0] + " food_good like ? " + con[1] + " food_good like ? " + con[2] + " food_good like ? ";

			psmt = conn.prepareStatement(sql);

			for (int i = 0; i < myfood.length; i++) {
				if (myfood[i] != null)
					psmt.setString(i + 1, '%' + myfood[i] + '%');
				else
					psmt.setString(i + 1, "%%");
			}

			int num = 6;

			for (int i = 0; i < arr.size(); i++) {
				String good = '%' + arr.get(i) + '%';
				psmt.setString(num, good);
				num += 1;
			}
			for (int i = num; i <= 9; i++) {
				String a = '%' + "" + '%';
				psmt.setString(i, a);
			}

//			psmt.setInt(10, month);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String food_name = rs.getString(1);
				String food_good = rs.getString(2);
				String food_content = rs.getString(3);
				String food_image = rs.getString(4);

				FoodDTO food = new FoodDTO(food_name, food_content, food_image, food_good);

				list.add(food);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return list;
	}

	public ArrayList<FoodDTO> food_custom(ArrayList<String> arr) {
		ArrayList<FoodDTO> list = new ArrayList<>();

		int size = arr.size() - 2;
		String[] con = { "and", "and", "and" };

		while (size >= 0) {
			con[size] = "or";
			size -= 1;
		}

		try {
			connection();

			String sql = "select distinct food_name, food_good, food_content, food_image from food "
					+ "where food_good like ? " + con[0] + " food_good like ? " + con[1] + " food_good like ? " + con[2]
					+ " food_good like ? ";

			psmt = conn.prepareStatement(sql);

			int num = 1;

			for (int i = 0; i < arr.size(); i++) {
				String good = '%' + arr.get(i) + '%';
				psmt.setString(num, good);
				num += 1;
			}
			for (int i = num; i <= 4; i++) {
				String a = '%' + "" + '%';
				psmt.setString(i, a);
			}

//			psmt.setInt(5, month);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				String food_name = rs.getString(1);
				String food_good = rs.getString(2);
				String food_content = rs.getString(3);
				String food_image = rs.getString(4);

				FoodDTO food = new FoodDTO(food_name, food_content, food_image, food_good);

				list.add(food);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return list;
	}
	
	public ArrayList<FoodDTO> food_custom_season(ArrayList<String> arr, String[] myfood, int month) {
		ArrayList<FoodDTO> list = new ArrayList<>();

		int size = arr.size() - 2;
		String[] con = { "and", "and", "and" };
		String[] con2 = { "or", "or", "or", "or" };

		while (size >= 0) {
			con[size] = "or";
			size -= 1;
		}

		for (int i = myfood.length - 1; i >= 0; i--) {
			if (myfood[i] != null) {
				for (int j = 0; j < i; j++)
					con2[j] = "and";
			}
		}

		try {
			connection();

			
			String sql = "select distinct food_name, food_good, food_content, food_image from (select * from (select food_name, food_good, food_content, "
					+ "food_image from food where food_month = ? ) where food_name not like ? "
					+ con2[0] + " food_name not like ? " + con2[1] + " food_name not like ? " + con2[2]
					+ " food_name not like ? " + con2[3] + " food_name not like ? )  " + "where food_good like ? "
					+ con[0] + " food_good like ? " + con[1] + " food_good like ? " + con[2] + " food_good like ? ";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, month);
			
			for (int i = 0; i < myfood.length; i++) {
				if (myfood[i] != null)
					psmt.setString(i + 2, '%' + myfood[i] + '%');
				else
					psmt.setString(i + 2, "%%");
			}

			int num = 7;

			for (int i = 0; i < arr.size(); i++) {
				String good = '%' + arr.get(i) + '%';
				psmt.setString(num, good);
				num += 1;
			}
			for (int i = num; i <= 10; i++) {
				String a = '%' + "" + '%';
				psmt.setString(i, a);
			}

//			psmt.setInt(10, month);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String food_name = rs.getString(1);
				String food_good = rs.getString(2);
				String food_content = rs.getString(3);
				String food_image = rs.getString(4);

				FoodDTO food = new FoodDTO(food_name, food_content, food_image, food_good);

				list.add(food);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return list;
	}

	public ArrayList<FoodDTO> food_custom_season(ArrayList<String> arr, int month) {
		ArrayList<FoodDTO> list = new ArrayList<>();

		int size = arr.size() - 2;
		String[] con = { "and", "and", "and" };

		while (size >= 0) {
			con[size] = "or";
			size -= 1;
		}

		try {
			connection();

			String sql = "select distinct food_name, food_good, food_content, food_image from (select food_name, food_good, food_content, "
					+ " food_image from food where food_month = ? ) "
					+ "where food_good like ? " + con[0] + " food_good like ? " + con[1] + " food_good like ? " + con[2]
					+ " food_good like ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, month);
			
			int num = 2;

			for (int i = 0; i < arr.size(); i++) {
				String good = '%' + arr.get(i) + '%';
				psmt.setString(num, good);
				num += 1;
			}
			for (int i = num; i <= 5; i++) {
				String a = '%' + "" + '%';
				psmt.setString(i, a);
			}

//			psmt.setInt(5, month);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				String food_name = rs.getString(1);
				String food_good = rs.getString(2);
				String food_content = rs.getString(3);
				String food_image = rs.getString(4);

				FoodDTO food = new FoodDTO(food_name, food_content, food_image, food_good);

				list.add(food);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return list;
	}

	// 식재료 검색
	public ArrayList<FoodDTO> search_food(String name) {

		ArrayList<FoodDTO> list = new ArrayList<>();
		FoodDTO food;
		

		try {
			connection();

			// 3. 쿼리문 실행
			String sql = "select distinct food_name, food_image, food_good from food where food_name like ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+name+"%");

			rs = psmt.executeQuery();

			while (rs.next()) {
//				int food_code = rs.getInt(1);
				String food_name = rs.getString(1);
				String food_image = rs.getString(2);
				String food_good = rs.getString(3);

				food = new FoodDTO(food_name, null, food_image, food_good);
				list.add(food);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return list;

	}
}
