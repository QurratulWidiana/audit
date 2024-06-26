<%@ page import="java.sql.*, java.io.*, java.util.UUID, java.text.SimpleDateFormat, java.text.ParseException, java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Task</title>
    <!-- Add your CSS stylesheets or include them from external files if needed -->
    <style>
        /* Add your custom styles here */
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

        form {
            width: 50%;
            margin: 20px auto;
            background-color: #fff; /* White background */
            box-shadow: 0 0 10px rgba(0, 51, 102, 0.1); /* Light blue shadow */
            padding: 20px;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #003366; /* Dark blue text */
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #003366; /* Dark blue button background */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h2>Update Task</h2>

<form action="processUpdateTask.jsp" method="post">
    <% 
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Database connection details
            String jdbcURL = "jdbc:mysql://localhost:3306/audit"; // Update with your database name
            String dbUser = "root"; // Update with your MySQL username
            String dbPassword = "admin"; // Update with your MySQL password

            // Get taskId from request parameter
            String taskId = request.getParameter("taskId");

            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            if (connection != null) {
                // Create statement
                statement = connection.createStatement();

                // Execute query to retrieve task details
                String sql = "SELECT taskName, dueDate, notes, status FROM tasks WHERE taskId = '" + taskId + "'";
                resultSet = statement.executeQuery(sql);

                if (resultSet.next()) {
                    // Retrieve task details from result set
                    String taskName = resultSet.getString("taskName");
                    java.sql.Date dueDate = resultSet.getDate("dueDate");
                    String notes = resultSet.getString("notes");
                    String status = resultSet.getString("status");

                    // Format the date for display in the form
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String formattedDueDate = sdf.format(dueDate);
    %>
                    <label for="taskName">Task Name:</label>
                    <input type="text" id="taskName" name="taskName" value="<%= taskName %>" required>

                    <label for="dueDate">Due Date:</label>
                    <input type="date" id="dueDate" name="dueDate" value="<%= formattedDueDate %>" required>

                    <label for="notes">Notes:</label>
                    <textarea id="notes" name="notes" rows="4" required><%= notes %></textarea>

                    <label for="status">Status:</label>
                    <select id="status" name="status" required>
                        <option value="Pending" <%= status.equals("Pending") ? "selected" : "" %>>Pending</option>
                        <option value="In Progress" <%= status.equals("In Progress") ? "selected" : "" %>>In Progress</option>
                        <option value="Completed" <%= status.equals("Completed") ? "selected" : "" %>>Completed</option>
                    </select>

                    <input type="hidden" name="taskId" value="<%= taskId %>">

                    <button type="submit">Update Task</button>
    <%
                } else {
                    out.println("<p>Error: Task not found</p>");
                }
            } else {
                out.println("<p>Error: Database connection is null</p>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</form>

<!-- Add your HTML content or include external scripts if needed -->

</body>
</html>
