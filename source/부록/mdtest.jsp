<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>

<%
          String DB_URL = "jdbc:sqlserver://localhost:1433;DatabaseName=Madang;";
          String DB_USER = "madanguser";
          String DB_PASSWORD= "madangpass";
          Connection conn;
          Statement stmt;
 
         try {
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
               conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
               stmt = conn.createStatement();
               conn.close();
               out.println("Madang SQL Server DB Connection Success!");
          } 
         catch(Exception e){
               out.println(e);
          }
%>
