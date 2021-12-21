package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecipeDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private int cnt;

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

	// 모든 레시피 저장 DAO
	public ArrayList<RecipeDTO> all_recipe() {

		ArrayList<RecipeDTO> list = new ArrayList<RecipeDTO>();

		try {

			connection();

			// 3. 쿼리문 실행
			String sql = "select * from Recipe order by racipe_name";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int getrecipe_code = rs.getInt(1);
				String getrecipe_name = rs.getString(2);
				String getrecipe_method = rs.getString(3);
				String getrecipe_food = rs.getString(4);
				String getrecipe_img = rs.getString(5);
				String getrecipe_cook1 = rs.getString(6);
				String getrecipe_cook2 = rs.getString(7);

				RecipeDTO recipe = new RecipeDTO(getrecipe_code, getrecipe_name, getrecipe_method, getrecipe_food,
						getrecipe_img, getrecipe_cook1, getrecipe_cook2);
				list.add(recipe);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 무조건적으로 실행되는 finally
			close();
		} // end finally
		return list;
	}

	public RecipeDTO search_recipe(String name) {

		RecipeDTO recipe = null;

		try {

			connection();

			String sql = "select * from Recipe where recipe_name = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int getrecipe_code = rs.getInt(1);
				String getrecipe_name = rs.getString(2);
				String getrecipe_method = rs.getString(3);
				String getrecipe_food = rs.getString(4);
				String getrecipe_img = rs.getString(5);
				String getrecipe_cook1 = rs.getString(6);
				String getrecipe_cook2 = rs.getString(7);

				recipe = new RecipeDTO(getrecipe_code, getrecipe_name, getrecipe_method, getrecipe_food, getrecipe_img,
						getrecipe_cook1, getrecipe_cook2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 무조건적으로 실행되는 finally
			close();
		} // end finally
		return recipe;
	}

	public ArrayList<RecipeDTO> search_recipe(ArrayList<Integer> myrecipe) {

		ArrayList<RecipeDTO> list = new ArrayList<RecipeDTO>();

		try {

			connection();

			for (int j = 0; j < myrecipe.size(); j++) {

				String sql = "select recipe_code, recipe_name, recipe_method, recipe_img from Recipe where recipe_code = ? ";

				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, myrecipe.get(j));
				rs = psmt.executeQuery();

				if (rs.next()) {
					int getrecipe_code = rs.getInt(1);
					String getrecipe_name = rs.getString(2);
					String getrecipe_method = rs.getString(3);
					String getrecipe_img = rs.getString(4);

					RecipeDTO recipe = new RecipeDTO(getrecipe_code, getrecipe_name, getrecipe_method, getrecipe_img);
					list.add(recipe);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 무조건적으로 실행되는 finally
			close();
		} // end finally
		return list;
	}

	// 해당 식재료와 관련된 레시피 DAO 1글자인 식재료 해결,,,
	public ArrayList<RecipeDTO> recipe_food(String name) {

		ArrayList<RecipeDTO> list = new ArrayList<RecipeDTO>();

		try {
			connection();

			// 3. 쿼리문 실행
			if (name.length() == 1) {

				if (name.equals("김") || name.equals("굴")) {
					String sql = "select * from recipe where recipe_food like ? or recipe_food like ? or recipe_food like ? or recipe_food like ? order by recipe_name";

					PreparedStatement psmt = conn.prepareStatement(sql);
					String name1 = '%' + name + "(%";
					String name2 = name + " %";
					String name3 = '생' + name + " %";
					String name4 = '생' + name + "(%";
					psmt.setString(1, name1);
					psmt.setString(2, name2);
					psmt.setString(3, name3);
					psmt.setString(4, name4);
					rs = psmt.executeQuery();

				} else if (name.equals("갓") || name.equals("마") || name.equals("조") || name.equals("밀")) {
					String sql = "select * from recipe where recipe_food like ? or recipe_food like ? order by recipe_name";

					PreparedStatement psmt = conn.prepareStatement(sql);
					String name1 = "% " + name + "(%";
					String name2 = "% " + name + " %";
					psmt.setString(1, name1);
					psmt.setString(2, name2);
					rs = psmt.executeQuery();

				} else {
					String sql = "select * from recipe where recipe_food like ? or recipe_food like ? order by recipe_name";

					PreparedStatement psmt = conn.prepareStatement(sql);
					String name1 = '%' + name + "(%";
					String name2 = '%' + name + " %";
					psmt.setString(1, name1);
					psmt.setString(2, name2);
					rs = psmt.executeQuery();

				}
			} else {
				String sql = "select * from recipe where recipe_food like ? or recipe_food like ? order by recipe_name";

				PreparedStatement psmt = conn.prepareStatement(sql);
				String name1 = '%' + name + "(%";
				String name2 = '%' + name + " %";
				psmt.setString(1, name1);
				psmt.setString(2, name2);
				rs = psmt.executeQuery();
			}

			while (rs.next()) {
				int getrecipe_code = rs.getInt(1);
				String getrecipe_name = rs.getString(2);
				String getrecipe_method = rs.getString(3);
				String getrecipe_food = rs.getString(4);
				String getrecipe_img = rs.getString(5);
				String getrecipe_cook1 = rs.getString(6);
				String getrecipe_cook2 = rs.getString(7);

				RecipeDTO recipe = new RecipeDTO(getrecipe_code, getrecipe_name, getrecipe_method, getrecipe_food,
						getrecipe_img, getrecipe_cook1, getrecipe_cook2);
				list.add(recipe);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return list;
	}


	// 레시피 검색 기능
	public ArrayList<RecipeDTO> Usearch_recipe(String name) {

		ArrayList<RecipeDTO> recipe = new ArrayList<RecipeDTO>();
		;
		RecipeDTO search;

		try {
			connection();

			// 3. 쿼리문 실행
			String sql = "select recipe_code, recipe_name, recipe_method, recipe_img from recipe where recipe_name like ? or recipe_food like ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, '%' + name + '%');
			psmt.setString(2, '%' + name + '%');

			rs = psmt.executeQuery();

			while (rs.next()) {
				int recipe_code = rs.getInt(1);
				String recipe_name = rs.getString(2);
				String recipe_method = rs.getString(3);
				String recipe_img = rs.getString(4);

				search = new RecipeDTO(recipe_code, recipe_name, recipe_method, recipe_img);
				recipe.add(search);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return recipe;

	}

	// 질병 맞춤 레시피 추천
	public ArrayList<RecipeDTO> custom_recipe(ArrayList<String> disease, ArrayList<FoodDTO> food) {

		ArrayList<RecipeDTO> recipe = new ArrayList<RecipeDTO>();

		String[] dis = { "당뇨", "고혈압", "위장", "호흡기" };
		String[] dis2 = { "v_dang", "v_go", "v_we", "v_ho" };
		ArrayList<String> disName = new ArrayList<>();

		try {
			connection();

			String sql = "select distinct recipe_code, recipe_name, recipe_method, recipe_img from (select * from recipe where ";

			for (int i = 0; i < disease.size(); i++) {
				for (int j = 0; j < dis.length; j++) {
					if (disease.get(i).equals(dis[j]))
						disName.add(" recipe_code in (select recipe_code from " + dis2[j] + " ) ");
				}
			}

			sql = sql + disName.get(0);

			for (int i = 1; i < disName.size(); i++) {
				sql = sql + " and " + disName.get(i);
			}

			sql = sql + ") where recipe_name like '%" + food.get(0).getFood_name() + "%' ";

			for (int i = 1; i < food.size(); i++) {
				sql = sql + " or recipe_name like '%" + food.get(i).getFood_name() + "%' ";
			}

			sql += " order by recipe_name";
			
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int recipe_code = rs.getInt(1);
				String recipe_name = rs.getString(2);
				String recipe_method = rs.getString(3);
				String recipe_img = rs.getString(4);

				RecipeDTO search = new RecipeDTO(recipe_code, recipe_name, recipe_method, recipe_img);
				recipe.add(search);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return recipe;

	}

	public ArrayList<RecipeDTO> custom_recipe(String disease, ArrayList<FoodDTO> food) {

		ArrayList<RecipeDTO> recipe = new ArrayList<RecipeDTO>();

		try {
			connection();

			String sql = "";

			if (disease.equals("v_dang"))
				sql = "select recipe_code, recipe_name, recipe_method, recipe_img from v_dang where recipe_name like ? ";
			else if (disease.equals("v_go"))
				sql = "select recipe_code, recipe_name, recipe_method, recipe_img from v_go where recipe_name like ? ";
			else if (disease.equals("v_ho"))
				sql = "select recipe_code, recipe_name, recipe_method, recipe_img from v_ho where recipe_name like ? ";
			else if (disease.equals("v_we"))
				sql = "select recipe_code, recipe_name, recipe_method, recipe_img from v_we where recipe_name like ? ";

			for (int i = 0; i < food.size(); i++) {

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, '%' + food.get(i).getFood_name() + '%');

				rs = psmt.executeQuery();

				while (rs.next()) {
					int recipe_code = rs.getInt(1);
					String recipe_name = rs.getString(2);
					String recipe_method = rs.getString(3);
					String recipe_img = rs.getString(4);

					RecipeDTO search = new RecipeDTO(recipe_code, recipe_name, recipe_method, recipe_img);
					recipe.add(search);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();

		} // end finally

		return recipe;

	}

}
