<%@include file="include/login_check.jsp" %>
<%title="Video";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement stv=conn.createStatement();
    String sql="select * from media where mdaid='"+request.getParameter("album_id")+"' and mdid='"+request.getParameter("video_id")+"'";
    ResultSet rs_video=stv.executeQuery(sql);
%>
<div class="row">

        <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
            <a class="link" href="view_media.jsp?album_id=<%out.print(request.getParameter("album_id"));%>">Back to album</a>
    </div>
    <div class="media_show">
        <%
            if(rs_video.next())
                {
                    out.print(rs_video.getString("name"));
        %>
        <br><br>

        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0"
width="470" height="320">
<param name="movie"
value="http://localhost:8080/eNetwork/strobe/StrobeMediaPlayback.swf"></param>
<param name="FlashVars"
       value="src=http://localhost:8080/eNetwork/user/videos/<%out.print(rs_video.getString("path"));%>"></param>
<param name="allowFullScreen" value="true"></param>
<param name="allowscriptaccess" value="always"></param>

<embed src="http://localhost:8080/eNetwork/strobe/StrobeMediaPlayback.swf"
type="application/x-shockwave-flash"
allowscriptaccess="always" allowfullscreen="true"
width="470" height="320"
FlashVars="src=http://localhost:8080/eNetwork/user/videos/<%out.print(rs_video.getString("path"));%>">
</embed>
</object>
        <%
            }
        %>
        <br/><br/>
    </div>
</div>
<%@include file="include/footer.jsp" %>