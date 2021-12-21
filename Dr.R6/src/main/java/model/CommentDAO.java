package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO {

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
		//4. 데이터베이스 연결종료
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int comment_insert(CommentDTO comment) {
		try {
			connection();
			
			//3. 쿼리문 실행
			String sql = "insert into commentss values(cmt_num.nextval, ?, sysdate, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, comment.getCmt_content());
			psmt.setInt(2, comment.getCmt_recipe());
			psmt.setString(3, comment.getCmt_id());
					
			cnt = psmt.executeUpdate(); //변경 Update()
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				
			close();
				
		}//end finally
		return cnt;
	}
	
	public ArrayList<CommentDTO> comment_select(int recipe) {
		//나에게 온 메세지들을 저장할 수 있는 ArrayList객체 생성
				ArrayList<CommentDTO> list = new ArrayList<>();
				
				try {
					
					connection();
					
					//3. 쿼리문 실행
					String sql = "select cmt_content, cmt_time, cmt_id from COMMENTSs where cmt_recipe=?";
					
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, recipe);
					
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						String getContent = rs.getString(1);
						String getTime = rs.getString(2);
						String getcmt_id = rs.getString(3);
						
						CommentDTO comment = new CommentDTO(getContent, getTime, getcmt_id);
						list.add(comment);
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("실패");
				} finally {
						
					close();
						
				}//end finally
				
				return list;
	}
	
	public ArrayList<CommentDTO> comment_select(String id) {
		//나에게 온 메세지들을 저장할 수 있는 ArrayList객체 생성
				ArrayList<CommentDTO> list = new ArrayList<>();
				
				try {
					
					connection();
					
					//3. 쿼리문 실행
					String sql = "select cmt_content, cmt_time, cmt_id from COMMENTSs where cmt_id=?";
					
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						String getContent = rs.getString(1);
						String getTime = rs.getString(2);
						String getcmt_recipe = rs.getString(3);
						
						CommentDTO comment = new CommentDTO(getContent, getTime, getcmt_recipe);
						list.add(comment);
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("실패");
				} finally {
						
					close();
						
				}//end finally
				
				return list;
	}
	
}
