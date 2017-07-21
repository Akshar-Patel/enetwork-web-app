<%@page import="java.sql.*"%>
<% String search=request.getParameter("search");
   int ls=Integer.parseInt(request.getParameter("last"));
   int le=Integer.parseInt(request.getParameter("last"))+10;
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
   Statement st = conn.createStatement();
   String sql="select user.uid,first_name,last_name,photo"
                     + " from user,profile"
                     + " where user.uid=profile.uid"
                     + " and (first_name='"+search+"' or last_name='"+search+"')"
                     + " limit "+ls+","+le;
  ResultSet rs=st.executeQuery(sql);
  while(rs.next())
       {
%>
<div class="search_row">
  <div class="search_col" style="margin-left:0px;">
            <%out.print("<img src='profile_images/"+rs.getString("uid") + "' width='70' height='70'>");%>
        </div>
        <div class="search_col user_display_name" style="margin-top:0px;width: 220px;">
            <%out.print(rs.getString("first_name")+" "+rs.getString("last_name"));%>
        </div>
        <div class="search_col">
            <a class="link" id="friend_status" onclick="">Send Friend Request</a>
        </div>
</div>
            <%
                }
            %>
