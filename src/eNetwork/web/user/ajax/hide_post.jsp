<%@page import="java.sql.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement st=conn.createStatement();
            String sql="insert into hidden_post(uid,psid) values('"+session.getAttribute("uid")+"','"+request.getParameter("psid")+"')";
            st.executeUpdate(sql);
%>