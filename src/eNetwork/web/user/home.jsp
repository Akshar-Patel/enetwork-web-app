<%@include file="include/login_check.jsp" %>
<%title="Home";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement stuf = conn.createStatement();
            String sqlf = "select first_name,last_name,user.uid,photo,post.psid,post.text "
                    + "from user,profile,post "
                    + "where user.uid=profile.uid "
                    + "and user.uid=post.uid "
                    + "and post.psid not in(select psid from hidden_post where uid='"+session.getAttribute("uid")+"')"
                    + "and (user.uid in(" + session.getAttribute("friends") + ") or user.uid='" + session.getAttribute("uid") + "') "
                    + "order by post.psid desc";
            
            ResultSet rs_frd = stuf.executeQuery(sqlf);

            Statement stcm = null;
            String sqlcm = null;
            ResultSet rs_cm = null;
%>
<div class="row">
    <div class="col" style="width:130px;margin-left:10px;margin-top:10px;margin-right: 10px;">
        <div id="left_content">
            <%
                        out.print("<img src='" + session.getAttribute("photo") + "' width='128' height='128'>");
                        out.print("<div class='user_display_name'>" + session.getAttribute("name") + "</div>");
            %>
        </div>
    </div>
    <div class="col" style="width:450px;margin:10px;">
        <div id="middle_content">
            <div id="share_row" class="share_row">
                <input type="text" id="share_content" name="share_content" size="44" class="blue_textbox">
                <input type="submit" value="Share" class="round_button" onclick="return insert_post()">
            </div>
           <div id="friend_request" class="friend_request">
                <%
                            Statement st_fr_rq = conn.createStatement();
                            String sql = "select user.uid,first_name,last_name,photo,uid_from"
                                    + " from user,profile,friend_request"
                                    + " where user.uid=friend_request.uid_from"
                                    + " and user.uid=profile.uid"
                                    + " and uid_to='" + session.getAttribute("uid") + "'";

                            ResultSet rs_fr_rq = st_fr_rq.executeQuery(sql);
                            if (rs_fr_rq.next()) {
                %>
                <div class="post_row" style="border:2px solid #1A77BD;padding-top: 8px;padding-bottom: 8px;-moz-border-radius:10px;">

                    <div class="green_text">You have new friend request.</div>

                    <div style="text-align:center">
                        <div class="friend_request_col">
                        <div class="friend_request_name">
                            <%
                            if (rs_fr_rq.getBoolean("photo") == false) {
                                } else {
                                      out.print("<img align='middle' width='48' height='48' src='profile_images/" + rs_fr_rq.getString("uid") + "'>");
                               }
                        %>

                            <%out.print("<a href='view_profile.jsp?uid=" + rs_fr_rq.getString("uid") + "'>" + rs_fr_rq.getString("first_name") + " " + rs_fr_rq.getString("last_name") + "</a>");%>
                        </div>
                        </div>
                        <div class="friend_request_col">
                            <input class="round_button" type="button" value="Accept" onclick="accept_friend_request(<%out.print(rs_fr_rq.getString("uid"));%>,this.parentNode.parentNode.parentNode)">
                            <input class="round_button" type="button" value="Discard" onclick="discard_friend_request(<%out.print(rs_fr_rq.getString("uid"));%>,this.parentNode.parentNode.parentNode)">
                        </div>
                    </div>
                </div>
                <%
                                }
            %>
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
                            <%out.print("<a href='view_profile.jsp?uid=" + rs_frd.getString("uid") + "'>" + rs_frd.getString("first_name") + " " + rs_frd.getString("last_name") + "</a>");%>
                        </div>
                        <div class="post_content">
                            <%out.print(rs_frd.getString("text"));%>
                        </div>
                        <div class="post_options">
                            <a class="link" onclick="show_comment_box(this.parentNode.parentNode.parentNode)">Comment</a>
                        </div>
                    </div>
                    <div style="float: right;" class="post_col">
                        <%    
                            if(rs_frd.getString("uid").equals(session.getAttribute("uid").toString()))
                                {
                        %>
                        <input type="button" onclick="remove_post(<%out.print(rs_frd.getString("psid"));%>,this.parentNode.parentNode)" class="close_button" value="Remove">
                        <%
                                }
                            else
                             {
                        %>
                        <input type="button" onclick="hide_post(<%out.print(rs_frd.getString("psid"));%>,this.parentNode.parentNode)" class="close_button" value="Remove">
                        <%
                        }
                        %>
                    </div>

                    <div id="comment">
                        <%
                                                        stcm = conn.createStatement();
                                                        sqlcm = "select user.uid,first_name,last_name,photo,pscid,text from user,profile,post_comment where user.uid=profile.uid and user.uid=post_comment.uid and psid='" + rs_frd.getString("psid") + "' order by pscid";
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
                                    <%out.print("<a href='view_profile.jsp?uid=" + rs_cm.getString("uid") + "'>" + rs_cm.getString("first_name") + " " + rs_cm.getString("last_name") + "</a>");%>
                                </div>
                                <div class="post_content" style="font-size:12px">
                                    <% out.print(rs_cm.getString("text"));%>
                                </div>

                            </div>
                        </div>
                        <%
                                                        }
                        %>
                    </div>
                    <div class="comment_row" id="comment_box" style="margin-top:2px;">
                        
                        <input type="text" class="blue_textbox" id="comment_text">
                        <input type="hidden" value="<%out.print(rs_frd.getString("psid"));%>">
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
        <div id="right_content">

        </div>
    </div>
</div>
<%@include file="include/footer.jsp" %>