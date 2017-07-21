<%@include file="include/login_check.jsp" %>
<%title="Search";%>
<%@include file="include/header.jsp" %>
<%@page import="org.apache.commons.lang.StringUtils" %>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%@page import="java.sql.*"%>
<% String search=request.getParameter("search");

   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
   Statement st = conn.createStatement();
   String sql="select user.uid,first_name,last_name,photo"
                     + " from user,profile"
                     + " where user.uid=profile.uid"
                     + " and (first_name='"+search+"' or last_name='"+search+"')"
                     + " limit 0,10";
  ResultSet rs=st.executeQuery(sql);

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
        <%
            while(rs.next())
                {
        %>
<div class="search" id="search">
    <div class="search_row">
        <div class="search_col" style="margin-left:0px;">
            <%out.print("<img src='profile_images/"+rs.getString("uid") + "' width='70' height='70'>");%>
        </div>
      
        <div class="search_col user_display_name" style="margin-top:0px;width: 220px;">
            <a href="view_profile.jsp?uid=<%out.print(rs.getString("uid"));%>">
            <%out.print(rs.getString("first_name")+" "+rs.getString("last_name"));%>
        </a>
        </div>
        <div class="search_col">
            <%
            Statement stfrq=conn.createStatement();
           sql="select * from friend_request where uid_from='"+session.getAttribute("uid")+"' and uid_to='"+rs.getString("uid")+"'";
           ResultSet rsfrq=stfrq.executeQuery(sql);
           rsfrq.last();

                String friends=null;
            String[] fra=null;
            boolean isfriend=false;
            if (session.getAttribute("friends")!=null && session.getAttribute("friends")!="") {
                friends=session.getAttribute("friends").toString();
            }
          if(friends!=null && friends!="")
              {
               fra=friends.split(",");
               isfriend=ArrayUtils.contains(fra,rs.getString("uid"));
              }
            %>
            <%
                if(session.getAttribute("uid").toString().equals(rs.getString("uid")))
                    {
                    %>
                    <div class="friend_status"></div>
                    <%
                    }
                        else
                            {

            %>
            <div class="friend_status">

            <%
            if(isfriend==true)
               {
                    %>
                    <span id="friend_status"><a class='link' id='friend_status' onclick='remove_friend_search(<%out.print(rs.getString("uid"));%>,this.parentNode.parentNode)'>Remove Friend</a></span>
                    <%
               }
            else if(rsfrq.getRow()!=0)
                {
           %>
                <span id="friend_status">Friend Request Sent.<br><a class='link' id='friend_status' onclick='cancel_friend_request_search(<%out.print(rs.getString("uid"));%>,this.parentNode.parentNode)'>Cancel Friend Request</a></span>
           <%
                }
                        else{
                %>
                <span style="" id="friend_status"><a class="link" id="friend_status" onclick="send_friend_request_search(<%out.print(rs.getString("uid"));%>,this.parentNode.parentNode)">Send Friend Request</a></span>

            <%
                }
            %>
            </div>
            <%
                }
            %>
        </div>
    </div>      
</div>
            <%
                }
            %>
           
        <div style="clear:both">
            <input style="margin-top:10px;" class="round_button" id="load_result"type="button" value="Load More Results" onclick='load_result(10,"<%out.print(request.getParameter("search"));%>")'>
        </div>
    </div>
</div>
</div>
<%@include file="include/footer.jsp" %>