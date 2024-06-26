<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Findings</title>
</head>
<body>

    <h2>Delete Findings</h2>

<%
    String auditIdToDelete = request.getParameter("auditId");

    // Check if auditIdToDelete is not null and is a valid integer
    if (auditIdToDelete != null) {
        Connection connection = null; // Declare the connection variable here

        try {
            int auditId = Integer.parseInt(auditIdToDelete); // Declare and assign the variable

            // Database connection (reuse the existing connection code)
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/audit";
            String dbUser = "root";
            String dbPassword = "admin";
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Delete audit entry from the database
            String deleteQuery = "DELETE FROM audit_data WHERE id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                preparedStatement.setInt(1, auditId);
                preparedStatement.executeUpdate();
            }

            // Redirect back to dashboard.jsp after deletion
            response.sendRedirect("viewFindings.jsp");
        } catch (NumberFormatException | SQLException | ClassNotFoundException | IOException e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            // Close the database connection in the finally block
            try {
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Error closing database connection: " + e.getMessage());
            }
        }
    } else {
        out.println("Invalid audit ID.");
    }
%>

</body>
</html>
