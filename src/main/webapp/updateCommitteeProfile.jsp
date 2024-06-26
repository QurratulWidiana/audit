<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Profile</title>

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
        }

        .update-profile {
            background-color: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
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

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .update-btn {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .update-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="main">
    <div class="update-profile">
        <h2 class="form-title">Update Profile</h2>

        <form method="post" action="processUpdateCommitteeProfile.jsp">
            <div class="form-group">
                <label for="committeename">New Username:</label>
                <input type="text" name="committeename" id="committeename" value="${sessionScope.committeename}" required />
            </div>

            <div class="form-group">
                <label for="committeeEmail">New Email:</label>
                <input type="email" name="committeeEmail" id="committeeEmail" value="${sessionScope.committeeEmail}" required />
            </div>

            <div class="form-group">
                <label for="committeemobile">New Mobile Number:</label>
                <input type="text" name="committeemobile" id="umobile" value="${sessionScope.committeemobile}" required />
            </div>

            <button type="submit" class="update-btn">Update Profile</button>
        </form>
    </div>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>

<!-- Additional scripts or external script files can be added here -->

</body>
</html>
