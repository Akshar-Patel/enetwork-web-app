<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql="update privacy set posts='"+request.getParameter("posts")+"',"
            + "birthday='"+request.getParameter("birthday")+"',"
            + "gender='"+request.getParameter("gender")+"',"
            + "email='"+request.getParameter("email")+"',"
            + "photos='"+request.getParameter("photos")+"',"
            + "videos='"+request.getParameter("videos")+"'"
            + " where uid='"+session.getAttribute("uid")+"'";
   st.executeUpdate(sql);
   response.sendRedirect("home.jsp");
%>