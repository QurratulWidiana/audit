<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Retrieve form parameters
    String auditeename = request.getParameter("auditeename");
    String auditeeEmail = request.getParameter("auditeeEmail");
    String auditeemobile = request.getParameter("auditeemobile");

    // Get auditorid from session
    String auditeeid = (String) session.getAttribute("auditeeid");

    // JDBC variables
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
            // SQL query to update user details
            String sqlQuery = "UPDATE auditee SET auditeename=?, auditeeEmail=?, auditeemobile=? WHERE auditeeid=?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, auditeename);
            preparedStatement.setString(2, auditeeEmail);
            preparedStatement.setString(3, auditeemobile);
            preparedStatement.setString(4, auditeeid);

            // Execute the update query
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Update successful
                response.sendRedirect("viewAuditeeProfile.jsp");
            } else {
                // No rows affected (update failed)
                response.sendRedirect("updateAuditeeProfile.jsp?error=1");
            }
        } else {
            // Log an error if the connection is null
            System.out.println("Error: Database connection is null");
            response.sendRedirect("updateAuditeeProfile.jsp?error=2");
        }

    } catch (SQLException e) {
        // Handle SQL-related exceptions
        e.printStackTrace();
        response.sendRedirect("updateAuditeeProfile.jsp?error=2");

    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();
        response.sendRedirect("updateAuditeeProfile.jsp?error=2");

    } finally {
        // Close the database resources
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
