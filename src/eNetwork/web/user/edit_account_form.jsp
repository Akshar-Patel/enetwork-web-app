<%@include file="include/login_check.jsp" %>
<%title="Edit Account";%>
<%@include file="include/header.jsp" %>
<%@page import="java.sql.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
            Statement stu = conn.createStatement();
            Statement stp = conn.createStatement();
            String sql = "select * from user where uid='" + session.getAttribute("uid") + "'";
            ResultSet rs_user = stu.executeQuery(sql);

            String []date=null;
            String first_name=null;
            String last_name=null;
            String email=null;
            String gender=null;
            if(rs_user.next())
                {
                    first_name=rs_user.getString("first_name");
                    last_name=rs_user.getString("last_name");
                    email=rs_user.getString("email");
                    gender=rs_user.getString("gender");
                    date=rs_user.getString("birthday").split("-");
       
               }
%>
<div class="row">
    <div class="form_col">
        <br/>
        <span id="error"style="margin-left:21px;color:#FF3A13;"></span>
        <form name="edit_account" action="edit_account.jsp" method="POST">
            <table cellpadding="8" align="center">
                <tr>
                    <td>First Name:</td>
                    <td><input type="text" name="first_name" value="<%out.print(first_name);%>" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><input type="text" name="last_name" value="<%out.print(last_name);%>" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" value="<%out.print(email);%>" size="30" class="green_textbox"/></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        
                        <input type="radio" name="gender" value="Male" <%if(gender.equals("Male"))out.print("checked='checked'");%>>
                        Male
                        <input type="radio" name="gender" value="Female" <%if(gender.equals("Female"))out.print("checked='checked'");%>>
                        Female
                    </td>
                </tr>
                <tr>
                    <td>Birthday:</td>
                    <td>
                        Month:
                                <select name="month" id="birthday_month" class="green_textbox">
                                    <option <%if(date[1].equals("01"))out.print("selected");%> value="01">Jan</option>
                                    <option <%if(date[1].equals("02"))out.print("selected");%> value="02">Feb</option>
                                    <option <%if(date[1].equals("03"))out.print("selected");%> value="03">Mar</option>
                                    <option <%if(date[1].equals("04"))out.print("selected");%> value="04">Apr</option>
                                    <option <%if(date[1].equals("05"))out.print("selected");%> value="05">May</option>
                                    <option <%if(date[1].equals("06"))out.print("selected");%> value="06">Jun</option>
                                    <option <%if(date[1].equals("07"))out.print("selected");%> value="07">Jul</option>
                                    <option <%if(date[1].equals("08"))out.print("selected");%> value="08">Aug</option>
                                    <option <%if(date[1].equals("09"))out.print("selected");%> value="09">Sep</option>
                                    <option <%if(date[1].equals("10"))out.print("selected");%> value="10">Oct</option>
                                    <option <%if(date[1].equals("11"))out.print("selected");%> value="11">Nov</option>
                                    <option <%if(date[1].equals("12"))out.print("selected");%> value="12">Dec</option>
                                </select>


                                Day:
                                <select name="day" id="birthday_day" class="green_textbox">
                                    <%
                                                for (int i = 1; i <= 31; i++) {
                                                    String ii=Integer.toString(i);
                                                    if(date[2].equals(ii))
                                                        {
                                                            out.print("<option selected>" + i + "</option>");
                                                        }
                                                    else
                                                    {
                                                    out.print("<option>" + i + "</option>");
                                                    }
                                                }
                                    %>
                                </select>
                                Year:
                                <select name="year" id="birthday_year" class="green_textbox">
                                    <%
                                                for (int i = 2010; i >= 1900; i--) {
                                                    String ii=Integer.toString(i);
                                                    if(date[0].equals(ii))
                                                    {
                                                        out.print("<option selected>" + i + "</option>");
                                                    }
                                                    else
                                                        {
                                                    out.print("<option>" + i + "</option>");
                                                    }
                                                }
                                              
                                    %>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="change_password_form.jsp"><input class="round_button" type="button" value="Change Password"></a>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Submit" class="green_button">
                        <a href="home.jsp"><input type="button" name="cancel" value="Cancel" class="green_button"></a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<%@include file="include/footer.jsp" %>