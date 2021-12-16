package genobot;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class qnaDAO {
		
	Connection conn = null;
	PreparedStatement psmt = null;

	int cnt = 0;
	String sql = "";
	qnaVO vo = null;
	ResultSet rs = null;

	public void getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3307/talkbot";
			String dbid = "root";
			String dbpw = "2024";
			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void close() {
		
		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}catch (Exception e) {
			e.printStackTrace();
		
		}
	}	
	
	public int qnaInsert(String user_name, String phone_num, String comment) {

		try {
			getConn();

			sql = "insert into call_list values(?,?,?,'N')";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_name);
			psmt.setString(2, phone_num);
			psmt.setString(3, comment);


			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	public int Update(String call_result, int boardnum) {

	
		try {
			getConn();

			sql = "update call_list set call_state = '상담완료', ck_date=sysdate(), call_result=? where boardnum=?";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, call_result);
			psmt.setInt(2, boardnum);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	public ArrayList<qnaVO> select() {
		ArrayList<qnaVO> arr = new ArrayList<qnaVO>();
		try {
			getConn();
			sql = "select * from call_list where 1=1";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
								
				String user_name = rs.getString(1);
				String phone_num = rs.getString(2);
				String comment = rs.getString(3);
				String call_state = rs.getString(4);
				int boardnum = rs.getInt(5);
				String reg_date = rs.getString(6);
				String ck_date = rs.getString(7);
				String call_result = rs.getString(8);
								
				vo = new qnaVO(user_name, phone_num, comment, call_state, boardnum, reg_date, ck_date, call_result);						
				
				arr.add(vo);
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return arr;
	}
	
	public qnaVO OneSelect(int boardnum){
		
		try {
			getConn();
			sql = "select * from call_list where boardnum = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardnum);
			rs = psmt.executeQuery();
			while(rs.next()) {
				
				String getuser_name = rs.getString(1);
				String getphone_num = rs.getString(2);
				String getcomment = rs.getString(3);
				String getcall_state = rs.getString(4);
				int getboardnum = rs.getInt(5);
				String getreg_date = rs.getString(6);
				String getck_date = rs.getString(7);
				String getcall_result = rs.getString(8);
				
				vo = new qnaVO(getuser_name, getphone_num, getcomment, getcall_state, getboardnum, getreg_date, getck_date, getcall_result);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close();
		}
		return vo;		
	}
	
public ArrayList<qnaVO> stateSelect(String call_state){
		ArrayList<qnaVO> arr = new ArrayList<qnaVO>();
		try {
			getConn();
			sql = "select * from call_list where call_state = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, call_state);
			rs = psmt.executeQuery();
			while(rs.next()) {
				
				String getuser_name = rs.getString(1);
				String getphone_num = rs.getString(2);
				String getcomment = rs.getString(3);
				String getcall_state = rs.getString(4);
				int getboardnum = rs.getInt(5);
				String getreg_date = rs.getString(6);
				String getck_date = rs.getString(7);
				String getcall_result = rs.getString(8);
				
				vo = new qnaVO(getuser_name, getphone_num, getcomment, getcall_state, getboardnum, getreg_date, getck_date, getcall_result);
			arr.add(vo);
			
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close();
		}
		return arr;
		
		
	}
	public int Delete(int boardnum) {
		

		try {
			getConn();

			sql = "Delete from call_list where boardnum=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardnum);
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}finally {
			close();
		}
		return cnt;
	}

}
