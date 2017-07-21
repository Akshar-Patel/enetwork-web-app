<%@page import="java.sql.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement stu = conn.createStatement();
            String sql = "insert into post(uid,text) values(" + session.getAttribute("uid") + ",'" + request.getParameter("share") + "')";
            stu.executeUpdate(sql);

            Statement stps = conn.createStatement();
            sql = "select psid from post where text='" + request.getParameter("share") + "' order by psid desc";
            ResultSet rsps = stps.executeQuery(sql);

%>
<div class="post_col">
    <%
                if (!(session.getAttribute("photo") == null)) {
                    out.print("<img src='profile_images/" + session.getAttribute("uid") + "' width='48' height='48'");
                }
    %>
</div>
<div class="post_col">

    <div class="post_name">
        
        <%
                    out.print("<a href='view_profile.jsp?uid="+session.getAttribute("uid")+"'>"+session.getAttribute("name")+"</a>");
        %>
    </div>
    <div class="post_content">
        <%
                    out.println(request.getParameter("share"));
        %>
    </div>
    <div class="post_options">
        <a class="link" onclick="show_comment_box(this.parentNode.parentNode.parentNode)">Comment</a>
    </div>
</div>
<div class="post_col" style="float:right">

    <input type="button" value="Remove" class="close_button" onclick="remove_post(<%out.print(session.getAttribute("uid"));%>,this.parentNode.parentNode)">

</div>
<div id="comment">

</div>
<div class="comment_row" id="comment_box" style="margin-top:2px;">
    <input type="text" class="blue_textbox" id="comment_text">
    <%
                if (rsps.next()) {


    %>
    <input type="hidden" value="<%out.print(rsps.getString("psid"));%>">
    <%
                }
    %>
    <input type="button" class="round_button" value="Comment" onclick="return insert_comment(this.parentNode.parentNode)">
    <input type="button" onclick="hide_comment_box(this.parentNode.parentNode)" class="close_button" value="X">
</div>


