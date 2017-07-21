<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="javax.imageio.ImageReader"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.imageio.stream.ImageInputStream"%>
<%@page import="java.sql.*"%>
<%@page import="java.nio.channels.*"%>
<%
    final int MAX_ALLOWED_SIZE = 4194304; // 4 MB
    final int MAX_ALLOWED_WIDTH = 1024;
    final int MAX_ALLOWED_HEIGHT = 768;

    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    // Create a factory for disk-based file items
    FileItemFactory factory = new DiskFileItemFactory();

    // Create a new file upload handler
    ServletFileUpload upload = new ServletFileUpload(factory);

    // Parse the request
    java.util.List /* FileItem */ items = upload.parseRequest(request);
 
    // Process the uploaded items
    java.util.Iterator iter = items.iterator();
    while (iter.hasNext()) {
        FileItem item = (FileItem) iter.next();

        if (item.isFormField()) {
            //processFormField(item);
        } else {
             String fieldName = item.getFieldName();
                String fileName = (session.getAttribute("uid")).toString();
                out.print(fileName);
                String contentType = item.getContentType();
                boolean isInMemory = item.isInMemory();
                long sizeInBytes = item.getSize();

                java.io.File fullFile  = new java.io.File(fileName);
                java.io.File savedFile = new java.io.File(getServletContext().getRealPath("user/profile_images"),
                fullFile.getName());
                item.write(savedFile);

                if(sizeInBytes > MAX_ALLOWED_SIZE){
                    savedFile.delete();
                    session.setAttribute("error", MAX_ALLOWED_SIZE+"Maxi file size exceeded!"+sizeInBytes);
                    response.sendRedirect("profile_photo_upload_form.jsp");

                }
                else if(
                        (!contentType.equals("image/jpeg"))&&
                        (!contentType.equals("image/bmp"))&&
                        (!contentType.equals("image/gif"))&&
                        (!contentType.equals("image/png"))&&
                        (!contentType.equals("image/bmp"))
                        )
                        {
                            savedFile.delete();
                            session.setAttribute("error", "Invalid file!");
                            response.sendRedirect("profile_photo_upload_form.jsp");
                        }
               else{
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
                    Statement st=conn.createStatement();
                    String sql="update profile set photo=1 where uid="+session.getAttribute("uid");
                    st.executeUpdate(sql);
                    Statement stph=conn.createStatement();
                    String sqlp="select photo from profile where uid="+session.getAttribute("uid");
                    ResultSet rs_photo=stph.executeQuery(sqlp);
                    if(rs_photo.next())
                        {
                            if(rs_photo.getString("photo").equals("0"))
                                {
                                    if(session.getAttribute("gender").equals("Male"))
                                    {
                                        session.setAttribute("photo","profile_images/male.png");
                                    }
                                    else
                                        {
                                        session.setAttribute("photo","profile_images/female.png");
                                    }
                                }
                            else
                                        {
                                            session.setAttribute("photo","profile_images/"+session.getAttribute("uid"));
                                        }

                        }
                    response.sendRedirect("add_profile_form.jsp");
                }
        }
    }

%>