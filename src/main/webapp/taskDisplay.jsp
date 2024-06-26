<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%! 
    // Declare variables
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<%
    try {
        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/audit"; // Update with your database name
        String dbUser = "root"; // Update with your MySQL username
        String dbPassword = "admin"; // Update with your MySQL password

        // Establish connection
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        if (connection != null) {
            // SQL query to retrieve all tasks
            String sqlQuery = "SELECT * FROM tasks";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sqlQuery);
%>
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Task Display</title>
                <!-- Add your CSS styles or include external CSS files here -->
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f0f7ff; /* Light blue background */
                        margin: 0;
                        padding: 0;
                    }
                    h1 {
                        text-align: center;
                    }
                    table {
                        width: 80%;
                        margin: 20px auto;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid #dddddd;
                        text-align: left;
                        padding: 8px;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                    tr:nth-child(even) {
                        background-color: #ffffff;
                    }
                    tr:nth-child(odd) {
                        background-color: #f9f9f9;
                    }
                    .btn {
                        padding: 8px 12px;
                        border: none;
                        cursor: pointer;
                    }
                    .btn-edit {
                        background-color: #4CAF50;
                        color: white;
                    }
                    .btn-delete {
                        background-color: #f44336;
                        color: white;
                    }
                </style>
            </head>
            <body>
                <h1>Task Display</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Task Name</th>
                            <th>Due Date</th>
                            <th>Status</th>
                            <th>Notes</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
<%
            // Iterate through the result set and display task details
            while (resultSet.next()) {
                String taskId = resultSet.getString("id");
                String taskName = resultSet.getString("taskName");
                String dueDate = resultSet.getString("dueDate");
                String status = resultSet.getString("status");
                String notes = resultSet.getString("notes");
%>
                        <tr>
                            <td><%= taskName %></td>
                            <td><%= dueDate %></td>
                            <td><%= status %></td>
                            <td><%= notes %></td>
                            <td>
                                <a href="editTask.jsp?id=<%= taskId %>" class="btn btn-edit">Edit</a>
                                <a href="deleteTask.jsp?id=<%= taskId %>" class="btn btn-delete">Delete</a>
                            </td>
                        </tr>
<%
            }
%>
                    </tbody>
                </table>
            </body>
            </html>
<%
        } else {
            out.println("Failed to establish database connection.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
