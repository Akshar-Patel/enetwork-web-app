<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql="delete from friend_request where uid_from='"+session.getAttribute("uid")+"' and uid_to='"+request.getParameter("uid")+"'";
    st.executeUpdate(sql);
%>