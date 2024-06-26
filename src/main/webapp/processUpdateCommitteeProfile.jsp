<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Retrieve form parameters
    String committeename = request.getParameter("committeename");
    String committeeEmail = request.getParameter("committeeEmail");
    String committeemobile = request.getParameter("committeemobile");

    // Get committeeid from session
    int committeeid = (int) session.getAttribute("committeeid");

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
            String sqlQuery = "UPDATE committee SET committeename=?, committeeEmail=?, committeemobile=? WHERE committeeid=?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, committeename);
            
            // Handle null or empty email
            if (committeeEmail == null || committeeEmail.trim().isEmpty()) {
                preparedStatement.setNull(2, Types.VARCHAR);
            } else {
                preparedStatement.setString(2, committeeEmail);
            }
            
            preparedStatement.setString(3, committeemobile);
            preparedStatement.setInt(4, committeeid);

            // Debug information
            System.out.println("SQL Query: " + sqlQuery);
            System.out.println("Committee ID: " + committeeid);
            System.out.println("Committee Name: " + committeename);
            System.out.println("Committee Email: " + committeeEmail);
            System.out.println("Committee Mobile: " + committeemobile);

            // Execute the update query
            int rowsAffected = preparedStatement.executeUpdate();

            System.out.println("Rows Affected: " + rowsAffected);

            if (rowsAffected > 0) {
                // Update successful
                response.sendRedirect("viewCommitteeProfile.jsp");
            } else {
                // No rows affected (update failed)
                response.sendRedirect("updateCommitteeProfile.jsp?error=1");
            }
        } else {
            // Log an error if the connection is null
            System.out.println("Error: Database connection is null");
            response.sendRedirect("updateCommitteeProfile.jsp?error=2");
        }

    } catch (SQLException e) {
        // Handle SQL-related exceptions
        e.printStackTrace();
        response.sendRedirect("updateCommitteeProfile.jsp?error=2");

    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();
        response.sendRedirect("updateCommitteeProfile.jsp?error=2");

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
