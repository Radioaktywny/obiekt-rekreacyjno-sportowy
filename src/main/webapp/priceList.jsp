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

<c:if test="${not empty priceLists}">

    <div id="swimPriceSection">
        <div class="container" style="padding-top: 180px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Basen</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[0].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[0].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[0].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[0].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[0].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[0].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[0].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[0].subscriptionTariffOnePrice}">
                                    <th>${priceLists[0].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[0].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[0].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[0].oneTimeEntrancePrice}">
                                    <th>${priceLists[0].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[0].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm0" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[0].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm0').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px;  text-shadow: 4px 4px white;">Sala gimnastyczna</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[1].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[1].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[1].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[1].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[1].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[1].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[1].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[1].subscriptionTariffOnePrice}">
                                    <th>${priceLists[1].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[1].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[1].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[1].oneTimeEntrancePrice}">
                                    <th>${priceLists[1].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[1].tariffSwitchHour}</strong></h5>
                    </div>

                </div>
                <div class="col-lg-4" style="padding-top: 245px; ">
                    <form id="reservationForm1" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[1].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm1').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection1">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px;  text-shadow: 4px 4px white;">Hala tenisowa</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[2].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[2].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[2].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[2].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[2].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[2].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[2].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[2].subscriptionTariffOnePrice}">
                                    <th>${priceLists[2].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[2].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[2].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[2].oneTimeEntrancePrice}">
                                    <th>${priceLists[2].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[2].tariffSwitchHour}</strong></h5>
                    </div>

                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm2" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[2].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm2').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection2">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Hala sztuk walki</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[3].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[3].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[3].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[3].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[3].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[3].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[3].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[3].subscriptionTariffOnePrice}">
                                    <th>${priceLists[3].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[3].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[3].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[3].oneTimeEntrancePrice}">
                                    <th>${priceLists[3].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[3].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm3" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[3].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm3').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection3">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Sala BJJ</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[4].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[4].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[4].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[4].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[4].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[4].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[4].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[4].subscriptionTariffOnePrice}">
                                    <th>${priceLists[4].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[4].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[4].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[4].oneTimeEntrancePrice}">
                                    <th>${priceLists[4].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[4].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm4" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[4].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm4').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection4">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Sauna</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[5].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[5].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[5].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[5].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[5].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[5].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[5].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[5].subscriptionTariffOnePrice}">
                                    <th>${priceLists[5].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[5].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[5].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[5].oneTimeEntrancePrice}">
                                    <th>${priceLists[5].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[0].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm5" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[5].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm5').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection5">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Boisko piłkarskie</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[6].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[6].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[6].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[6].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[6].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[6].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[6].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[6].subscriptionTariffOnePrice}">
                                    <th>${priceLists[6].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[6].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[6].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[6].oneTimeEntrancePrice}">
                                    <th>${priceLists[6].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[0].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm6" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[6].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm6').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection6">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Boisko siatkarskie</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[7].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[7].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[7].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[7].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[7].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[7].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[7].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[7].subscriptionTariffOnePrice}">
                                    <th>${priceLists[7].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[7].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[7].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[7].oneTimeEntrancePrice}">
                                    <th>${priceLists[7].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[7].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm7" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[7].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm7').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

</c:if>

</body>

</html>