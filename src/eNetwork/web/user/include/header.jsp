<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%!String title;%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/index.css">
        <link rel="stylesheet" type="text/css" href="../css/home.css">
        <script type="text/javascript" src="../js/home.js"></script>
       
        <title>
            <%
        out.print(title);%></title>
    </head>
    <body>
<div class="header_home"><br>
    <div style="float:left">
        <font size="5px">
            <a href="home.jsp" style="text-decoration: none;color:white">eNetwork</a></font>
    </div>
    <div style="float:left" class="menu">
        <a href="home.jsp"><input id="home" type="button" value="Home" class="green_button"></a>
        <a href="profile.jsp"><input id="profile" type="button" value="Profile" class="green_button"></a>
        <a href="album.jsp"><input type="button" value="Albums" class="green_button"></a>
        <a href="message.jsp"><input type="button" value="Messages" class="green_button"></a>
        <a href="friend.jsp"><input type="button" value="Friends" class="green_button"></a>
    </div>
    <div style="margin-left:10px;margin-top:5px;float:left">
        <form action="search.jsp" method="get" style="width:250px;">
        <input type="text" name="search" class="green_textbox">
        <input type="submit" value="Search" class="round_button">
        </form>
    </div>

    <div style="float:right;margin:10px;font-size: 12px;color:white;">
        <a href="privacy_form.jsp" style="color:white">Privacy</a>
        <a href="edit_account_form.jsp" style="color:white">Settings</a>
        <a href="logout.jsp" style="color:white">Log out</a>
    </div>
   

</div>
