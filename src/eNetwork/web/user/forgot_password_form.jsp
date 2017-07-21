
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/index.css">
        <script type="text/javascript" src="../js/forgot_password.js"></script>
        <title>eNetwork</title>
    </head>
    <body>
        <div class="header">
            <h1>
                <a href="../index.jsp" style="text-decoration: none;color:white">
	eNetwork
                </a>
            </h1>

        </div>
        <div class="row">
            <div class="form_col">
                <br>
                <span id="error"style="margin-left:21px;color:#FF3A13;">
                    <%
                    if(!(session.getAttribute("error")==null))
                    {
                          out.println(session.getAttribute("error"));
                          session.removeAttribute("error");
                    }
                    %>
                </span>
                <form action="forgot_password.jsp" method="post" name="forgot_password_form" onsubmit="return validate_form(this)">
                    <table cellpadding="18" align="center">
                        <tr>
                            <td colspan="2">Your password will be sent to your email.</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input id="email" type="text" name="email" size="30" class="green_textbox" onblur="validate(this)"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" name="send" value="Send" class="green_button">
                                <a href="../index.jsp"><input type="button" name="cancel" value="Cancel" class="green_button"></a>
                            </td>

                        </tr>
                    </table>
                </form>
            </div>
        </div>


        <div class="footer">
            eNetwork&copy;2010
        </div>
    </body>
</html>
