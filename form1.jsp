<%@ page language="java" import="java.sql.*;"%>
<html>
<head>
</head>
<body>
<%
  
    String username = request.getParameter("userName");
    String password = request.getParameter("password");
 
   
    System.out.println("MySQL Connect");
    Connection conn = null;
    
    String url = "jdbc:mysql://localhost:8080/";
    String dbName = "shopping";
    String driver = "com.mysql.jdbc.Driver";
    String username = "root"; 
    String Password = "root";
    try 
    {
      Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,username,Password);
      Statement st = conn.createStatement();
      String strQuery = "select count(*) from shoopingTable where username='"+username+"' and password='"+password+"'"; 
      out.println(strQuery);
      ResultSet rs = st.executeQuery(strQuery);
  
      if(rs.next())
        {
           if(rs.getInt(1)>0)
             {
                session.setAttribute("username",username);
                response.sendRedirect("Shoppingpage.html");
             }
           else
             {
               response.sendRedirect("FORM.html");
             }
        }
      System.out.println("Connected to the database");
      conn.close();
      System.out.println("Disconnected from database");
    } 
    catch (Exception e) 
    {
      e.printStackTrace();
    }
 %> 
