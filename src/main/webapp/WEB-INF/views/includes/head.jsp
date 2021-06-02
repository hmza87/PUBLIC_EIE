<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>


<!DOCTYPE html>


<html lang="ar">
<head>
    <style>
        .at{
            color:white !important;
        }

    </style>

    <meta charset="utf-8">
    <title>DE</title>
    <!-- Stylesheets -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/custom_blue.css" id="color_switcher">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/styleguru.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/icofont.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/themify-icons.css" >
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Responsive File -->
    <link href="${pageContext.request.contextPath}/assets/css/responsive.css" rel="stylesheet">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo_1.png" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo_1.png" type="image/x-icon">

    <!-- Responsive File -->
    <link href="${pageContext.request.contextPath}/assets/css/captcha.css" rel="stylesheet">


    <!-- sweetalert -->
    <link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css" rel="stylesheet">


    <!-- validate form -->
    <link href="${pageContext.request.contextPath}/assets/css/validationcss.css" rel="stylesheet">


    <!-- validate blue -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/custom_blue.css" id="color_switcher_log">

    <!--views jsp-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jsp/css/stockage.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jsp/css/stockage_affich.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jsp/css/custom.css" >



    <!-- select 2 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jsp/css/custom.css" >



    <!-- Responsive Settings -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!--[if lt IE 9]><script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script><![endif]-->
    <!--[if lt IE 9]><script src="${pageContext.request.contextPath}/assets/js/respond.js"></script><![endif]-->




    <!--   //datatable-->
    <link href="${pageContext.request.contextPath}/assets/css/datatable/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/datatable/responsive.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bs-stepper.min.css">


    <script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-stepper.min.js"></script>

</head>

<body style="overflow-x:hidden;">

<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">

<style>
    .header-style-one .other-links .language .lang-dropdown{
        left: 0 !important;
    }
    .inner-container.clearfix .nav-outer{
        float: right;
    }

    .inner-container.clearfix .other-links{
        float: left;
    }

    .main-menu .navigation > li{
        float: right;

    }
    .main-menu .navigation > li:last-child{
        margin-right: 30px !important;
    }

</style>

</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>

