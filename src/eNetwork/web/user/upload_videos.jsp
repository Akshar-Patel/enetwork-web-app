<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="javax.imageio.ImageReader"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.imageio.stream.ImageInputStream"%>
<%@page import="java.sql.*"%>

<%
            final int MAX_ALLOWED_SIZE = 52428800; // 50 MB
            int err=0;
            int suc=0;

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            java.util.List /* FileItem */ items = upload.parseRequest(request);

            // Process the uploaded items
            java.util.Iterator iter = items.iterator();
            out.print(items.size());
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                String contentType = item.getContentType();
                long sizeInBytes = item.getSize();
                if (sizeInBytes > MAX_ALLOWED_SIZE) {
                    err++;
                } else if ((!contentType.equals("video/mp4"))
                        && (!contentType.equals("video/x-flv"))) {
                    err++;
                } else {
                    if (item.isFormField()) {
                        //processFormField(item);
                    } else {
                        String fieldName = item.getFieldName();
                        String fileName = item.getName().replace("'", "''");
                        boolean isInMemory = item.isInMemory();
                        java.io.File fullFile = new java.io.File(fileName);
                        java.io.File savedFile = new java.io.File(getServletContext().getRealPath("user/videos"),
                        fullFile.getName());
                        item.write(savedFile);

                       Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eNetwork", "root","root");
    Statement st=conn.createStatement();
    String sql="insert into media(mdaid,name,path,type) values('"+request.getParameter("album_id")+"','"+fileName+"','"+fileName+"','v')";
    out.print(sql);
    st.executeUpdate(sql);
                        suc++;
                    }
                }
            }
            if(err!=0)
                {
                    session.setAttribute("error",Integer.toString(suc)+" files successfully uploaded."+Integer.toString(err)+" files not uploaded.");
                    response.sendRedirect("upload_videos_form.jsp");
                }
            else
                {
                    response.sendRedirect("media.jsp?album_id="+request.getParameter("album_id"));
                }

%>
