<%@ page import="java.sql.*" %>

<%
    // Get the ID from the request parameter
    String auditId = request.getParameter("id");

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
            // SQL query to update the approval status in the database
            String sqlQuery = "UPDATE audit_data SET approval_status = 'Approved' WHERE id = ?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1, Integer.parseInt(auditId));
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

    // Redirect back to the main page after processing
    response.sendRedirect("manageReport.jsp");
%>
