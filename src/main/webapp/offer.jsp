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
<style>
    body {
        background: url("/resources/img/nice-girl.jpg") no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }
</style>
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

<c:if test="${not empty offerList}">

    <div class="container" style="padding-top: 180px;">
        <div class="row">
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[0].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[0].name}</h1>
                    <br>
                    <h4>${offerList[0].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">

                    <img src="/${offerList[1].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[1].name}</h1>
                    <br>
                    <h4>${offerList[1].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[2].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[2].name}</h1>
                    <br>
                    <h4>${offerList[2].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[3].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[3].name}</h1>
                    <br>
                    <h4>${offerList[3].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[4].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[4].name}</h1>
                    <br>
                    <h4>${offerList[4].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[5].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[5].name}</h1>
                    <br>
                    <h4>${offerList[5].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[6].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[6].name}</h1>
                    <br>
                    <h4>${offerList[6].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[7].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[7].name}</h1>
                    <br>
                    <h4>${offerList[7].description}</h4>
                </div>
            </div>
        </div>
    </div>

</c:if>

</body>

</html>