<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Model.auditform" %>

<%! 
    private List<auditform> auditDataList; // Declare at the top level

    private void initializeAuditDataList() {
        auditDataList = new ArrayList<>();
    }

    private List<auditform> getAllAuditData() {
        initializeAuditDataList(); // Call the initialization method

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/audit";
            String dbUser = "root";
            String dbPassword = "admin";
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            if (connection != null) {
                // SQL query to retrieve all audit data
                String sqlQuery = "SELECT * FROM audit_data";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sqlQuery);

                while (resultSet.next()) {
                    // Create AuditForm objects and add them to the list
                    auditform auditform = new auditform(
                        resultSet.getInt("id"),
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

                    auditDataList.add(auditform);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return auditDataList;
    }
%>

<!-- Add your CSS styles or include external CSS files here -->
<style>
    .audit-box {
        border: 1px solid #ddd;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .approve-button {
        background-color: green;
        color: white;
        margin-right: 5px;
    }

    .ofi-ncr-button {
        background-color: red;
        color: white;
    }
</style>

<html>
<head>
    <title>Findings</title>
    
    <!-- Add JavaScript code for displaying notifications -->
    <script>
        function showNotification() {
            alert("OFI/NCR alert has been sent to the auditor.");
        }
    </script>
</head>
<body>

    <h2>View Findings</h2>

    <!-- Back to Dashboard Button -->
    <form action="dashboardCommittee.jsp" method="get" style="text-align: right; margin-top: -40px; margin-right: 10px;">
        <button type="submit" style="background-color: blue; color: white;">Back to Dashboard</button>
    </form>

    <% List<auditform> auditDataList = getAllAuditData();
       for (auditform auditform : auditDataList) { %>

        <div class="audit-box">
            <h3><%= auditform.getAudit_name() %></h3>
            <p><strong>Audit Type:</strong> <%= auditform.getAudit_type() %></p>
            <p><strong>Audit Department:</strong> <%= auditform.getAudit_department() %></p>
            <p><strong>Start Date:</strong> <%= auditform.getStart_date() %></p>
            <p><strong>End Date:</strong> <%= auditform.getEnd_date() %></p>
            <p><strong>Auditor Name:</strong> <%= auditform.getAuditor_name() %></p>
            <p><strong>Auditor Email:</strong> <%= auditform.getAuditor_email() %></p>
            <p><strong>Auditor ID:</strong> <%= auditform.getAuditor_id() %></p>
            <p><strong>Auditee Name:</strong> <%= auditform.getAuditee_name() %></p>
            <p><strong>Auditee Department:</strong> <%= auditform.getAuditee_department() %></p>
            <p><strong>Findings:</strong> <%= auditform.getFindings() %></p>

            <!-- Form for updating findings -->
             <form action="processApproval.jsp" method="post">
                <input type="hidden" name="id" value="<%= auditform.getId() %>">
                <button type="submit" name="action" value="approve" class="approve-button">Approve</button>
            </form>

            <form action="#" method="post" onsubmit="showNotification()">
                <input type="hidden" name="id" value="<%= auditform.getId() %>">
                <button type="submit" name="action" value="ofi_ncr" class="ofi-ncr-button">OFI/NCR</button>
            </form>
        </div>

    <% } %>

</body>
</html>
