<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>View Profile</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .main {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            flex-direction: column; /* Added to make items stack vertically */
        }

        .profile {
            background-color: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
            margin-bottom: 20px; /* Added margin to separate the profile and buttons */
        }

        .form-title {
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }

        span {
            display: inline-block;
            padding: 10px;
            background-color: #eee;
            border-radius: 4px;
        }

        .update-btn {
            background-color: #0d6efd;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-bottom: 10px; /* Added margin to separate the buttons */
        }

        .update-btn:hover {
            background-color: #001f3f;
        }

        .back-btn {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .back-btn:hover {
            background-color: #a52d3a;
        }
    </style>
</head>
<body>

<div class="main">
    <div class="profile">
        <h2 class="form-title">Auditor Profile</h2>

        <div class="form-group">
            <label for="auditorid">Auditor ID:</label>
            <span>${sessionScope.auditorid}</span>
        </div>

        <div class="form-group">
            <label for="uname">Username:</label>
            <span>${sessionScope.uname}</span>
        </div>

        <div class="form-group">
            <label for="uemail">Email:</label>
            <span>${sessionScope.uemail}</span>
        </div>

        <div class="form-group">
            <label for="umobile">Mobile Number:</label>
            <span>${sessionScope.umobile}</span>
        </div>

        <button class="update-btn" onclick="redirectToUpdate()">Update Profile</button>
    </div>

    <form action="dashboard.jsp" method="get">
        <button type="submit" class="back-btn">Back to Dashboard</button>
    </form>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>

<!-- Additional scripts or external script files can be added here -->

<script>
    function redirectToUpdate() {
        window.location.href = 'updateProfile.jsp';
    }
</script>

</body>
</html>
