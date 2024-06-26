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
                        <h2 class="form-title">Committee Registration</h2>

                        <form method="post" action="processCommitteeRegister.jsp" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="committeename" id="committeename" placeholder="Your Name" />
                                <span style="color: red;">
                                    <% String committeename = request.getParameter("committeename");
                                        if (committeename != null) {
                                            if (committeename.length() < 5 || committeename.length() > 20) {
                                                out.println("Name should be between 5 and 20 characters.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="committeeEmail" id="committeeEmail" placeholder="Your Email" />
                                <span style="color: red;">
                                    <% String committeeEmail = request.getParameter("committeeEmail");
                                        if (committeeEmail != null) {
                                            if (!committeeEmail.matches("\\S+@\\S+\\.\\S+")) {
                                                out.println("Please enter a valid email address.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="committeepswd" id="committeepswd" placeholder="Password" required/>
                                <span style="color: red;">
                                    <% String committeepswd = request.getParameter("committeepswd");
                                        if (committeepswd != null) {
                                            if (committeepswd.length() < 6) {
                                                out.println("Password should be at least 6 characters.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="committeepswd" id="committeepswd" placeholder="Repeat your password" required />
                                <span style="color: red;">
                                    <% String confirmPassword = request.getParameter("confirmPassword");
                                        if (confirmPassword != null) {
                                            String password = request.getParameter("committeepswd");
                                            if (!confirmPassword.equals(password)) {
                                                out.println("Passwords do not match.");
                                            }
                                        }
                                    %>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="committeemobile" id="committeemobile" placeholder="Contact no" required/>
                                <span style="color: red;">
                                    <% String committeemobile = request.getParameter("committeemobile");
                                        if (committeemobile != null) {
                                            if (committeemobile.length() != 11 || !committeemobile.matches("\\d+")) {
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
                        <a href="committeeLogin.jsp" class="signup-image-link">I am already a member</a>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    
     
</body>

</html>
