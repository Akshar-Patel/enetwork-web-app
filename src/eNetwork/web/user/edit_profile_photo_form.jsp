<%@include file="include/login_check.jsp"%>
<%title="Edit Profile Photo";%>
<%@include file="include/header.jsp"%>
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
        <form action="edit_profile_photo.jsp" method="post" enctype="multipart/form-data">
            <table cellpadding="18" align="center">
                <tr align="center">
                    <td><%out.print("<img src='" + session.getAttribute("photo") + "' width='128' height='128'>");%></td>
                </tr>
                <tr align="center">
                    <td><input type="file" name="image" id="image" size="21"/></td>
                </tr>
                <tr align="center">
                    <td>
                        <input type="submit" value="Upload" class="green_button"/>
                        <a href="profile.jsp"><input type="button" value="Cancel" class="green_button"/></a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
 <%@include file="include/footer.jsp" %>
