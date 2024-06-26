<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Task</title>

    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            box-sizing: border-box;
        }
        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }
        .form-container input, 
        .form-container select, 
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #003366;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-container button:hover {
            background-color: #0055a5;
        }
        .form-container span {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h1>Add Task</h1>
    <form action="processTask.jsp" method="post">
        <!-- Task Name -->
        <label for="taskName">Task Name:</label>
        <input type="text" id="taskName" name="taskName" required>
        <!-- Validation message for Task Name -->
        <span>
            <% String taskName = request.getParameter("taskName");
                if (taskName != null) {
                    if (taskName.length() < 3 || taskName.length() > 50) {
                        out.println("Task name should be between 3 and 50 characters.");
                    }
                }
            %>
        </span>

        <!-- Due Date -->
        <label for="dueDate">Due Date:</label>
        <input type="date" id="dueDate" name="dueDate" required>
        <!-- Validation message for Due Date -->
        <span>
            <% String dueDate = request.getParameter("dueDate");
                if (dueDate != null) {
                    if (!dueDate.matches("\\d{4}-\\d{2}-\\d{2}")) {
                        out.println("Please enter a valid date in YYYY-MM-DD format.");
                    }
                }
            %>
        </span>

        <!-- Status -->
        <label for="status">Status:</label>
        <select id="status" name="status" required>
            <option value="Approved">Approved</option>
            <option value="In Progress">In Progress</option>
            <option value="In Review">In Review</option>
        </select>

        <!-- Notes -->
        <label for="notes">Notes:</label>
        <textarea id="notes" name="notes" rows="4" cols="50"></textarea>
        <!-- Validation message for Notes -->
        <span>
            <% String notes = request.getParameter("notes");
                if (notes != null && notes.length() > 500) {
                    out.println("Notes should not exceed 500 characters.");
                }
            %>
        </span>

        <!-- Submit Button -->
        <button type="submit">Add Task</button>
    </form>
</div>

</body>
</html>
