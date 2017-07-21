<%-- 
    Document   : index
    Created on : Dec 22, 2010, 11:06:32 AM
    Author     : akshar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <script type="text/javascript" src="js/index.js"></script>
         <title>eNetwork</title>
    </head>
    <body>
        <div class="header">
            <h1>
	eNetwork
	</h1>

            </div>
            <div class="row" style="height:380px">
                <div class="col" style="margin-left:40px;margin-top:40px;width:350px">
                    <img src="images/people.png">
                </div>
                <div class="col" style="margin-left:30px;margin-top:30px;min-width:390px;background:#1A77BD;color:white;border:1px solid #1A77BD;-moz-border-radius:10px;border-radius:10px;">
                    <form action="user/login.jsp" method="post" accept-charset="utf-8" name="loginform" onSubmit="return validate_form(this)">
                       <table cellpadding="18">
                       		<tr>
                       			<td>Username</td>
                                        <td>
                                            
                                            
                                            <input 
                                                type="text" name="username" size="20" class="green_textbox" id="username" onblur="validate(this)"
                                                value="<%
                                            if(!(session.getAttribute("username")==null))
                                               {
                                                   out.print(session.getAttribute("username"));
                                                   session.removeAttribute("username");
                                               }
                                            %>"
                                            >
                                        </td>
                       		</tr>
							<tr>
                       			<td>Password</td>
								<td><input type="password" name="password" size="20" class="green_textbox" onblur="validate(this)"></td>
                       		</tr>
							<tr>
                       			<td></td>
								<td>
                                                                    <input type="submit" value="Login" class="green_button">
                                                                    <span id="error"style="margin-left:10px;color:#FF3A13;">
                                                                        
                                                                        <%
                                                                        if(!(session.getAttribute("error")==null))
                                                                            {
                                                                            out.println(session.getAttribute("error"));
                                                                            session.removeAttribute("error");
                                                                            }
                                                                         %>                                                                  
                                                                    </span>
                                                                    
                                                                </td>
                       		</tr>
							<tr>
								<td></td>
								<td style="font-size:10pt;">
                                                                    <a href="user/forgot_password_form.jsp" style="text-decoration:none;color:white">Forgot Password?</a>
                                                                </td>
							</tr>
							<tr>
								<td></td>
								<td>
                                                                    <a href="user/register_form.jsp"><input type="button" value="Register" class="green_button" style="padding:10px 20px 10px 20px"></a></td>
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
