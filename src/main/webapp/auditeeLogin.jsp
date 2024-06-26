<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Form</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="main">

    <!-- Sign in Form -->
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure>
                        <img src="images/auditlogo.png" alt="sign up image">
                    </figure>
                    <a href="auditeeRegistration.jsp" class="signup-image-link">Create an account</a>
                </div>

                <div class="signin-form">
                    <h2 class="form-title">Login</h2>
                    <form method="post" action="processAuditeeLogin.jsp" class="register-form" id="login-form">
                        <div class="form-group">
                            <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label> 
                            <input type="text" name="username" id="username" placeholder="Your Name" required />
                        </div>
                        <div class="form-group">
                            <label for="password"><i class="zmdi zmdi-lock"></i></label> 
                            <input type="password" name="password" id="password" placeholder="Password" required />
                        </div>

                        <div class="form-group">
                            <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" /> 
                            <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                        </div>
                        <div class="form-group form-button">
                            <button type="submit" class="form-submit">Login</button>
                        </div>
                        <!-- Placeholder for error handling -->
                        <% String error = request.getParameter("error");
                            if (error != null) {
                                if (error.equals("1")) { %>
                                    <div class="alert alert-danger mt-3" role="alert">
                                        Invalid login credentials. Please try again.
                                    </div>
                        <%      } else if (error.equals("2")) { %>
                                    <div class="alert alert-danger mt-3" role="alert">
                                        An error occurred. Please try again later.
                                    </div>
                        <%      }
                            } %>

                        <!-- Check for successful login and redirect -->
                        <% String success = request.getParameter("success");
                            if (success != null && success.equals("1")) { %>
                                <script>
                                    // Redirect after a short delay
                                    setTimeout(function () {
                                        window.location.replace("auditeeRegistration.jsp");
                                    }, 2000);
                                </script>
                        <%  } %>
                    </form>
                </div>
            </div>
        </div>
    </section>

</div>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<!-- JavaScript to set the role value when a button is clicked and submit the form -->
  

</body>
</html>
