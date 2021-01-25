<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rejestracja</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Rejestracja</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="../../../resources/images/favicon.png"/>">
    <!-- Chartist -->
    <link rel="stylesheet" href="<c:url value="../../../resources/plugins/chartist/css/chartist.min.css"/>">
    <link rel="stylesheet" href="<c:url value="../../../resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css"/>">
    <!-- Custom Stylesheet -->
    <link href="<c:url value="../../../resources/css/style.css"/>" rel="stylesheet">
</head>
<body class="h-100">

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
    <%@include file="../home/header.jsp"%>

    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="/"><h3>Rosella</h3></a>


                                <form:form method="post" id="step-form-horizontal"
                                           cssClass="mt-5 mb-5 login-input"
                                           modelAttribute="user">

                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <form:input path="email" cssClass="form-control"
                                                        placeholder="Email"/>
                                            <form:errors path="email" cssClass="alert alert-danger"
                                                         element="div"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <form:password path="password" cssClass="form-control"
                                                           placeholder="Password"/>
                                            <form:errors path="password" cssClass="alert alert-danger"
                                                         element="div"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <input type="password" name="confirmPassword"
                                                   class="form-control"
                                                   placeholder="Confirm Password"/>
                                            <div class="alert alert-danger"><spring:message
                                                    code="password.confirm"/></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <form:input path="firstName" cssClass="form-control"
                                                        placeholder="First Name"/>
                                            <form:errors path="firstName" cssClass="alert alert-danger"
                                                         element="div"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <form:input path="lastName" cssClass="form-control"
                                                        placeholder="Last Name"/>
                                            <form:errors path="lastName" cssClass="alert alert-danger"
                                                         element="div"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <div class=" form-check form-check-inline">
                                                <label class="form-check-label">
                                                    <form:radiobutton path="technician" id="tech"
                                                                   cssClass="form-check-input"/>Technik</label>
                                                <label class="form-check-label">
                                                    <form:radiobutton path="stomatologist"
                                                                   cssClass="form-check-input"/>Stomatolog</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <div id="spec" class="form-check-inline">
                                                <form:checkboxes path="specializations"
                                                                 cssClass="form-check-input"
                                                                 items="${specList}"
                                                                 itemLabel="name" itemValue="id"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <form:input path="certificateNumber"
                                                        class="form-control"
                                                        placeholder="podaj numer dyplomu"/>
                                            <form:errors path="certificateNumber" cssClass="alert alert-danger"
                                                         element="div"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" class="btn mb-1 btn-primary" value="Zarejestruj się"/>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
<!--**********************************
    Scripts
***********************************-->
<script src="../../../resources/plugins/common/common.min.js"></script>
<script src="../../../resources/js/custom.min.js"></script>
<script src="../../../resources/js/settings.js"></script>
<script src="../../../resources/js/gleek.js"></script>
<script src="../../../resources/js/styleSwitcher.js"></script>

<script src="../../../resources/js/plugins-init/form-specialization.js"></script>
<!--**********************************
    Scripts
***********************************-->


</body>
</html>
