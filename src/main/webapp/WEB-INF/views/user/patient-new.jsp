<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Add patient</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="../../images/favicon.png"/> ">
    <!-- Chartist -->
    <link type="text/css" rel="stylesheet" href="<c:url value="../plugins/chartist/css/chartist.min.css"/>"/>
    <link type="text/css" rel="stylesheet"
          href="<c:url value="../plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css"/>"/>
    <!-- Custom Stylesheet -->
    <link type="text/css" href="<c:url value="../css/style.css"/>" rel="stylesheet">

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

    <%@include file="../home/header.jsp" %>
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Dodaj pacjenta</h4>
                            <div class="basic-form">
                                <form:form action="/user/patient" method="post" modelAttribute="patient">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Imię</label>
                                            <form:input path="firstName" class="form-control" placeholder="imię"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Nazwisko</label>
                                            <form:input path="lastName" class="form-control" placeholder="nazwisko"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>PESEL</label>
                                        <form:input path="pesel" class="form-control" placeholder="pesel"/>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Miasto</label>
                                            <form:input path="city" class="form-control"
                                                   placeholder="miasto"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Adres</label>
                                            <form:input path="address" class="form-control"
                                                   placeholder="adres"/>
                                        </div>
                                    </div>
                                    <input class="btn mb-1 btn-success" type="submit" value="dodaj">
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../home/footer.jsp" %>
</div>

</body>
</html>
