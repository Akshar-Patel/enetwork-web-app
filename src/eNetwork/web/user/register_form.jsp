
<%-- 
    Document   : register
    Created on : Dec 25, 2010, 3:07:52 PM
    Author     : akshar

    pending:

    terms and conditions
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/index.css">
        <script type="text/javascript" src="../js/register.js"></script>
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
                <br/>
                 <span id="error"style="margin-left:21px;color:#FF3A13;"></span>
            
                <form action="register.jsp" method="post" name="register_form" onsubmit="return validate_form(this)">

                    <table cellpadding="18" align="center">
                        <tr>
                            <td>First Name</td>
                            <td><input type="text" name="first_name" value="" size="30" class="green_textbox" onblur="validate(this)"/></td>
            
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td><input type="text" name="last_name" value="" size="30" class="green_textbox" onblur="validate(this)"/></td>
                        </tr>
                        <tr>
                            <td>Username</td>
                            <td><input id="username" type="text" name="username" size="30" class="green_textbox" onblur="validate(this);check_username()"></td>
                        </tr>
                        <tr>
                            <td>Choose Password</td>
                            <td><input type="password" name="password" size="30" class="green_textbox" onblur="validate(this)"></td>
                        </tr>
                        <tr>
                            <td>Confirm Password</td>
                            <td><input type="password" name="confirm_password" size="30" class="green_textbox" onblur="validate(this)"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input id="email" type="text" name="email" size="30" class="green_textbox" onblur="validate(this);check_email()"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>
                                <input type="radio" name="gender" value="Male" checked="checked" onblur="validate(this)"/>Male
                                <input type="radio" name="gender" value="Female" />Female
                         
                            </td>
                        </tr>
                        <tr>
                            <td>Birthday</td>
                            <td>

                                Month:
                                <select name="birthday_month" id="birthday_month" class="green_textbox">
                                    <option value="01">Jan</option>
                                    <option value="02">Feb</option>
                                    <option value="03">Mar</option>
                                    <option value="04">Apr</option>
                                    <option value="05">May</option>
                                    <option value="06">Jun</option>
                                    <option value="07">Jul</option>
                                    <option value="08">Aug</option>
                                    <option value="09">Sep</option>
                                    <option value="10">Oct</option>
                                    <option value="11">Nov</option>
                                    <option value="12">Dec</option>
                                </select>


                                Day:
                                <select name="birthday_day" id="birthday_day" class="green_textbox">
                                    <%
                                                for (int i = 1; i <= 31; i++) {
                                                    out.print("<option>" + i + "</option>");
                                                }
                                    %>
                                </select>
                                Year:
                                <select name="birthday_year" id="birthday_year" class="green_textbox">
                                    <%
                                                for (int i = 2010; i >= 1900; i--) {
                                                    out.print("<option>" + i + "</option>");
                                                }
                                              
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="checkbox" name="tc">I accept terms and conditions.
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" name="register" value="Register" class="green_button">
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
