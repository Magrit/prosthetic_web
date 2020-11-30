<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Header</title>
</head>
<body>

<!--**********************************
            Nav header start
        ***********************************-->
<div class="nav-header">
    <div class="brand-logo">
        <a href="/">
            <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
            <span class="logo-compact"><img src="images/logo-compact.png" alt=""></span>
            <span class="brand-title">
                        <img src="images/logo-text.png" alt="">
                    </span>
        </a>
    </div>
</div>
<!--**********************************
    Nav header end
***********************************-->

<!--**********************************
    Header start
***********************************-->
<div class="header">
    <div class="header-content clearfix">

        <div class="nav-control">
            <div class="hamburger">
                <span class="toggle-icon"><i class="icon-menu"></i></span>
            </div>
        </div>
        <div class="header-right">
            <sec:authorize access="hasRole('owner')">
                <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">--%>
                    <i class="mdi mdi-bell-outline"></i>
                    <span class="badge badge-pill gradient-2">3</span>
                </a>
                    <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                        <div class="dropdown-content-heading d-flex justify-content-between">
                            <span class="">2 New Notifications</span>
                            <a href="javascript:void()" class="d-inline-block">
                                <span class="badge badge-pill gradient-2">5</span>
                            </a>
                        </div>
                        <div class="dropdown-content-body">
                            <ul>
                                <li>
                                    <a href="javascript:void()">
                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i
                                            class="icon-present"></i></span>
                                        <div class="notification-content">
                                            <h6 class="notification-heading">Events near you</h6>
                                            <span class="notification-text">Within next 5 days</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void()">
                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i
                                            class="icon-present"></i></span>
                                        <div class="notification-content">
                                            <h6 class="notification-heading">Event Started</h6>
                                            <span class="notification-text">One hour ago</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void()">
                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i
                                            class="icon-present"></i></span>
                                        <div class="notification-content">
                                            <h6 class="notification-heading">Event Ended Successfully</h6>
                                            <span class="notification-text">One hour ago</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void()">
                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i
                                            class="icon-present"></i></span>
                                        <div class="notification-content">
                                            <h6 class="notification-heading">Events to Join</h6>
                                            <span class="notification-text">After two days</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>
                </li>
            </sec:authorize>
            <ul class="clearfix">
                <sec:authorize access="isAuthenticated()">
                    <li class="icons dropdown"><a href="/user/messages" data-toggle="dropdown">
                        <i class="mdi mdi-email-outline"></i>
                        <span class="badge badge-pill gradient-1">3</span>
                    </a>
                        <div class="drop-down animated fadeIn dropdown-menu">
                            <div class="dropdown-content-heading d-flex justify-content-between">
                                <span class="">messages</span>
                                <a href="/user/messages" class="d-inline-block">
                                    <span class="badge badge-pill gradient-1">3</span>
                                </a>
                            </div>
                            <div class="dropdown-content-body">
                                <ul>
                                    <li class="notification-unread">
                                        <a href="/user/messages/${message.id}">
                                            <div class="notification-content">
                                                <div class="notification-heading">Saiful Islam</div>
                                                <div class="notification-timestamp">08 Hours ago</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-unread">
                                        <a href="/user/messages/${message.id}">
                                            <div class="notification-content">
                                                <div class="notification-heading">Adam Smith</div>
                                                <div class="notification-timestamp">08 Hours ago</div>
                                                <div class="notification-text">Can you do me a favour?</div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/user/messages/${message.id}">
                                            <div class="notification-content">
                                                <div class="notification-heading">Barak Obama</div>
                                                <div class="notification-timestamp">08 Hours ago</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/user/messages/${message.id}">
                                            <div class="notification-content">
                                                <div class="notification-heading">Hilari Clinton</div>
                                                <div class="notification-timestamp">08 Hours ago</div>
                                                <div class="notification-text">Hello</div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </li>
                </sec:authorize>
                <li class="icons dropdown d-none d-md-flex">
                    <a href="javascript:void(0)" class="log-appUser" data-toggle="dropdown">
                        <span>Polski</span> <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                    </a>
                    <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                        <div class="dropdown-content-body">
                            <ul>
                                <li><a href="javascript:void()">Polski</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="icons d-none d-md-flex">
                    <sec:authorize access="isAnonymous()">
                        <a href="/login" class="log-appUser">
                            <span>Zaloguj się</span>
                        </a>
                    </sec:authorize>
                </li>
                <sec:authorize access="isAuthenticated()">
                    <li class="icons dropdown">
                        <div class="user-img c-pointer position-relative" data-toggle="dropdown">
                            <span class="activity active"></span>
                            <img src="images/user/1.png" height="40" width="40" alt="">
                        </div>
                        <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                            <div class="dropdown-content-body">
                                <ul>
                                    <li>
                                        <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void()">
                                            <i class="icon-envelope-open"></i> <span>Inbox</span>
                                            <div class="badge gradient-3 badge-pill gradient-1">3</div>
                                        </a>
                                    </li>

                                    <hr class="my-2">
                                    <li>
                                        <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                    </li>
                                    <li>
                                        <form action="/logout" method="post">
                                            <label class="icon-key"><input type="submit" class="btn-light"
                                                                           value="Wyloguj"></label>
                                            <input type="hidden" name="${_csrf.parameterName}"
                                                   value="${_csrf.token}"/>
                                        </form>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </sec:authorize>
                </li>

            </ul>
        </div>
    </div>
</div>


<div class="nk-sidebar">
    <div class="nk-nav-scroll">
        <ul class="metismenu" id="menu">
            <sec:authorize access="isAuthenticated()">
                <li>
                    <a href="/registration" aria-expanded="false">
                        <i class="icon-badge menu-icon"></i><span class="nav-text">Rejestracja</span>
                    </a>
                </li>
                <li>
                    <a href="/registration" aria-expanded="false">
                        <i class="icon-badge menu-icon"></i><span class="nav-text">Rejestracja</span>
                    </a>
                </li>
            </sec:authorize>
            <li>
                <a href="/registration" aria-expanded="false">
                    <i class="icon-badge menu-icon"></i><span class="nav-text">Rejestracja</span>
                </a>
            </li>
            <li>
                <a href="/about" aria-expanded="false">
                    <i class="icon-badge menu-icon"></i><span class="nav-text">O aplikacji</span>
                </a>
            </li>
            <li class="mega-menu mega-menu-sm">
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Współpracujące placówki</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="./layout-blank.html">Pracownie dentystyczne</a></li>
                    <li><a href="./layout-one-column.html">Gabinety stomatologiczne</a></li>
                    <li><a href="./layout-two-column.html">Szukaj</a></li>
                </ul>
            </li>
            <li>
                <a href="/contact" aria-expanded="false">
                    <i class="icon-badge menu-icon"></i><span class="nav-text">Kontakt</span>
                </a>
            </li>

        </ul>
    </div>
</div>
<!--**********************************
    Header end ti-comment-alt
***********************************-->
<script src="plugins/common/common.min.js"></script>
<script src="js/custom.min.js"></script>
<script src="js/settings.js"></script>
<script src="js/gleek.js"></script>
<script src="js/styleSwitcher.js"></script>

<script src="./js/dashboard/dashboard-1.js"></script>

</body>
</html>
