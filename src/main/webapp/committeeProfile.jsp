<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Committee List</title>

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

        .back-to-dashboard {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .back-btn {
            background-color: #0d6efd;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .back-btn:hover {
            background-color: #001f3f;
        }
    </style>
</head>
<body>

    <div class="back-to-dashboard">
        <a href="dashboardCommittee.jsp">
            <button class="back-btn">Back to Dashboard</button>
        </a>
    </div>

    <h2>Committee List</h2>

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
                        String sqlQuery = "SELECT * FROM committee";
                        resultSet = statement.executeQuery(sqlQuery);

                        while (resultSet.next()) {
                            int id = resultSet.getInt("committeeid");
                            String committeename = resultSet.getString("committeename");
                            String committeeEmail = resultSet.getString("committeeEmail");
                            String committeemobile = resultSet.getString("committeemobile");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= committeename %></td>
                <td><%= committeeEmail %></td>
                <td><%= committeemobile %></td>
                <td>
                    <a href="deleteCommitteeProfile.jsp?id=<%= id %>">Delete</a>
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
