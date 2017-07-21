<%@include file="include/login_check.jsp" %>
<%@page import="org.apache.commons.lang.StringUtils" %>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%title="View Posts";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
            String uid=request.getParameter("uid");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");

            Statement stu = conn.createStatement();
            String sql = "select user.uid,first_name,last_name,gender,photo"
                    + " from user,profile"
                    + " where user.uid=profile.uid"
                    + " and user.uid='" +uid+ "'";
          
            ResultSet rs_m = stu.executeQuery(sql);
            String photo=null;
            String display_name=null;
            if(rs_m.next())
                        {
                            display_name=rs_m.getString("first_name")+" "+rs_m.getString("last_name");
                            if(rs_m.getBoolean("photo")==false)
                                {

                                    if(rs_m.getString("gender").equals("Male"))
                                    {
                                        photo="profile_images/male.png";
                                    }
                                    else
                                        {
                                        photo="profile_images/female.png";
       
                                    }
                                }
                            else
                                        {

                                         photo="profile_images/"+rs_m.getString("uid");
                                        }

                        }

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

            Statement stuf = conn.createStatement();
            String sqlf = "select first_name,last_name,user.uid,photo,post.psid,post.text "
                    + "from user,profile,post "
                    + "where user.uid=profile.uid "
                    + "and user.uid=post.uid "
                    + "and post.psid not in(select psid from hidden_post where uid='"+uid+"')"
                    + "and (user.uid in(" + friends + ") or user.uid='" + uid + "') "
                    + "order by psid desc";
            ResultSet rs_frd = stuf.executeQuery(sqlf);

            Statement stcm = null;
            String sqlcm = null;
            ResultSet rs_cm = null;

           
          
%>
<div class="row">
    <div class="col" style="width:130px;margin-left:10px;margin-top:10px;margin-right: 10px;">
        <div id="left_content" style="text-align:center">
            <%
                        out.print("<img src='" + photo + "' width='128' height='128'>");
                        out.print("<div class='user_display_name'>" + display_name + "</div>");
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
                <span id="friend_status">Friend Request Sent.<br><br><a class='link' id='friend_status' onclick='cancel_friend_request()'>Cancel Friend Request</a></span>
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
            <a class="link" href="view_posts.jsp?uid=<%out.print(request.getParameter("uid"));%>">Posts</a><br/><br/>
            <a class="link" href="view_profile.jsp?uid=<%out.print(request.getParameter("uid"));%>">Profile</a><br/><br/>
            <a class="link" href="view_album.jsp?uid=<%out.print(request.getParameter("uid"));%>">Albums</a><br/><br/>

            <%
                }
            %>
 </div>
    </div>
    <div class="col" style="width:450px;margin:10px;">
        <div id="middle_content">
            <div id="share_row" class="share_row">
                <input type="text" id="share_content" name="share_content" size="44" class="blue_textbox">
                <input type="submit" value="Share" class="round_button" onclick="return insert_post()">
            </div>
            
            <div id="post" class="post">
                <%
                            while (rs_frd.next()) {
                %>
                <div id="post_row" class="post_row">
                    <div class="post_col">
                        <%
                                                                if (rs_frd.getBoolean("photo") == false) {
                                                                } else {
                                                                    out.print("<img width='48' height='48' src='profile_images/" + rs_frd.getString("uid") + "'>");
                                                                }
                        %>
                    </div>
                    <div class="post_col">

                        <div class="post_name">
                            <%out.print("<a href='view_profile.jsp?uid="+rs_frd.getString("uid")+"'>"+rs_frd.getString("first_name") + " " + rs_frd.getString("last_name")+"</a>");%>
                        </div>
                        <div class="post_content">
                            <%out.print(rs_frd.getString("text"));%>
                        </div>
                        <div class="post_options">
                            <a class="link" onclick="show_comment_box(this.parentNode.parentNode.parentNode)">Comment</a>
                        </div>
                    </div>
                    <div style="float: right;" class="post_col">
                        <input type="button" onclick="remove(this.parentNode.parentNode)" class="close_button" value="Remove">
                    </div>

                    <div id="comment">
                        <%
                                                                stcm = conn.createStatement();
                                                                sqlcm = "select user.uid,first_name,last_name,photo,pscid,text from user,profile,post_comment where user.uid=profile.uid and user.uid=post_comment.uid and psid='" + rs_frd.getString("psid") + "'";
                                                                rs_cm = stcm.executeQuery(sqlcm);
                                                                while (rs_cm.next()) {

                        %>
                        <div class="comment_row">

                            <div class="comment_col">
                                <%
                                                                                                                        if (rs_cm.getBoolean("photo") == false) {
                                                                                                                        } else {
                                                                                                                            out.print("<img width='32' height='32' src='profile_images/" + rs_cm.getString("uid") + "'>");
                                                                                                                        }
                                %>
                            </div>
                            <div class="comment_col">
                                <div class="comment_name">
                                    <%out.print("<a href='view_profile.jsp?uid="+rs_cm.getString("uid")+"'>"+rs_cm.getString("first_name") + " " + rs_cm.getString("last_name")+"</a>");%>
                                </div>
                                <div class="post_content" style="font-size:12px">
                                    <%out.print(rs_cm.getString("text"));%>
                                </div>

                            </div>
                        </div>
                        <%
                                                                }
                        %>
                    </div>
                    <div class="comment_row" id="comment_box">
                        <input type="text" class="blue_textbox" id="comment_text">
                        <input type="text" value="<%out.print(rs_frd.getString("psid"));%>">
                        <input type="button" class="round_button" value="Comment" onclick="return insert_comment(this.parentNode.parentNode)">
                        <input type="button" onclick="hide_comment_box(this.parentNode.parentNode)" class="close_button" value="X">
                    </div>

                </div>
                <%
                            }
                            stuf.close();
                            conn.close();
                %>
            </div>
        </div>

    </div>
    <div class="col" style="width:250px;margin-left:10px;margin-top:10px;">
        <div id="right_content" style="text-align:center">
            
        </div>
    </div>
</div>
<%@include file="include/footer.jsp" %>
