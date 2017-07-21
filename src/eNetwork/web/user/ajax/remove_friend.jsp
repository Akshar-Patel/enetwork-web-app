<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>
<%@page import="org.apache.commons.lang.StringUtils" %>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");

    Object uid1=session.getAttribute("uid").toString();
    Object uid2=request.getParameter("uid").toString();
    
    String friends1=session.getAttribute("friends").toString();
    Object[] fro1=null;
    fro1=friends1.split(",");
    fro1=ArrayUtils.removeElement(fro1,uid2);
    friends1=StringUtils.join(fro1, ":");
    session.setAttribute("friends", friends1.replace(":", ","));
    Statement sti1=conn.createStatement();
    String sql="update friendship set frids='"+friends1+"' where uid='"+uid1+"'";
    sti1.executeUpdate(sql);

    Statement st=conn.createStatement();
    sql="select frids from friendship where uid='"+uid2+"'";
    ResultSet rs=st.executeQuery(sql);
    String friends2=null;
    Object[] fro2=null;
    if(rs.next())
    {
        friends2=rs.getString("frids");
        }
    
    fro2=friends2.split(":");
    fro2=ArrayUtils.removeElement(fro2,uid1);
    friends2=StringUtils.join(fro2, ":");
    Statement sti2=conn.createStatement();
    sql="update friendship set frids='"+friends2+"' where uid='"+uid2+"'";
        sti2.executeUpdate(sql);
%>