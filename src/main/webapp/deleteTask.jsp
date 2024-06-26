<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Get task ID from the request parameter
    String taskId = request.getParameter("id");

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    try {
        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/audit"; // Update with your database name
        String dbUser = "root"; // Update with your MySQL username
        String dbPassword = "admin"; // Update with your MySQL password

        // Establish connection
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        if (connection != null) {
            // SQL query to delete the task
            String sqlQuery = "DELETE FROM tasks WHERE id = ?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, taskId);

            // Execute the delete statement
            int affectedRows = preparedStatement.executeUpdate();

            // Redirect to taskDisplay.jsp after deletion
            if (affectedRows > 0) {
                response.sendRedirect("dashboard.jsp");
            } else {
                out.println("Failed to delete the task.");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
