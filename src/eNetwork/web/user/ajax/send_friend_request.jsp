<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql="insert into friend_request(uid_from,uid_to) values('"+session.getAttribute("uid")+"','"+request.getParameter("uid")+"')";
    st.executeUpdate(sql);
%>