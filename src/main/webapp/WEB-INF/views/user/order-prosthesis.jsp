<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Order prosthesis</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="../../../images/favicon.png"/> ">
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
                                <form:form action="/user/order" method="post" modelAttribute="prosthesis">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Deadline</label>
                                            <form:input path="deadline" cssClass="form-control" placeholder="mm-dd-yyyy"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Typ</label>
                                            <form:input path="type" cssClass="form-control" placeholder="np.aparat ortodontyczny"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Rodzaj</label>
                                        <form:select path="variety" cssClass="form-control">
                                                <c:forEach items="${specializationsList}" var="specialization">
                                                    <form:option value="${specialization}" label="${specialization.name}"/>
                                                </c:forEach>
                                        </form:select>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Opis</label>
                                            <form:textarea path="description" cssClass="form-control"
                                                        placeholder="opis"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Materiały</label>
                                            <form:textarea path="materials" cssClass="form-control"
                                                           placeholder="materiały"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Cena</label>
                                            <form:input path="price" cssClass="form-control"
                                                           placeholder="cena"/>
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
