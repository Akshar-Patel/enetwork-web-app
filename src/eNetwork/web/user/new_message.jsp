<%@include file="include/login_check.jsp" %>
<%title="New Message";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement stuf = conn.createStatement();
            String sqlf = "select first_name,last_name,user.uid "
                    + "from user "
                    + "where (user.uid in(" + session.getAttribute("friends") +")) ";
                        ResultSet rs_frd = stuf.executeQuery(sqlf);
%>
<div class="row">
<div class="col" style="width:130px;margin-left:10px;margin-top:10px;margin-right: 10px;">
    <div id="left_content"></div>
</div>
<div class="col" style="width:450px;margin:10px;">
    <div id="middle_content" style="border:0px solid red;-moz-border-radius:2px;">
        <div class="form_col">
            <form name="new_message" action="send_message.jsp" method="POST">
            <table cellpadding="8" align="center">
                <tr>
                    <td>
                        Write your message:
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea rows="10" cols="78" name="message">
                            
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        To:
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <%
                            while(rs_frd.next())
                               {
                         %>
                         <div class="to_col">
                         <input value="<%out.print(rs_frd.getString("uid"));%>" type="checkbox" name="to[]">
                         <%
                            out.print(rs_frd.getString("first_name")+" "+rs_frd.getString("last_name"));
                         %>
                         </div>
                                                 
                                 <%
                              }
                        %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="send" value="Send" class="green_button">
                        <a href="message.jsp"><input type="button" name="cancel" value="Cancel" class="green_button"></a>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</div>
</div>
<%@include file="include/footer.jsp" %>