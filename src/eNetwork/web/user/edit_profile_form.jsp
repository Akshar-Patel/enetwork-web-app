<%@include file="include/login_check.jsp" %>
<%title="Edit Profile Information";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement stp = conn.createStatement();
            String sql = "select * from profile where uid='" + session.getAttribute("uid") + "'";
            ResultSet rs_profile = stp.executeQuery(sql);
%>
<div class="row">
    <div class="form_col">
        <br/>
        <span id="error"style="margin-left:21px;color:#FF3A13;"></span>
        <form name="edit_profile_form" action="add_profile.jsp?edit=true" method="POST">
            <table cellpadding="8" align="center">
                <%
                    if(rs_profile.next())
                        {
                        String city="";
                        String hometown="";
                        String languages="";
                        String about_me="";
                        String relationship_status="";
                        String employer="";
                        String college="";
                        String high_school="";
                        String religion="";
                        String activities="";
                        String interests="";

                        if(rs_profile.getString("city")!=null)
                            {
                                city=rs_profile.getString("city");
                            }
                        if(rs_profile.getString("hometown")!=null)
                            {
                                hometown=rs_profile.getString("hometown");
                            }
                        if(rs_profile.getString("languages")!=null)
                            {
                                languages=rs_profile.getString("languages");
                            }
                        if(rs_profile.getString("about_me")!=null)
                            {
                                about_me=rs_profile.getString("about_me");
                            }
                        if(rs_profile.getString("relationship_status")!=null)
                            {
                                relationship_status=rs_profile.getString("relationship_status");
                            }
                        if(rs_profile.getString("employer")!=null)
                            {
                                employer=rs_profile.getString("employer");
                            }
                        if(rs_profile.getString("college")!=null)
                            {
                                college=rs_profile.getString("college");
                            }
                        if(rs_profile.getString("high_school")!=null)
                            {
                                high_school=rs_profile.getString("high_school");
                            }
                        if(rs_profile.getString("religion")!=null)
                            {
                                religion=rs_profile.getString("religion");
                            }
                        if(rs_profile.getString("activities")!=null)
                            {
                                activities=rs_profile.getString("activities");
                            }
                        if(rs_profile.getString("interests")!=null)
                            {
                                interests=rs_profile.getString("interests");
                            }
                %>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="city" value="<%out.print(city);%>" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>Hometown</td>
                    <td><input type="text" name="hometown" value="<%out.print(hometown);%>" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>Languages</td>
                    <td><input type="text" name="languages" value="<%out.print(languages);%>" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>About me</td>
                    <td>
                        <textarea cols="34" rows="3" class="green_textbox" name="about_me">
                            <%out.print(about_me);%>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>Relationship Status</td>
                    <td>
                        <select class="green_textbox" name="relationship_status">
                            
                            <option <%if(relationship_status.equals("Single"))out.print("selected");%>>Single</option>
                            <option <%if(relationship_status.equals("Married"))out.print("selected");%>>Married</option>
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Employer</td>
                    <td><input type="text" name="employer" value="<%out.print(employer);%>" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>College/University</td>
                    <td><input type="text" name="college" value="<%out.print(college);%>" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>High School</td>
                    <td><input type="text" name="high_school" value="<%out.print(high_school);%>" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>Religion</td>
                    <td>
                        <select class="green_textbox" name="religion">
                            <option <%if(religion.equals("Hindu"))out.print("selected");%>>Hindu</option>
                            <option <%if(religion.equals("Muslim"))out.print("selected");%>>Muslim</option>
                            <option <%if(religion.equals("Sikh"))out.print("selected");%>>Sikh</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Activities</td>
                    <td>
                        <textarea cols="34" rows="3" class="green_textbox" name="activities">
                            <%out.print(activities);%>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>Interests</td>
                    <td>
                        <textarea cols="34" rows="3" class="green_textbox" name="interests">
                            <%out.print(interests);%>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Submit" class="green_button">
                        <a href="profile.jsp"><input type="button" name="cancel" value="Cancel" class="green_button"></a>
                    </td>
                </tr>
                <%
                }
                %>
            </table>
        </form>
    </div>
</div>
<%@include file="include/footer.jsp" %>
