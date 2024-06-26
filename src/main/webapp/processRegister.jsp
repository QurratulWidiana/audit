<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.Model.users" %>

<%
    // Retrieve form parameters
    String uname = request.getParameter("uname");
    String uemail = request.getParameter("uemail");
    String upswd = request.getParameter("upswd");
    String umobile = request.getParameter("umobile");

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
            // SQL query to insert data into the database
            String sqlQuery = "INSERT INTO users (uname, upswd, uemail, umobile) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sqlQuery);

            // Set values for the parameters
            preparedStatement.setString(1, uname);
            preparedStatement.setString(2, upswd);
            preparedStatement.setString(3, uemail);
            preparedStatement.setString(4, umobile);

            // Execute the insert statement
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                // Registration successful
                response.sendRedirect("login.jsp");
            } else {
                // Log an error if no rows were affected
                out.println("<p>Error: No rows affected</p>");
            }
        } else {
            // Log an error if the connection is null
            out.println("<p>Error: Database connection is null</p>");
        }
    } catch (SQLIntegrityConstraintViolationException e) {
        // Handle duplicate key exception (username or email already exists)
        e.printStackTrace();
        response.sendRedirect("registration.jsp?registrationStatus=alert-danger&registrationMessage=Username or Email already exists. Please try again.");
    } catch (SQLException e) {
        // Handle SQL-related exceptions
        e.printStackTrace();
        response.sendRedirect("registration.jsp?registrationStatus=alert-danger&registrationMessage=SQL Error. Please check server logs for details.");
    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();
        response.sendRedirect("registration.jsp?registrationStatus=alert-danger&registrationMessage=An unexpected error occurred. Please check server logs for details.");
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
