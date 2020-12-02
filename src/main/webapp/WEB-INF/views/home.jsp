
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Dental prosthetic</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="../images/favicon.png"/>">
    <!-- Pignose Calender -->
    <link href="<c:url value="../plugins/pg-calendar/css/pignose.calendar.min.css"/>" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="<c:url value="../plugins/chartist/css/chartist.min.css"/>">
    <link rel="stylesheet" href="<c:url value="../plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css"/>">
    <!-- Custom Stylesheet -->
    <link href="<c:url value="../css/style.css"/>" rel="stylesheet">
</head>
<body>

<!--*******************
    Preloader start
********************-->
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
        </svg>
    </div>
</div>
<!--*******************
    Preloader end
********************-->


<!--**********************************
    Main wrapper start
***********************************-->
<div id="main-wrapper">

    <%@include file="header.jsp" %>


    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">

        <div class="container-fluid mt-3">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="card gradient-1">
                        <div class="card-body">
                            <h3 class="card-title text-white">Wyprodukowanych uzupełnień protetycznych</h3>
                            <div class="d-inline-block">
                                <h2 class="text-white">4565</h2>
                                <p class="text-white mb-0">Jan - March 2019</p>
                            </div>
                            <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card gradient-2">
                        <div class="card-body">
                            <h3 class="card-title text-white">Współpracujące placówki</h3>
                            <div class="d-inline-block">
                                <h2 class="text-white">$ 8541</h2>
                                <p class="text-white mb-0">Jan - March 2019</p>
                            </div>
                            <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card gradient-3">
                        <div class="card-body">
                            <h3 class="card-title text-white">Nowi użytkownicy</h3>
                            <div class="d-inline-block">
                                <h2 class="text-white">4565</h2>
                                <p class="text-white mb-0">Jan - March 2019</p>
                            </div>
                            <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card gradient-4">
                        <div class="card-body">
                            <h3 class="card-title text-white">Zadowoleni pacjenci</h3>
                            <div class="d-inline-block">
                                <h2 class="text-white">99%</h2>
                                <p class="text-white mb-0">Jan - March 2019</p>
                            </div>
                            <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Wykonane prace</h4>
                            <div class="bootstrap-carousel">
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0"
                                            class="active"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100" src="images/big/img5.jpg"
                                                 alt="First slide">
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="images/big/img6.jpg"
                                                 alt="Second slide">
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="images/big/img5.jpg"
                                                 alt="Third slide">
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators"
                                       data-slide="prev"><span class="carousel-control-prev-icon"></span> <span
                                            class="sr-only">Previous</span> </a><a class="carousel-control-next"
                                                                                   href="#carouselExampleIndicators"
                                                                                   data-slide="next"><span
                                        class="carousel-control-next-icon"></span> <span
                                        class="sr-only">Next</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body">
                                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Asperiores repellendus
                                    molestiae exercitationem voluptatem tempora quo dolore nostrum dolor consequuntur
                                    itaque, alias fugit. Architecto rerum animi velit, beatae corrupti quos nam saepe
                                    asperiores aliquid quae culpa ea reiciendis ipsam numquam laborum aperiam. Id
                                    tempore consequuntur velit vitae corporis, aspernatur praesentium ratione!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="card-body">
                                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Asperiores repellendus
                                    molestiae exercitationem voluptatem tempora quo dolore nostrum dolor consequuntur
                                    itaque, alias fugit. Architecto rerum animi velit, beatae corrupti quos nam saepe
                                    asperiores aliquid quae culpa ea reiciendis ipsam numquam laborum aperiam. Id
                                    tempore consequuntur velit vitae corporis, aspernatur praesentium ratione!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 m-b-30">
                <h4 class="d-inline">Cards With Images</h4>
                <p class="text-muted">This is 3 column contents</p>
                <div class="row">
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <img class="img-fluid" src="images/big/img1.jpg" alt="">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text and below as a natural
                                    lead-in to the additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- End Col -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <img class="img-fluid" src="images/big/img2.jpg" alt="">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text and below as a natural
                                    lead-in to the additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- End Col -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <img class="img-fluid" src="images/big/img3.jpg" alt="">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text and below as a natural
                                    lead-in to the additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- End Col -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <img class="img-fluid" src="images/big/img4.jpg" alt="">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text and below as a natural
                                    lead-in to the additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- End Col -->
                </div>
            </div>
        </div>
        <!-- #/ container -->
    </div>
    <!--**********************************
        Content body end
    ***********************************-->

    <%@include file="footer.jsp" %>

</div>
<!--**********************************
    Scripts
***********************************-->

<script src="plugins/common/common.min.js"></script>
<script src="js/custom.min.js"></script>
<script src="js/settings.js"></script>
<script src="js/gleek.js"></script>
<script src="js/styleSwitcher.js"></script>

<!-- Chartjs -->
<script src="plugins/chart.js/Chart.bundle.min.js"></script>
<!-- Circle progress -->
<script src="plugins/circle-progress/circle-progress.min.js"></script>
<!-- Datamap -->
<script src="plugins/d3v3/index.js"></script>
<script src="plugins/topojson/topojson.min.js"></script>
<script src="plugins/datamaps/datamaps.world.min.js"></script>
<!-- Morrisjs -->
<script src="plugins/raphael/raphael.min.js"></script>
<script src="plugins/morris/morris.min.js"></script>
<!-- Pignose Calender -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/pg-calendar/js/pignose.calendar.min.js"></script>
<!-- ChartistJS -->
<script src="plugins/chartist/js/chartist.min.js"></script>
<script src="plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>


<script src="js/dashboard/dashboard-1.js"></script>
</body>
</html>
