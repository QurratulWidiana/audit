<%@ page import="java.sql.*" %>
<%@ page import="com.Model.auditform" %>

<%
    String auditId = request.getParameter("auditId");

    // Retrieve existing audit details from the database
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    String existingAuditType = "";
    String existingAuditDepartment = "";
    String existingAuditName = "";
    String existingStartDate = "";
    String existingEndDate = "";
    String existingAuditorName = "";
    String existingAuditorEmail = "";
    String existingAuditorId = "";
    String existingAuditeeName = "";
    String existingAuditeeDepartment = "";
    String existingFindings = "";

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcURL = "jdbc:mysql://localhost:3306/audit";
        String dbUser = "root";
        String dbPassword = "admin";
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        if (connection != null) {
            // SQL query to retrieve existing audit details
            String sqlQuery = "SELECT * FROM audit_data WHERE id = ?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, auditId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                existingAuditType = resultSet.getString("audit_type");
                existingAuditDepartment = resultSet.getString("audit_department");
                existingAuditName = resultSet.getString("audit_name");
                existingStartDate = resultSet.getString("start_date");
                existingEndDate = resultSet.getString("end_date");
                existingAuditorName = resultSet.getString("auditor_name");
                existingAuditorEmail = resultSet.getString("auditor_email");
                existingAuditorId = resultSet.getString("auditor_id");
                existingAuditeeName = resultSet.getString("auditee_name");
                existingAuditeeDepartment = resultSet.getString("auditee_department");
                existingFindings = resultSet.getString("findings");
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
%>

<html>
<head>
    <title>Update Findings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            height: 100px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <h2>Update Findings</h2>

    <form action="processUpdateFindings.jsp" method="post">
        <%-- Get the audit ID from the request parameter --%>
        <input type="hidden" name="auditId" value="<%= auditId %>">

        <label for="auditType">Audit Type:</label>
        <input type="text" name="auditType" value="<%= existingAuditType %>" required>

        <label for="auditDepartment">Audit Department:</label>
        <input type="text" name="auditDepartment" value="<%= existingAuditDepartment %>" required>

        <label for="auditName">Audit Name:</label>
        <input type="text" name="auditName" value="<%= existingAuditName %>" required>

        <label for="startDate">Start Date:</label>
        <input type="text" name="startDate" value="<%= existingStartDate %>" required>

        <label for="endDate">End Date:</label>
        <input type="text" name="endDate" value="<%= existingEndDate %>" required>

        <label for="auditorName">Auditor Name:</label>
        <input type="text" name="auditorName" value="<%= existingAuditorName %>" required>

        <label for="auditorEmail">Auditor Email:</label>
        <input type="text" name="auditorEmail" value="<%= existingAuditorEmail %>" required>

        <label for="auditorId">Auditor ID:</label>
        <input type="text" name="auditorId" value="<%= existingAuditorId %>" required>

        <label for="auditeeName">Auditee Name:</label>
        <input type="text" name="auditeeName" value="<%= existingAuditeeName %>" required>

        <label for="auditeeDepartment">Auditee Department:</label>
        <input type="text" name="auditeeDepartment" value="<%= existingAuditeeDepartment %>" required>

        <label for="findings">Findings:</label>
        <textarea name="findings" rows="4" cols="50"><%= existingFindings %></textarea>

        <button type="submit">Update Audit Details</button>
    </form>

</body>
</html>
