<%@page import="java.sql.*"%>
<%
    String album_name=request.getParameter("album_name");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql="insert into media_album(uid,name,cover) values('"+session.getAttribute("uid")+"','"+request.getParameter("album_name")+"',0)";
    st.executeUpdate(sql);
    response.sendRedirect("album.jsp");
%>