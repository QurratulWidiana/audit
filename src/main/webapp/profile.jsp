<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auditor List</title>

    <style>
        /* Add your existing styles or include external CSS files here */

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ff; /* Light blue background */
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #003366; /* Dark blue text */
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff; /* White background */
            box-shadow: 0 0 10px rgba(0, 51, 102, 0.1); /* Light blue shadow */
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #003366; /* Dark blue header background */
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Style for back-to-dashboard button */
        .back-to-dashboard {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #4CAF50;
            color: #fff;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
        }

        .back-to-dashboard:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h2>Auditor List</h2>

    <!-- Back to Dashboard Button -->
    <a href="dashboard.jsp" class="back-to-dashboard">Back to Dashboard</a>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String jdbcURL = "jdbc:mysql://localhost:3306/audit";
                    String dbUser = "root";
                    String dbPassword = "admin";
                    connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                    if (connection != null) {
                        statement = connection.createStatement();
                        String sqlQuery = "SELECT * FROM users";
                        resultSet = statement.executeQuery(sqlQuery);

                        while (resultSet.next()) {
                            int auditorid = resultSet.getInt("auditorid");
                            String uname = resultSet.getString("uname");
                            String uemail = resultSet.getString("uemail");
                            String umobile = resultSet.getString("umobile");
            %>
            <tr>
                <td><%= auditorid %></td>
                <td><%= uname %></td>
                <td><%= uemail %></td>
                <td><%= umobile %></td>
                <td>
                    <a href="deleteProfile.jsp?auditorid=<%= auditorid %>">Delete</a>
                </td>
            </tr>
            <%
                        }
                    } else {
                        out.println("<tr><td colspan='6'>Error: Database connection is null</td></tr>");
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    // Close the database resources
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<tr><td colspan='6'>Error closing database resources: " + e.getMessage() + "</td></tr>");
                    }
                }
            %>
        </tbody>
    </table>

    <!-- ... your existing HTML content ... -->

</body>
</html>
