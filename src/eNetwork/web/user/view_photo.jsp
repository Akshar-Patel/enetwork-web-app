<%@include file="include/login_check.jsp" %>
<%title="Photo";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement stph=conn.createStatement();
    String sql="select * from media where mdaid='"+request.getParameter("album_id")+"' and mdid='"+request.getParameter("photo_id")+"'";
    ResultSet rs_photo=stph.executeQuery(sql);
%>
<div class="row">

        <div class="media_row" style="margin:10px 20px 0px 20px;width:845px;">
            <a class="link" href="view_media.jsp?album_id=<%out.print(request.getParameter("album_id"));%>">Back to album</a>
    </div>
    <div class="media_show">
        <br><br>
        <%
            if(rs_photo.next())
                {
                    out.print(rs_photo.getString("name"));
        %>
        <br/>
        <br/>

        <img alt="" src="photos/<%out.print(rs_photo.getString("path"));%>" style="max-width:850px;">
        <%
            }
        %>
        <br/><br/>
    </div>
</div>
<%@include file="include/footer.jsp" %>