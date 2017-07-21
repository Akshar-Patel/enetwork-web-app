<%@page import="java.sql.*"%>
<%
    String[] id=request.getParameterValues("id[]");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql;
    for(int i=0;i<id.length;i++)
        {
            sql="delete from message where mid='"+id[i]+"'";
            st.executeUpdate(sql);
        }
    
%>