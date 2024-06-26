<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:300,600">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/jquery.selectric/1.10.1/selectric.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
    <nav class="navbar navbar-dark sticky-top flex-md-nowrap p-0">
        <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">UMT Audit System</a>
        <ul class="navbar-nav px-3">
            <li class="nav-item text-nowrap">
                <a class="nav-link" href="#" id="profileDropdownToggle">Profile</a>
                <div class="profile-dropdown">
                    <ul>
                        <li><a href="viewprofile.jsp">View Profile</a></li>
                        <li><a href="OFInotification.jsp">Notifications</a></li>
                        <li><a href="role.jsp">Log Out</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-sm-12 main sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                <i class="zmdi zmdi-widgets"></i>
                                Dashboard <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="viewFindings.jsp">
                                <i class="zmdi zmdi-layers"></i>
                                Documents
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="profile.jsp">
                                <i class="zmdi zmdi-accounts"></i>
                                Auditor
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="task.jsp">
                                <i class="zmdi zmdi-accounts"></i>
                                Task
                            </a>
                        </li>
                    </ul>

                    <h6 class="sidebar-heading d-flex justify-content-between align-items-center pl-3 mt-4 mb-1 text-muted">
                        <span>Audit</span>
                        <a class="d-flex align-items-center text-muted" href="#">
                            <i class="zmdi zmdi-plus-circle-o"></i>
                        </a>
                    </h6>
                    <ul class="nav flex-column mb-2">
                        <li class="nav-item">
                            <a class="nav-link" href="auditform.jsp">
                                <i class="zmdi zmdi-file-text"></i>
                                New Findings
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ofi.jsp">
                                <i class="zmdi zmdi-file-text"></i>
                                OFI
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ncr.jsp">
                                <i class="zmdi zmdi-file-text"></i>
                                NCR
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 my-3">
                <div class="card-list">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <div class="card text-white bg-primary mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Total Audits</h5>
                                    <p class="card-text">10</p> <!-- Replace with dynamic data -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-white bg-success mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">ISO NCR</h5>
                                    <p class="card-text">5</p> <!-- Replace with dynamic data -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-white bg-info mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Reports</h5>
                                    <p class="card-text">8</p> <!-- Replace with dynamic data -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Task display -->
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">Tasks</div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Task Name</th>
                                                <th>Due Date</th>
                                                <th>Notes</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%  
                                                // Database connection details
                                                String jdbcURL = "jdbc:mysql://localhost:3306/audit"; // Update with your database name
                                                String dbUser = "root"; // Update with your MySQL username
                                                String dbPassword = "admin"; // Update with your MySQL password

                                                Connection connection = null;
                                                Statement statement = null;
                                                ResultSet resultSet = null;

                                                try {
                                                    // Load JDBC driver
                                                    Class.forName("com.mysql.cj.jdbc.Driver");

                                                    // Establish connection
                                                    connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                                                    if (connection != null) {
                                                        // Create statement
                                                        statement = connection.createStatement();
                                                        // Execute query
                                                        String sql = "SELECT taskId, taskName, dueDate, notes, status FROM tasks";
                                                        resultSet = statement.executeQuery(sql);

                                                        // Iterate through result set and display tasks
                                                        while (resultSet.next()) {
                                                            String taskId = resultSet.getString("taskId");
                                                            String taskName = resultSet.getString("taskName");
                                                            Date dueDate = resultSet.getDate("dueDate");
                                                            String notes = resultSet.getString("notes");
                                                            String status = resultSet.getString("status");
                                            %>
                                                            <tr>
                                                                <td><%= taskName %></td>
                                                                <td><%= dueDate %></td>
                                                                <td><%= notes %></td>
                                                                <td><%= status %></td>
                                                                <td>
                                                                    <a href="updateTask.jsp?taskId=<%= taskId %>" class="btn btn-sm btn-primary">Edit</a>
                                                                    <a href="deleteTask.jsp?taskId=<%= taskId %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this task?');">Delete</a>
                                                                </td>
                                                            </tr>
                                            <%
                                                        }
                                                    } else {
                                                        out.println("<tr><td colspan='5'>Failed to establish database connection.</td></tr>");
                                                    }
                                                } catch (SQLException | ClassNotFoundException e) {
                                                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                                                    e.printStackTrace();
                                                } finally {
                                                    // Close resources
                                                    if (resultSet != null) try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
                                                    if (statement != null) try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
                                                    if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- End of task display -->
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="js/dashboard.js"></script>
</body>
</html>
