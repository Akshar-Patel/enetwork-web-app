<%@include file="include/login_check.jsp" %>
<%title="View Profile";%>
<%@include file="include/header.jsp" %>
<%@page import="org.apache.commons.lang.StringUtils" %>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%@page import="java.sql.*"%>
<%
            String uid=request.getParameter("uid");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement stp = conn.createStatement();
            Statement stu = conn.createStatement();
            Statement stu1=conn.createStatement();

            String sql = "select * from user where uid='" + uid + "'";
            ResultSet rs_user = stu.executeQuery(sql);
            ResultSet rs_user1=stu1.executeQuery(sql);
            sql = "select * from profile where uid='" + uid + "'";
            ResultSet rs_profile = stp.executeQuery(sql);

           
            String friends=null;
            String[] fra=null;
            boolean isfriend=false;
            if (session.getAttribute("friends")!=null && session.getAttribute("friends")!="") {
                friends=session.getAttribute("friends").toString();
            }
          if(friends!=null && friends!="")
              {
               fra=friends.split(",");
               isfriend=ArrayUtils.contains(fra,uid);
              }
          
           Statement stfrq=conn.createStatement();
           sql="select * from friend_request where uid_from='"+session.getAttribute("uid")+"' and uid_to='"+uid+"'";
           ResultSet rsfrq=stfrq.executeQuery(sql);
           rsfrq.last();

           Statement stpr=conn.createStatement();
           sql="select * from privacy where uid='"+uid+"'";
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
    <div class="col" style="width: 130px; margin-left: 10px; margin-top: 10px; margin-right: 10px;">
        <div id="left_content" style="text-align:center">
            <%
                         
                      if(rs_user1.next())
                            {
                        out.print("<img src='profile_images/" + rs_user1.getString("uid") + "' width='128' height='128'>");
                        out.print("<div class='user_display_name'>" + rs_user1.getString("first_name")+" "+rs_user1.getString("last_name")+ "</div>");
                        }
            %>
            <hr/>
               <%
                if(session.getAttribute("uid").toString().equals(request.getParameter("uid")))
                    {

                    }
                        else
                            {

            %>
            <div class="friend_status">

            <%
            if(isfriend==true)
               {
                    %>
              <span id="friend_status"><a class='link' id='friend_status' onclick='remove_friend(<%out.print(uid);%>)'>Remove Friend</a></span>
                    <%
               }
            else if(rsfrq.getRow()!=0)
                {
           %>
                <span id="friend_status">Friend Request Sent.<br><br><a class='link' id='friend_status' onclick='cancel_friend_request(<%out.print(uid);%>)'>Cancel Friend Request</a></span>
           <%
                }
                        else{
                %>
            <span id="friend_status"><a class="link" id="friend_status" onclick="send_friend_request(<%out.print(uid);%>)">Send Friend Request</a></span>

            <%
                }
            %>
            </div>
               <hr/>
            <%
                        if(posts_privacy=="e")
                            {
                    %>
            <a class="link" href="view_posts.jsp?uid=<%out.print(request.getParameter("uid"));%>">Posts</a><br/><br/>
            <%
                            }
                        else
                            {
                                if(isfriend)
                                    {
                    %>
                    <a class="link" href="view_posts.jsp?uid=<%out.print(request.getParameter("uid"));%>">Posts</a><br/><br/>
            
                    <%
                    }
                            }
                    %>
            <a class="link" href="view_profile.jsp?uid=<%out.print(request.getParameter("uid"));%>">Profile</a><br/><br/>
            <a class="link" href="view_album.jsp?uid=<%out.print(request.getParameter("uid"));%>">Albums</a><br/><br/>
            
            <%
                }
            %>
         
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
                    <%
                        if(email_privacy=="e")
                            {
                    %>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Email</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("email"));%></td>
                    </tr>
                    <%
                            }
                        else
                            {
                                if(isfriend)
                                    {
                    %>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Email</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("email"));%></td>
                    </tr>
                    <%
                    }
                            }
                    %>
                    <%
                        if(gender_privacy=="e")
                            {
                    %>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Gender</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("gender"));%></td>
                    </tr>
                    <%
                            }
                        else
                            {
                                if(isfriend)
                                    {
                    %>
                    <tr>
                        <td style="color: rgb(51, 141, 36);">Gender</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("gender"));%></td>
                    </tr>
                    <%
                    }
                            }
                    %>
                    <%
                        if(gender_privacy=="e")
                            {
                    %>
                    <tr>

                        <td style="color: rgb(51, 141, 36);">Birthday</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("birthday"));%></td>
                    </tr>
                    <%
                            }
                        else
                            {
                                if(isfriend)
                                    {
                    %>
                    <tr>

                        <td style="color: rgb(51, 141, 36);">Birthday</td>
                        <td style="color: rgb(5, 81, 138);"><%out.print(rs_user.getString("birthday"));%></td>
                    </tr>
                    <%
                    }
                            }
                    %>
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
