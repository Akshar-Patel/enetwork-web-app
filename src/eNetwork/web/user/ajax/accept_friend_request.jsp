<%@page import="java.sql.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();

    String friends1=null;
    if(session.getAttribute("friends")!=null && (!session.getAttribute("friends").equals("")))
        {
            friends1=session.getAttribute("friends").toString().replace(",", ":");
            friends1=friends1+":"+request.getParameter("uid");
        }
    else
        {
           friends1=request.getParameter("uid");
        }
    
    Statement stf=conn.createStatement();
    String sql="select frids from friendship where uid='"+request.getParameter("uid")+"'";
    String friends2=null;
    ResultSet rsf=stf.executeQuery(sql);
    if(rsf.next())
        {
            if(rsf.getString("frids")!=null && (!rsf.getString("frids").equals("")))
                {
            friends2=rsf.getString("frids");
            friends2=friends2+":"+session.getAttribute("uid");
            }
                else
                    {
              friends2=session.getAttribute("uid").toString();
                }
        }

    session.setAttribute("friends", friends1.replace(":", ","));
    sql="update friendship set frids='"+friends1+"' where uid='"+session.getAttribute("uid")+"'";
    st.executeUpdate(sql);

    sql="update friendship set frids='"+friends2+"' where uid='"+request.getParameter("uid")+"'";
    st.executeUpdate(sql);

    sql="delete from friend_request where uid_to='"+session.getAttribute("uid")+"' and uid_from='"+request.getParameter("uid")+"'";
    st.executeUpdate(sql);
%>