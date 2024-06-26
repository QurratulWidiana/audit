<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registration Form</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/index-style.css">
</head>

<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Auditor Registration</h2>

                        <form method="post" action="processRegister.jsp" class="register-form" id="register-form">
                            <!-- Name -->
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="uname" id="uname" placeholder="Your Name" required />
                                <!-- Validation message for Name -->
                                <span style="color: red;">
                                    <% String uname = request.getParameter("uname");
                                        if (uname != null) {
                                            if (uname.length() < 5 || uname.length() > 20) {
                                                out.println("Name should be between 5 and 20 characters.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <!-- Email -->
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="uemail" id="uemail" placeholder="Your Email" required />
                                <!-- Validation message for Email -->
                                <span style="color: red;">
                                    <% String uemail = request.getParameter("uemail");
                                        if (uemail != null) {
                                            if (!uemail.matches("\\S+@\\S+\\.\\S+")) {
                                                out.println("Please enter a valid email address.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <!-- Password -->
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="upswd" id="upswd" placeholder="Password" required />
                                <!-- Validation message for Password -->
                                <span style="color: red;">
                                    <% String upswd = request.getParameter("upswd");
                                        if (upswd != null) {
                                            if (upswd.length() < 6) {
                                                out.println("Password should be at least 6 characters.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <!-- Repeat Password -->
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Repeat your password" required />
                                <!-- Validation message for Repeat Password -->
                                <span style="color: red;">
                                    <% String confirmPassword = request.getParameter("confirmPassword");
                                        if (confirmPassword != null) {
                                            String password = request.getParameter("upswd");
                                            if (!confirmPassword.equals(password)) {
                                                out.println("Passwords do not match.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <!-- Mobile Number -->
                            <div class="form-group">
                                <label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="umobile" id="umobile" placeholder="Contact no" required />
                                <!-- Validation message for Mobile Number -->
                                <span style="color: red;">
                                    <% String umobile = request.getParameter("umobile");
                                        if (umobile != null) {
                                            if (umobile.length() != 11 || !umobile.matches("\\d+")) {
                                                out.println("Please enter a valid 11-digit mobile number.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>

                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I
                                    agree all statements in <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure>
                            <img src="images/auditlogo.png" alt="sing up image">
                        </figure>
                        <a href="login.jsp" class="signup-image-link">I am already a member</a>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <!-- Your other scripts -->

</body>

</html>
