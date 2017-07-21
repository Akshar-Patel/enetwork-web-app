<%@page import="java.sql.*"%>
<%
    String username=request.getParameter("username").trim();


   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
   Statement st = conn.createStatement();
   String sql="select username from user where username='"+username+"'";
   ResultSet rs=st.executeQuery(sql);
   rs.last();
   int count=rs.getRow();
   if(count!=0)
       {
            out.print("no");
       }
%>