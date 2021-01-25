<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Change user data</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="../../../resources/images/favicon.png"/>">
    <!-- Chartist -->
    <link rel="stylesheet" href="<c:url value="../../../resources/plugins/chartist/css/chartist.min.css"/>">
    <link rel="stylesheet" href="<c:url value="../../../resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css"/>">
    <!-- Custom Stylesheet -->
    <link href="<c:url value="../../../resources/css/style.css"/>" rel="stylesheet">

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
                                <form:form action="/user/data" method="post" modelAttribute="user">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Imię</label>
                                            <form:input path="firstName" cssClass="form-control" placeholder="imię"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Nazwisko</label>
                                            <form:input path="lastName" cssClass="form-control" placeholder="nazwisko"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <form:input path="email" cssClass="form-control" placeholder="example@ecample.com"/>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Nr dyplomu</label>
                                            <form:input path="certificateNumber" cssClass="form-control"
                                                        placeholder="nr dyplomu"/>
                                        </div>
                                        <sec:authorize access="hasRole('TECHNICIAN')">
                                        <div class="form-group col-md-6">
                                            <label>Rodzaje prac:</label>
                                            <form:checkboxes path="specializations" items="${specialisationsList}" cssClass="form-check-inline form-check"/>
                                        </div>
                                        </sec:authorize>
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
