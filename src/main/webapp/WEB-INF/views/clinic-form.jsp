<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Add clinic</title>
    <!-- Favicon icon -->
    <link rel="icon" type="<c:url value="../image/png"/>" sizes="16x16" href="images/favicon.png">
    <!-- Pignose Calender -->
    <link href="<c:url value="../plugins/pg-calendar/css/pignose.calendar.min.css"/>" rel="stylesheet">
    <!-- Chartist -->
    <link rel=stylesheet" href="<c:url value="../plugins/chartist/css/chartist.min.css"/>">
    <link rel=stylesheet" href="<c:url value="../plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css"/>">
    <!-- Custom Stylesheet -->
    <link href="<c:url value=".//css/style.css"/>" rel="stylesheet">

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
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Dodaj przychodnię, w której pracujesz</h4>
                        <div class="basic-form">
                            <form action="/user/clinic" method="post">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text">Options</label>
                                    </div>
                                    <select name="clinicId" class="custom-select">
                                        <option selected="selected">Wybierz placówkę</option>
                                        <c:forEach items="${clinicies}" var="clinic">
                                            <option value="${clinic.id}">${clinic.city} ${clinic.address}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="submit" class="btn btn-dark" value="Wybierz" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>
