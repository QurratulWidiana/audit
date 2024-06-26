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
    String auditoridToDelete = request.getParameter("auditorid");

    // Check if userIdToDelete is not null and is a valid integer
    if (auditoridToDelete != null) {
        Connection connection = null; // Declare the connection variable here

        try {
            int auditorid = Integer.parseInt(auditoridToDelete); // Declare and assign the variable

            // Database connection (reuse the existing connection code)
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/audit";
            String dbUser = "root";
            String dbPassword = "admin";
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Delete user from the database
            String deleteQuery = "DELETE FROM users WHERE auditorid = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                preparedStatement.setInt(1, auditorid);
                preparedStatement.executeUpdate();
            }

            // Redirect back to profile.jsp after deletion
            response.sendRedirect("profile.jsp");
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
