<%@page import="enetwork.MD5"%>
<%
    MD5 md5=new MD5();
    String password=md5.hash(request.getParameter("old_password").trim());
    String new_password=md5.hash(request.getParameter("new_password")).trim();
%>
<%@page import="java.sql.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement st=conn.createStatement();
            Statement stu=conn.createStatement();
         
            String sql="select password from user where uid='"+session.getAttribute("uid")+"'";
            ResultSet rs=st.executeQuery(sql);
            if(rs.next())
                {
                    if((!rs.getString("password").equals(password)) || 
                       (!request.getParameter("new_password").equals(request.getParameter("confirm_password"))))
                        {

                            session.setAttribute("error", "Invalid Password");
                            response.sendRedirect("change_password_form.jsp");
                        }
                    else
                        {
                            sql="update user set password='"+new_password+"' where uid='"+session.getAttribute("uid")+"'";
                            stu.executeUpdate(sql);
                            response.sendRedirect("home.jsp");
                        }
                }
%>