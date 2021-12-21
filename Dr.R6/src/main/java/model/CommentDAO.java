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
		//4. �����ͺ��̽� ��������
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
			
			//3. ������ ����
			String sql = "insert into commentss values(cmt_num.nextval, ?, sysdate, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, comment.getCmt_content());
			psmt.setInt(2, comment.getCmt_recipe());
			psmt.setString(3, comment.getCmt_id());
					
			cnt = psmt.executeUpdate(); //���� Update()
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				
			close();
				
		}//end finally
		return cnt;
	}
	
	public ArrayList<CommentDTO> comment_select(int recipe) {
		//������ �� �޼������� ������ �� �ִ� ArrayList��ü ����
				ArrayList<CommentDTO> list = new ArrayList<>();
				
				try {
					
					connection();
					
					//3. ������ ����
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
					System.out.println("����");
				} finally {
						
					close();
						
				}//end finally
				
				return list;
	}
	
	public ArrayList<CommentDTO> comment_select(String id) {
		//������ �� �޼������� ������ �� �ִ� ArrayList��ü ����
				ArrayList<CommentDTO> list = new ArrayList<>();
				
				try {
					
					connection();
					
					//3. ������ ����
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
					System.out.println("����");
				} finally {
						
					close();
						
				}//end finally
				
				return list;
	}
	
}
