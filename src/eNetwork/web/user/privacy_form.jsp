<%@include file="include/login_check.jsp" %>
<%title="Privacy";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
           Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            
            Statement stpr=conn.createStatement();
           String sql="select * from privacy where uid='"+session.getAttribute("uid")+"'";
           ResultSet rspr=stpr.executeQuery(sql);

           String posts_privacy=null;
           String birthday_privacy=null;
           String gender_privacy=null;
           String email_privacy=null;
           String photos_privacy=null;
           String videos_privacy=null;
           if(rspr.next())
               {
                    posts_privacy=rspr.getString("posts");
                    birthday_privacy=rspr.getString("birthday");
                    gender_privacy=rspr.getString("gender");
                    email_privacy=rspr.getString("email");
                    photos_privacy=rspr.getString("photos");
                    videos_privacy=rspr.getString("videos");
               }
%>
<div class="row">
    <form action="privacy.jsp" method="post">
    <div class="form_col">
        <table cellpadding="8" align="center">
            <tr>
                <td>Who can see your</td>
                <td></td>
            </tr>
            <tr>
                <td>
                 Posts:
                </td>
                <td>
                    <select class="green_textbox" name="posts">
                        <option value="e" <%if(posts_privacy.equals("e"))out.print("selected");%> >Everyone</option>
                        <option value="f" <%if(posts_privacy.equals("f"))out.print("selected");%>>Only Friends</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                 Birthday:
                </td>
                <td>
                    <select class="green_textbox" name="birthday">
                        <option  value="e" <%if(birthday_privacy.equals("e"))out.print("selected");%> >Everyone</option>
                        <option value="f" <%if(birthday_privacy.equals("f"))out.print("selected");%> >Only Friends</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                 Gender:
                </td>
                <td>
                    <select class="green_textbox" name="gender">
                        <option value="e" <%if(gender_privacy.equals("e"))out.print("selected");%> >Everyone</option>
                        <option value="f" <%if(gender_privacy.equals("f"))out.print("selected");%> >Only Friends</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                 Email:
                </td>
                <td>
                    <select class="green_textbox" name="email">
                        <option value="e" <%if(email_privacy.equals("e"))out.print("selected");%> >Everyone</option>
                        <option value="f" <%if(email_privacy.equals("f"))out.print("selected");%> >Only Friends</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                 Photos:
                </td>
                <td>
                    <select class="green_textbox" name="photos">
                        <option value="e" <%if(photos_privacy.equals("e"))out.print("selected");%> >Everyone</option>
                        <option value="f" <%if(photos_privacy.equals("f"))out.print("selected");%> >Only Friends</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                 Videos:
                </td>
                <td>
                    <select class="green_textbox" name="videos">
                        <option value="e" <%if(videos_privacy.equals("e"))out.print("selected");%> >Everyone</option>
                        <option value="f" <%if(videos_privacy.equals("f"))out.print("selected");%> >Only Friends</option>
                    </select>
                </td>
            </tr>
            <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Submit" class="green_button">
                        <a href="home.jsp"><input type="button" name="cancel" value="Cancel" class="green_button"></a>
                    </td>
                </tr>
        </table>
    </div>
    </form>
</div>
<%@include file="include/footer.jsp" %>