<%@include file="include/login_check.jsp" %>
<%title="Message";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql="select * from message where uid_to='"+session.getAttribute("uid")+"'";
    ResultSet rsm=st.executeQuery(sql);
    
%>
<div class="row">
    <div class="col" style="width:130px;margin-left:10px;margin-top:10px;margin-right: 10px;">
        <div id="left_content">
            <%
                        out.print("<img src='" + session.getAttribute("photo") + "' width='128' height='128'>");
                        out.print("<div class='user_display_name'>" + session.getAttribute("name") + "</div>");
            %>
            <hr/>
            <div>
                <a class="link" href="new_message.jsp">New Message</a><br/><br/>
              
            </div>
        </div>
    </div>
            <form action="delete_message.jsp" method="post">
    <div class="col" style="width:450px;margin:10px;">
            <div id="middle_content" style="border:0px solid red;-moz-border-radius:2px;">
                <div class="message_option">
                    
                    <input type="submit" value="Delete" class="round_button" style="float:right;margin:8px 8px 0px 0px">
                    
                </div>
                <table border="0" style="clear: both" cellpadding="10">
                    <%
                        while(rsm.next())
                            {
                                sql="select first_name,last_name,uid from user where uid='"+rsm.getString("uid_from")+"'";
                                Statement stu=conn.createStatement();
                                ResultSet rsu=stu.executeQuery(sql);
                    %>

                    <tr>
                        <%
                                    if(rsu.next())
                                        {
                                 %>
                        <td><input name="id[]"type="checkbox" value="<%out.print(rsm.getString("mid"));%>"></td>
                        <td><img width="48" height="48" align="middle" src="profile_images/<%out.print(rsu.getString("uid"));%>"></td>
                        <td>
                             <div class="post_name" style="margin-left:0px;">
                                 
                                 <a href="profile.jsp?uid=<%out.print(rsu.getString("uid"));%>"><%out.print(rsu.getString("first_name")+" "+rsu.getString("last_name"));%></a>
                                 
                             </div>
                        </td>
                            <td>
                                <div class="message_content"><%out.print(rsm.getString("text"));%></div>
                            </td>
                            <%
                                        }
                                 %>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
    </div>
            </form>
</div>            
<%@include file="include/footer.jsp" %>