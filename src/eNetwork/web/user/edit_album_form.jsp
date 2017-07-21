<%@include file="include/login_check.jsp" %>
<%title="Edit Album";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");

    Statement sta=conn.createStatement();
    String sql="select * from media_album where mdaid='"+request.getParameter("album_id")+"'";
    ResultSet rs_album=sta.executeQuery(sql);

    Statement stph=conn.createStatement();
    sql="select * from media where mdaid='"+request.getParameter("album_id")+"' and type='p'";
    ResultSet rs_photos=stph.executeQuery(sql);

    Statement stv=conn.createStatement();
    sql="select * from media where mdaid='"+request.getParameter("album_id")+"' and type='v'";
    ResultSet rs_videos=stv.executeQuery(sql);

    String cover=null;
    String name=null;
%>
<div class="row">
     <form name="edit_album_form" action="edit_album.jsp" method="POST">
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">

        <%
        if(rs_album.next())
            {
            out.print("<input type='hidden' value='"+request.getParameter("album_id")+"' name='album_id'>");
          cover=rs_album.getString("cover");
          name=rs_album.getString("name");
        }
%>
    </div>
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
        <hr/>
        Photos
        <span class="link" style="float:right">
            <a href="upload_photos_form.jsp?album_id=<%out.print(request.getParameter("album_id"));%>">Upload Photos</a>
        </span>
    </div>
    <div class="media_row">
        <%
            while(rs_photos.next())
                {
                
        %>
        <div class="media_col" style="border:1px solid gainsboro;height:210px;width:195px;padding-top: 10px;">
           <a href="photo.jsp?album_id=<%out.print(request.getParameter("album_id"));%>&photo_id=<%out.print(rs_photos.getString("mdid"));%>">
            <img alt=""  src="photos/<%out.print(rs_photos.getString("path"));%>" width="128" height="128" style="border:none">
           </a>
            <br>
            <br>
            Name: <input style="border:1px solid gainsboro"type="text" size="15" name="name[]" value="<%out.print(rs_photos.getString("name"));%>">
            <input type="hidden" name="id[]" value="<%out.print(rs_photos.getString("mdid"));%>">
            <%
                    if(rs_photos.getString("mdid").equals(cover))
                        {
                         %>
                         <input type="radio" name="cover" value="<%out.print(rs_photos.getString("mdid"));%>" checked="checked">
                         <%
                        }
                        else
                         {
                         %>
                         <input type="radio" name="cover" value="<%out.print(rs_photos.getString("mdid"));%>">
                         <%
                }
            %>
            This is album cover.
            <br>
            <input type="checkbox" name="delete_id[]" value="<%out.print(rs_photos.getString("mdid"));%>">Delete this photo.
        </div>
        <%
                }
        %>
    </div>
    <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
        <hr>
        Videos
        <span class="link" style="float:right">
            <a href="upload_videos_form.jsp?album_id=<%out.print(request.getParameter("album_id"));%>">Upload Videos</a>
        </span>
    </div>
    <div class="media_row">
        <%
            while(rs_videos.next())
                {

        %>
        <div class="media_col" style="border:1px solid gainsboro;height:150px;width:195px;padding-top: 10px;">

            <%
                out.print("<a href='video.jsp?album_id="+request.getParameter("album_id")+"&video_id="+rs_videos.getString("mdid")+"'><img style='border:none' src='photos/play.png' width='75' height='75'></a>");
            %>
            <br>
            <br>
            Name: <input style="border:1px solid gainsboro"type="text" size="15" name="name[]" value="<%out.print(rs_videos.getString("name"));%>">
            <input type="hidden" name="id[]" value="<%out.print(rs_videos.getString("mdid"));%>">
            
            <br>
            <input type="checkbox" name="delete_id[]" value="<%out.print(rs_videos.getString("mdid"));%>">Delete this video.
        </div>
        <%
                }
        %>
    </div>
    <div class="form_col">
        <br/>
        <span id="error"style="margin-left:21px;color:#FF3A13;"></span>
        
            <table cellpadding="8" align="center">
                        <tr>
                            <td>Album Name</td>
                            <td><input type="text" name="album_name" value="<%out.print(name);%>" size="30" class="green_textbox" onblur="validate(this)"/></td>
                        </tr>
                         <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Save" class="green_button">
                        <a href="album.jsp"><input type="button" name="cancel" value="Cancel" class="green_button"></a>
                    </td>
                </tr>
              </table>
        
</div>
        </form>
</div>
<%@include file="include/footer.jsp" %>