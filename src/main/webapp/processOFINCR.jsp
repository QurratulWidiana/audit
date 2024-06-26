<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Model.auditform" %>

<%! 
    private auditform getAuditDataById(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        auditform auditData = null;

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/audit";
            String dbUser = "root";
            String dbPassword = "admin";
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            if (connection != null) {
                // SQL query to retrieve audit data by ID
                String sqlQuery = "SELECT * FROM audit_data WHERE id=?";
                preparedStatement = connection.prepareStatement(sqlQuery);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    // Create an auditform object with the retrieved data
                    auditData = new auditform(
                            resultSet.getString("audit_type"),
                            resultSet.getString("audit_department"),
                            resultSet.getString("audit_name"),
                            resultSet.getString("start_date"),
                            resultSet.getString("end_date"),
                            resultSet.getString("auditor_name"),
                            resultSet.getString("auditor_email"),
                            resultSet.getString("auditor_id"),
                            resultSet.getString("auditee_name"),
                            resultSet.getString("auditee_department"),
                            resultSet.getString("findings")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return auditData;
    }
%>

<html>
<head>
    <title>Process OFI/NCR</title>
</head>
<body>

<%
    // Get the ID from the request parameter
    String auditId = request.getParameter("id");

    if (auditId != null && !auditId.isEmpty()) {
        // Retrieve audit data by ID
        auditform auditData = getAuditDataById(Integer.parseInt(auditId));

        // Display the audit data
        if (auditData != null) {
%>
            <div class="audit-box">
                <h3><%= auditData.getAudit_name() %></h3>
                <p><strong>Audit Type:</strong> <%= auditData.getAudit_type() %></p>
                <p><strong>Audit Department:</strong> <%= auditData.getAudit_department() %></p>
                <p><strong>Start Date:</strong> <%= auditData.getStart_date() %></p>
                <p><strong>End Date:</strong> <%= auditData.getEnd_date() %></p>
                <p><strong>Auditor Name:</strong> <%= auditData.getAuditor_name() %></p>
                <p><strong>Auditor Email:</strong> <%= auditData.getAuditor_email() %></p>
                <p><strong>Auditor ID:</strong> <%= auditData.getAuditor_id() %></p>
                <p><strong>Auditee Name:</strong> <%= auditData.getAuditee_name() %></p>
                <p><strong>Auditee Department:</strong> <%= auditData.getAuditee_department() %></p>
                <p><strong>Findings:</strong> <%= auditData.getFindings() %></p>
            </div>
<%
        } else {
            // Handle the case where no audit data is found for the given ID
            out.println("Audit data not found.");
        }
    } else {
        // Handle the case where no ID parameter is provided
        out.println("No ID parameter provided.");
    }
%>

</body>
</html>
