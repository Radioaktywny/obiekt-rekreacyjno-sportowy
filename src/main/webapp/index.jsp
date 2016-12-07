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
                <li><a href="#content-home"><img src="resources/img/logo2.png"/></a></li>
            </ul>
        </div>

        <div class="col-lg-9 col-md-9 navbar-right" style="height: 130px;">
            <div class="col-lg-4 col-lg-offset-8" style="height: 55px; padding-top: 10px;  padding-left: 45px;">
                <button id="userMenu1" class="btn btn-primary" type="button" style="background-color: #6666FF;">
                    <a href="/login" style="color: white"><span>Zaloguj się </span></a>
                </button>
                <button id="userMenu" class="btn btn-primary" type="button" style="background-color: #6666FF;">
                    <a href="/registration" style="color: white"><span>Zarejestruj się</span></a>
                </button>
            </div>
            <div class="col-lg-12" style="height: 65px;">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav nav-pills text-header  navbar-right">
                        <li role="presentation"><a href="#content-about-scroll">
                            <div style="color: black;">o nas</div>
                        </a></li>
                        <li role="presentation"><a href="#content-about">
                            <div style="color: black;">aktualności</div>
                        </a></li>
                        <li role="presentation"><a href="#content-work">
                            <div style="color: black;">cennik</div>
                        </a></li>
                        <li role="presentation"><a href="#content-contact">
                            <div style="color: black;">oferta</div>
                        </a></li>
                        <li role="presentation"><a href="#content-contact">
                            <div style="color: black;">kontakt</div>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="content-home">
    <div class="container">
        <div class="row" style="height: 870px;">
            <div class="col col-md-7"></div>
            <div class="col col-md-5" style="padding-top: 300px">
                <h1 class="text-center" style="font-family: 'Audiowide', cursive; color: black; font-size: 50px">Trenuj
                    z nami!</h1>
                <h3 class="text-center" style="font-family: 'Audiowide', cursive; color: black; font-size: 30px">Twoje
                    centrum sportowe</h3><br/>
                <div class="col-sm-10 col-md-offset-3">
                    <button type="submit" class="btn btn-primary"
                            style="background-color: #6666FF; color: white;  font-size: 25px">Dołącz do nas
                    </button>
                </div>
            </div>
        </div>
        <div id="content-about-scroll" style="padding-top: 300px"
             data-scrollreveal="enter top and move 100px, wait 0.2s"></div>
    </div>
