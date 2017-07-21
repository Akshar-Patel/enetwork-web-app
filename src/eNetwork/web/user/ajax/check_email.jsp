<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email").trim();


   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
   Statement st = conn.createStatement();
   String sql="select email from user where email='"+email+"'";
   ResultSet rs=st.executeQuery(sql);
   rs.last();
   int count=rs.getRow();
   if(count!=0)
       {
            out.print("no");
       }
%>