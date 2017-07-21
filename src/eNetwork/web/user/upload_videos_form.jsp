<%@include file="include/login_check.jsp" %>
<%title="Upload Videos";%>
<%@include file="include/header.jsp" %>
<div class="row">
    <div class="form_col">
        <br/>
        <span id="error"style="margin-left:21px;color:#FF3A13;">
            <%
                        if (!(session.getAttribute("error") == null)) {
                            out.println(session.getAttribute("error"));
                            session.removeAttribute("error");
                        }
            %>
        </span>
            <form action="upload_videos.jsp?album_id=<%out.print(request.getParameter("album_id"));%>" method="post" enctype="multipart/form-data">
            <input type="hidden" value="">
            <table cellpadding="18" align="center">
                <tbody id="video_table">
                <tr align="center" id="video_row">
                    <td><input type="file" name="image" id="video" size="21"/></td>
                </tr>
                <tr align="center">
                    <td>
                        <input type="submit" value="Upload" class="green_button"/>
                        <a href="profile.jsp"><input type="button" value="Cancel" class="green_button"/></a>
                        <input type="button" value="Add Field" class="round_button" onclick="add_field_video()">
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
 <%@include file="include/footer.jsp" %>
