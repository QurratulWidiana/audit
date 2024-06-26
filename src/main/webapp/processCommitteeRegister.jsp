<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.Model.committee" %>

<%
    // Retrieve form parameters
    String committeename = request.getParameter("committeename");
    String committeeEmail = request.getParameter("committeeEmail");
    String committeepswd = request.getParameter("committeepswd");
    String committeemobile = request.getParameter("committeemobile");

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
            String sqlQuery = "INSERT INTO committee (committeename, committeepswd, committeeEmail, committeemobile) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sqlQuery);

            // Set values for the parameters
            preparedStatement.setString(1, committeename);
            preparedStatement.setString(2, committeepswd);
            preparedStatement.setString(3, committeeEmail);
            preparedStatement.setString(4, committeemobile);

            // Execute the insert statement
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                // Registration successful
                response.sendRedirect("committeeLogin.jsp");
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
        response.sendRedirect("committeeRegistration.jsp?registrationStatus=alert-danger&registrationMessage=Username or Email already exists. Please try again.");
    } catch (SQLException e) {
        // Handle SQL-related exceptions
        e.printStackTrace();
        response.sendRedirect("committeeRegistration.jsp?registrationStatus=alert-danger&registrationMessage=SQL Error. Please check server logs for details.");
    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();
        response.sendRedirect("committeeRegistration.jsp?registrationStatus=alert-danger&registrationMessage=An unexpected error occurred. Please check server logs for details.");
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
