<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
                    <c:url value="/logout" var="logoutUrl" />
                    <form action="${logoutUrl}" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />
                    </form>
                    <script>
                        function formSubmit() {
                            document.getElementById("logoutForm").submit();
                        }
                    </script>

                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <ul class="nav navbar-nav navbar-right" style="margin-right: 35px; padding-top: 10px; font-size: 17px;">
                            <li><a href="userProfile" style="color: black"><strong>Mój profil</strong></a></li>
                            <li style="padding-top: 5px;">
                                <ol class="breadcrumb" style="float: left;">
                                    <li class="active" style="color: black;">Witaj, ${pageContext.request.userPrincipal.name}</li>
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
                        <li role="presentation"><a href="/priceList">
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

<div id="content-contact" style="padding-top: 150px;">
    <div class="container">
        <div class="col-md-8 col-md-offset-2 text-center" data-scrollreveal="enter top and move 100px, wait 0.3s" style=" padding-bottom: 20px;">
            <h1 style="font-family: console;"><div id="red"><strong>Kontakt / Napisz do nas</strong></div></h1>
        </div>

        <div class="col-md-6 text-justify" data-scrollreveal="enter top and move 100px, wait 0.3s" style=" padding-bottom: 20px;">
            <h3 style="margin-top: 15px; font-color: black;"><strong>Nasza lokalizacja</strong></br>
                <hr /><h3>Skarżyńskiego 3, 31-866 Kraków</br>Telefon: +48 070 099 769</br>Email: kennyssport@gmail.com</h3>
        </div>

        <div class="col-md-6 text-justify" data-scrollreveal="enter top and move 100px, wait 0.3s" style=" padding-bottom: 20px;">
            <h1 style="font-family: console;"><h3><strong>Napisz wiadomość</strong></br></h3> <hr/>

                <form:form method="POST" modelAttribute="contactForm">
                    <div class="row">
                        <div class="form-group col-md-6 ">
                            <spring:bind path="contactName">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input path="contactName" class="form-control" placeholder="Twoje imię"/>
                                    <form:errors path="contactName"></form:errors>
                                </div>
                            </spring:bind>
                        </div>

                        <div class="form-group col-md-6 ">
                            <spring:bind path="contactEmail">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input path="contactEmail" class="form-control" placeholder="Email"/>
                                    <form:errors path="contactEmail"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12 ">
                            <spring:bind path="contactContent">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:textarea path="contactContent" class="form-control" rows="3"  placeholder="Message"/>
                                    <form:errors path="contactContent"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default">Wyślij!</button>
                </form:form>
        </div>
    </div>
</div>

</body>
</html>
