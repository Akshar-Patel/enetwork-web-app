<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="javax.imageio.ImageReader"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.imageio.stream.ImageInputStream"%>
<%@page import="java.sql.*"%>

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
                String contentType = item.getContentType();
                long sizeInBytes = item.getSize();
                if (sizeInBytes > MAX_ALLOWED_SIZE) {

                    session.setAttribute("error", "Maximum file size exceeded!");
                    response.sendRedirect("edit_profile_photo_form.jsp");
                } else if ((!contentType.equals("image/jpeg"))
                        && (!contentType.equals("image/bmp"))
                        && (!contentType.equals("image/gif"))
                        && (!contentType.equals("image/png"))
                        && (!contentType.equals("image/bmp"))) {
                    session.setAttribute("error", "Invalid file!");
                  
                    response.sendRedirect("edit_profile_photo_form.jsp");
                } else {
                    if (item.isFormField()) {
                        //processFormField(item);
                    } else {
                        String fieldName = item.getFieldName();
                        String fileName = (session.getAttribute("uid")).toString();
                        boolean isInMemory = item.isInMemory();
                        java.io.File fullFile = new java.io.File(fileName);
                        java.io.File savedFile = new java.io.File(getServletContext().getRealPath("user/profile_images"),
                                fullFile.getName());
                        item.write(savedFile);
                        String sql = "";
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root", "root");
                        Statement st = conn.createStatement();
                        sql = "update profile set photo=1 where uid=" + session.getAttribute("uid");
                        st.executeUpdate(sql);
                        session.setAttribute("photo", "profile_images/" + session.getAttribute("uid"));
                        response.sendRedirect("profile.jsp");
                    }
                }
            }

%>
