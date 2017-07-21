<%@page import="java.sql.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement st=conn.createStatement();
            Statement st1=conn.createStatement();
            String sql="delete from post where psid='"+request.getParameter("psid")+"'";
            st1.executeUpdate(sql);
%>