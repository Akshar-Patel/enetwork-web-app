<%@include file="include/login_check.jsp" %>
<%title="Create Album";%>
<%@include file="include/header.jsp" %>
<div class="row">
    <div class="form_col">
        <br/>
        <span id="error"style="margin-left:21px;color:#FF3A13;"></span>
        <form name="create_album_form" action="create_album.jsp" method="POST">
            <table cellpadding="8" align="center">
                        <tr>
                            <td>Album Name</td>
                            <td><input type="text" name="album_name" value="" size="30" class="green_textbox" onblur="validate(this)"/></td>
                        </tr>
                         <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Create" class="green_button">
                        <a href="album.jsp"><input type="button" name="cancel" value="Cancel" class="green_button"></a>
                    </td>
                </tr>
              </table>
        </form>
</div>
</div>
<%@include file="include/footer.jsp" %>