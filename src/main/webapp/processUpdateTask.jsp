<%@ page import="java.sql.*, java.io.*, java.util.UUID, java.text.SimpleDateFormat, java.text.ParseException, java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Retrieve form parameters
    String taskId = request.getParameter("taskId");
    String taskName = request.getParameter("taskName");
    String dueDate = request.getParameter("dueDate");
    String status = request.getParameter("status");
    String notes = request.getParameter("notes");

    // Print parameters for debugging
    out.println("Task ID: " + taskId);
    out.println("Task Name: " + taskName);
    out.println("Due Date: " + dueDate);
    out.println("Status: " + status);
    out.println("Notes: " + notes);

    // Check if taskId is null or empty
    if (taskId == null || taskId.isEmpty()) {
        out.println("<p>Error: Task ID parameter is null or empty</p>");
        // Redirect back to updateTask.jsp or display an error message
        // You can use JavaScript to redirect or provide a link to go back
    } else {
        // Proceed with database update
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Database connection details
            String jdbcURL = "jdbc:mysql://localhost:3306/audit"; // Update with your database name
            String dbUser = "root"; // Update with your MySQL username
            String dbPassword = "admin"; // Update with your MySQL password

            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            if (connection != null) {
                // Convert dueDate to java.sql.Date
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date utilDate = sdf.parse(dueDate);
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

                // SQL query to update task data
                String sqlQuery = "UPDATE tasks SET taskName = ?, dueDate = ?, status = ?, notes = ? WHERE taskId = ?";
                preparedStatement = connection.prepareStatement(sqlQuery);

                // Set values for the parameters
                preparedStatement.setString(1, taskName);
                preparedStatement.setDate(2, sqlDate);
                preparedStatement.setString(3, status);
                preparedStatement.setString(4, notes);
                preparedStatement.setString(5, taskId);

                // Execute the update statement
                int affectedRows = preparedStatement.executeUpdate();

                if (affectedRows > 0) {
                    // Task update successful
                    response.sendRedirect("dashboard.jsp");
                } else {
                    // Log an error if no rows were affected
                    out.println("<p>Error: Failed to update task</p>");
                }
            } else {
                // Log an error if the connection is null
                out.println("<p>Error: Database connection is null</p>");
            }
        } catch (SQLException | ClassNotFoundException | ParseException e) {
            // Handle exceptions
            out.println("<p>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
