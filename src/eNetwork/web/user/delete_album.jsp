<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql="delete from media_album where mdaid='"+request.getParameter("album_id")+"'";
    st.executeUpdate(sql);
    response.sendRedirect("album.jsp");
%>
