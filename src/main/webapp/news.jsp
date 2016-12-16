<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="resources/css/news.css"/>
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/script.js"></script>
    <script src="resources/js/scrollReveal.js"></script>
    <script src="resources/js/custom.js"></script>
    <script src="resources/js/news.js"></script>
</head>

<body>

<div class="navbar navbar-default navbar-fixed-top" style="background-color: white;">
    <div class="container">

        <div class="collapse navbar-collapse col-lg-3 col-md-3 navbar-left" style="height: 150px;">
            <ul class="nav navbar-nav ">
                <li><a href="#content-home"><img src="resources/img/logo2.png"/></a></li>
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

<div class="clearfix" />
</div>


<div class="container 2 clearfix">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
    <div id="myCarousel" class="carousel slide" data-ride="carousel" >

          <!-- Wrapper for slides -->


          <c:if test="${not empty newsList}">
          <div class="carousel-inner">
          <c:forEach var="listValue" items="${newsList}">
          <c:set var="count" value="${count + 1}" scope="page"/>
          <c:choose>
              <c:when test="${count == 1}">
                <div class="item active">
              </c:when>
              <c:otherwise>
                   <div class="item">
              </c:otherwise>
          </c:choose>

              <c:forEach var="object" items="${objectList}">
                  <c:if test="${object.id == listValue.id}">
                       <img src="${object.picture}">
                  </c:if>
              </c:forEach>
               <div class="carousel-caption">
                <h4><a href="/priceList">${listValue.title}</a></h4>
                <p>${listValue.description}<a class="label label-primary" href="/" target="_blank">przeczytaj wiecej</a></p>
                <p><small>${listValue.data}</small></p>
              </div>
            </div><!-- End Item -->
            </c:forEach>

        </div>
            <ul class="list-group col-sm-4">
           <c:forEach var="listValue" items="${newsList}">
                     <c:set var="count1" value="${count1 + 1}" scope="page"/>
              <li data-target="#myCarousel" data-slide-to="${count1 - 1}" class="list-group-item">
              <h4>${listValue.title}</h4>
              </li>
           </c:forEach>
            </ul>
              <!-- Controls -->
              <div class="carousel-controls">
                  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                  </a>
                  <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                  </a>
              </div>
        </div><!-- End Carousel -->
      </c:if>
    </div>
</div>




<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-pills nav-justified">
                    <li><a href="/" style="color: black;">© 2016 kennyS.</a></li>
                    <li><a href="#" style="color: black;">Warunki korzystania z serwisu</a></li>
                    <li><a href="#" style="color: black;">Polityka prywatności</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>

</html>