<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Dashboard</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Pignose Calender -->
    <link href="plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

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

<%@include file="header.jsp" %>

<div class="content-body">

    <sec:authorize access="hasRole('STOMATOLOGIST')">
        <div class="container-fluid mt-3">
            <div class="row">
                <div class="col-lg-6">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5 class="card-title">Twoja placówka</h5>
                            <c:if test="${empty clinic}">
                                <p class="card-text">Nie masz jeszcze przypisanej przychodni</p>
                                <a href="/user/clinic" class="btn mb-1 btn-success">Dodaj przychodnię</a>
                            </c:if>
                            <c:if test="${not empty clinic}">
                                <p class="card-text">${clinic. address} <br/>${clinic.city}</p>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="collg-6">

                </div>

                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Twoi pacjenci</h5>
                            <a href="user/patient" class="btn mb-1 btn-success">Dodaj pacjenta</a>
                            <c:forEach items="${patients}" var="patient">
                                <h4 class="card-title">${patient.firstName} ${patient.lastName}</h4>
                                <p class="text-muted"><code></code>
                                </p>
                                <div class="accordion">
                                    <c:forEach items="${patient.labelsList}" var="label">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="mb-0" data-toggle="collapse" data-target="#collapseOne"
                                                    aria-expanded="true" aria-controls="collapseOne4"><i class="fa"
                                                                                                         aria-hidden="true"></i>${label.date}
                                                </h5>
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordion-three">
                                                <div class="card-body">${label.description}</div>
                                                <a href="/user/order" class="btn mb-1 btn-primary">Zamów nowe
                                                    uzupełnienie
                                                    protetyczne <span class="btn-icon-right"><i
                                                            class="fa fa-shopping-cart"></i></span>

                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </sec:authorize>


    <sec:authorize access="hasRole('TECHNICIAN')">
        <div class="container-fluid mt-3">
            <div class="row">
                <div class="col-lg-6">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5 class="card-title">Twoja pracownia</h5>
                            <c:if test="${empty laboratory}">
                                <p class="card-text">Nie masz jeszcze przypisanej pracowni</p>
                                <a href="/user/laboratory" class="btn mb-1 btn-success">Dodaj pracownię</a>
                            </c:if>
                            <c:if test="${not empty clinic}">
                                <p class="card-text">${clinic. address} <br/>${clinic.city}</p>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Zlecone prace</h4>
                                    <p class="text-muted"><code></code>
                                    </p>
                                    <div class="accordion">
                                        <c:forEach items="${prostheses}" var="prosthesis">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5 class="mb-0" data-toggle="collapse" data-target="#collapseOne4"
                                                        aria-expanded="true"
                                                        aria-controls="collapseOne4"><i class="fa"
                                                                                        aria-hidden="true"></i>${prosthesis.deadline}
                                                    </h5>
                                                </div>
                                                <div id="collapseOne4" class="collapse show"
                                                     data-parent="#accordion-three">
                                                    <div class="card-body">${prosthesis.description}</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </sec:authorize>

</div>

<%@include file="footer.jsp" %>
</body>
</html>
