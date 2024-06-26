<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role Selection</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f4f4f4; /* Set background color */
        }

        #logo-container {
            text-align: center;
            margin-bottom: 20px;
        }

        #logo-container img {
            max-width: 100%;
            height: auto;
        }

        #button-container {
            display: flex;
            justify-content: center;
        }

        .role-button {
            padding: 10px 20px;
            margin: 0 10px;
            font-size: 16px;
            cursor: pointer;
            background-color: #63C5DA; /* Dark blue button background */
            color: white;
            border: none;
            border-radius: 5px;
        }

        .role-button:hover {
            background-color: #001f3f;
        }
    </style>
</head>
<body>
    <div id="logo-container">
        <img src="images/auditlogo.png" alt="Audit Logo">
    </div>

    <div id="button-container">
        <button class="role-button" onclick="redirectToRegistration('auditor')">Auditor</button>
        <button class="role-button" onclick="redirectToRegistration('auditee')">Auditee</button>
        <button class="role-button" onclick="redirectToRegistration('committee')">Committee</button>
    </div>

    <script>
        function redirectToRegistration(role) {
            var registrationPage;
            switch (role) {
                case 'auditor':
                    registrationPage = 'registration.jsp';
                    break;
                case 'auditee':
                    registrationPage = 'auditeeRegistration.jsp';
                    break;
                case 'committee':
                    registrationPage = 'committeeRegistration.jsp';
                    break;
                default:
                    registrationPage = 'role.jsp'; // Default to index.jsp
            }
            window.location.href = registrationPage;
        }
    </script>
</body>
</html>
