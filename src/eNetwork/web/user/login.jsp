<%-- 
    Document   : login.jsp
    Created on : Dec 25, 2010, 2:42:34 PM
    Author     : akshar

    pending:

    trim password,username
--%>
<%@page import="enetwork.MD5"%>
<%
    MD5 md5=new MD5();
    String username=request.getParameter("username").trim();
    String password=md5.hash(request.getParameter("password").trim());
%>
<%-- Database Connection --%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%
    session.setMaxInactiveInterval(3600);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement stu=conn.createStatement();
    Statement stp=conn.createStatement();
    Statement stph=conn.createStatement();
    Statement stf=conn.createStatement();
    String sql="select uid,username from user where username='"+username+"'";
    ResultSet rs_uid=stu.executeQuery(sql);
    sql="select uid,username,gender,first_name,last_name from user where username='"+username+"' and password='"+password+"'";
    ResultSet rs_password=stp.executeQuery(sql);
    
    if(rs_password.next())
        {
                    session.setAttribute("uid",rs_password.getInt("uid"));
                    session.setAttribute("name",rs_password.getString("first_name")+" "+rs_password.getString("last_name"));
                    String sqlp="select photo from profile where uid="+rs_password.getInt("uid");
                    ResultSet rs_photo=stph.executeQuery(sqlp);
                    if(rs_photo.next())
                        {
                            if(rs_photo.getBoolean("photo")==false)
                                {
                                    
                                    if(rs_password.getString("gender").equals("Male"))
                                    {
                                        session.setAttribute("photo","profile_images/male.png");
                                        session.setAttribute("gender","Male");
                                    }
                                    else
                                        {
                                        session.setAttribute("photo","profile_images/female.png");
                                        session.setAttribute("gender","Female");
                                    }
                                }
                            else
                                        {
                                            
                                            session.setAttribute("photo","profile_images/"+rs_password.getString("uid"));
                                        }
                            
                        }
                    
            sql = "select frids from friendship where uid='" + session.getAttribute("uid") + "'";
            ResultSet rs_fr = stf.executeQuery(sql);
            String friends=null;

            if (rs_fr.next()) {
                if(rs_fr.getString("frids")!=null && rs_fr.getString("frids")!="")
                    {
                friends=rs_fr.getString("frids").replace(":",",");
                session.setAttribute("friends", friends);
                }
            }
           response.sendRedirect("home.jsp");
        }
    else if(rs_uid.next())
        {
                session.setAttribute("username",rs_uid.getString("username"));
                session.setAttribute("error","Invalid password");
                response.sendRedirect("../index.jsp");
        }
    else
        {
                session.setAttribute("error","Invalid username and password");
                response.sendRedirect("../index.jsp");
        }
    stu.close();
    stp.close();
    conn.close();
%>
<html>
    <body>

    </body>
</html>