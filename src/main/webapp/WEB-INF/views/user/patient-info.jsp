<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Karta pacjenta</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="../images/favicon.png"/>" >
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
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
        </svg>
    </div>
</div>
<!--*******************
    Preloader end
********************-->

<div id="main-wrapper">
    <%@include file="../home/header.jsp"%>

    <div class="content-body">

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="media align-items-center mb-4">
                                <img class="mr-3" src="../../../../resources/static/images/avatar/11.png" width="80" height="80" alt="">
                                <div class="media-body">
                                    <h3 class="mb-0">${patient.firstName} ${patient.lastName}</h3>
                                    <p class="text-muted mb-0">${patient.pesel}</p>
                                </div>
                            </div>

                            <div class="row mb-5">
                                <div class="col">
                                    <div class="card card-profile text-center">
                                        <span class="mb-1 text-primary"><i class="icon-people"></i></span>
                                        <h3 class="mb-0">${labelCounter}</h3>
                                        <p class="text-muted px-4">Ilość wizyt</p>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="card card-profile text-center">
                                        <span class="mb-1 text-warning"><i class="icon-appUser-follow"></i></span>
                                        <h3 class="mb-0">${prosthetisCounter}</h3>
                                        <p class="text-muted">Ilość uzupełnień protetycznych</p>
                                    </div>
                                </div>
                                <div class="col-12 text-center">
                                    <button class="btn btn-danger px-5">Zmień dane pacjenta</button>
                                </div>
                            </div>

                            <ul class="card-profile__info">
                                <li class="mb-1"><strong class="text-dark mr-4">Miasto</strong> <span>${patient.city}</span></li>
                                <li><strong class="text-dark mr-4">Adres</strong> <span>${patient.address}</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-xl-9">
                    <div class="card">
                        <div class="card-body">
                            <form action="#" class="form-profile">
                                <div class="form-group">
                                    <textarea class="form-control" name="textarea" id="textarea" cols="30" rows="2" placeholder="Post a new message"></textarea>
                                </div>
                                <div class="d-flex align-items-center">
                                    <ul class="mb-0 form-profile__icons">
                                        <li class="d-inline-block">
                                            <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-appUser"></i></button>
                                        </li>
                                        <li class="d-inline-block">
                                            <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-paper-plane"></i></button>
                                        </li>
                                        <li class="d-inline-block">
                                            <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-camera"></i></button>
                                        </li>
                                        <li class="d-inline-block">
                                            <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-smile"></i></button>
                                        </li>
                                    </ul>
                                    <button class="btn btn-primary px-3 ml-4">Send</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <c:forEach items="chartLabels" var="label">
                            <div class="media media-reply">
                                <img class="mr-3 circle-rounded" src="../../../../resources/static/images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">
                                <div class="media-body">
                                    <div class="d-sm-flex justify-content-between mb-2">
                                        <h5 class="mb-sm-0">${label.date}
                                            <small class="text-muted ml-3"><c:if test="${label.isDentalProsthesisOrdered}">zamówiono uzupełnienie protetycze
                                            </c:if></small></h5>
                                        <div class="media-reply__link">
                                            <a href="/user/patient/${patient.id}/edit" class="btn btn-transparent p-0 mr-3">Edytuj opis</a>
                                            <a href="/user/patient/${patient.id}/order" class="btn btn-transparent p-0 mr-3">Zamów uzupełnienie</a>
                                        </div>
                                    </div>

                                    <p>${label.description}</p>

                                </div>
                            </div>
                            </c:forEach>

                            <div class="media media-reply">
                                <img class="mr-3 circle-rounded" src="../images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">
                                <div class="media-body">
                                    <div class="d-sm-flex justify-content-between mb-2">
                                        <h5 class="mb-sm-0">Milan Gbah <small class="text-muted ml-3">about 3 days ago</small></h5>
                                        <div class="media-reply__link">
                                            <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-up"></i></button>
                                            <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-down"></i></button>
                                            <button class="btn btn-transparent p-0 ml-3 font-weight-bold">Reply</button>
                                        </div>
                                    </div>

                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                </div>
                            </div>

                            <div class="media media-reply">
                                <img class="mr-3 circle-rounded" src="../images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">
                                <div class="media-body">
                                    <div class="d-sm-flex justify-content-between mb-2">
                                        <h5 class="mb-sm-0">Milan Gbah <small class="text-muted ml-3">about 3 days ago</small></h5>
                                        <div class="media-reply__link">
                                            <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-up"></i></button>
                                            <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-down"></i></button>
                                            <button class="btn btn-transparent p-0 ml-3 font-weight-bold">Reply</button>
                                        </div>
                                    </div>

                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                </div>
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

</body>
</html>
