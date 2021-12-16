package genobot;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MainEntry {
	
	 public static void main(String[] args) {
	        // DB ���� ��ü����
	        Connection conn = null;
	 
	        try {
	            // Maria db ����̹� �ε�
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            // �����ͺ��̽� ����
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/talkbot", "root", "2024");
	        } catch (Exception e) {
	            System.out.println(e.toString());
	        } finally {
	            try {
	                conn.close();
	            } catch (Exception e) {
	            }
	        }
	        if (conn != null) {
	            System.out.println("���Ӽ���");
	        } else {
	        	System.out.println("���ӽ���");
	        }
	 
	    }
	 


}
