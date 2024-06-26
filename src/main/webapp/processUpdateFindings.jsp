<%@ page import="java.sql.*" %>

<%
    String auditId = request.getParameter("auditId");
    String auditType = request.getParameter("auditType");
    String auditDepartment = request.getParameter("auditDepartment");
    String auditName = request.getParameter("auditName");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String auditorName = request.getParameter("auditorName");
    String auditorEmail = request.getParameter("auditorEmail");
    String auditorId = request.getParameter("auditorId");
    String auditeeName = request.getParameter("auditeeName");
    String auditeeDepartment = request.getParameter("auditeeDepartment");
    String newFindings = request.getParameter("findings");

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
            // SQL query to update audit details
            String sqlQuery = "UPDATE audit_data SET " +
                    "audit_type = COALESCE(?, audit_type), " +
                    "audit_department = COALESCE(?, audit_department), " +
                    "audit_name = COALESCE(?, audit_name), " +
                    "start_date = COALESCE(?, start_date), " +
                    "end_date = COALESCE(?, end_date), " +
                    "auditor_name = COALESCE(?, auditor_name), " +
                    "auditor_email = COALESCE(?, auditor_email), " +
                    "auditor_id = COALESCE(?, auditor_id), " +
                    "auditee_name = COALESCE(?, auditee_name), " +
                    "auditee_department = COALESCE(?, auditee_department), " +
                    "findings = COALESCE(?, findings) " +
                    "WHERE id = ?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            
            // Set parameters, check if each value is not null or empty
            int parameterIndex = 1;
            preparedStatement.setString(parameterIndex++, (auditType != null && !auditType.isEmpty()) ? auditType : null);
            preparedStatement.setString(parameterIndex++, (auditDepartment != null && !auditDepartment.isEmpty()) ? auditDepartment : null);
            preparedStatement.setString(parameterIndex++, (auditName != null && !auditName.isEmpty()) ? auditName : null);
            preparedStatement.setString(parameterIndex++, (startDate != null && !startDate.isEmpty()) ? startDate : null);
            preparedStatement.setString(parameterIndex++, (endDate != null && !endDate.isEmpty()) ? endDate : null);
            preparedStatement.setString(parameterIndex++, (auditorName != null && !auditorName.isEmpty()) ? auditorName : null);
            preparedStatement.setString(parameterIndex++, (auditorEmail != null && !auditorEmail.isEmpty()) ? auditorEmail : null);
            preparedStatement.setString(parameterIndex++, (auditorId != null && !auditorId.isEmpty()) ? auditorId : null);
            preparedStatement.setString(parameterIndex++, (auditeeName != null && !auditeeName.isEmpty()) ? auditeeName : null);
            preparedStatement.setString(parameterIndex++, (auditeeDepartment != null && !auditeeDepartment.isEmpty()) ? auditeeDepartment : null);
            preparedStatement.setString(parameterIndex++, newFindings);
            preparedStatement.setString(parameterIndex++, auditId);
            
            preparedStatement.executeUpdate();
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

    // Redirect back to the ViewFindings.jsp page after updating details
    response.sendRedirect("viewFindings.jsp");
%>
