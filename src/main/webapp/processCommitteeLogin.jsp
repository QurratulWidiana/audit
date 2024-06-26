<%@ page import="java.sql.*" %>

<%
    // Retrieve form parameters
    String committeename = request.getParameter("username");
    String committeepswd = request.getParameter("password");

    // JDBC variables
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcURL = "jdbc:mysql://localhost:3306/audit";
        String dbUser = "root";
        String dbPassword = "admin";
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        if (connection != null) {
            // Debug information
            out.println("Username: " + committeename);
            out.println("Password: " + committeepswd);

            // SQL query to validate user credentials
            String sqlQuery = "SELECT * FROM committee WHERE BINARY committeename = ? AND committeepswd = ?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, committeename);
            preparedStatement.setString(2, committeepswd);

            // Debug information
            System.out.println("Executing SQL Query: " + sqlQuery);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Retrieve data from the database
                int committeeid = resultSet.getInt("committeeid");
                String committeeEmail = resultSet.getString("committeeEmail");
                String committeemobile = resultSet.getString("committeemobile");

                // Debug information
                out.println("Committee ID from DB: " + committeeid);
                out.println("Email from DB: " + committeeEmail);
                out.println("Mobile from DB: " + committeemobile);

                // Store user information in session attributes
                session.setAttribute("committeeid", committeeid);
                session.setAttribute("committeename", committeename);
                session.setAttribute("commiteeEmail", committeeEmail);
                session.setAttribute("committeemobile", committeemobile);

                // Login successful
                response.sendRedirect("dashboardCommittee.jsp?success=1");
            } else {
                // Invalid login credentials
                response.sendRedirect("committeeLogin.jsp?error=1");
            }
        } else {
            // Log an error if the connection is null
            System.out.println("Error: Database connection is null");
            response.sendRedirect("committeeLogin.jsp?error=2");
        }

    } catch (SQLException e) {
        // Handle SQL-related exceptions
        e.printStackTrace();

        // Log the SQL exception details
        System.out.println("SQL Exception: " + e.getMessage());
        System.out.println("SQL State: " + e.getSQLState());
        System.out.println("Vendor Error Code: " + e.getErrorCode());

        response.sendRedirect("committeeLogin.jsp?error=2");

    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();

        // Log other exception details
        System.out.println("Exception: " + e.getMessage());

        response.sendRedirect("committeeLogin.jsp?error=2");

    } finally {
        // Close the database resources
        try {
            if (resultSet != null) {
                resultSet.close();
            }
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
