<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User</title>
</head>
<body>

    <h2>Delete User</h2>

<%
    String userIdToDelete = request.getParameter("id");

    // Check if userIdToDelete is not null and is a valid integer
    if (userIdToDelete != null) {
        Connection connection = null; // Declare the connection variable here

        try {
            int id = Integer.parseInt(userIdToDelete);

            // Database connection (reuse the existing connection code)
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/audit";
            String dbUser = "root";
            String dbPassword = "admin";
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Delete user from the database
            String deleteQuery = "DELETE FROM committee WHERE committeeid = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                preparedStatement.setInt(1, id); // Use 'id' instead of 'auditeeid'
                preparedStatement.executeUpdate();
            }

            // Redirect back to auditeeProfile.jsp after deletion
            response.sendRedirect("committeeProfile.jsp");
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
        out.println("Invalid user ID.");
    }
%>

</body>
</html>
