<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Add clinic</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="images/favicon.png"/>"/>
    <!-- Pignose Calender -->
    <link href="<c:url value="plugins/pg-calendar/css/pignose.calendar.min.css"/>" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="<c:url value="plugins/chartist/css/chartist.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css"/>"/>
    <!-- Custom Stylesheet -->
    <link href="<c:url value="css/style.css"/>" rel="stylesheet">

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
                                <form action="/user/laboratory" method="post">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <select name="laboratoryId">
                                                <option value="null" label="Wybierz placówkę"/>
                                                <c:forEach items="${laboratories}" var="laboratory">
                                                    <option label="${laboratory.city} ${laboratory.address}"
                                                            value="${laboratory.id}"/>
                                                </c:forEach>
                                            </select>
                                            <input type="submit" class="btn btn-dark">Wybierz</input>
                                        </div>
                                    </div>
                                </form>

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
