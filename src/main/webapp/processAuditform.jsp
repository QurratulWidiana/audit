<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Model.auditform" %>

<%! 
    // Declare variables before using them
    String audit_type, audit_department, audit_name, start_date, end_date;
    String auditor_name, auditor_email, auditor_id, auditee_name, auditee_department, findings;
    String pictureFileName = "";
%>

<%
    // Get values from the request parameters
    audit_type = request.getParameter("audit_type");
    audit_department = request.getParameter("audit_department");
    audit_name = request.getParameter("audit_name");
    start_date = request.getParameter("start_date");
    end_date = request.getParameter("end_date");
    auditor_name = request.getParameter("auditor_name");
    auditor_email = request.getParameter("auditor_email");
    auditor_id = request.getParameter("auditor_id");
    auditee_name = request.getParameter("auditee_name");
    auditee_department = request.getParameter("auditee_department");
    findings = request.getParameter("findings");

    // Handle file upload
    Part filePart = request.getPart("picture");
    String fileName = extractFileName(filePart);
    if (fileName != null && !fileName.isEmpty()) {
        String uploadDir = "uploads";
        String savePath = getServletContext().getRealPath("") + File.separator + uploadDir;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
        pictureFileName = savePath + File.separator + uniqueFileName;
        filePart.write(pictureFileName);
    }
%>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcURL = "jdbc:mysql://localhost:3306/audit";
        String dbUser = "root";
        String dbPassword = "admin";
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        if (connection != null) {
            // SQL query to insert audit data
            String sqlQuery = "INSERT INTO audit_data (audit_type, audit_department, audit_name, start_date, end_date, auditor_name, auditor_email, auditor_id, auditee_name, auditee_department, findings, picture) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sqlQuery);

            // Set values for the parameters
            preparedStatement.setString(1, audit_type);
            preparedStatement.setString(2, audit_department);
            preparedStatement.setString(3, audit_name);
            preparedStatement.setString(4, start_date);
            preparedStatement.setString(5, end_date);
            preparedStatement.setString(6, auditor_name);
            preparedStatement.setString(7, auditor_email);
            preparedStatement.setString(8, auditor_id);
            preparedStatement.setString(9, auditee_name);
            preparedStatement.setString(10, auditee_department);
            preparedStatement.setString(11, findings);
            preparedStatement.setString(12, pictureFileName); // Add the picture file name

            // Execute the insert statement
            int affectedRows = preparedStatement.executeUpdate();

            // Handle the result of the insert statement
            if (affectedRows > 0) {
                // Redirect to dashboard.jsp
                response.sendRedirect("viewFindings.jsp");
            } else {
                out.println("Failed to insert audit data.");
            }
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to extract file name from content-disposition header of file part
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
%>
