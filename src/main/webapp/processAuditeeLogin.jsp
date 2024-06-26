<%@ page import="java.sql.*" %>

<%
    // Retrieve form parameters
    String auditeename = request.getParameter("username");
    String auditeepswd = request.getParameter("password");

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
            out.println("Username: " + auditeename);
            out.println("Password: " + auditeepswd);

            // SQL query to validate user credentials
            String sqlQuery = "SELECT * FROM auditee WHERE BINARY auditeename = ? AND auditeepswd = ?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, auditeename);
            preparedStatement.setString(2, auditeepswd);

            // Debug information
            System.out.println("Executing SQL Query: " + sqlQuery);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Retrieve data from the database
                int auditeeid = resultSet.getInt("auditeeid");
                String auditeeEmail = resultSet.getString("auditeeEmail");
                String auditeemobile = resultSet.getString("auditeemobile");

                // Debug information
                out.println("Auditee ID from DB: " + auditeeid);
                out.println("Email from DB: " + auditeeEmail);
                out.println("Mobile from DB: " + auditeemobile);

                // Store user information in session attributes
                session.setAttribute("auditeeid", auditeeid);
                session.setAttribute("auditeename", auditeename);
                session.setAttribute("auditeeEmail", auditeeEmail);
                session.setAttribute("auditeemobile", auditeemobile);

                // Login successful
                response.sendRedirect("dashboardAuditee.jsp?success=1");
            } else {
                // Invalid login credentials
                response.sendRedirect("auditeeLogin.jsp?error=1");
            }
        } else {
            // Log an error if the connection is null
            System.out.println("Error: Database connection is null");
            response.sendRedirect("auditeeLogin.jsp?error=2");
        }

    } catch (SQLException e) {
        // Handle SQL-related exceptions
        e.printStackTrace();

        // Log the SQL exception details
        System.out.println("SQL Exception: " + e.getMessage());
        System.out.println("SQL State: " + e.getSQLState());
        System.out.println("Vendor Error Code: " + e.getErrorCode());

        response.sendRedirect("auditeeLogin.jsp?error=2");

    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();

        // Log other exception details
        System.out.println("Exception: " + e.getMessage());

        response.sendRedirect("auditeeLogin.jsp?error=2");

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
