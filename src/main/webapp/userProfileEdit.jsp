<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl_PL">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>kennyS - centrum sportowe</title>
    <link href="https://fonts.googleapis.com/css?family=Audiowide" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Play" rel="stylesheet"/>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="resources/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="resources/css/style.css"/>
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/script.js"></script>
    <script src="resources/js/scrollReveal.js"></script>
    <script src="resources/js/custom.js"></script>
</head>

<body>

<div class="navbar navbar-default navbar-fixed-top" style="background-color: white;">
    <div class="container">

        <div class="collapse navbar-collapse col-lg-3 col-md-3 navbar-left" style="height: 150px;">
            <ul class="nav navbar-nav ">
                <li><a href="/"><img src="resources/img/logo2.png"/></a></li>
            </ul>
        </div>

        <div class="col-lg-9 col-md-9 navbar-right" style="height: 130px;">
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <div class="col-lg-4 col-lg-offset-8" style="height: 55px; padding-top: 10px;  padding-left: 45px;">

                    <button id="userMenu1" class="btn btn-primary" type="button" style="background-color: #6666FF;">
                        <a href="/login" style="color: white"><span>Zaloguj się </span></a>
                    </button>
                    <button id="userMenu" class="btn btn-primary" type="button" style="background-color: #6666FF;">
                        <a href="/registration" style="color: white"><span>Zarejestruj się</span></a>
                    </button>
                </div>
            </c:if>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="hasRole('ROLE_USER')">
                    <c:url value="/logout" var="logoutUrl"/>
                    <form action="${logoutUrl}" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                    </form>
                    <script>
                        function formSubmit() {
                            document.getElementById("logoutForm").submit();
                        }
                    </script>

                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <ul class="nav navbar-nav navbar-right"
                            style="margin-right: 35px; padding-top: 10px; font-size: 17px;">
                            <li><a href="userProfile" style="color: black"><strong>Mój profil</strong></a></li>
                            <li style="padding-top: 5px;">
                                <ol class="breadcrumb" style="float: left;">
                                    <li class="active" style="color: black;">
                                        Witaj, ${pageContext.request.userPrincipal.name}</li>
                                    <li><a href="javascript:formSubmit()" style="color: black;"> Wyloguj</a></li>
                                </ol>
                            </li>
                        </ul>
                    </c:if>
                </sec:authorize>
            </ul>
            <div class="col-lg-12" style="height: 65px;">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav nav-pills text-header  navbar-right">
                        <li role="presentation"><a href="/news">
                            <div style="color: black;">aktualności</div>
                        </a></li>
                        <li role="presentation"><a href="/priceList">
                            <div style="color: black;">cennik</div>
                        </a></li>
                        <li role="presentation"><a href="/offer">
                            <div style="color: black;">oferta</div>
                        </a></li>
                        <li role="presentation"><a href="/contact">
                            <div style="color: black;">kontakt</div>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="content-home" style="padding-top: 200px;">
    <div class="container">
        <div class="col-lg-3 col-lg-offset-1">

            <div class="panel-custom-container">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h3 class="panel-title"><a href="/userProfile">Profil</a></h3>
                    </div>
                    <div class="panel-body">
                        <h3 class="panel-title"><a href="/userProfileReservation">Rezerwacje</a></h3>
                    </div>
                    <div class="panel-heading">
                        <h3 class="panel-title"><a href=" /userProfileEdit">Ustawienia</a></h3>
                    </div>
                    <c:if test="${user.role == 'ADMINISTRATOR'}">
                        <div class="panel-body">
                            <h3 class="panel-title"><a href="/userProfileSettings">Dodaj aktualność</a></h3>
                        </div>
                        <div class="panel-body">
                            <h3 class="panel-title"><a href="/userProfileMessages">Wiadomości</a></h3>
                        </div>
                        <div class="panel-body">
                            <h3 class="panel-title"><a href="/reports">Raporty</a></h3>
                        </div>
                    </c:if>
                </div>
            </div>

        </div>
        <div class="col-lg-7">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 ">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="box box-info">
                                    <div class="box-body">
                                        <div class="col-sm-6">
                                            <div align="center"><img alt="User Pic"
                                                                     src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
                                                                     id="profile-image1"
                                                                     class="img-circle img-responsive">

                                                <input id="profile-image-upload" class="hidden" type="file">
                                            </div>
                                            <br>
                                        </div>
                                        <div class="col-sm-6">
                                            <h4 style="color:#6666FF;">${user.username} </h4></span>
                                            <span>${user.role} </p></span>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="reservationsContent">
                                                <form method="POST" action="/userProfileEditEmail" class="form-signin">

                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Zmień
                                                                email</label>
                                                            <div class="col-md-4">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="text" name="userName"
                                                                           class="form-control"
                                                                           placeholder="Nowy Email"></input>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}"/>
                                                            <div class="col-lg-5 controls"
                                                                 style="margin-bottom: 10px; padding-left: 0px;">
                                                                <input type="hidden" name="id" value="${user.id}">
                                                                <input type="submit" name="submit" value="Zmień"
                                                                       class="btn btn-primary"
                                                                       style="background-color: #6666FF; width: 100px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <form method="POST" action="/userProfileEditPassword" class="form-signin">
                                                    <h4 style="text-align: left; padding-left: 30px;">Zmień hasło</h4>
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Obecne
                                                                hasło</label>
                                                            <div class="col-md-4">
                                                                <input type="hidden" name="id" value="${user.id}">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="password" name="password1"
                                                                           class="form-control"
                                                                           placeholder="Obecne hasło"></input>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Nowe
                                                                hasło</label>
                                                            <div class="col-md-4">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="password" name="password2"
                                                                           class="form-control"
                                                                           placeholder="Nowe hasło"></input>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}"/>
                                                            <div class="col-lg-5 controls"
                                                                 style="margin-bottom: 10px; padding-left: 0px;">
                                                                <input type="submit" name="submit" value="Zmień"
                                                                       class="btn btn-primary"
                                                                       style="background-color: #6666FF; width: 100px;">
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                                <form method="POST" action="/userProfileEditStreet" class="form-signin">

                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Zmień
                                                                ulice</label>
                                                            <div class="col-md-4">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="text" name="street"
                                                                           class="form-control"
                                                                           placeholder="Ulica"></input>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}"/>
                                                            <div class="col-lg-5 controls"
                                                                 style="margin-bottom: 10px; padding-left: 0px;">
                                                                <input type="hidden" name="id" value="${user.id}">
                                                                <input type="submit" name="submit" value="Zmień"
                                                                       class="btn btn-primary"
                                                                       style="background-color: #6666FF; width: 100px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <form method="POST" action="/userProfileEditPhone" class="form-signin">

                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Zmień nr. telefonu</label>
                                                            <div class="col-md-4">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="text" name="phone"
                                                                           class="form-control"
                                                                           placeholder="Telefon"></input>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}"/>
                                                            <div class="col-lg-5 controls"
                                                                 style="margin-bottom: 10px; padding-left: 0px;">
                                                                <input type="hidden" name="id" value="${user.id}">
                                                                <input type="submit" name="submit" value="Zmień"
                                                                       class="btn btn-primary"
                                                                       style="background-color: #6666FF; width: 100px;">
                                                            </div>
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
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
