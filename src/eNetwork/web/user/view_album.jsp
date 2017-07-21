<%@include file="include/login_check.jsp" %>
<%title="View Albums";%>
<%@include file="include/header.jsp" %>

<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement stu=conn.createStatement();
    String sql="select * from user where uid='"+request.getParameter("uid")+"'";
    ResultSet rs_user=stu.executeQuery(sql);

    Statement sta=conn.createStatement();
    sql="select * from media_album where uid='"+request.getParameter("uid")+"'";
    ResultSet rs_album=sta.executeQuery(sql);

    
%>
<div class="row">
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
        Albums by&nbsp;
       <%
       if(rs_user.next())
           {
       out.print("<a style='font-size:15px;' class='link' href='view_profile.jsp?uid=" +rs_user.getString("first_name")+" "+rs_user.getString("last_name")+ "'>" +rs_user.getString("first_name")+" "+rs_user.getString("last_name")+ "</a>");
            }
%>
           </div>
    <div class="media_row">
        <%
            while(rs_album.next())
                {

        %>
        <a href="view_media.jsp?uid=<%out.print(request.getParameter("uid"));%>&album_id=<%out.print(rs_album.getString("mdaid"));%>">
        <div class="media_col" style="padding-top:8px;">
            <%
                if(rs_album.getString("cover").equals("0"))
                    {
            %>
            <img alt=""  src="photos/no_cover.jpg" width="128" height="128" style="border:none">
            <%
                    }
                    else
                        {
                    Statement stph=conn.createStatement();
                    sql="select * from media where mdid='"+rs_album.getString("cover")+"'";
                    ResultSet rs_photos=stph.executeQuery(sql);
                    if(rs_photos.next())
                        {
                    out.print("<img src='photos/" + rs_photos.getString("path") + "' width='128' height='128' style='border:none'>");
                    }
                    }
            %>
            <div class="media_album_name"><%out.print(rs_album.getString("name"));%></div>

        </div>
         </a>
        <%

            }
        %>
    </div>
</div>
<%@include file="include/footer.jsp" %>