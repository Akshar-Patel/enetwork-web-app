<%@include file="include/login_check.jsp" %>
<%title="Media";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");

    Statement stph=conn.createStatement();
    String sql="select * from media where mdaid='"+request.getParameter("album_id")+"' and type='p'";
    ResultSet rs_photos=stph.executeQuery(sql);

    Statement stv=conn.createStatement();
    sql="select * from media where mdaid='"+request.getParameter("album_id")+"' and type='v'";
    ResultSet rs_videos=stv.executeQuery(sql);

    Statement sta=conn.createStatement();
    sql="select * from media_album where mdaid='"+request.getParameter("album_id")+"'";
    ResultSet rs_album=sta.executeQuery(sql);
%>
<div class="row">
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
        <%
            if(rs_album.next())
                {
                    out.print(rs_album.getString("name"));
                }
        %>
         by &nbsp;
       <%out.print("<a style='font-size:15px;' class='link' href='view_profile.jsp?uid=" + session.getAttribute("uid") + "'>" + session.getAttribute("name") + "</a>");%>
       <a href="edit_album_form.jsp?album_id=<%out.print(request.getParameter("album_id"));%>" class="link" style="font-size: 15px;float:right"> Edit Album</a>
       <a href="delete_album.jsp?album_id=<%out.print(request.getParameter("album_id"));%>" class="link" style="font-size: 15px;float:right">Delete Album| </a>
    </div
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
        <hr>
        Photos
    </div>
    <div class="media_row">
        <%
           while(rs_photos.next())
               {
        %>
        <a href="photo.jsp?album_id=<%out.print(request.getParameter("album_id"));%>&photo_id=<%out.print(rs_photos.getString("mdid"));%>">
        <div class="media_col" style="border:1px solid gainsboro">
            <img alt=""  src="photos/<%out.print(rs_photos.getString("path"));%>" width="145" height="145" style="border:none">
            <div class="media_album_name"><%out.print(rs_photos.getString("name"));%></div>
        </div>
        </a>
        
        <%
            }
        %>
    </div>
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
        <hr>
        Videos
    </div>
    <div class="media_row">
        <%
           while(rs_videos.next())
               {
        %>
        <a href="video.jsp?album_id=<%out.print(request.getParameter("album_id"));%>&video_id=<%out.print(rs_videos.getString("mdid"));%>">
        <div class="media_col" style="border:1px solid gainsboro">
            <br>
            <br/>
            <img alt=""  src="photos/play.png" width="75" height="75" style="border:none">
            <div class="media_album_name"><%out.print(rs_videos.getString("name"));%></div>
        </div>
        </a>
        <%
            }
        %>
    </div>
</div>
<%@include file="include/footer.jsp" %>