
<%title="Home";%>
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
        <form name="change_password" action="change_password.jsp" method="POST">
            <table cellpadding="8" align="center">
                <tr>
                    <td>Old password:</td>
                    <td><input type="password" name="old_password" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>New password:</td>
                    <td><input type="password" name="new_password"  size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>Confirm password:</td>
                    <td><input type="password" name="confirm_password" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Submit" class="green_button">
                        <a href="edit_account_form.jsp"><input type="button" name="cancel" value="Cancel" class="green_button"></a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<%@include file="include/footer.jsp" %>