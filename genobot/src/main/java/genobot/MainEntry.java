package genobot;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MainEntry {
	
	 public static void main(String[] args) {
	        // DB 접속 객체선언
	        Connection conn = null;
	 
	        try {
	            // Maria db 드라이버 로드
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            // 데이터베이스 접속
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/talkbot", "root", "!@#genobot123");
	        } catch (Exception e) {
	            System.out.println(e.toString());
	        } finally {
	            try {
	                conn.close();
	            } catch (Exception e) {
	            }
	        }
	        if (conn != null) {
	            System.out.println("접속성공");
	        } else {
	        	System.out.println("접속실패");
	        }
	 
	    }
	 


}
