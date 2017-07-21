<%@include file="include/login_check.jsp" %>
<%title="Profile";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement stu = conn.createStatement();
            Statement stp = conn.createStatement();
            String sql = "select * from user where uid='" + session.getAttribute("uid") + "'";
            ResultSet rs_user = stu.executeQuery(sql);
            sql = "select * from profile where uid='" + session.getAttribute("uid") + "'";
            ResultSet rs_profile = stp.executeQuery(sql);
%>
<div class="row">
    <div class="col" style="width: 130px; margin-left: 10px; margin-top: 10px; margin-right: 10px;">
        <div id="left_content">
            <%
                        out.print("<img src='" + session.getAttribute("photo") + "' width='128' height='128'>");
                        out.print("<div class='user_display_name'>" + session.getAttribute("name") + "</div>");
            %>
            <hr/>
            <div>
                <a class="link" href="edit_profile_photo_form.jsp">Change Profile Photo</a><br/><br/>
                <a class="link" href="edit_profile_form.jsp">Edit Profile</a><br/><br/>
            </div>
            <div id="photo_pop_up" class="photo_pop_up">
                <div><input type="button" class="close_button" value="X" onclick="close_photo_pop_up()"></div>
                <iframe style="border:0px;" width="400px" height="340px" src="profile_photo_form.jsp">
                </iframe>
            </div>
        </div>
    </div>
    <div class="col" style="width: 450px; margin: 10px;">

        <div id="middle_content">
            <div>
                <table style="font-size: 15px;" cellpadding="10">
                    <%
                                if (rs_user.next()) {
                    %>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Full Name</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("first_name") + " " + rs_user.getString("last_name"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Email</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("email"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Gender</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("gender"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Birthday</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("birthday"));%></td>
                    </tr>
                    <%
                                }
                                if (rs_profile.next()) {
                    %>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">City</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("city"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Hometown</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("hometown"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Languages</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("languages"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">About me</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("about_me"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Relationship Status</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("relationship_status"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Employer</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("employer"));%></td>
                    </tr>

                    <tr>
                        <td style="color: rgb(51, 141, 36);">College</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("college"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">High School</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("high_school"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Religion</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("religion"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Activities</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("activities"));%></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Interests</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_profile.getString("interests"));%></td>
                    </tr>

                    <%
                                }
                    %>
                </table>
            </div>
        </div>
    </div>

</div>
<%@include file="include/footer.jsp" %>
