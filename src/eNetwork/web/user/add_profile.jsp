<%@page import="java.sql.*"%>
<script type="text/javascript">
</script>
<%
    String city=request.getParameter("city").trim();
    String hometown=request.getParameter("hometown").trim();
    String languages=request.getParameter("languages").trim();
    String about_me=request.getParameter("about_me").trim();
    String relationship_status=request.getParameter("relationship_status").trim();
    String employer=request.getParameter("employer").trim();
    String college=request.getParameter("college").trim();
    String high_school=request.getParameter("high_school").trim();
    String religion=request.getParameter("religion").trim();
    String activities=request.getParameter("activities").trim();
    String interests=request.getParameter("interests").trim();
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
   String sql="update profile set "
            + "city='"+city+"',"
            + "hometown='"+hometown+"',"
            +"languages='"+languages+"',"
            +"about_me='"+about_me+"',"
            +"relationship_status='"+relationship_status+"',"
            +"employer='"+employer+"',"
            +"college='"+college+"',"
            +"high_school='"+high_school+"',"
            +"religion='"+religion+"',"
            +"activities='"+activities+"',"
            +"interests='"+interests+"'"
            +" where uid='"+session.getAttribute("uid")+"'";
            ;
   st.executeUpdate(sql);
   if(request.getParameter("edir")!=null)
       {
   if(request.getParameter("edit").equals("true"))
       {
        response.sendRedirect("profile.jsp");
       }
   }
   else
       {
           response.sendRedirect("home.jsp");
       }
       
%>
