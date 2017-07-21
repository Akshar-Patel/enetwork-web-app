<%@page import="java.sql.*"%>
<%
boolean is_friend_request_sent(int uid1,int uid2)
        {
            
       
    }%>
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
                <div id="post_row" class="post_row" style="border:2px solid #1A77BD;padding-top: 8px;padding-bottom: 8px;-moz-border-radius:10px;">

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
                            <input class="round_button" type="button" value="Accept">
                            <input class="round_button" type="button" value="Discard">
                        </div>
                    </div>
                </div>
                <%
                                }
            %>
            </div>
%>