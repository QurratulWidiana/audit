<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Retrieve form parameters
    String uname = request.getParameter("uname");
    String uemail = request.getParameter("uemail");
    String umobile = request.getParameter("umobile");

    // Get auditorid from session
    String auditorid = (String) session.getAttribute("auditorid");

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
            String sqlQuery = "UPDATE users SET uname=?, uemail=?, umobile=? WHERE auditorid=?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, uname);
            preparedStatement.setString(2, uemail);
            preparedStatement.setString(3, umobile);
            preparedStatement.setString(4, auditorid);

            // Execute the update query
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Update successful
                response.sendRedirect("viewprofile.jsp");
            } else {
                // No rows affected (update failed)
                response.sendRedirect("updateProfile.jsp?error=1");
            }
        } else {
            // Log an error if the connection is null
            System.out.println("Error: Database connection is null");
            response.sendRedirect("updateProfile.jsp?error=2");
        }

    } catch (SQLException e) {
        // Handle SQL-related exceptions
        e.printStackTrace();
        response.sendRedirect("updateProfile.jsp?error=2");

    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();
        response.sendRedirect("updateProfile.jsp?error=2");

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
