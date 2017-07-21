<%-- 
    Document   : session
    Created on : Dec 25, 2010, 2:38:40 PM
    Author     : akshar
--%>

<%
    if((session.getAttribute("uid"))==null||(session.getAttribute("uid")==""))
        {
            response.sendRedirect("../index.jsp");
        }
%>