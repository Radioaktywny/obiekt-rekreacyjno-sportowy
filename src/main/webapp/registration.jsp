<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="pl_PL">
<head>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/font-awesome.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

    <title>Rejestracja</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body style="background-color: #F9F9F9;">

<div class="container" style=" margin-top: 250px;">
    <div id="signupbox" style="margin-top:50px" class="col-md-8 col-md-offset-2" data-scrollreveal="enter bottom and move 300px, wait 0.2s">
        <div class="panel"  style="border-color: #5151cc;">
            <div class="panel-heading" style="background-color: #a3a3ff;">
                <div class="panel-title"  >Zarejestruj się</div>

            </div>
            <div class="panel-body" >
                <form:form method="POST" modelAttribute="userForm" class="form-signin">

                    <div class="form-group">
                        <label for="username" class="text-left col-md-3 control-label " style="text-align: left">Login</label>
                        <div class="col-md-4 " style="margin-right: 150px;">
                            <spring:bind path="username">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="username" class="form-control" placeholder="Login"
                                                autofocus="true"></form:input>
                                    <form:errors path="username"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label"  style="text-align: left">Hasło</label>
                        <div class="col-md-4 " style="margin-right: 150px;">
                            <spring:bind path="password">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:input type="password" path="password" class="form-control" placeholder="Hasło"></form:input>
                                <form:errors path="password"></form:errors>
                            </div>
                        </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label"  style="text-align: left">Powtórz hasło</label>
                        <div class="col-md-4 " style="margin-right: 150px;">
                            <spring:bind path="passwordConfirm">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="password" path="passwordConfirm" class="form-control"
                                                placeholder="Powtórz hasło"></form:input>
                                    <form:errors path="passwordConfirm"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-md-3 control-label"  style="text-align: left">Email</label>
                        <div class="col-md-4 " style="margin-right: 150px;">
                            <spring:bind path="email">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="email" class="form-control"
                                                placeholder="Email"></form:input>
                                    <form:errors path="email"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="town" class="col-md-3 control-label"  style="text-align: left">Lokalizacja</label>
                        <div class="col-md-4">
                            <spring:bind path="town">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="town" class="form-control" placeholder="Miasto"></form:input>
                                    <form:errors path="town"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="postKey">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="postKey" class="form-control" placeholder="Kod pocztowy"></form:input>
                                    <form:errors path="postKey"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="checkbox col-md-8  col-md-offset-3 control-label" style="text-align: left">
                            <label>
                                <input type="checkbox" id="rulesRequired" name="test" required>Zapoznałem się z treścią regulaminu i wyrażam na niego zgodę
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-offset-3 col-md-9">
                            <input type="submit" value="Zarejestruj się" class="btn btn-primary" style="background-color: #6666FF; width: 150px;">
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrollReveal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>