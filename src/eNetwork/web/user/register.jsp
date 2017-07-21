<%@page import="enetwork.MD5"%>
<%@page import="java.sql.*"%>
<%
    MD5 md5=new MD5();
    String firstName=request.getParameter("first_name").trim();
    String lastName=request.getParameter("last_name").trim();
    String username=request.getParameter("username").trim();
    String password=md5.hash(request.getParameter("password")).trim();
    String email=request.getParameter("email").trim();
    String gender=request.getParameter("gender").trim();
    String month=request.getParameter("birthday_month").trim();
    String day=request.getParameter("birthday_day").trim();
    String year=request.getParameter("birthday_year").trim();

    String birthday=year+"-"+month+"-"+day;

    out.println(firstName);
    out.println(lastName);
    out.println(username);
    out.println(password);
    out.println(gender);
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql="insert into user(username,password,email,first_name,last_name,gender,birthday) "
            + "values('"
            +username+"','"+password+"','"+email+"','"
            +firstName+"','"+lastName+"','"+gender+"','"+birthday
            +"')";
   
    st.executeUpdate(sql);
    sql="select uid,first_name,last_name from user where username='"+username+"'";
    Statement stu=conn.createStatement();
    ResultSet rs_username=stu.executeQuery(sql);
    if(rs_username.next())
        {
            session.setAttribute("uid", rs_username.getInt("uid"));
            session.setAttribute("name",rs_username.getString("first_name")+" "+rs_username.getString("last_name"));
            Statement stp=conn.createStatement();
            String sqli="insert into profile(uid) values("+rs_username.getInt("uid")+")";
            stp.executeUpdate(sqli);
            Statement stf=conn.createStatement();
            sqli="insert into friendship(uid) values("+rs_username.getInt("uid")+")";
            stf.executeUpdate(sqli);
            Statement stpr=conn.createStatement();
            sqli="insert into privacy(uid) values("+rs_username.getInt("uid")+")";
            stpr.executeUpdate(sqli);
        }
    session.setAttribute("username", username);
    out.print(session.getAttribute("uid"));
    response.sendRedirect("profile_photo_upload_form.jsp");
%>