import java.io.*;
import java.sql.*;

public class BookList {
	Connection con;

	public BookList() {
	  String Driver="";
          String url="jdbc:sqlserver://localhost:1433;DatabaseName=Madang;";
          String userid="madanguser";
          String pwd="madangpass";

	   try { /* 드라이버를 찾는 과정 */
	     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	     System.out.println("드라이버 로드 성공");
	   } catch(ClassNotFoundException e) {
		e.printStackTrace();
	     }

	   try { /* 데이터베이스를 연결하는 과정 */
	     System.out.println("데이터베이스 연결 준비 ...");
	     con=DriverManager.getConnection(url, userid, pwd);
	     System.out.println("데이터베이스 연결 성공");
	     } catch(SQLException e) {
	         e.printStackTrace( );
		}
	   }

	   private void sqlRun( ) {
	     String query="SELECT * FROM Book"; /* SQL 문 */
	     try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
		   Statement stmt=con.createStatement();
		   ResultSet rs=stmt.executeQuery(query);
		   System.out.println("BOOK NO \tBOOK NAME \t\tPUBLISHER \tPRICE");
		   while(rs.next( )) {
			   System.out.print("\t"+rs.getInt(1));
			   System.out.print("\t"+rs.getString(2));
			   System.out.print("\t\t"+rs.getString(3));
			   System.out.println("\t"+rs.getInt(4));
		   }

		   con.close( );
	     } catch(SQLException e) {
		     e.printStackTrace( );
		}
	}

	public static void main(String args[ ]) {
	   BookList so=new BookList( );
	   so.sqlRun();
	}
}