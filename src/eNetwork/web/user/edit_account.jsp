<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String date=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
    String sql="update user set first_name='"+request.getParameter("first_name")+"',"
            + "last_name='"+request.getParameter("last_name")+"',"
            + "email='"+request.getParameter("email")+"',"
            + "birthday='"+date+"',"
            + "gender='"+request.getParameter("gender")+"' "
            + "where uid='"+session.getAttribute("uid")+"'";
    st.executeUpdate(sql);
    session.setAttribute("name", request.getParameter("first_name")+" "+request.getParameter("last_name"));
    response.sendRedirect("home.jsp");
    %>