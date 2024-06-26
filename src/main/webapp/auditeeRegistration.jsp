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
                        <h2 class="form-title">Auditee Registration</h2>

                        <form method="post" action="processAuditeeRegister.jsp" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="auditeename" id="auditeename" placeholder="Your Name" />
                                <span style="color: red;">
                                    <% String auditeename = request.getParameter("auditeename");
                                        if (auditeename != null) {
                                            if (auditeename.length() < 5 || auditeename.length() > 20) {
                                                out.println("Name should be between 5 and 20 characters.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="auditeeEmail" id="auditeeEmail" placeholder="Your Email" />
                                <span style="color: red;">
                                    <% String auditeeEmail = request.getParameter("auditeeEmail");
                                        if (auditeeEmail != null) {
                                            if (!auditeeEmail.matches("\\S+@\\S+\\.\\S+")) {
                                                out.println("Please enter a valid email address.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="auditeepswd" id="auditeepswd" placeholder="Password" required/>
                                <span style="color: red;">
                                    <% String auditeepswd = request.getParameter("auditeepswd");
                                        if (auditeepswd != null) {
                                            if (auditeepswd.length() < 6) {
                                                out.println("Password should be at least 6 characters.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="auditeepswd" id="auditeepswd" placeholder="Repeat your password" required />
                                <span style="color: red;">
                                    <% String confirmPassword = request.getParameter("confirmPassword");
                                        if (confirmPassword != null) {
                                            String password = request.getParameter("auditeepswd");
                                            if (!confirmPassword.equals(password)) {
                                                out.println("Passwords do not match.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="auditeemobile" id="auditeemobile" placeholder="Contact no" required/>
                                <span style="color: red;">
                                    <% String auditeemobile = request.getParameter("auditeemobile");
                                        if (auditeemobile != null) {
                                            if (auditeemobile.length() != 11 || !auditeemobile.matches("\\d+")) {
                                                out.println("Please enter a valid 11-digit mobile number.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            

                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
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
                        <a href="auditeeLogin.jsp" class="signup-image-link">I am already a member</a>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    
     
</body>

</html>
