<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Gabinety stomatologiczne</title>
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

    <%@ include file="header.jsp"%>

    <div class="content-body">

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Nasze gabiety stomatologiczne</h4>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered zero-configuration">
                                    <thead>
                                    <tr>
                                        <th>NIP</th>
                                        <th>Miasto</th>
                                        <th>Adres</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${clinics}" var="clinic">
                                        <tr>
                                            <td>${clinic.nip}</td>
                                            <td>${clinic.city}</td>
                                            <td>${clinic.address}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>NIP</th>
                                        <th>Miasto</th>
                                        <th>Adres</th>
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


    <%@include file="footer.jsp"%>

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
