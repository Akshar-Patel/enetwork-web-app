<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/index.css">
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
                 <form name="add_profile_form" action="add_profile.jsp" method="POST">
                     <table cellpadding="10" align="center">
                         <tr>
                             <td>City</td>
                             <td><input type="text" name="city" value="" size="30" class="green_textbox"/></td>
                         </tr>
                         <tr>
                             <td>Hometown</td>
                             <td><input type="text" name="hometown" value="" size="30" class="green_textbox"/></td>
                         </tr>
                         <tr>
                             <td>Languages</td>
                             <td><input type="text" name="languages" value="" size="30" class="green_textbox"/></td>
                         </tr>
                         <tr>
                             <td>About me</td>
                             <td>
                                 <textarea cols="34" rows="3" class="green_textbox" name="about_me">

                                 </textarea>
                             </td>
                         </tr>
                          <tr>
                             <td>Relationship Status</td>
                             <td>
                                 <select class="green_textbox" name="relationship_status">
                                     <option>Single</option>
                                     <option>Married</option>
                                 </select>
                             </td>
                         </tr>
                         <tr>
                             <td>Employer</td>
                             <td><input type="text" name="employer" value="" size="30" class="green_textbox"/></td>
                         </tr>
                          <tr>
                             <td>College/University</td>
                             <td><input type="text" name="college" value="" size="30" class="green_textbox"/></td>
                         </tr>
                         <tr>
                             <td>High School</td>
                             <td><input type="text" name="high_school" value="" size="30" class="green_textbox"/></td>
                         </tr>
                         <tr>
                             <td>Religion</td>
                             <td>
                                 <select class="green_textbox" name="religion">
                                     <option>Hindu</option>
                                     <option>Muslim</option>
                                     <option>Sikh</option>
                                 </select>
                             </td>
                         </tr>
                         <tr>
                             <td>Activities</td>
                             <td>
                                 <textarea cols="34" rows="3" class="green_textbox" name="activities">

                                 </textarea>
                             </td>
                         </tr>
                         <tr>
                             <td>Interests</td>
                             <td>
                                 <textarea cols="34" rows="3" class="green_textbox" name="interests">

                                 </textarea>
                             </td>
                         </tr>
                        
                         <tr>
                            <td colspan="2" align="center">
                                <input type="submit" name="submit" value="Submit" class="green_button">
                                
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
