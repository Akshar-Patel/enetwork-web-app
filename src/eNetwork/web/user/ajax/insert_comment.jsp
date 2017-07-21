<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement stu=conn.createStatement();
    String sql="insert into post_comment(psid,uid,text) values("+request.getParameter("psid")+","+session.getAttribute("uid")+",'"+request.getParameter("comment")+"')";
    stu.executeUpdate(sql);
%>
<div class="comment_col">
    <%out.print("<img width='32' height='32' src='"+session.getAttribute("photo")+"'>");%>
                            </div>
                            <div class="comment_col">
                                <div class="comment_name">
                                    <%
                                        out.print("<a href='view_profile.jsp?uid="+session.getAttribute("uid")+"'>"+session.getAttribute("name")+"</a>");
                                    %>
                                </div>
                                <div class="post_content" style="font-size:12px">
                                    <%
                                        out.print(request.getParameter("comment"));
                                    %>
                                </div>

                            </div>