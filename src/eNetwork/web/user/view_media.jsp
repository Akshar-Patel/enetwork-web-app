<%@include file="include/login_check.jsp" %>
<%title="Media";%>
<%@include file="include/header.jsp" %>
<%@page import="org.apache.commons.lang.StringUtils" %>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");


    Statement stu=conn.createStatement();
    String sql="select * from user where uid='"+request.getParameter("uid")+"'";
    ResultSet rs_user=stu.executeQuery(sql);
    
    Statement stph=conn.createStatement();
    sql="select * from media where mdaid='"+request.getParameter("album_id")+"' and type='p'";
    ResultSet rs_photos=stph.executeQuery(sql);

    Statement stv=conn.createStatement();
    sql="select * from media where mdaid='"+request.getParameter("album_id")+"' and type='v'";
    ResultSet rs_videos=stv.executeQuery(sql);

    Statement sta=conn.createStatement();
    sql="select * from media_album where mdaid='"+request.getParameter("album_id")+"'";
    ResultSet rs_album=sta.executeQuery(sql);

    String friends=null;
            String[] fra=null;
            boolean isfriend=false;
            if (session.getAttribute("friends")!=null && session.getAttribute("friends")!="") {
                friends=session.getAttribute("friends").toString();
            }
          if(friends!=null && friends!="")
              {
               fra=friends.split(",");
               isfriend=ArrayUtils.contains(fra,request.getParameter("uid"));
              }

            Statement stpr=conn.createStatement();
           sql="select * from privacy where uid='"+request.getParameter("uid")+"'";
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
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
        <%
            if(rs_album.next())
                {
                    out.print(rs_album.getString("name"));
                }
        %>
         by &nbsp;<%
       if(rs_user.next())
           {
       out.print("<a style='font-size:15px;' class='link' href='view_profile.jsp?uid=" +rs_user.getString("first_name")+" "+rs_user.getString("last_name")+ "'>" +rs_user.getString("first_name")+" "+rs_user.getString("last_name")+ "</a>");
            }
%></div>
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
        <hr>
        Photos
    </div>
   <%
                        if(photos_privacy=="e")
                            {
                    %>
    <div class="media_row">
        <%
           while(rs_photos.next())
               {
        %>
        <a href="view_photo.jsp?album_id=<%out.print(request.getParameter("album_id"));%>&photo_id=<%out.print(rs_photos.getString("mdid"));%>">
        <div class="media_col" style="border:1px solid gainsboro">
            <img alt=""  src="photos/<%out.print(rs_photos.getString("path"));%>" width="145" height="145" style="border:none">
            <div class="media_album_name"><%out.print(rs_photos.getString("name"));%></div>
        </div>
        </a>

        <%
            }
        %>
    </div>
    <%
                            }
                        else
                            {
                                if(isfriend)
                                    {
                    %>
                    <div class="media_row">
        <%
           while(rs_photos.next())
               {
        %>
        <a href="view_photo.jsp?album_id=<%out.print(request.getParameter("album_id"));%>&photo_id=<%out.print(rs_photos.getString("mdid"));%>">
        <div class="media_col" style="border:1px solid gainsboro">
            <img alt=""  src="photos/<%out.print(rs_photos.getString("path"));%>" width="145" height="145" style="border:none">
            <div class="media_album_name"><%out.print(rs_photos.getString("name"));%></div>
        </div>
        </a>

        <%
            }
        %>
    </div>
                     <%
                    }
                            }
                    %>
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
        <hr>
        Videos
    </div>
    <%
                        if(videos_privacy=="e")
                            {
                    %>

    <div class="media_row">
        <%
           while(rs_videos.next())
               {
        %>
        <a href="view_video.jsp?album_id=<%out.print(request.getParameter("album_id"));%>&video_id=<%out.print(rs_videos.getString("mdid"));%>">
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
    <%
                            }
                        else
                            {
                                if(isfriend)
                                    {
                    %>
                    <div class="media_row">
        <%
           while(rs_videos.next())
               {
        %>
        <a href="view_video.jsp?album_id=<%out.print(request.getParameter("album_id"));%>&video_id=<%out.print(rs_videos.getString("mdid"));%>">
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
 <%
                    }
                            }
                    %>
</div>
<%@include file="include/footer.jsp" %>