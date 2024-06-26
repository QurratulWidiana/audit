<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
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

        input {
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

    <h2>Edit User</h2>

    <form action="updateRegister.jsp" method="post">
        <% 
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                String jdbcURL = "jdbc:mysql://localhost:3306/auditlogin";
                String dbUser = "root";
                String dbPassword = "admin";
                connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                if (connection != null) {
                    int userId = Integer.parseInt(request.getParameter("id"));
                    String sqlQuery = "SELECT * FROM users WHERE id = " + userId;
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery(sqlQuery);

                    if (resultSet.next()) {
                        String uname = resultSet.getString("uname");
                        String uemail = resultSet.getString("uemail");
                        String upswd = resultSet.getString("upswd");
                        String umobile = resultSet.getString("umobile");

                        %>
                        <label for="uname">Name:</label>
                        <input type="text" id="uname" name="uname" value="<%= uname %>" required>

                        <label for="uemail">Email:</label>
                        <input type="email" id="uemail" name="uemail" value="<%= uemail %>" required>

                        <label for="upswd">Password:</label>
                        <input type="password" id="upswd" name="upswd" value="<%= upswd %>" required>

                        <label for="umobile">Contact:</label>
                        <input type="text" id="umobile" name="umobile" value="<%= umobile %>" required>

                        <input type="hidden" name="id" value="<%= userId %>">

                        <button type="submit">Update User</button>
                        <%
                    } else {
                        out.println("<p>Error: User not found</p>");
                    }
                } else {
                    out.println("<p>Error: Database connection is null</p>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                // Close the database resources
                try {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<p>Error closing database resources: " + e.getMessage() + "</p>");
                }
            }
        %>
    </form>

    <!-- Add your HTML content or include external scripts if needed -->

</body>
</html>
