<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Protezy</title>
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

<div id="main-wrapper">

<%@ include file="../home/header.jsp"%>

<div class="content-body">

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Wykonane uzupełnienia protetyczne</h4>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered zero-configuration">
                                <thead>
                                <tr>
                                    <th>Data zamówienia</th>
                                    <th>Dada oddania pracy</th>
                                    <th>Typ</th>
                                    <th>Rodzaj</th>
                                    <th>nr pesel pacjenta</th>
                                    <th></th>
                                    <sec:authorize access="hasRole('STOMATOLOGIST')">
                                        <th></th>
                                    </sec:authorize>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${prostheses}" var="prosthesis">
                                <tr>
                                    <td>${prosthesis.dateOfOrder}</td>
                                    <td>${prosthesis.deadline}</td>
                                    <td>${prosthesis.type}</td>
                                    <td>${prosthesis.variety}</td>
                                    <c:forEach items="${prosthesis.patient}" var="patient">
                                        <td>${patient.pesel}</td>
                                    </c:forEach>
                                    <td><a href="/user/prosthesis/${prosthesis.id}" class="btn mb-1 btn-success">Pokaż</a></td>
                                    <sec:authorize access="hasRole('STOMATOLOGIST')">
                                        <th><a href="/user/prosthesis/${prosthesis.id}" class="btn mb-1 btn-success">Edytuj</a></th>
                                    </sec:authorize>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>Data zamówienia</th>
                                    <th>Dada oddania pracy</th>
                                    <th>Typ</th>
                                    <th>Rodzaj</th>
                                    <th>nr pesel pacjenta</th>
                                    <th></th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #/ container -->
</div>


<%@include file="../home/footer.jsp"%>

</div>

<!--**********************************
    Scripts
***********************************-->
<script src="../../../resources/plugins/common/common.min.js"></script>
<script src="../../../resources/js/custom.min.js"></script>
<script src="../../../resources/js/settings.js"></script>
<script src="../../../resources/js/gleek.js"></script>
<script src="../../../resources/js/styleSwitcher.js"></script>

<script src="../../../resources/plugins/tables/js/jquery.dataTables.min.js"></script>
<script src="../../../resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
</body>
</html>
