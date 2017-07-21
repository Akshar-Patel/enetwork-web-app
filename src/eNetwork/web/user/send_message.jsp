<%@page import="java.sql.*"%>
<%
    String[] id=request.getParameterValues("to[]");
    String message=request.getParameter("message").trim();

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql=null;

    for(int i=0;i<id.length;i++)
        {
            sql="insert into message(uid_from,uid_to,text) values('"+session.getAttribute("uid")+"','"+id[i]+"','"+message+"')";
            st.executeUpdate(sql);
        }
%>