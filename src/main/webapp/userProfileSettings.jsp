<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>

<!DOCTYPE html>
<html lang="pl_PL">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>kennyS - centrum sportowe</title>
    <link href="https://fonts.googleapis.com/css?family=Audiowide" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Play" rel="stylesheet"/>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <script src="/resources/js/jquery.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/script.js"></script>
    <script src="/resources/js/scrollReveal.js"></script>
    <script src="/resources/js/custom.js"></script>
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
                <sec:authorize access="hasAnyRole('ROLE_USER')">
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
                    <div class="panel-body">
                        <h3 class="panel-title"><a href=" /userProfileEdit">Ustawienia</a></h3>
                    </div>
                    <c:if test="${user.role == 'ADMINISTRATOR'}">
                        <div class="panel-heading">
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
                                        </div>
                                        <br>
                                        <div class="col-sm-6">
                                            <h4 style="color:#6666FF;">${user.username} </h4></span>
                                            <span>${user.role} </p></span>
                                        </div>
                                        <c:if test="${user.role == 'ADMINISTRATOR'}">
                                        <div class="col-lg-12">
                                        <form:form method="POST" modelAttribute="newsForm" action="/userProfileSettings" class="form-horizontal">
                                            <fieldset>
                                                    <form:hidden path="id" value="${newsForm.id}"/>
                                                <c:if test="${newsForm.id == null}">
                                                <legend>Dodaj aktualność</legend>
                                                </c:if>
                                                <c:if test="${newsForm.id != null}">
                                                    <legend>Edytuj aktualność</legend>
                                                </c:if>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="title">Tytuł
                                                        aktualności</label>
                                                    <div class="col-md-4">
                                                        <spring:bind path="title">
                                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                <form:input type="text" name="title" path="title"
                                                                            class="form-control input-md"
                                                                            placeholder="Tu wpisz tytuł aktualności"
                                                                            autofocus="true"
                                                                            required="true"></form:input>
                                                                <form:errors path="title"></form:errors>
                                                            </div>
                                                        </spring:bind>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="objectId">Wybierz obiekt</label>
                                                    <div class="col-md-4">
                                                        <c:if test="${objectSelected == null}">
                                                        <form:select type="text" path="objectId" itemValue="f" class="form-control">
                                                            <c:forEach var="listValue" items="${objectList}">
                                                                <option value="${listValue.id}">${listValue.name}</option>
                                                            </c:forEach>
                                                        </form:select>
                                                        </c:if>
                                                        <c:if test="${objectSelected != null}">
                                                            <h4 style="padding-top: 5px; margin: 0px; text-align: left">${objectSelected}</h4>
                                                            <form:hidden path="objectId2" value="${objectId}"/>
                                                        </c:if>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label">Opis</label>
                                                    <div class="col-md-8">
                                                        <spring:bind path="description">
                                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                <form:textarea path="description" class="form-control" name="description" rows="8" cols="62"
                                                                           placeholder="Tu wpisz opis"
                                                                          required="true"></form:textarea>
                                                                <form:errors path="description"></form:errors>
                                                            </div>
                                                        </spring:bind>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="singlebutton"></label>
                                                    <div class="col-md-3 col-md-offset-5">
                                                        <button id="singlebutton" name="singlebutton"
                                                                class="btn"  style="background-color:#6666FF; color: white">Dodaj
                                                        </button>
                                                    </div>
                                                </div>
                                                 </fieldset>
                                        </form:form>
                                                    <c:if test="${not empty newsList}" >
                                                        <form method="POST" class="form-horizontal" var="selected" action="/userProfileSettings/edit">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <fieldset>
                                                                <legend>Operacje na aktualność</legend>
                                                                <div class="form-group">
                                                                    <label class="col-md-4 control-label"
                                                                           for="selectbasic">Wybierz aktualność</label>
                                                                    <div class="col-md-4">

                                                                        <select id="selectbasic" name="selectId"
                                                                                class="form-control">
                                                                            <c:forEach var="listView"
                                                                                       items="${newsList}">
                                                                                <option path="Id"
                                                                                        value="${selected = listView.id}">${listView.title}</option>
                                                                            </c:forEach>
                                                                        </select>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-md-4  control-label" style="padding-top: 10px;">Wybierz operacje</label>
                                                                    <div class="col-md-4 col-md-offset-4" style="padding-right: 29px;">
                                                                        <button name="type" value="delete" class="btn" style="background-color:#6666FF; color: white">Usuń</button>
                                                                        <button name="type" value="edit" class="btn" style="background-color:#6666FF; color: white">Edytuj</button>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </c:if>
                                                </div>
                                                </c:if>
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
