<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.lang.StringUtils" %>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%
    String[] id=request.getParameterValues("id[]");
    String[] name=request.getParameterValues("name[]");
    String cover=request.getParameter("cover");
    String album_name=request.getParameter("album_name");
    String[] delete_id=request.getParameterValues("delete_id[]");
    String sql=null;
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    if(id!=null)
        {
    for(int i=0;i<id.length;i++)
        {
            name[i]=name[i].replace("'", "''");
            sql="update media set name='"+name[i]+"' where mdid='"+id[i]+"'";
            out.println(sql);
            st.executeUpdate(sql);
        }
    }
    
    if(delete_id!=null)
        {
        if(ArrayUtils.contains(delete_id, cover))
        {
            cover="0";
        }
    for(int i=0;i<delete_id.length;i++)
        {
            sql="delete from media where mdid='"+delete_id[i]+"'";
            st.executeUpdate(sql);
        }
    }
    if(cover==null)
        {
            cover="0";
        }
    sql="update media_album set cover='"+cover+"',name='"+album_name+"' where mdaid='"+request.getParameter("album_id")+"'";
    st.executeUpdate(sql);
    response.sendRedirect("media.jsp?album_id="+request.getParameter("album_id"));
%>