</div>
<div id="content-about">
    <div class="section-contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 text-center" style="padding-top: 70px;">
                    <div class="col-lg-3">
                        <img src="resources/img/localization-icon.png"/>
                    </div>
                    <div class="col-lg-9">
                        <h4>ul. Kapusiów 14<br/>30-384 Kraków</h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center" style="padding-top: 70px;">
                    <div class="col-lg-3">
                        <img src="resources/img/phone-icon.png"/>
                    </div>
                    <div class="col-lg-9">
                        <h4>e-mail: info@cascada.com.pl<br/>tel.: 12 262 76 45, 12 262 76 46</h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="col-lg-3" style="padding-top: 70px;">
                        <img src="resources/img/open-icon.png"/>
                    </div>
                    <div class="col-lg-9" style="padding-top: 30px;">
                        <h6>Basen, sauna, fitness, solarium</h6>
                        <h4>Pn - Pt: 10:00 - 22:00<br/>Sb - Nd: 9:00 - 21:00</h4>
                        <h6>Siłownia, tenis, squash, tenis stołowy, sala sportowa</h6>
                        <h4>Pn - Nd: 6:00 - 22:00</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="aboutUs">
            <div style="height: 100px; padding-left: 30px">
                <h1 style="font-weight: bold; font-family: 'Play', sans-serif;">O nas</h1>
            </div>
        </div>
        <div class="aboutUsButtons" data-scrollreveal="enter left and move 100px, wait 0.4s">
            <div class="col-lg-3" style="height: 600px; ">
                <div id="aboutUsButton" class="col-lg-12">
                    <a href="#aboutUsContent_1" onclick="showContent_1();" style=" text-decoration: none;">
                        <h1 style="color: white;  text-align: center;">Opis</h1>
                    </a>
                </div>
                <div id="aboutUsButton" class="col-lg-12" style="margin-top: 10px">
                    <a href="#aboutUsContent_2" onclick="showContent_2();" style=" text-decoration: none;">
                        <h1 style="color: white; text-align: center;">Galeria</h1>
                    </a>
                </div>
            </div>
        </div>
        <div id="aboutUsContent_1" data-scrollreveal="enter right and move 100px, wait 0.4s">
            <div class="col-lg-9" style="height: 600px; font-size: 15px;">
                <p style="text-align:justify">Jesteśmy nowoczesnym oraz dynamicznie rozwijającym się Centrum. Nasze
                    15-letnie doświadczenie oparte jest na potrzebach naszych Klientów, dlatego też przez te wszystkie
                    lata kształt i wizerunek Cascady zmieniał się wielokrotnie. Wszystkie zmiany miały na celu dążenie
                    do zaspokojenia potrzeb coraz większej i bardziej wymagającej grupy Klientów. Wiemy, że dla naszych
                    Klientów aktywny wypoczynek stał się przyjemnością, a przyjemność - stylem życia.</p>

                <p style="text-align:justify">Miła, kameralna atmosfera i profesjonalny personel sprawią, że poczują się
                    Państwo swobodnie, pełni energii do życia, zrelaksują umysł i ciało. Systematyczne korzystanie z
                    klimatyzowanych sal do ćwiczeń, nowej dwupoziomowej siłowni z innowacyjnym sprzętem, sauny suchej i
                    parowej, jacuzzi, basenu, kortów tenisowych, squasha, solarium oraz wielu innych uslug sprawią, że
                    poczują się Państwo szczuplejsi, zdrowsi, zadbani i dumni z własnych osiągnięć. Również z myślą o
                    naszych Klientach otworzyliśmy niedawno nowoczesne Day Spa.</p>

                <p style="text-align:justify">Wiemy, jak bardzo cenny jest Państwa czas, dlatego proponujemy bardzo
                    dogodne godziny funkcjonowania dwupoziomowej siłowni, tenisa, squasha czy sali sportowej: <strong>codziennie
                        od 6:00 do 22:00.</strong></p>

            </div>
        </div>
        <div id="aboutUsContent_2">

            <div class="col-lg-3 col-md-4 col-xs-6">
                <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="Basen sportowy"
                   data-caption="Takie baseny tylko u nas. Bez kitu lepszych nie ma" data-image="img/basen.jpg"
                   data-target="#image-gallery">
                    <img class="img-responsive" src="resources/img/basen.jpg" alt="Short alt text"/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="Hala tenisowa"
                   data-caption="Posiadamy profesjonalne boiska tenisowe z pełnym sprzętem tenisowym do wypożyczenia na miejscu"
                   data-image="img/tenis.jpg" data-target="#image-gallery">
                    <img class="img-responsive" src="resources/img/tenis.jpg" alt="A alt text"/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="Fitness"
                   data-caption="Zajecia fitness z naszymi trenerkami to czysty profesjonalizm. I te widoki ... oh eh"
                   data-image="img/fitness.jpg" data-target="#image-gallery">
                    <img class="img-responsive" src="resources/img/fitness.jpg" alt="A alt text"/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="Boiska siatkarskie"
                   data-caption="Posiadamy 3 nowoczesne boiska siatkarskie." data-image="img/siatka.jpg"
                   data-target="#image-gallery">
                    <img class="img-responsive" src="resources/img/siatka.jpg" alt="Another alt text"/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="Siłownia"
                   data-caption="Najnowocześniejszy sprzęt i nie tylko" data-image="img/silownia.jpg"
                   data-target="#image-gallery">
                    <img class="img-responsive" src="resources/img/silownia.jpg" alt="Short alt text"/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="Sauna"
                   data-caption="Oferujemy także korzystanie z klasycznych saun." data-image="img/sauna.jpg"
                   data-target="#image-gallery">
                    <img class="img-responsive" src="resources/img/sauna.jpg" alt="Another alt text"/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="Kickboxing"
                   data-caption="Treningi boksu z Adnrzejem Pałą to poziom światowy" data-image="img/boks.jpg"
                   data-target="#image-gallery">
                    <img class="img-responsive" src="resources/img/boks.jpg" alt="Another alt text"/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <a class="thumbnail" href="#" data-image-id="" data-toggle="modal"
                   data-title="Treningi Brazylijskiego Ju Jitsu"
                   data-caption="Oferujemy profesjonalne zajęcia bjj z byłymi zawodowcami" data-image="img/bjj.jpg"
                   data-target="#image-gallery">
                    <img class="img-responsive" src="resources/img/bjj.jpg" alt="Short alt text"/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6">
                <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="Aqua Dance"
                   data-caption="Zajęcia Aqua Dance dla osób w każdym wieku" data-image="img/aqua.jpg"
                   data-target="#image-gallery">
                    <img class="img-responsive" src="resources/img/aqua.jpg" alt="Another alt text"/>
                </a>
            </div>
        </div>
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

<div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     style="padding-top: 150px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="image-gallery-title"></h4>
            </div>
            <div class="modal-body">
                <img id="image-gallery-image" class="img-responsive" src=""/>
            </div>
            <div class="modal-footer">

                <div class="col-md-3">
                    <button type="button" class="btn btn-primary" id="show-previous-image">Poprzednie</button>
                </div>

                <div class="col-md-6 text-justify" id="image-gallery-caption">
                    This text will be overwritten by jQuery
                </div>

                <div class="col-md-3">
                    <button type="button" id="show-next-image" class="btn btn-default">Następne</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>