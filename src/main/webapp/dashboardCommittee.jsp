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
                            <li><a href="viewCommitteeProfile.jsp">View Profile</a></li>
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
                                <a class="nav-link" href="manageReport.jsp">
                                    <i class="zmdi zmdi-chart"></i>
                                    Reports
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="zmdi zmdi-layers"></i>
                                    Documents
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="committeeProfile.jsp">
                                    <i class="zmdi zmdi-accounts"></i>
                                    Committee
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
                                <a class="nav-link" href="viewAuditform.jsp">
                                    <i class="zmdi zmdi-file-text"></i>
                                    Findings
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
                        <div class="row">
                            <div class="col-12 col-md-6 col-lg-4 col-xl-3 mb-4">
                                <div class="card blue">
                                    <div class="title">Total Audit</div>

                                    <div class="value">53</div>
                                    
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-4 col-xl-3 mb-4">
                                <div class="card green">
                                    <div class="title">Complete Audit</div>

                                    <div class="value">27</div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-4 col-xl-3 mb-4">
                                <div class="card orange">
                                    <div class="title">Pending Audit</div>

                                    <div class="value">15</div>
                                    
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-4 col-xl-3 mb-4">
                                <div class="card red">
                                    <div class="title">Non-Conformance</div>

                                    <div class="value">3</div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    </div>

            </div>

        </div>
    </div>
</div>
</main>
</div>
</div>

<script src="js/dashboard.js"></script>

</body>

</html>      