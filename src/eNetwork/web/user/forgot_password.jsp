<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql="select email from user where email='"+email+"'";
    ResultSet rs=st.executeQuery(sql);
    if(rs.next())
        {
            response.sendRedirect("../index.jsp");
        }
    else
        {
            session.setAttribute("error", "Invalid email");
            response.sendRedirect("forgot_password_form.jsp");
        }
    st.close();
    conn.close();
%>