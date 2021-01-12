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
    <link rel="icon" type="image/png" sizes="16x16" href="../../../resources/static/images/favicon.png">
    <!-- Pignose Calender -->
    <link href="<c:url value="../plugins/pg-calendar/css/pignose.calendar.min.css"/>" rel="stylesheet">
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

    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Dodaj pracownię, w której pracujesz</h4>
                            <div class="basic-form">
                                <form:form action="/user/clinic" method="post" modelAttribute="chosenClinic">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text">Options</label>
                                        </div>
                                        <form:select path="id" class="custom-select">
                                            <form:option selected="selected" value="0" label="Wybierz przychodnię"/>
                                            <c:forEach items="${clinics}" var="clinic">
                                                <form:option value="${clinic.id}"
                                                             label="${clinic.city} ${clinic.address}"/>
                                            </c:forEach>
                                        </form:select>
                                        <input type="submit" class="btn btn-dark" value="Wybierz"/>
                                    </div>
                                </form:form>
                            </div>
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