<div class="page-wrapper">
    <!-- Preloader -->
    <div class="preloader"><div class="icon"></div></div>

    <!-- Main Header -->
    <header class="main-header header-style-one">
        <!-- Header Top -->
        <div class="header-top header-top-one" style="background: #f8f9fa;" >
            <%--<div class="auto-container">--%>
            <%--<img alt="" src="${pageContext.request.contextPath}/assets/images/logopublic.png" style="max-height: 100px;--%>
            <%--width: 100%;">--%>

            <%--</div>--%>
            <div class="row" style="color: black ;text-align: center;height: 58px; max-height: 58px; !important;">

                <c:choose>
                    <c:when test="${pageContext.response.locale=='ar'}">
                        <div class="col-2 ">

                        </div>
                        <div class="col-8" style="text-align: center; font-weight: bold;font-style:oblique"><span id="TitrFr"><spring:message code="label.Systeme"/><br><spring:message code="label.Systemebr"/> </span><span style="display: none;font-family: initial;font-size: x-large;" id="TitrAr">نظام رقمنة المساطر المسلمة من طرف قطاع البيئة </span></div>
                        <div class="col-2 ">
                            <img alt="" src="${pageContext.request.contextPath}/assets/images/logoarabe.png" style="height: 60px;margin-top: -8px"  id="arlogo" >
                        </div>

                    </c:when>
                    <c:otherwise>

                        <div class="col-2 ">
                            <img alt="" src="${pageContext.request.contextPath}/assets/images/logo.png" style="height: 60px;
                        margin-top: -8px;" id="frlogo">
                        </div>
                        <div class="col-8" style="text-align: center; font-weight: bold;font-style:oblique"><span id="TitrFr"><spring:message code="label.Systeme"/><br><spring:message code="label.Systemebr"/> </span><span style="display: none;font-family: initial;font-size: x-large;" id="TitrAr">نظام رقمنة المساطر المسلمة من طرف قطاع البيئة </span></div>
                        <div class="col-2 ">
                        </div>
                    </c:otherwise>
                </c:choose>


            </div>

        </div>
        <!-- Header Upper -->
        <div class="header-upper" style="background: #7dc7bd;">
            <div class="auto-container" style="height:61px;">
                <div class="inner-container clearfix" >
                    <!--Logo-->


                    <!--Nav-->
                    <div class="nav-outer clearfix"  >
                        <!--Mobile Navigation Toggler-->
                        <div class="mobile-nav-toggler"><span class="icon flaticon-menu-1"></span></div>

                        <!-- Main Menu -->
                        <nav class="main-menu navbar-expand-md navbar-light">
                            <div class="collapse navbar-collapse show clearfix" id="navbarSupportedContent">
                                <ul class="navigation clearfix">
                                    <li class="current"><a href="/index" class="at"><spring:message code="label.Accueil"/></a>

                                    </li>
                                    <c:if test="${user.compteId != null}">
                                        <c:if test="${!user.st.etat.equals('2')   }">
                                            <li  class="dropdown"><a href="/api/ListeEIE_card" class="at"><spring:message code="label.Evaluationenvironnementale"/></a>
                                                <ul>
                                                    <li><a onclick="checkAut('${user.st.EIE}','/api/checkEIESelect/EE')"><spring:message code="label.Etudedimpactenvironnementale"/></a></li>
                                                     <li><a onclick="checkAut('${user.st.NT}','/api/checkEIESelect/NT')"><spring:message code="label.Noticedimpact"/></a></li>
                                                <li><a onclick="checkAut('${user.st.EA}','/api/checkEIESelect/AE')"><spring:message code="label.Auditenvironnementale"/></a></li>
                                                   
                                                </ul>
                                            </li>
                                        </c:if>
                                        <c:if test="${!user.st.etat.equals('1')  }">

                                            <li  class="dropdown"><a href="/api/ListeAutorisation_card/ZF/d" class="at"><spring:message code="label.Autorisationdesdechets"/></a>
                                                <ul>
                                                    <li><a onclick="checkAut('${user.st.ZF}','/api/checkUserDispatch/ZF')"><spring:message code="label.Importationdechetszonefranche"/></a></li>
                                                    <li><a onclick="checkAut('${user.st.ET}','/api/checkUserDispatch/ET')"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></a></li>
                                                        <%--<li><a href="/api/getListCollectTrans"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></li>--%>
                                                    <li><a onclick="checkAut('${user.st.CT}','/api/checkUserDispatch/CT')"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></li>

                                                    <li><a onclick="checkAut('${user.st.IT}','/api/checkUserDispatch/IT')"><spring:message code="label.Installationdetraitementdesdechets"/></a></li>
                                                    <li><a onclick="checkAut('${user.st.XD}','/api/checkUserDispatch/XD')"><spring:message code="label.Exportationdesdechetsdangereux"/> </a></li>
                                                    <li><a onclick="checkAut('${user.st.TR}','/api/checkUserDispatch/TR')"><spring:message code="label.Transitdesdechets"/></a></li>
                                                        <%-- <li><a href=""><spring:message code="label.Importationdesdechetsnonferreux"/></a></li> --%>
                                                </ul>
                                            </li>

                                        </c:if>
                                    </c:if>
                                    <c:if test="${user.compteId == null}">
                                        <li  class="dropdown"><a href="/connexion" class="at"><spring:message code="label.Evaluationenvironnementale"/></a>
                                            <ul>
                                                <li><a href="/connexion"><spring:message code="label.Etudedimpactenvironnementale"/></a></li>
                                                 <li><a href="/connexion"><spring:message code="label.Noticedimpact"/></a></li>
                                           <li><a href="/connexion"><spring:message code="label.Auditenvironnementale"/></a></li>
                                               
                                            </ul>
                                        </li>

                                        <li  class="dropdown"><a href="/connexion" class="at"><spring:message code="label.Autorisationdesdechets"/></a>
                                            <ul>
                                                <li><a href="/connexion"><spring:message code="label.Importationdechetszonefranche"/></a></li>
                                                <li><a href="/connexion"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></a></li>
                                                    <%--<li><a href="/api/getListCollectTrans"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></li>--%>
                                                <li><a href="/connexion"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></li>

                                                <li><a href="/connexion"><spring:message code="label.Installationdetraitementdesdechets"/></a></li>
                                                <li><a href="/connexion"><spring:message code="label.Exportationdesdechetsdangereux"/> </a></li>
                                                <li><a href="/connexion"><spring:message code="label.Transitdesdechets"/></a></li>
                                                    <%-- <li><a href=""><spring:message code="label.Importationdesdechetsnonferreux"/></a></li> --%>
                                            </ul>
                                        </li>
                                    </c:if>

                                    <li  class="dropdown"><a href="/index"  class="at"><spring:message code="label.Ressources"/></a>
                                        <ul>
                                            <li>
                                                <a href="/Preparezvotredemarche"><spring:message code="label.Preparezvotredemarche"/></a>
                                            </li>
                                            <li><a href="/guide" >Guide et Procédure</a></li>
                                            <li><a href="/videoList" >Vidéos</a></li>
                                            <li><a href="/faq" ><spring:message code="label.FA"/></a></li>
                                            <li><a href="/CatalogueDesDechet1" >Catalogue Des Déchet</a></li>
                                            <li><a href="/Actualite" >Actualite</a></li>
                                        </ul>
                                    </li>
                                    <li class=""><a href="/contact/0" class="at"><spring:message code="label.contact"/></a>



                                </ul>
                            </div>
                        </nav>
                    </div>

                    <!--Other Links-->
                    <div class="other-links clearfix" >
                        <!--Language-->
                        <div class="language">

                            <div class="lang-btn">
                                <span class="icon flaticon-worldwide-1"></span>
                                <c:if test="${pageContext.response.locale=='fr'}">
                                    <span class="txt" id="curntlng"><spring:message code="label.Francais"/></span>
                                </c:if>
                                <c:if test="${pageContext.response.locale=='ar'}">
                                    <span class="txt" id="curntlng"><spring:message code="label.Arabic"/></span>
                                </c:if>
                                <span class="arrow fa fa-angle-down"></span>
                            </div>

                            <div class="lang-dropdown" >
                                <ul>
                                    <li><a href="?lang=ar" id="choslng"><spring:message code="label.Arabic"/></a></li>
                                    <li><a href="?lang=fr" id="choslng"><spring:message code="label.Francais"/></a></li>

                                </ul>
                            </div>
                        </div>

                        <%--<div class="language" style="padding-left:30px">--%>
                        <%--<div class="lang-btn">--%>
                        <%--<span class="fa fa-cog"></span>--%>
                        <%--<span class="arrow fa fa-angle-down"></span>--%>
                        <%--</div>--%>
                        <%--<div class="lang-dropdown">--%>
                        <%--<ul>--%>
                        <%--<li>--%>
                        <%--<div class="flex_color">--%>
                        <%--<a href="javascript:void(0)" data-size="plus"  data-fontSize="13" id="changePlus" class="size_cog">A+</a>--%>
                        <%--<a href="javascript:void(0)" data-size="moins" data-fontSize="12" id="changeMoins" class="size_cog">A-</a>--%>
                        <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                        <%--<div class="flex_color" id="changeColor" style="margin: 6px 0">--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_blue" style="background:#2196f3"></a>--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_red"  style="background:#ED4C67"></a>--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_vert" style="background:#00d2d3"></a>--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_jaune"  style="background:#ff9f43"></a>--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_violet" style="background:#5f27cd"></a>--%>
                        <%--</div>--%>
                        <%--</li>--%>


                        <%--</ul>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <!--Social Links-->
                        <%--<div class="social-links-one">--%>
                        <%--<ul class="clearfix">--%>
                        <%--<li><a href="#" class="has-tooltip"><span class="fab fa-facebook-f"></span><div class="c-tooltip"><div class="tooltip-inner">Facebook</div></div></a></li>--%>
                        <%--<li><a href="#" class="has-tooltip"><span class="fab fa-twitter"></span><div class="c-tooltip"><div class="tooltip-inner">Twitter</div></div></a></li>--%>
                        <%--<li><a href="#" class="has-tooltip"><span class="fab fa-linkedin-in"></span><div class="c-tooltip"><div class="tooltip-inner">Linkedin</div></div></a></li>--%>
                        <%--</ul>--%>
                        <%--</div>--%>

                        <div class="language">
                            <c:if test="${(not empty user)}">
                                <div class="lang-btn">
                                    <span class="icon flaticon-user-2"></span>
                                    <span class="txt">${user.email==null?"":user.email}</span>
                                    <span class="arrow fa fa-angle-down"></span>
                                </div>
                                <c:if test="${user.email!=null}">
                                    <div class="lang-dropdown">
                                        <ul>
                                            <li><a href="/Mon_profil">Mon profil</a></li>
                                            <li><a href="/logout"><spring:message code="label.sedeconnecter"/></a></li>

                                        </ul>
                                    </div>
                                </c:if>
                            </c:if>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!--End Header Upper-->

        <!-- Sticky Header  -->
        <div class="sticky-header">
            <div class="auto-container clearfix">
                <!--Logo-->
                <div class="logo pull-left">
                    <a href="${pageContext.request.contextPath}/espace_client" title=""><img src="${pageContext.request.contextPath}/assets/images/sticky-logo.png" alt="" title=""></a>
                </div>
                <!--Right Col-->
                <div class="pull-right">
                    <!-- Main Menu -->
                    <nav class="main-menu clearfix">
                        <!--Keep This Empty / Menu will come through Javascript-->
                    </nav><!-- Main Menu End-->
                </div>
            </div>
        </div><!-- End Sticky Menu -->

        <!-- Mobile Menu  -->
        <div class="mobile-menu">
            <div class="menu-backdrop"></div>
            <div class="close-btn"><span class="icon flaticon-targeting-cross"></span></div>

            <nav class="menu-box">
                <div class="nav-logo"><a href="${pageContext.request.contextPath}/espace_client"><img src="${pageContext.request.contextPath}/assets/images/nav-logo.png" alt="" title=""></a></div>
                <div class="menu-outer"><!--Here Menu Will Come Automatically Via Javascript / Same Menu as in Header--></div>
                <!--Social Links-->
                <!-- <div class="social-links">
                    <ul class="clearfix">
                        <li><a href="#"><span class="fab fa-twitter"></span></a></li>
                        <li><a href="#"><span class="fab fa-facebook-square"></span></a></li>
                        <li><a href="#"><span class="fab fa-pinterest-p"></span></a></li>
                        <li><a href="#"><span class="fab fa-instagram"></span></a></li>
                        <li><a href="#"><span class="fab fa-youtube"></span></a></li>
                    </ul>
                </div> -->

                <div class="languageD ml-4" >
                    <hr style="background-color:white">
                    <div class="language">
                        <%-- <div class="lang-btn">
                            <span class="icon flaticon-worldwide-1"></span>
                          <c:if test="${pageContext.response.locale=='ar'}">
                          <span class="txt" id="curntlng"><spring:message code="label.Francais"/></span>
                          </c:if>
                           <c:if test="${pageContext.response.locale=='fr'}">
                          <span class="txt" id="curntlng"><spring:message code="label.Arabic"/></span>
                          </c:if>



                            <span class="arrow fa fa-angle-down"></span>
                        </div> --%>
                        <div class="lang-dropdown" >

                            <ul>

                                <li><a  style="color:white"href="?lang=ar" id="choslng"><spring:message code="label.Arabic"/></a></li>

                                <li><a   style="color:white"href="?lang=fr" id="choslng"><spring:message code="label.Francais"/></a></li>

                            </ul>
                        </div>
                    </div>
                    <hr style="background-color:white">
                    <div class="language">
                        <div class="lang-btn">
                            <!-- <span class="icon flaticon-user-2"></span> -->
                            <span class="txt">${user.email==null?"":user.email}</span>
                            <!--  <span class="arrow fa fa-angle-down"></span> -->
                        </div>
                        <c:if test="${user.email!=null}">
                            <div class="lang-dropdown">
                                <ul>
                                    <li><a  style="color:#FF3390;" href="/logout"><spring:message code="label.sedeconnecter"/></a></li>

                                </ul>
                            </div>
                        </c:if>

                    </div>
                </div>
            </nav>
        </div><!-- End Mobile Menu -->
    </header>
    <!-- End Main Header -->
    <!--Search Popup-->
    <div id="search-popup" class="search-popup">
        <div class="close-search theme-btn"><span class="flaticon-targeting-cross"></span></div>
        <div class="popup-inner">
            <div class="overlay-layer"></div>
            <div class="search-form">

                <div class="form-group">
                    <form action="/login" method="get">
                        <div style="color: white; text-align: -webkit-center;">


                            <label >Email  </label>
                            <input type="text" name="j_name" id="emailval" placeholder="Email" class="form-control" style="    width: 500px;">
                            <label >Mot de passe  </label>
                            <input type="password" name="j_pass" id="passwordval" placeholder="Mot de passe" class="form-control" style="    width: 500px;">
                            <button style="margin-top: 10px;" type="submit" class="btn btn-danger" ><spring:message code="button.Seconnecter"/></button>


                        </div>
                    </form>
                </div>



                <br>
                <br>
                <ul class="recent-searches">
                    <li><a href="#"><spring:message code="label.Motdepasseoublie"/></a></li>
                    <li><a href="/demandez_compte"><spring:message code="label.Demandezuncompte"/></a></li>

                </ul>

            </div>

        </div>
    </div>

    <div id="myModal" class="modal fade in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body justify-content-center">
                    <h4 class="text-center">Voulez-vous ajouter cette demande à votre profil ?</h4>
                    <i class="fa fa-info-circle" style="font-size: 80px; justify-content: center; display: flex; color: #f1c40f"></i>
                </div>
                <div class="modal-footer justify-content-center">
                    <div class="btn-group">
                        <button class="btn btn-danger" data-dismiss="modal"><span class="fa fa-times"></span> Non</button>
                        <a class="btn btn-primary at" href="/Mon_profil#comptes"> Oui <span class="fa fa-check"></span></a>
                    </div>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal-dalog -->
    </div>

    <script>

        function checkAut(checked, lien) {
            if (checked == 'on') {
                window.location = lien;
            } else {
                $("#myModal").modal('show');
            }
        }

        function changlogo()
        {

            $("#choslng").attr("onclick","changlogo2()");

            $("#arlogo").show();
            $("#frlogo").hide();
            $("#TitrAr").show();
            $("#TitrFr").hide();
            $("#curntlng").text("Arabic");
            $("#choslng").text("Français");


        }

        function changlogo2()
        {

            $("#choslng").attr("onclick","changlogo()");

            $("#arlogo").hide();
            $("#frlogo").show();
            $("#TitrAr").hide();
            $("#TitrFr").show();
            $("#curntlng").text("Français");
            $("#choslng").text("Arabic");

        }

        $(document).ready(function() {
            if(location.hash == "#comptes"){

                $([document.documentElement, document.body]).animate({
                    scrollTop: $("#comptes").offset().top
                }, 2000);

            }
        });
    </script></div>
