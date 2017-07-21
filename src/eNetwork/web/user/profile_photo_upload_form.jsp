<%-- 
    Document   : upload_photo
    Created on : Jan 4, 2011, 10:24:06 PM
    Author     : akshar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/index.css">
        <title>eNetwork</title>
    </head>
    <body>
        <div class="header">
            <h1>
                <a href="../index.jsp" style="text-decoration: none;color:white">
                    eNetwork
                </a>
            </h1>
        </div>
        <div class="row">

            <div class="form_col">
                <br/>
                <span id="error"style="margin-left:21px;color:#FF3A13;">
                    <%
                                if (!(session.getAttribute("error") == null)) {
                                    out.println(session.getAttribute("error"));
                                    session.removeAttribute("error");
                                }
                    %>
                </span>
                <form action="profile_photo_upload.jsp" method="post" enctype="multipart/form-data">
                    <table cellpadding="18" align="center">
                        <tr align="center">
                            <td>
                                <%@page import="java.sql.*"%>
                                <%
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
                                            Statement stu = conn.createStatement();
                                            String sql = "select gender from user where uid='" + session.getAttribute("uid") + "'";
                                            ResultSet rs_gender = stu.executeQuery(sql);
                                            if (rs_gender.next())
                                                {
                                                    if(rs_gender.getString("gender").equals("Male"))
                                                        {
                                                            out.print("<img src='../images/male.png' class='green_textbox'>");
                                                            session.setAttribute("gender","Male");
                                                        }
                                                    else
                                                        {
                                                            out.print("<img src='../images/female.png' class='green_textbox' width='248' height='233'>");
                                                            session.setAttribute("gender","Female");
                                                    }
                                                }
                                %>
                                
                            </td>
                        </tr>
                        <tr align="center">
                            <td><input type="file" name="image" id="image" size="21"/></td>
                        </tr
                        <tr align="center">
                            <td><input type="submit" value="Upload" class="green_button"/>
                                <a href="add_profile_form.jsp"><input type="button" value="Skip" class="green_button"/></a>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="footer">
            eNetwork&copy;2010
        </div>
    </body>
</html>
