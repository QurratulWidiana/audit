<%@ page import="java.sql.*" %>

<%
    // Retrieve form parameters
    String uname = request.getParameter("username");
    String upswd = request.getParameter("password");

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
            out.println("Username: " + uname);
            out.println("Password: " + upswd);

            // SQL query to validate user credentials
            String sqlQuery = "SELECT * FROM users WHERE BINARY uname = ? AND upswd = ?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, uname);
            preparedStatement.setString(2, upswd);

            // Debug information
            System.out.println("Executing SQL Query: " + sqlQuery);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Retrieve data from the database
                String auditorid = resultSet.getString("auditorid");
                String uemail = resultSet.getString("uemail");
                String umobile = resultSet.getString("umobile");

                // Debug information
                out.println("Auditor ID from DB: " + auditorid);
                out.println("Email from DB: " + uemail);
                out.println("Mobile from DB: " + umobile);

                // Store user information in session attributes
                session.setAttribute("auditorid", auditorid);
                session.setAttribute("uname", uname);
                session.setAttribute("uemail", uemail);
                session.setAttribute("umobile", umobile);

                // Login successful
                response.sendRedirect("dashboard.jsp?success=1");
            } else {
                // Invalid login credentials
                response.sendRedirect("login.jsp?error=1");
            }
        } else {
            // Log an error if the connection is null
            System.out.println("Error: Database connection is null");
            response.sendRedirect("login.jsp?error=2");
        }

    } catch (SQLException e) {
        // Handle SQL-related exceptions
        e.printStackTrace();

        // Log the SQL exception details
        System.out.println("SQL Exception: " + e.getMessage());
        System.out.println("SQL State: " + e.getSQLState());
        System.out.println("Vendor Error Code: " + e.getErrorCode());

        response.sendRedirect("login.jsp?error=2");

    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();

        // Log other exception details
        System.out.println("Exception: " + e.getMessage());

        response.sendRedirect("login.jsp?error=2");

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
