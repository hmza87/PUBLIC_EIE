<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<jsp:include page="../includes/head.jsp"/>

<style>

    .f_20 {
        font-size: 20px;
    }

    .f_28 {
        font-size: 28px;
    }

    .bcc {
        background: white !important;
        color: #036 !important;
        padding: 8px;
    }

    .ligne_white {
        height: 1px;
        background: white;
        width: 100%;
        margin-bottom: 5px;
    }

    .bg_stat_01 {
        background: linear-gradient(to right, #01a9ac, #01dbdf);
        color: white;
        padding: 0;
    }

    .bg_stat_02 {
        background: linear-gradient(to right, #0ac282, #0df3a3);
        color: white;
        padding: 0;
    }

    .paral {
        height: 500px;
        background-attachment: fixed;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }

    .paral p {
        font-size: 25px;
        color: white;
        text-align: center;
        margin-top: -20px;
        font-weight: bold;

    }

    .paral h1 {
        color: rgba(255, 255, 255, 0.8);
        font-size: 60px;
        text-align: center;
    / / padding-top: - 20 px;
        line-height: 100px;
    }

    .parallax {
        background-image: url("../../assets/images/parallax.png");
    }

    .frm_cal {
        background: aliceblue;
        border-radius: 3px;
        width: 100px;
        font-size: 14px;
        padding: 0px 5px;
    }

    .step:hover {
        width: auto;
        opacity: unset;
        cursor: unset;
    }

    .disp_none {
        display: none;
    }

    .timeline hr, .timeline .corner, .col-2::after {
        border-top: 3px solid green !important;
        border-right-color: green !important;
        border-bottom-color: green !important;
        border-left-color: green !important;
    }

    .circle {
        background-color: green !important;
    }

    .div_shadow {
        background: #7dc7bd;
        cursor: pointer;
        padding: 40px 0;
        border-radius: 24px;
        min-height: 200px;
    }

    .block_vert {
        color: #7dc7bd;
        font-size: 40px;
        padding: 15px;
    }

    .alice_blue {
        background: aliceblue;
    }

    .folder_icon {
        color: #7dc7bd;
        font-size: 27px;
    }

    img {
        max-width: 100%;
    }

    img:hover {
        opacity: 0.5;
        cursor: pointer;
    }

    /* CSS Grid*/
    .img-grid {
        display: grid;
        grid-template-columns: repeat(1, 1fr);
        grid-gap: 5px;
    }

    /* Media Query for changing grid on bigger screens*/

    /* Bigger than Phones(tablet) */
    @media only screen and (min-width: 750px) {
        .img-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    /* Bigger than Phones(laptop / desktop) */
    @media only screen and (min-width: 970px) {
        .img-grid {
            grid-template-columns: repeat(4, 1fr);
        }
    }


    .close {
        float: none;
        font-size: 2.5rem;
        font-weight: 700;
        line-height: 1;
        color: white;
        text-shadow: 0 1px 0 #fff;
        opacity: 0.8;
        margin-left: 10%;
    }

    .tree .container-fluid {
        padding-top: 15%;
        font-size: 13px;
        text-align: center;
    }

    /*#region Organizational Chart*/
    .tree * {
        margin: 0;
        padding: 0;
    }

    .tree ul {
        padding-top: 20px;
        position: relative;
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }

    .tree li {
        float: left;
        text-align: center;
        list-style-type: none;
        position: relative;
        padding: 20px 5px 0 5px;
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }

    /*We will use ::before and ::after to draw the connectors*/
    .tree li::before, .tree li::after {
        content: '';
        position: absolute;
        top: 0;
        right: 50%;
        border-top: 2px solid #696969;
        width: 50%;
        height: 20px;
    }

    .tree li::after {
        right: auto;
        left: 50%;
        border-left: 2px solid #696969;
    }

    /*We need to remove left-right connectors from elements without
    any siblings*/
    .tree li:only-child::after, .tree li:only-child::before {
        display: none;
    }

    /*Remove space from the top of single children*/
    .tree li:only-child {
        padding-top: 0;
    }

    /*Remove left connector from first child and
    right connector from last child*/
    .tree li:first-child::before, .tree li:last-child::after {
        border: 0 none;
    }

    /*Adding back the vertical connector to the last nodes*/
    .tree li:last-child::before {
        border-right: 2px solid #696969;
        border-radius: 0 5px 0 0;
        -webkit-border-radius: 0 5px 0 0;
        -moz-border-radius: 0 5px 0 0;
    }

    .tree li:first-child::after {
        border-radius: 5px 0 0 0;
        -webkit-border-radius: 5px 0 0 0;
        -moz-border-radius: 5px 0 0 0;
    }

    /*Time to add downward connectors from parents*/
    .tree ul ul::before {
        content: '';
        position: absolute;
        top: 0;
        left: 50%;
        border-left: 2px solid #696969;
        width: 0;
        height: 20px;
    }

    .tree li i {
        color: white !important;
    }

    .tree li .row {
        color: white !important;
    }

    .tree li a {
        border-radius: 50% !important;
        background-color: #7dc7bd !important;
        color: white;
        height: 100px;
        width: 200px;
        padding: 5px 10px;
        text-decoration: none;
        background-color: white;
        color: #8b8b8b;
        font-family: arial, verdana, tahoma;
        font-size: 11px;
        display: inline-block;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }

    /*Time for some hover effects*/
    /*We will apply the hover effect the the lineage of the element also*/
    .tree li a:hover, .tree li a:hover + ul li a {
        background: #cbcbcb;
        color: #000;
    }

    /*Connector styles on hover*/
    .tree li a:hover + ul li::after,
    .tree li a:hover + ul li::before,
    .tree li a:hover + ul::before,
    .tree li a:hover + ul ul::before {
        border-color: #94a0b4;
    }

    /*#endregion*/
</style>
<style>
    #etprow .timeline {
        height: 25px;
        margin-top: -1%;
    }

    .circle {
        padding: 0px 10px;
        border-radius: 50%;
        background-color: #ED8D8D;
        color: #fff;
        max-height: 30px;
        z-index: 2;
    }

    .how-it-works.row .col-2 {
        align-self: stretch;
    }

    .how-it-works.row .col-2::after {
        content: "";
        position: absolute;
        border-left: 3px solid #ED8D8D;
        z-index: 1;
    }

    .how-it-works.row .col-2.bottom::after {
        height: 50%;
        left: 50%;
        top: 50%;
    }

    .how-it-works.row .col-2.full::after {
        height: 100%;
        left: calc(50% - 3px);
    }

    .how-it-works.row .col-2.top::after {
        height: 50%;
        left: 50%;
        top: 0;
    }


    .timeline div {
        padding: 0;
        height: 40px;
    }

    .timeline hr {
        border-top: 3px solid #ED8D8D;
        margin: 0;
        top: 17px;
        position: relative;
    }

    .timeline .col-2 {
        display: flex;
        overflow: hidden;
    }

    .timeline .corner {
        border: 3px solid #ED8D8D;
        width: 100%;
        position: relative;
        border-radius: 15px;
    }

    .timeline .top-right {
        left: 50%;
        top: -50%;
    }

    .timeline .left-bottom {
        left: -50%;
        top: calc(50% - 3px);
    }

    .timeline .top-left {
        left: -50%;
        top: -50%;
    }

    .timeline .right-bottom {
        left: 50%;
        top: calc(50% - 3px);
    }


    span.icon-number {
        border: 2px solid;
        width: 30px !important;
        height: 30px !important;
        background: red;
        color: #fff;
        border-radius: 50%;
        line-height: 18px;
        font-family: 'Open Sans', sans-serif;
        padding-top: 5px;
        position: absolute;
        padding-left: 8px;
    }

    ul#myTab a {
        color: black;
    }

    .btn-success {
        background-color: #7dc7bd;
        border-color: #7dc7bd;
    }
</style>
<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option {
        text-align: right
    }    </style>
</c:if>
<c:if test="${pageContext.response.locale=='fr' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option {
        text-align: right
    }    </style>
</c:if>


<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .tab-pane {
            text-align: right;
            padding-right: 10px;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale=='fr' }">
    <style>
        .tab-pane {
            text-align: left;
            padding-left: 10px;
        }
    </style>
</c:if>
<div class="row">
    <div class="col-md-2">
    </div>
    <div class="col-md-8">
        <div class="container-fluid page-body-wrapper" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="main-panel">
                <!--  <div class="content-wrapper p-2">
                 <div id="carouselExampleIndicators" class="carousel card slide" data-ride="carousel">
                     <ol class=" carousel-indicators" >
                         <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active" style="background-color:gray;"></li>
                         <li data-target="#carouselExampleIndicators" data-slide-to="1"  style="background-color:gray;"></li>
                         <li data-target="#carouselExampleIndicators" data-slide-to="2"  style="background-color:gray;"></li>
                     </ol>
                     <div class="pl-5 pr-5 carousel-inner">
                         <div class="carousel-item active">

                             <img src="/assets/images/test2.png" alt="test">
                             <div style="height: 300px;text-align: center">

                                 <h3 class="pt-3" style="color: #4c5155">Présentation du systéme</h3>
                                 <div class="h5 col-auto">Systeme de dématérialisation des autorisations  <br>
                                     délivrées par le département de l'environnement</div>
                             </div>
                         </div>

                         <div class="carousel-item ">

                             <img src="/assets/images/test2.png" alt="test">
                             <div style="height: 300px;text-align: center">

                                 <h3 class="pt-3" style="color: #4c5155">Nouveau Systéme </h3>
                                 <div class="h5 col-auto"> de dématérialisation des autorisations  <br>
                                     délivrées par le département de l'environnement</div>
                             </div>
                         </div>
                         <div class="pl-5 pr-5 carousel-item">
                             <img src="/assets/images/test2.png" alt="test">
                             <div style="height: 300px;text-align: center">
                                 <h3 class="pt-3 upper-text" style="color: #4c5155">à partir de cette plateforme</h3>
                                 <div class="h5">vous avez la possibilité de déposé et de suivre <br>
                                     tous  vos demande d'autorisation <br>
                                     délivrées par le département de l'environnement</div>
                         </div>
                         </div>
                     </div>
                     <a style="background-color: #87939a;opacity: 1" class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                         <span class="sr-only">Previous</span>
                     </a>
                     <a  style="background-color: #87939a;opacity: 1" class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                         <span class="carousel-control-next-icon" aria-hidden="true"></span>
                         <span class="sr-only">Next</span>
                     </a>
                 </div>
                 </div> -->
                <div class="content-wrapper">
                    <div class="col-md-12 col-sm-12 pl-2 pr-2 mb-2" id="zone_rech">
                        <div class="border  rounded" style="height: 100%">
                            <div class="row p-0 m-0 mt-5">
                                <div class="col-2 ">
                                    <button id="btnprcd" style="background-color: #7dc7bd;color: white"
                                            class="btn disp_none" onclick="retsecmain()"><spring:message
                                            code="button.Precedent"/></button>
                                </div>
                                <div class="col-8 text-center text-underline">

<c:if test="${Preparezvotredemarche=='1' }">
                                    <h2 class="font-weight-700"><spring:message
                                            code="label.Preparezvotredemarche"/></h2>
</c:if>
<c:if test="${Preparezvotredemarche=='0' }">
                                    <h2 class="font-weight-700"><spring:message
                                            code="label.DeposerleDossier"/></h2>
</c:if>

                                </div>
                                <div class="col-2"></div>

                            </div>
                            <div class="row m-0 p-0 text-center mt-5 mb-5" id="sectmain">
                                <div class="col-6 d-block block_vert hvr-float-shadow"
                                     onclick="sectautoris_table_select('auth')">
                                    <div class="div_shadow rounded"
                                         style="border-top-right-radius: 3px !important; border-bottom-left-radius: 3px !important; border:1px solid gray;">
                                        <img src="/assets/images/arbre2.png" style=" width: 100px;
border-radius: 50%;
margin-bottom: 10px;">
                                        <h5 class="bcc">
                                            <spring:message code="label.AutorisationsdesDechets"/>
                                            <%--<spring:message code="label.aut" />--%>
                                        </h5>
                                    </div>

                                </div>
                                <div class="col-6 d-block block_vert hvr-float-shadow" onclick="sectautoris_table_select('EIE')">
                                    <div class="div_shadow rounded"
                                         style="border-bottom-right-radius: 3px !important;border-top-left-radius: 3px !important; border:1px solid gray;">
                                        <img src="/assets/images/Arb1.png" style=" width: 100px;
border-radius: 50%;
margin-bottom: 10px;">
                                        <h5 class="bcc"><spring:message code="label.EvaluationEnvironnementale"/></h5>
                                    </div>
                                </div>
                            </div>


                            <div class="row justify-content-center mt-4" id="zone_select">
                                <div class="col-md-8 col-sm-12 mt-4">
                                    <div id="slct1" class="text-center disp_none mb-4">
                                        <h4><i class="fa fa-recycle"></i> <spring:message
                                                code="label.Autorisations"/></h4>
                                        <select onchange="slct1()" id="slct1change" class="form-control select2"
                                                style="margin-top: 5%;width: 90%;margin-left: 5%;" ${dd}>
                                            <option><spring:message code="option.Choisir"/></option>
                                           
                                            <option value="1"><spring:message
                                                    code="option.Collectetransportdesdechetsdangereux"/></option>
                                            <option value="2"><spring:message
                                                    code="option.Importationdesdechetsnondangereuxdunpaysetranger"/></option>
                                            <option value="3"><spring:message
                                                    code="option.Installationdetraitementdesdechets"/></option>
                                            <option value="4"><spring:message
                                                    code="option.Importationdesdechetsnondangereudunezonefranche"/></option>
                                            <option value="5"><spring:message
                                                    code="option.Exportationdesdechetsedangereux"/></option>
                                            <option value="6"><spring:message code="option.TransitdesDechets"/></option>
                                            <option value="7"><spring:message
                                                    code="option.Demandedelicencedimportationdesdechetsnonferreux"/></option>
                                        </select>
                                    </div>

                                    <div id="slct2" class="text-center disp_none mt-4">
                                        <h4><i class="fa fa-tree"></i> <spring:message
                                                code="label.EvaluationEnvironnementale"/></h4>
                                        <select onchange="slct2()" id="slct2change" class="form-control select2"
                                                style="margin-top: 5%;width: 90%;margin-left: 5%;" ${dd}>
                                            <option><spring:message code="option.Choisir"/></option>
                                            <option value="0"><spring:message
                                                    code="option.EvaluationenvironnementalestrategiqueEES"/></option>
                                            <option value="1"><spring:message
                                                    code="option.Auditenvironnementale"/></option>
                                            <option value="2"><spring:message code="option.Noticedimpact"/></option>
                                            <option value="3"><spring:message
                                                    code="option.Etudedimpactenvironnementale"/></option>
                                        </select>
                                    </div>

                                </div>


                            </div>

                        </div>
                    </div>

                    <!--  debut  -->


                    <div class="col-12 pl-2 pr-2 mb-2">
                        <div class="row-fluid d-none border p-2" id="dev_step">
                            <p class="text-center h4 w-100 font_bold"><spring:message
                                    code="option.Procedureasuivrepourobtenir"/></p>
                            <div class="col-2 p-0">
                                <button class="btn btn-success btn-block" onclick="show_etape_normal()"><span
                                        class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/></button>
                            </div>
                            <div class="col-sm-12 p-4 mt-4">
                                <div class="row p-0 justify-content-center">

                                    <div class="col-12">
                                        <hr class="p_absolute_top">
                                        <div class="row p-0 justify-content-center">
                                            <div class="col-2 text-center">
                                                <button data-toggle="tooltip" data-placement="top"
                                                        title="Créer votre Compte"
                                                        class="p-3 rounded-circle btn btn-success btn_step_perso btn_step_perso1"
                                                        onclick="show_zone('z_compt',this)">
                                                    <img src="${pageContext.request.contextPath}/assets/images/cadnat.png">
                                                </button>
                                            </div>
                                            <div class="col-2 text-center">
                                                <button data-toggle="tooltip" data-placement="top"
                                                        title="Saisir votre demande"
                                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso2"
                                                        onclick="show_zone('saisie',this)">
                                                    <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                                </button>
                                            </div>
                                            <div class="col-2 text-center">
                                                <button data-toggle="tooltip" data-placement="top"
                                                        title="Attacher vos Fichier"
                                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                                        onclick="show_zone('attache',this)">
                                                    <img src="${pageContext.request.contextPath}/assets/images/attache_file.png">
                                                </button>
                                            </div>
                                            <div class="col-2 text-center">
                                                <button data-toggle="tooltip" data-placement="top"
                                                        title="Suivre votre demande"
                                                        class=" rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                                        onclick="show_zone('suivre',this)">
                                                    <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                                                </button>
                                            </div>
                                            <div class="col-2 text-center">
                                                <button data-toggle="tooltip" data-placement="top"
                                                        title="Recevoir votre document E-signé"
                                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                                        onclick="show_zone('recevoir',this)">
                                                    <img src="${pageContext.request.contextPath}/assets/images/img_doc_ok.png">
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row clss_hide mt-5 z_compt">
                                            <div class="col-12">
                                                <p class="text-success h-4 font_bold"><spring:message
                                                        code="label.jecreemoncompte"/></p>
                                                <p><spring:message code="label.IlvousfautauprealableCreerun"/> <a
                                                        href="/demandez_compte" class="h5 text-primary font_bold">
                                                    <spring:message code="label.SuivantA"/></a></p>
                                                <p><spring:message code="label.passeserontgeneres"/></p>
                                                <p><spring:message code="label.Votrecomptevavouspermettre"/></p>


                                            </div>
                                        </div>

                                        <div class="row clss_hide mt-5 saisie collapse">
                                            <div class="col-12">
                                                <p class="text-success h-4 font_bold"><spring:message
                                                        code="label.Jeremplisleformulairededemandedunumerodenotificationenligne"/></p>
                                                <p>
                                                    <img src="${pageContext.request.contextPath}/assets/images/warning.png"
                                                         style="width: 40px;margin-left: 10px"><spring:message
                                                        code="label.Pourdeposeunedemandedautorisationdimportationdes"/>
                                                </p>
                                                <p><spring:message code="label.Apreslacreationdevotrecompte"/>
                                                </p>
                                                <p><spring:message code="label.Alafinvousavezlapossibilite"/>
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row clss_hide mt-5 attache collapse">
                                            <div class="col-12">
                                                <p class="text-success h-4 font_bold"><spring:message
                                                        code="label.Jedeposemademandedautorisationd"/></p>
                                                <p><spring:message
                                                        code="label.apreslobtentiondunumerodefication"/>: </p>
                                                <p class="text-underline text-success font_bold"><spring:message
                                                        code="label.Lespieceafournir"/> :</p>

                                                <div id="accordion">
                                                    <h3><spring:message code="label.Cahierdecharge"/></h3>
                                                    <div>
                                                        <p><spring:message code="label.Maurismaurisante"/></p>
                                                    </div>
                                                    <h3><spring:message code="label.Documentdenotification"/></h3>
                                                    <div>
                                                        <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum
                                                            sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet,
                                                            mauris turpis porttitor velit, faucibus interdum tellus
                                                            libero ac justo. Vivamus non quam. In suscipit faucibus
                                                            urna. </p>
                                                    </div>
                                                    <h3><spring:message code="label.Documentdetransportmouvement"/></h3>
                                                    <div>
                                                        <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.
                                                            Quisque lobortis. Phasellus pellentesque purus in massa.
                                                            Aenean in pede. Phasellus ac libero ac tellus pellentesque
                                                            semper. Sed ac felis. Sed commodo, magna quis lacinia
                                                            ornare, quam ante aliquam nisi, eu iaculis leo purus
                                                            venenatis dui. </p>
                                                        <ul>
                                                            <li>List item one</li>
                                                            <li>List item two</li>
                                                            <li>List item three</li>
                                                        </ul>
                                                    </div>
                                                    <h3><spring:message code="label.GarantieFinanciere"/></h3>
                                                    <div>
                                                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus
                                                            et netus et malesuada fames ac turpis egestas. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices
                                                            posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                                                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
                                                            consequat lectus. Class aptent taciti sociosqu ad litora
                                                            torquent per conubia nostra, per inceptos himenaeos. </p>
                                                    </div>
                                                    <h3><spring:message
                                                            code="label.Copieducontratconcluentrelexportateur"/></h3>
                                                    <div>
                                                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus
                                                            et netus et malesuada fames ac turpis egestas. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices
                                                            posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                                                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
                                                            consequat lectus. Class aptent taciti sociosqu ad litora
                                                            torquent per conubia nostra, per inceptos himenaeos. </p>
                                                    </div>
                                                    <h3><spring:message
                                                            code="label.Documentdesanalysesphysicochimiquesdesdechets"/></h3>
                                                    <div>
                                                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus
                                                            et netus et malesuada fames ac turpis egestas. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices
                                                            posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                                                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
                                                            consequat lectus. Class aptent taciti sociosqu ad litora
                                                            torquent per conubia nostra, per inceptos himenaeos. </p>
                                                    </div>
                                                    <h3><spring:message
                                                            code="label.Attestationdacceptationdesdechetsde"/></h3>
                                                    <div>
                                                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus
                                                            et netus et malesuada fames ac turpis egestas. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices
                                                            posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                                                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
                                                            consequat lectus. Class aptent taciti sociosqu ad litora
                                                            torquent per conubia nostra, per inceptos himenaeos. </p>
                                                    </div>
                                                    <h3><spring:message
                                                            code="label.Copiedelautorisationdexploitationdelinstallation"/></h3>
                                                    <div>
                                                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus
                                                            et netus et malesuada fames ac turpis egestas. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices
                                                            posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                                                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
                                                            consequat lectus. Class aptent taciti sociosqu ad litora
                                                            torquent per conubia nostra, per inceptos himenaeos. </p>
                                                    </div>
                                                    <h3><spring:message
                                                            code="label.Copiedelautorisationdelnstallationpourlavalorisationdesdechetsdangereuxetdeleurelimination"/></h3>
                                                    <div>
                                                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus
                                                            et netus et malesuada fames ac turpis egestas. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices
                                                            posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                                                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
                                                            consequat lectus. Class aptent taciti sociosqu ad litora
                                                            torquent per conubia nostra, per inceptos himenaeos. </p>
                                                    </div>
                                                    <h3><spring:message
                                                            code="label.Assurancesurlaresponsabiliteciviledelinstallationdevalorisation"/></h3>
                                                    <div>
                                                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus
                                                            et netus et malesuada fames ac turpis egestas. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices
                                                            posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                                                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
                                                            consequat lectus. Class aptent taciti sociosqu ad litora
                                                            torquent per conubia nostra, per inceptos himenaeos. </p>
                                                    </div>
                                                    <h3><spring:message
                                                            code="label.Lautorisationdelacollecteetdutransportdes"/></h3>
                                                    <div>
                                                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus
                                                            et netus et malesuada fames ac turpis egestas. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices
                                                            posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                                                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
                                                            consequat lectus. Class aptent taciti sociosqu ad litora
                                                            torquent per conubia nostra, per inceptos himenaeos. </p>
                                                    </div>
                                                    <h3><spring:message
                                                            code="label.Declarationsurlhonneursurlexactitudedesinformationspresenteessignee"/>. </h3>
                                                    <div>
                                                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus
                                                            et netus et malesuada fames ac turpis egestas. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices
                                                            posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                                                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
                                                            consequat lectus. Class aptent taciti sociosqu ad litora
                                                            torquent per conubia nostra, per inceptos himenaeos. </p>
                                                    </div>
                                                </div>

                                                <p class="text-underline text-success font_bold mt-3"><spring:message
                                                        code="label.Acteurimpliqueetdelaisdetraitementparphase"/></p>

                                                <table class="table table-striped table-bordered table-hover my_table">
                                                    <thead class="bg_stat_01">
                                                    <tr>
                                                        <th><spring:message code="label.Statut"/></th>
                                                        <th><spring:message code="label.Acteur"/></th>
                                                        <th><spring:message code="label.Delais"/></th>
                                                        <th><spring:message code="label.Detail"/></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td><spring:message code="label.EnAttente"/></td>
                                                        <td><spring:message code="label.Ministere"/></td>
                                                        <td><spring:message code="label.jours"/></td>
                                                        <td><spring:message
                                                                code="label.Danscetteetapevotredossierestredirige"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><spring:message code="label.demandedecomplement"/></td>
                                                        <td><spring:message code="label.Demandeur"/></td>
                                                        <td> -</td>
                                                        <td><spring:message
                                                                code="label.Danscetteetapevotredossierestincomplet"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><spring:message code="label.AvisCommission"/></td>
                                                        <td><spring:message code="label.Commission"/></td>
                                                        <td><spring:message code="label.jours"/></td>
                                                        <td><spring:message code="label.leservicedecommission"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><spring:message code="label.Favorable"/></td>
                                                        <td><spring:message code="label.Ministere"/></td>
                                                        <td><spring:message code="label.jours"/></td>
                                                        <td><spring:message code="label.servicespecialise"/></td>
                                                    </tr>
                                                    </tbody>

                                                </table>

                                            </div>
                                        </div>

                                        <div class="row clss_hide mt-5 suivre collapse">
                                            <div class="col-12">
                                                <p class="text-success h-4 font_bold"><spring:message
                                                        code="label.Jefaislesuividemademandeenligne"/></p>
                                                <p><spring:message code="label.Vouspouvezsuivrelevolution"/></p>
                                                <p><spring:message code="label.Aussivousrecevrezegalement"/></p>
                                            </div>
                                        </div>

                                        <div class="row clss_hide mt-5 recevoir collapse">
                                            <div class="col-12">
                                                <p class="text-success h-4 font_bold"><spring:message
                                                        code="label.Jerecuperemondautorisation"/></p>
                                                <p><spring:message
                                                        code="label.Alafinduprocessusdutraitementdevotredemande"/>
                                                </p>
                                                <p><spring:message
                                                        code="label.Lautorisationdimportationdesdechetsdunezone"/></p>
                                                <p><spring:message
                                                        code="label.Lesautorisationsdimportationdesdechetsdunezonefranchenonret"/>.</p>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </div>
                        <div class="row-fluid border d-none" id="dev_list_slc">
                            <div class="col-12">
                                <c:if test="${Preparezvotredemarche=='1' }">
                                    <p class="h3 font_bold w-100 text-center p-4"><spring:message
                                            code="label.Preparezvotredemarche"/></p>
                                </c:if>
                                <c:if test="${Preparezvotredemarche=='0' }">
                                    <p class="h3 font_bold w-100 text-center p-4"><spring:message
                                            code="label.DeposerleDossier"/></p>
                                </c:if>
                            </div>
                            <div class="col-12 p-0 m-0  bg-light border">
                                <div class="row p-0 m-0">
                                    <div class="col-12 ">
                                        <p class="font_bold p-3 mb-0">
                                            <spring:message code="label.Jesouhaitefaireunedemandedautorisation"/> :
                                        </p>
                                    </div>

                                </div>
                            </div>


                            <div class="col-12 border">
                                <div class="row p-0 m-0 mt-3">
                                    <div class="col-md-4 col-sm-12">
                                        <div class="card w-100">
                                            <div class="card-body text-center">
                                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                                    <spring:message code="label.Importationdechetszonefranche"/></h6>
                                                <c:if test="${Preparezvotredemarche=='1' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="show_etape_perso('ZF')">
                                                        Details
                                                    </button>
                                                </c:if>
                                                <c:if test="${Preparezvotredemarche=='0' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="checkAut('${user.st.ZF}','/api/checkUserDispatch/ZF')">
                                                        Entrer
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-12">
                                        <div class="card w-100">
                                            <div class="card-body text-center">
                                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                                    <spring:message
                                                            code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></h6>


                                                <c:if test="${Preparezvotredemarche=='1' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="show_etape_perso('ET')">
                                                        Details
                                                    </button>

                                                </c:if>
                                                <c:if test="${Preparezvotredemarche=='0' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="checkAut('${user.st.ET}','/api/checkUserDispatch/ET')">
                                                        Entrer
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-12">
                                        <div class="card w-100">
                                            <div class="card-body text-center">
                                                <h6 style="min-height: 3.5em" class="card-title text-center ">
                                                    <spring:message
                                                            code="label.Collectetransportdesdechetsdangereux"/></h6>
                                                <c:if test="${Preparezvotredemarche=='1' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="show_etape_perso('CT')">
                                                        Details
                                                    </button>

                                                </c:if>
                                                <c:if test="${Preparezvotredemarche=='0' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="checkAut('${user.st.CT}','/api/checkUserDispatch/CT')">
                                                        Entrer
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row p-0 m-0 mt-3 mb-3">
                                    <div class="col-md-4 col-sm-12">
                                        <div class="card w-100">
                                            <div class="card-body text-center">
                                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                                    <spring:message
                                                            code="label.Installationdetraitementdesdechets"/></h6>

                                                <c:if test="${Preparezvotredemarche=='1' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="show_etape_perso('ZF')">
                                                        Details
                                                    </button>

                                                </c:if>
                                                <c:if test="${Preparezvotredemarche=='0' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="checkAut('${user.st.IT}','/api/checkUserDispatch/IT')">
                                                        Entrer
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-12">
                                        <div class="card w-100">
                                            <div class="card-body text-center">
                                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                                    <spring:message code="label.Exportationdesdechetsdangereux"/></h6>
                                                <c:if test="${Preparezvotredemarche=='1' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="show_etape_perso('ET')">
                                                        Details
                                                    </button>

                                                </c:if>
                                                <c:if test="${Preparezvotredemarche=='0' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="checkAut('${user.st.XD}','/api/checkUserDispatch/XD')">
                                                        Entrer
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-12">
                                        <div class="card w-100">
                                            <div class="card-body text-center">
                                                <h6 style="min-height: 3.5em" class="card-title text-center ">
                                                    <spring:message code="label.Transitdesdechets"/></h6>

                                                <c:if test="${Preparezvotredemarche=='1' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="show_etape_perso('CT')">
                                                        Details
                                                    </button>

                                                </c:if>
                                                <c:if test="${Preparezvotredemarche=='0' }">
                                                    <button class="btn btn-primary btn-sm"
                                                            onclick="checkAut('${user.st.TR}','/api/checkUserDispatch/TR')">
                                                        Entrer
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row-fluid border d-none" id="dev_list_slc2">
                            <div class="col-12">
                                <c:if test="${Preparezvotredemarche=='1' }">
                                    <p class="h3 font_bold w-100 text-center p-4"><spring:message
                                            code="label.Preparezvotredemarche"/></p>
                                </c:if>
                                <c:if test="${Preparezvotredemarche=='0' }">
                                    <p class="h3 font_bold w-100 text-center p-4"><spring:message
                                            code="label.DeposerleDossier"/></p>
                                </c:if>
                            </div>
                            <div class="col-12 p-0 m-0  bg-light border">
                                <div class="row p-0 m-0">
                                    <div class="col-12 ">
                                        <p class="font_bold p-3 mb-0">
                                            <c:if test="${Preparezvotredemarche=='1' }">
                                                <spring:message code="label.Jesouhaitefaireunedemandedautorisation"/> :
                                            </c:if>
                                            <c:if test="${Preparezvotredemarche=='0' }">
                                                Je souhaite faire la demande de :
                                            </c:if>
                                        </p>
                                    </div>

                                </div>
                            </div>


                            <div class="col-12 border">
                                <div class="row p-0 m-0 mt-3">
                                    <div class="col-md-4 col-sm-12">
                                        <div class="card w-100">
                                            <div class="card-body text-center">
                                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                                    <spring:message code="label.etudeimpactenvironnemental"/></h6>
                                                <button class="btn btn-primary btn-sm"
                                                        onclick="checkAut('${user.st.EIE}','/api/checkEIESelect/EE')">
                                                    Entrer
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-12">
                                        <div class="card w-100">
                                            <div class="card-body text-center">
                                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                                    <spring:message
                                                            code="label.Noticedimpact"/></h6>


                                                <button
                                                        onclick="checkAut('${user.st.NT}','/api/checkEIESelect/NT')"
                                                        class="btn btn-primary btn-sm">
                                                    Entrer
                                                </button>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-12">
                                        <div class="card w-100">
                                            <div class="card-body text-center">
                                                <h6 style="min-height: 3.5em" class="card-title text-center ">
                                                    <spring:message
                                                            code="label.Auditenvironnementale"/></h6>
                                                <button
                                                        onclick="checkAut('${user.st.EA}','/api/checkEIESelect/AE')"
                                                        class="btn btn-primary btn-sm">
                                                    Entrer
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12 pl-2 pr-2 disp_none mb-2" id="section_01">
                        <div class="border  rounded">
                            <div class="row">
                                <div class="col-2 m-2">
                                    <button id="btnprcd" style="background-color: #7dc7bd;color: white" class="btn"
                                            onclick="retsecmain2()"><spring:message code="button.Precedent"/></button>
                                </div>
                                <div class="col-8 col-xs-12 text-center m-2">
                                    <h4><spring:message code="label.ResultatdeRecherche"/></h4>
                                </div>
                                <div class="col-2 d-xs-none">
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-12">
                                    <div id="navss" style="display: none">
                                        <ul class="nav nav-tabs" id="myTab3" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home"
                                                   role="tab" aria-controls="home" aria-selected="true"><spring:message
                                                        code="label.DocumentRequis"/></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile"
                                                   role="tab" aria-controls="profile"
                                                   aria-selected="false"><spring:message code="label.Etape"/></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact"
                                                   role="tab" aria-controls="contact"
                                                   aria-selected="false"><spring:message
                                                        code="label.BaseJuridique"/></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="garant-tab" data-toggle="tab" href="#garant"
                                                   role="tab" aria-controls="garant"
                                                   aria-selected="false"><spring:message
                                                        code="label.GarantieFinanciere"/></a>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade show active" id="home" role="tabpanel"
                                                 aria-labelledby="home-tab"
                                                 style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; padding-left: 3%;overflow-y: scroll;height: 400px;">

                                                <div style="padding-top: 3%;"></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}; width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message code="label.DOCNotification"/> </a></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}; width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red"
                                                            class="fa fa-file-pdf"></i><spring:message
                                                            code="label.DOCMouvement"/> </a></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red"
                                                            class="fa fa-file-pdf"></i><spring:message
                                                            code="label.GarantieFinanciere"/> </a></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message code="label.Contrat"/> </a></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message code="label.AnalysesFichedidentificationDD"/>
                                                    </a></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message code="label.CAP"/> </a></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message
                                                                code="label.Autorisationdexploitationdelinstallation"/>
                                                    </a></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message code="label.Autorisationdelinstallation"/> </a>
                                                </div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message
                                                                code="label.AssurancedelaResponsabiliteCiviledelinstallation"/>
                                                    </a></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message code="label.AutorisationdeCollecteettransport"/>
                                                    </a></div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message
                                                                code="label.Declarationsurlhonneursurlexactitudedesinformationspresentees"/></a>
                                                </div>
                                                <div style="padding-right: ${pageContext.response.locale=='ar'?'20px':''};width: 100%;padding-bottom: 1%;">
                                                    <a href="#" style="font-size: 20px;color:black"> <i
                                                            style="color: red" class="fa fa-file-pdf"></i>
                                                        <spring:message code="label.Cahierdecharge"/> </a></div>

                                            </div>
                                            <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;"
                                                 id="profile" role="tabpanel" aria-labelledby="profile-tab">

                                                <img id="myImg" src="../../assets/images/organigramme.png">

                                            </div>


                                            <div class="tab-pane fade" id="contact" role="tabpanel"
                                                 aria-labelledby="contact-tab">
                                                <div style="margin-top: 3%;"></div>
                                            </div>
                                            <div style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'};;padding-left: 1%;overflow-y: scroll;height: 400px;"
                                                 class="tab-pane fade" id="garant" role="tabpanel"
                                                 aria-labelledby="garant-tab">

                                                <br/>
                                                <div style="background-color: #0c5460;color: white;padding-left: 1%;border: 1px solid black;">
                                                    <strong><spring:message
                                                            code="label.Modeleducautionnementoudelagarantiefinanciere"/></strong>
                                                </div>

                                                <p style="padding-left: 1%;border: 2px solid black;">
                                                    <spring:message code="label.Article"/><br/>
                                                    <spring:message code="label.utiliser"/>
                                                </p>
                                                <ul>
                                                    <li><spring:message code="label.transport"/></li>
                                                    <li><spring:message code="label.quantite"/></li>
                                                    <li><spring:message code="label.peuvent"/></li>
                                                    <li><spring:message code="label.devis"/></li>
                                                </ul>
                                                <div style="background-color: red;color: white;padding-left: 1%;border: 1px solid black;">
                                                    <strong style="color: #eaeaea">GF</strong> <spring:message
                                                        code="label.GF"/> <br/>

                                                    <strong style="color: #eaeaea">GF</strong> <spring:message
                                                        code="label.GFA"/> <br/>

                                                    <strong style="color: #eaeaea">CT</strong> <spring:message
                                                        code="label.CT"/> <br/>


                                                </div>
                                                <p style="padding-left: 1%;border: 2px solid black;">


                                                </p>

                                                <div style="background-color: red;color: white;padding-left: 1%;border: 1px solid black;">
                                                    <strong style="color: #eaeaea">CT</strong> <spring:message
                                                        code="label.CTA"/> <br/>

                                                    <%-- <div class="row-fluid mb-1">
                                                         <div class="col-sm-12 pl-0 ">
                                                             <strong style="color: #eaeaea">GF</strong> = <input value="0" min="0" class="frm_cal" width="20%" type="number" placeholder="CT" id="inp_ct">
                                                             + <input class="frm_cal" value="0" min="0" type="number" placeholder="CTR" id="inp_ctr"> + <input value="0" min="0" class="frm_cal" type="number" placeholder="Cs" id="inp_cs">
                                                             * <input class="frm_cal" value="0" min="0" type="number" placeholder="Q" id="inp_q"> * 1,2 &nbsp; <button class="btn btn-sm btn-success" onclick="calculer()">Calculer</button>
                                                             <br>
                                                             <span id="resultat_calcul" class="disp_none"><strong style="color: #eaeaea">GF</strong> = <p class="res d-inline" id="res">  </p></span>
                                                         </div>
                                                     </div>

                                                     <div class="row-fluid mb-1">
                                                         <div class="col-sm-12 pl-0 ">
                                                             <strong style="color: #eaeaea">CT</strong> = <input value="0" min="0" class="frm_cal" type="number" placeholder="Cu" id="inp_cu">
                                                             * <input class="frm_cal" value="0" min="0" type="number" placeholder="Q" id="inp_q2">
                                                             * <input value="0" min="0" class="frm_cal" type="number" placeholder="D" id="inp_d">
                                                             &nbsp; <button class="btn btn-sm btn-success" onclick="calculer2()">Calculer</button>
                                                             <br>
                                                             <span id="resultat_calcul2" class="disp_none"><strong style="color: #eaeaea">CT</strong> = <p class="res2 d-inline" id="res2">  </p></span>
                                                         </div>
                                                     </div>--%>
                                                </div>

                                                <br/>
                                                <p style="padding-left: 1%;border: 2px solid black;">
                                                    <strong style="color: green">CTR</strong><spring:message
                                                        code="label.CTR"/>
                                                </p>

                                                <p style="padding-left: 1%;border: 2px solid black;">
                                                    <strong style="color: green">CS</strong><spring:message
                                                        code="label.CS"/> : <spring:message
                                                        code="label.coutdestockage"/>
                                                </p>
                                                <p style="padding-left: 1%;border: 2px solid black;">
                                                    <strong style="color: green">Q</strong> : <spring:message
                                                        code="label.Quantitededechetstransferes"/>
                                                    <spring:message code="label.quantitededechetalaquantitetotale"/>
                                                </p>
                                                <br>
                                                <div style="background-color: red;color: white;padding-left: 1%;border: 1px solid black;">

                                                    <div class="row-fluid mb-1">
                                                        <div class="col-sm-12 pl-0 ">
                                                            <strong style="color: #eaeaea">CT</strong> = <input
                                                                value="0" min="0" class="frm_cal" type="number"
                                                                placeholder="Cu" id="inp_cu">
                                                            * <input class="frm_cal" value="0" min="0" type="number"
                                                                     placeholder="Q" id="inp_q2">
                                                            * <input value="0" min="0" class="frm_cal" type="number"
                                                                     placeholder="D" id="inp_d">
                                                            &nbsp;
                                                            <button class="btn btn-sm btn-success"
                                                                    onclick="calculer2()"><spring:message
                                                                    code="button.Calculer"/></button>
                                                            <br>
                                                            <span id="resultat_calcul2" class="disp_none"><strong
                                                                    style="color: #eaeaea;">CT</strong> = <p
                                                                    class="res2 d-inline" id="res2">  </p></span>
                                                        </div>
                                                    </div>

                                                    <div class="row-fluid mb-1">
                                                        <div class="col-sm-12 pl-0 ">
                                                            <strong style="color: #eaeaea"
                                                                    class="float-right">GF</strong> = <input value="0"
                                                                                                             min="0"
                                                                                                             class="frm_cal"
                                                                                                             width="20%"
                                                                                                             type="number"
                                                                                                             placeholder="CT"
                                                                                                             id="inp_ct">
                                                            + <input class="frm_cal" value="0" min="0" type="number"
                                                                     placeholder="CTR" id="inp_ctr"> + <input value="0"
                                                                                                              min="0"
                                                                                                              class="frm_cal"
                                                                                                              type="number"
                                                                                                              placeholder="Cs"
                                                                                                              id="inp_cs">
                                                            * <input class="frm_cal" value="0" min="0" type="number"
                                                                     placeholder="Q" id="inp_q"> * 1,2 &nbsp;
                                                            <button class="btn btn-sm btn-success" onclick="calculer()"
                                                                    style="margin-top: 10px"><spring:message
                                                                    code="button.Calculer"/></button>
                                                            <br>
                                                            <span id="resultat_calcul" class="disp_none"><strong
                                                                    style="color: #eaeaea">GF</strong> = <p
                                                                    class="res d-inline" id="res">  </p></span>
                                                        </div>
                                                    </div>


                                                </div>

                                                <br/>
                                                <p style="padding-left: 1%;border: 2px solid black;"><spring:message
                                                        code="label.LescoutsretenussurpresentationdedevissontlibellesendirhamsTTC"/></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div id="navss3" style="display: none">
                                        <ul class="nav nav-tabs" id="myTab3" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="home-tab3" data-toggle="tab"
                                                   href="#home3" role="tab" aria-controls="home3"
                                                   aria-selected="true"><spring:message
                                                        code="label.DocumentRequis"/></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="profile-tab3" data-toggle="tab" href="#profile3"
                                                   role="tab" aria-controls="profile3"
                                                   aria-selected="false"><spring:message code="label.Etape"/></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="contact-tab3" data-toggle="tab" href="#contact3"
                                                   role="tab" aria-controls="contact3"
                                                   aria-selected="false"><spring:message
                                                        code="label.BaseJuridique"/></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="garant-tab3" data-toggle="tab" href="#garant3"
                                                   role="tab" aria-controls="garant3"
                                                   aria-selected="false"><spring:message
                                                        code="label.GarantieFinanciere"/></a>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade show active" id="home3" role="tabpanel"
                                                 aria-labelledby="home-tab3" overflow-y: scroll;height: 400px;
                                            ">

                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.CoordoneesduDemandeur"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.DeclarationDechetsdangereuxacollecterettransporter"/>
                                            </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copiedelacartenationaledidentite"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Assuranceresponsabilitecivile"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Attestationassurancemultirisque"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Activitedudetenteurgenerateur"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Engagementdexercerlesactivitesdecollecteetdetransport"/>
                                            </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdesmesurespreventivesetsanitaires"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Piecejustifiantlacapacitfinanciere"/></a></div>

                                        </div>
                                        <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;"
                                             id="profile3" role="tabpanel" aria-labelledby="profile-tab3">

                                            <img id="myImg" src="../../assets/images/etape3.png">

                                        </div>
                                        <div class="tab-pane fade" id="contact3" role="tabpanel"
                                             aria-labelledby="contact-tab3">
                                            <div style="margin-top: 3%;"></div>
                                        </div>
                                        <div style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'};;padding-left: 1%;overflow-y: scroll;height: 400px;"
                                             class="tab-pane fade" id="garant3" role="tabpanel"
                                             aria-labelledby="garant-tab3">

                                            <br/>
                                            <div style="background-color: #0c5460;color: white;padding-left: 1%;border: 1px solid black;">
                                                <strong><spring:message
                                                        code="label.Modeleducautionnementoudelagarantiefinanciere"/></strong>
                                            </div>

                                            <p style="padding-left: 1%;border: 2px solid black;">
                                                <spring:message code="label.Article"/><br/>
                                                <spring:message code="label.utiliser"/>
                                            </p>
                                            <ul>
                                                <li><spring:message code="label.transport"/></li>
                                                <li><spring:message code="label.quantite"/></li>
                                                <li><spring:message code="label.peuvent"/></li>
                                                <li><spring:message code="label.devis"/></li>
                                            </ul>
                                            <div style="background-color: red;color: white;padding-left: 1%;border: 1px solid black;">
                                                <strong style="color: #eaeaea">GF</strong> <spring:message
                                                    code="label.GF"/> <br/>

                                                <strong style="color: #eaeaea">GF</strong> <spring:message
                                                    code="label.GFA"/> <br/>

                                                <strong style="color: #eaeaea">CT</strong> <spring:message
                                                    code="label.CT"/> <br/>


                                            </div>
                                            <p style="padding-left: 1%;border: 2px solid black;">


                                            </p>

                                            <div style="background-color: red;color: white;padding-left: 1%;border: 1px solid black;">
                                                <strong style="color: #eaeaea">CT</strong> <spring:message
                                                    code="label.CTA"/> <br/>

                                                <%-- <div class="row-fluid mb-1">
                                                     <div class="col-sm-12 pl-0 ">
                                                         <strong style="color: #eaeaea">GF</strong> = <input value="0" min="0" class="frm_cal" width="20%" type="number" placeholder="CT" id="inp_ct">
                                                         + <input class="frm_cal" value="0" min="0" type="number" placeholder="CTR" id="inp_ctr"> + <input value="0" min="0" class="frm_cal" type="number" placeholder="Cs" id="inp_cs">
                                                         * <input class="frm_cal" value="0" min="0" type="number" placeholder="Q" id="inp_q"> * 1,2 &nbsp; <button class="btn btn-sm btn-success" onclick="calculer()">Calculer</button>
                                                         <br>
                                                         <span id="resultat_calcul" class="disp_none"><strong style="color: #eaeaea">GF</strong> = <p class="res d-inline" id="res">  </p></span>
                                                     </div>
                                                 </div>

                                                 <div class="row-fluid mb-1">
                                                     <div class="col-sm-12 pl-0 ">
                                                         <strong style="color: #eaeaea">CT</strong> = <input value="0" min="0" class="frm_cal" type="number" placeholder="Cu" id="inp_cu">
                                                         * <input class="frm_cal" value="0" min="0" type="number" placeholder="Q" id="inp_q2">
                                                         * <input value="0" min="0" class="frm_cal" type="number" placeholder="D" id="inp_d">
                                                         &nbsp; <button class="btn btn-sm btn-success" onclick="calculer2()">Calculer</button>
                                                         <br>
                                                         <span id="resultat_calcul2" class="disp_none"><strong style="color: #eaeaea">CT</strong> = <p class="res2 d-inline" id="res2">  </p></span>
                                                     </div>
                                                 </div>--%>
                                            </div>

                                            <br/>
                                            <p style="padding-left: 1%;border: 2px solid black;">
                                                <strong style="color: green">CTR</strong><spring:message
                                                    code="label.CTR"/>
                                            </p>

                                            <p style="padding-left: 1%;border: 2px solid black;">
                                                <strong style="color: green">CS</strong><spring:message
                                                    code="label.CS"/> : <spring:message code="label.coutdestockage"/>
                                            </p>
                                            <p style="padding-left: 1%;border: 2px solid black;">
                                                <strong style="color: green">Q</strong> : <spring:message
                                                    code="label.Quantitededechetstransferes"/>
                                                <spring:message code="label.quantitededechetalaquantitetotale"/>
                                            </p>
                                            <br>
                                            <div style="background-color: red;color: white;padding-left: 1%;border: 1px solid black;">

                                                <div class="row-fluid mb-1">
                                                    <div class="col-sm-12 pl-0 ">
                                                        <strong style="color: #eaeaea">CT</strong> = <input value="0"
                                                                                                            min="0"
                                                                                                            class="frm_cal"
                                                                                                            type="number"
                                                                                                            placeholder="Cu"
                                                                                                            id="inp_cu">
                                                        * <input class="frm_cal" value="0" min="0" type="number"
                                                                 placeholder="Q" id="inp_q2">
                                                        * <input value="0" min="0" class="frm_cal" type="number"
                                                                 placeholder="D" id="inp_d">
                                                        &nbsp;
                                                        <button class="btn btn-sm btn-success" onclick="calculer2()">
                                                            <spring:message code="button.Calculer"/></button>
                                                        <br>
                                                        <span id="resultat_calcul2" class="disp_none"><strong
                                                                style="color: #eaeaea;">CT</strong> = <p
                                                                class="res2 d-inline" id="res2">  </p></span>
                                                    </div>
                                                </div>

                                                <div class="row-fluid mb-1">
                                                    <div class="col-sm-12 pl-0 ">
                                                        <strong style="color: #eaeaea" class="float-right">GF</strong> =
                                                        <input value="0" min="0" class="frm_cal" width="20%"
                                                               type="number" placeholder="CT" id="inp_ct">
                                                        + <input class="frm_cal" value="0" min="0" type="number"
                                                                 placeholder="CTR" id="inp_ctr"> + <input value="0"
                                                                                                          min="0"
                                                                                                          class="frm_cal"
                                                                                                          type="number"
                                                                                                          placeholder="Cs"
                                                                                                          id="inp_cs">
                                                        * <input class="frm_cal" value="0" min="0" type="number"
                                                                 placeholder="Q" id="inp_q"> * 1,2 &nbsp;
                                                        <button class="btn btn-sm btn-success" onclick="calculer()"
                                                                style="margin-top: 10px"><spring:message
                                                                code="button.Calculer"/></button>
                                                        <br>
                                                        <span id="resultat_calcul" class="disp_none"><strong
                                                                style="color: #eaeaea">GF</strong> = <p
                                                                class="res d-inline" id="res">  </p></span>
                                                    </div>
                                                </div>


                                            </div>

                                            <br/>
                                            <p style="padding-left: 1%;border: 2px solid black;"><spring:message
                                                    code="label.LescoutsretenussurpresentationdedevissontlibellesendirhamsTTC"/></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div id="navss4" style="display: none">
                                    <ul class="nav nav-tabs" id="myTab4" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab4" data-toggle="tab" href="#home4"
                                               role="tab" aria-controls="home4" aria-selected="true"><spring:message
                                                    code="label.DocumentRequis"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab4" data-toggle="tab" href="#profile4"
                                               role="tab" aria-controls="profile4" aria-selected="false"><spring:message
                                                    code="label.Etape"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab4" data-toggle="tab" href="#contact4"
                                               role="tab" aria-controls="contact4" aria-selected="false"><spring:message
                                                    code="label.BaseJuridique"/></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home4" role="tabpanel"
                                             aria-labelledby="home-tab4" style="overflow-y: scroll;height: 400px;">

                                            <div style="padding-top: 3%;"></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.DemandedelautoritenationaledelEtatdexploitation"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdenotification"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdetransport"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.GarantieFinanciere"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copieducontratconcluentrelexportateuretlimportateur"/></a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdesanalysesphysicochimiquesdesdechets"/></a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Cahierdecharge"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Autorisationdexploitationdesunitesdeproduction"/></a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.AssurancedelaResponsabiliteCiviledelinstallation"/></a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Listedesautoritescompetentes"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i><spring:message
                                                    code="label.Coutetcalculdumontantdelagarantiefinanciere"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Parcoursdelacharge"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Modesdevalorisfaationdesdechets"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Causesdelimportation"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i><spring:message
                                                    code="label.Declaration"/></a></div>

                                        </div>
                                        <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;"
                                             id="profile4" role="tabpanel" aria-labelledby="profile-tab4">

                                            <img id="myImg" src="../../assets/images/etape4.png">

                                        </div>


                                        <div class="tab-pane fade" id="contact4" role="tabpanel"
                                             aria-labelledby="contact-tab4">
                                            <div style="margin-top: 3%;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div id="navss5" style="display: none">
                                    <ul class="nav nav-tabs" id="myTab5" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab5" data-toggle="tab" href="#home5"
                                               role="tab" aria-controls="home5" aria-selected="true"><spring:message
                                                    code="label.DocumentRequis"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab5" data-toggle="tab" href="#profile5"
                                               role="tab" aria-controls="profile5" aria-selected="false"><spring:message
                                                    code="label.Etape"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab5" data-toggle="tab" href="#contact5"
                                               role="tab" aria-controls="contact5" aria-selected="false"><spring:message
                                                    code="label.BaseJuridique"/></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home5" role="tabpanel"
                                             aria-labelledby="home-tab5"
                                             stye="text-align: left;padding-left: 3%;overflow-y: scroll;height: 400px;">

                                            <div style="padding-top: 3%;"></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Demandesousformedeformulaire"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Informationssurlinstallationprojeteeetleursite"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Naturedesactivitesaexerceretlestypesetquantitesdesdechets"/>
                                            </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Prescriptionstechniquesetlesmodesdetraitement"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Precautionspourgarantirlesconditionsdesecurite"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Plandeterraincomportantlesbatimentsetlesinstallations"/></a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i><spring:message
                                                    code="label.Plandesitedelinstallationaveclaprecisiondelaffectationdesdifferenteszonesdeladite"/>
                                            </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Descriptiondelinstallation"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Descriptiondeprocedesdetraitementetdequipements"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Plandautocontroledegestiondelinstallation"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copiedeladecisiondacceptabiliteenvironnementale"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copiedelagarantiefinanciereviseealarticledelaloiprecitee"/></a>
                                            </div>

                                        </div>
                                        <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;"
                                             id="profile5" role="tabpanel" aria-labelledby="profile-tab5">

                                            <img id="myImg" src="../../assets/images/etape5.png">

                                        </div>


                                        <div class="tab-pane fade" id="contact5" role="tabpanel"
                                             aria-labelledby="contact-tab5">
                                            <div style="margin-top: 3%;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div id="navss6" style="display: none">
                                    <ul class="nav nav-tabs" id="myTab6" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab6" data-toggle="tab" href="#home6"
                                               role="tab" aria-controls="home6" aria-selected="true"><spring:message
                                                    code="label.DocumentRequis"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab6" data-toggle="tab" href="#profile6"
                                               role="tab" aria-controls="profile6" aria-selected="false"><spring:message
                                                    code="label.Etape"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab6" data-toggle="tab" href="#contact6"
                                               role="tab" aria-controls="contact6" aria-selected="false"><spring:message
                                                    code="label.BaseJuridique"/></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home6" role="tabpanel"
                                             aria-labelledby="home-tab6" style="overflow-y: scroll;height: 400px;">

                                            <div style="padding-top: 3%;"></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdenotification"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdetransportoudemouvement"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.GarantieFinanciere"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copieducontratconcluentrelexportateurdesdechetsetlimportateur"/>
                                            </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdesanalysesphysicochimiquesdesdechets"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Attestationdacceptationdesdechetsdelinstallationdevalorisation"/>
                                            </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i><spring:message
                                                    code="label.Copiedelautorisationdexploitationdelinstallation"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copiedelautorisationdelinstallation"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Assurancesurlaresponsabiliteciviledelinstallationdevalorisation"/>
                                            </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Lautorisationdelacollecteetdutransportdesdechets"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Cahierdescharges"/></a></div>

                                        </div>
                                        <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;"
                                             id="profile6" role="tabpanel" aria-labelledby="profile-tab6">

                                            <img id="myImg" src="../../assets/images/etape6.png">

                                        </div>


                                        <div class="tab-pane fade" id="contact6" role="tabpanel"
                                             aria-labelledby="contact-tab6">
                                            <div style="margin-top: 3%;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div id="navss7" style="display: none">
                                    <ul class="nav nav-tabs" id="myTab7" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab7" data-toggle="tab" href="#home7"
                                               role="tab" aria-controls="home7" aria-selected="true"><spring:message
                                                    code="label.DocumentRequis"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab7" data-toggle="tab" href="#profile7"
                                               role="tab" aria-controls="profile7" aria-selected="false"><spring:message
                                                    code="label.Etape"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab7" data-toggle="tab" href="#contact7"
                                               role="tab" aria-controls="contact7" aria-selected="false"><spring:message
                                                    code="label.BaseJuridique"/></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home7" role="tabpanel"
                                             aria-labelledby="home-tab7" style="overflow-y: scroll;height: 400px;">

                                            <div style="padding-top: 3%;"></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdenotification"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdetransport"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Motifsdexportation"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copiedelautorisationdexploitationdelinstallation"/></a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copieducontratentrelexportateurdesdechetsetlimportateur"/></a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Attestationdelaccordprealable"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Caracteristiquesdesdechets"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Descriptiondesmodalitesdeproductiondesdechets"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i><spring:message
                                                    code="label.GarantieFinanciere"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i><spring:message
                                                    code="label.Listedestransporteurs"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Parcoursdelacharge"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i><spring:message
                                                    code="label.D"/> </a></div>
                                        </div>
                                        <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;"
                                             id="profile7" role="tabpanel" aria-labelledby="profile-tab6">

                                            <img id="myImg" src="../../assets/images/etape7.png">

                                        </div>


                                        <div class="tab-pane fade" id="contact7" role="tabpanel"
                                             aria-labelledby="contact-tab7">
                                            <div style="margin-top: 3%;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div id="navss7" style="display: none">
                                    <ul class="nav nav-tabs" id="myTab7" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab7" data-toggle="tab" href="#home7"
                                               role="tab" aria-controls="home7" aria-selected="true"><spring:message
                                                    code="label.DocumentRequis"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab7" data-toggle="tab" href="#profile7"
                                               role="tab" aria-controls="profile7" aria-selected="false"><spring:message
                                                    code="label.Etape"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab7" data-toggle="tab" href="#contact7"
                                               role="tab" aria-controls="contact7" aria-selected="false"><spring:message
                                                    code="label.BaseJuridique"/></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home7" role="tabpanel"
                                             aria-labelledby="home-tab7" style="overflow-y: scroll;height: 400px;">

                                            <div style="padding-top: 3%;"></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdenotification"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Documentdetransport"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Motifsdexportation"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copiedelautorisationdexploitationdelinstallation"/></a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Copieducontratentrelexportateurdesdechetsetlimportateur"/></a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Attestationdelaccordprealable"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Caracteristiquesdesdechets"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Descriptiondesmodalitesdeproductiondesdechets"/> </a>
                                            </div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.GarantieFinanciere"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Listedestransporteurs"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Parcoursdelacharge"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.D"/> </a></div>
                                        </div>
                                        <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;"
                                             id="profile7" role="tabpanel" aria-labelledby="profile-tab7">

                                            <img id="myImg" src="../../assets/images/etape7.png">

                                        </div>


                                        <div class="tab-pane fade" id="contact7" role="tabpanel"
                                             aria-labelledby="contact-tab7">
                                            <div style="margin-top: 3%;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div id="navss8" style="display: none">
                                    <ul class="nav nav-tabs" id="myTab8" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab8" data-toggle="tab" href="#home8"
                                               role="tab" aria-controls="home8" aria-selected="true"><spring:message
                                                    code="label.DocumentRequis"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab8" data-toggle="tab" href="#profile8"
                                               role="tab" aria-controls="profile8" aria-selected="false"><spring:message
                                                    code="label.Etape"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab8" data-toggle="tab" href="#contact8"
                                               role="tab" aria-controls="contact8" aria-selected="false"><spring:message
                                                    code="label.BaseJuridique"/></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home8" role="tabpanel"
                                             aria-labelledby="home-tab8" style="overflow-y: scroll;height: 400px;">

                                            <div style="padding-top: 3%;"></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i><spring:message
                                                    code="label.Documentdenotification"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i><spring:message
                                                    code="label.Documentdetransport"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.devis"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Calculdelagarantiefinanciere"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Analyses"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Itineraires"/></a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Listedesautoritesdetransit"/></a></div>
                                        </div>
                                        <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;"
                                             id="profile8" role="tabpanel" aria-labelledby="profile-tab8">

                                            <img id="myImg" src="../../assets/images/etape8.png">

                                        </div>


                                        <div class="tab-pane fade" id="contact8" role="tabpanel"
                                             aria-labelledby="contact-tab8">
                                            <div style="margin-top: 3%;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div id="navss9" style="display: none">
                                    <ul class="nav nav-tabs" id="myTab9" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab9" data-toggle="tab" href="#home9"
                                               role="tab" aria-controls="home9" aria-selected="true"><spring:message
                                                    code="label.DocumentRequis"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab9" data-toggle="tab" href="#profile9"
                                               role="tab" aria-controls="profile9" aria-selected="false"><spring:message
                                                    code="label.Etape"/></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab9" data-toggle="tab" href="#contact9"
                                               role="tab" aria-controls="contact9" aria-selected="false"><spring:message
                                                    code="label.BaseJuridique"/></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home9" role="tabpanel"
                                             aria-labelledby="home-tab9" style="overflow-y: scroll;height: 400px;">

                                            <div style="padding-top: 3%;"></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.LettreduMinistereducommerceetdelIndustrie"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Licencedimportation"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.FacturePreforma"/> </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Certificatdenonradioactivitepourlesmetauxferreuxetnonferreux"/>
                                            </a></div>
                                            <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                        style="font-size: 20px;color:black">
                                                <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                    code="label.Engagementsurlhonneursigneetlegalise"/> </a></div>
                                        </div>
                                        <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;"
                                             id="profile9" role="tabpanel" aria-labelledby="profile-tab9">

                                            <img id="myImg" src="../../assets/images/etape9.png">

                                        </div>


                                        <div class="tab-pane fade" id="contact9" role="tabpanel"
                                             aria-labelledby="contact-tab9">
                                            <div style="margin-top: 3%;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-12 col-sm-12 pl-2 pr-2 disp_none mb-2" id="section_02">
                    <div class="border  rounded" style="height: 100%">
                        <div class="row">
                            <div class="col-2 m-2">
                                <button id="btnprcd" style="background-color: #7dc7bd;color: white" class="btn"
                                        onclick="retsecmain2()"><spring:message code="button.Precedent"/></button>
                            </div>
                            <div class="col-8 col-xs-12 text-center m-2">
                                <h4><spring:message code="label.ResultatdeRecherche"/></h4>
                            </div>
                            <div class="col-2 d-xs-none">
                            </div>
                        </div>
                        <div id="navss2" style="display: none">
                            <ul class="nav nav-tabs" id="myTab2" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active" id="doctab-tab2" data-toggle="tab" href="#doctab2"
                                       role="tab" aria-controls="doctab2" aria-selected="true"><spring:message
                                            code="label.DocumentRequis"/></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab2" data-toggle="tab" href="#profile2" role="tab"
                                       aria-controls="profile2" aria-selected="false"><spring:message
                                            code="label.Etape"/></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab2" data-toggle="tab" href="#contact2" role="tab"
                                       aria-controls="contact2" aria-selected="false"><spring:message
                                            code="label.BaseJuridique"/></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab2" data-toggle="tab" href="#contactt33"
                                       role="tab" aria-controls="contactt33" aria-selected="false">Directives</a>
                                </li>

                            </ul>
                            <div class="tab-content" id="myTabContent2">

                                <div class="tab-pane fade show  active" id="doctab2" role="tabpanel"
                                     aria-labelledby="doctab-tab2"
                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'};padding-left: 3%;overflow-y: scroll;height: 400px;">
                                    <div style="padding-top: 3%;"></div>
                                    <div style="padding-right: ${pageContext.response.locale=='ar'?'16px':''}; width: 100%;padding-bottom: 1%;">
                                        <a href="#" style="font-size: 20px;color:black"> <i style="color: red"
                                                                                            class="fa fa-file-pdf"></i>
                                            <spring:message code="label.EtudedimpactEnvironnementale"/> </a></div>
                                    <div style="padding-right: ${pageContext.response.locale=='ar'?'16px':''}; width: 100%;padding-bottom: 1%;">
                                        <a href="#" style="font-size: 20px;color:black"> <i style="color: red"
                                                                                            class="fa fa-file-pdf"></i>
                                            <spring:message code="label.Enquetepublique"/> </a></div>
                                </div>
                                <div class="tab-pane fade" style="overflow-y: scroll;height: 400px;" id="profile2"
                                     role="tabpanel" aria-labelledby="profile-tab2">

                                    <img id="myImg2" src="../../assets/images/diag2.png">

                                </div>
                                <div class="tab-pane fade" id="contact2" role="tabpanel" aria-labelledby="contact-tab2"
                                     style="scroll;height: 400px;">
                                    <c:if test="${pageContext.response.locale=='fr' }">
                                        <div style="padding-top: 3%;"></div>
                                        <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                    onclick="DownloadFile('Decret_n_2-04-563 relatif aux attributions et au fonctionnement du CNEI et des CREI.pdf')"
                                                                                                    style="font-size: 20px;color:black">
                                            <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                code="label.DecretRelatifAuxAttributions"/> </a></div>
                                        <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                    onclick="DownloadFile('Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.pdf')"
                                                                                                    style="font-size: 20px;color:black">
                                            <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                code="label.DecretFixantModalites"/> </a></div>
                                        <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                    onclick="DownloadFile('Loi n° 12-03 Relative aux études d\'impact sur l\'environnement.pdf')"
                                                                                                    style="font-size: 20px;color:black">
                                            <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                code="label.LoiRelativeEtudesImpact"/> </a></div>
                                        <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                    onclick="DownloadFile('Loi 49-17 Relative a l\'environnement.pdf')"
                                                                                                    style="font-size: 20px;color:black">
                                            <i style="color: red" class="fa fa-file-pdf"></i> Loi 49-17 Relative a
                                            l'evaluation environnementale </a></div>
                                    </c:if>
                                    <c:if test="${pageContext.response.locale=='ar' }">
                                        <div style="padding-top: 3%;"></div>
                                        <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                    onclick="DownloadFile('المرسوم التطبيقي 563.pdf')"
                                                                                                    style="font-size: 20px;color:black">
                                            <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                code="label.DecretRelatifAuxAttributionsE"/> </a></div>
                                        <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#"
                                                                                                    onclick="DownloadFile('ظهير حول دراسة التاثير على البيئة.pdf')"
                                                                                                    style="font-size: 20px;color:black">
                                            <i style="color: red" class="fa fa-file-pdf"></i> <spring:message
                                                code="label.DecretFixantModalitesE"/> </a></div>
                                    </c:if>
                                </div>

                                <div class="tab-pane fade" id="contactt33" role="tabpanel"
                                     aria-labelledby="contact-tab2" style="scroll;height: 400px;">

                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="row pl-2 pr-2" style="margin-bottom: 24px !important;">
                        <%-- <div class="pl-2 pr-2 col-md-6 text-center mb-2">
                            <c:if test="${user.email!=null}">
                                <div class="border rounded p-2">
                                        <i class="hp-box-icon fas fa-user pt-2" style="font-size: 5vw !important;"></i>
                                    <img src="/assets/images/cadnat.png" style=" width: 85px;">
                                    <h3>${ user.email}</h3>
                                    <form action="/login" method="get">
                                        <div style="margin-top: 5%;">

                                        </div>
                                        <div style="margin-top: 5%;">

                                            <a href="/logout" class="btn btn-success"> <i
                                                    class="fa fa-user-plus"></i> <spring:message
                                                    code="label.sedeconnecter"/></a>

                                        </div>
                                    </form>
                                </div>
                            </c:if>
                            <c:if test="${user.email==null}">
                                <div class="border rounded p-2">
                                        <i class="hp-box-icon fas fa-user pt-2" style="font-size: 5vw !important;"></i>
                                    <img src="/assets/images/cadnat.png" style=" width: 85px;">
                                    <h3><spring:message code="label.espacedemandeur"/></h3>
                                    <form action="/login" method="get">
                                        <div style="margin-top: 5%;">
                                            <c:choose>
                                                <c:when test="${pageContext.response.locale=='ar'}">
                                                    <input name="j_name" dir='rtl'
                                                           style="width: 95%;margin-left: 3%;" class="form-control"
                                                           type="text"
                                                           placeholder="<spring:message code="label.iden"/>">
                                                    <input name="j_pass" dir='rtl'
                                                           style="margin-top: 2%;width: 95%;margin-left: 3%;"
                                                           class="form-control" type="password"
                                                           placeholder=" <spring:message code="label.Password"/>">
                                                </c:when>
                                                <c:otherwise>
                                                    <input name="j_name" style="width: 95%;margin-left: 3%;"
                                                           class="form-control" type="text"
                                                           placeholder="<spring:message code="label.iden"/>">
                                                    <input name="j_pass"
                                                           style="margin-top: 2%;width: 95%;margin-left: 3%;"
                                                           class="form-control" type="password"
                                                           placeholder=" <spring:message code="label.Password"/>">
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                        <div style="margin-top: 5%;">

                                            <button type="submit" class="btn btn-success mb-2"><i
                                                    class="fa fa-unlock"></i> <spring:message
                                                    code="button.Seconnecter"/></button>
                                            <a href="/demandez_compte" class="btn btn-success mb-2"> <i
                                                    class="fa fa-user-plus"></i><spring:message
                                                    code="label.Senregistrer"/></a>
                                        </div>
                                    </form>
                                </div>


                            </c:if>


                        </div> --%>
<%--<c:if test="${Preparezvotredemarche=='0' }">
                        <div class="border rounded pl-2 pr-2 col-md-12  text-center mb-2 alice_blue">
                            <!-- <div class="border  rounded p-2  alice_blue" style="position: relative;top: 50%;transform: translateY(-50%);"> -->
                            <div class="row p-0 m-0 mb-2 justify-content-center">
                                <div class="col-8 m-0 p-0 text-center">
                                    <h5 class="mt-3 pl-1">
                                        <div class="position-relative">
                                            <i class="fa fa-folder-open d-inline-block folder_icon"></i>
                                            <span><spring:message code="label.StatutduDossier"/></span>
                                        </div>
                                    </h5>
                                </div>
                            </div>

                            <div class=" row m-0 p-0">
                                <div class="col-12">
                                    <input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="text"
                                           placeholder="<spring:message code="label.VotreReferencesdossier"/>"
                                           class="form-control etatmain"
                                           name="num_notification" id="num_notifications">
                                    <span id="notifSt"></span>
                                    <button style="margin-bottom:10px !important;" class="btn btn-success etatmain mt-2"
                                            onclick="checknotifStatut()">
                                        <i class="fa fa-check-circle"></i> <spring:message
                                            code="button.VerifierVotreDossier"/></button>

                                    <div style="width: 90%;margin-left: 5%;display: none" id="retsecmainetat">
                                        <div style="width: 100%" id="alertetat" class="alert alert-danger"
                                             role="alert">
                                            <spring:message code="label.Resultatintrouvable"/>
                                        </div>
                                        <button onclick="retsecmainetat()"
                                                style="background-color: #7dc7bd;color: white" class="btn">
                                            <spring:message code="button.Precedent"/></button>
                                    </div>
                                </div>
                                <!-- </div> -->


                            </div>
                        </div>
</c:if>--%>
                    </div>
                </div>


                <%--  <div class="row">

                     <div id="ressources" class="w-100 pl-12 pr-12 mr-3 mt-4 " style="text-align:center">
                         <label style="border-bottom: 5px solid #7dc7bd8c;font-weight: bold;"><spring:message code="label.Resources"/></label>

                     </div> --%>

                <%-- <div class=" row p-0 m-0 ">

                    <div class="col-md-3 col-sm-3 hvr-float-shadow">
                        <div class="card widget-card-1">
                            <div class="card-block-small">
                                <a href="/guide">
                                    <c:choose>
                                        <c:when test="${pageContext.response.locale=='ar'}">
                                            <img src="${pageContext.request.contextPath}/assets/images/Arabe توجيه وإجراءات.gif">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/assets/images/Guide et procedure.gif" class="step" />
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 hvr-float-shadow">
                        <div class="card widget-card-1">
                            <div class="card-block-small">
                                <a href="/videoList">
                                    <c:choose>
                                        <c:when test="${pageContext.response.locale=='ar'}">
                                            <img src="${pageContext.request.contextPath}/assets/images/Arabe Video.png">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/assets/images/video.png" />
                                        </c:otherwise>
                                    </c:choose>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-3 hvr-float-shadow">
                        <div class="card widget-card-1">
                            <div class="card-block-small">
                                <a href="/faq">
                                    <c:choose>
                                        <c:when test="${pageContext.response.locale=='ar'}">
                                            <img src="${pageContext.request.contextPath}/assets/images/Arabe reponse.png">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/assets/images/question.png" />
                                        </c:otherwise>
                                    </c:choose>
                                </a>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-3 hvr-float-shadow">
                        <div class="card widget-card-1">
                            <div class="card-block-small">
                                <a href="/contact/0">
                                    <c:choose>
                                        <c:when test="${pageContext.response.locale=='ar'}">
                                            <img src="${pageContext.request.contextPath}/assets/images/Arabe Contactez-nous.png">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/assets/images/contact.png" />
                                        </c:otherwise>
                                    </c:choose>

                                </a>

                            </div>
                        </div>
                    </div>

                </ div>--%>

                <!--  statistique -->
                <%-- <div class="container" style="margin-top: 20px">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 text-center">
                            <label style="border-bottom: 5px solid #7dc7bd8c;font-weight: bold;"><spring:message code="label.Statistique"/></label>
                        </div>
                    </div>
                    <div class="mt-5 row justify-content-center border-bottom " id="counter">
                        <div class="col-md-4 col-sm-4 text-center border-right">
                            <p><span class="fas fa-user-check" style="font-size: 22px;color:#00e300"></span></p>
                            <div class="counter-value" data-count="2000">900</div>
                            <p><spring:message code="label.Nombredevisite"/></p>
                        </div>
                        <div class="col-md-4 col-sm-4 text-center border-right">
                            <p><span class="fas fa-wifi" style="font-size: 22px;color:#00e300" ></span></p>
                            <div class="counter-value" data-count="2000">4000</div>
                            <p><spring:message code="label.Nombredesutilisateursconnectees"/></p>
                        </div>
                        <div class="col-md-4 col-sm-4 text-center">
                            <p><span class="fas fa-user-shield" style="font-size: 22px;color:#00e300" ></span></p>
                            <div class="counter-value" data-count="2000">2000</div>
                            <p><spring:message code="label.Nombredesutilisateursinscrits"/></p>
                        </div>
                    </div>
                    <div class="row mt-2 justify-content-center" >
                        <div class="col-md-4 col-sm-6 text-center rounded bg_stat_01 m-2">
                            <div class="row mr-3 ml-3 mt-2">
                                <div class="col-md-6 col-sm-6 text-left p-2">
                                    <div class="counter-value f_20" data-count="2000">12000</div>
                                </div>
                                <div class="col-md-6 col-sm-6 text-right p-2">
                                    <span class="fas fa-user-check f_28"></span>
                                </div>
                            </div>
                            <hr class="ligne_white">
                            <p><spring:message code="label.Nombredautorisationdelivreeans"/></p>
                        </div>
                        <div class="col-md-4 col-sm-4 text-center rounded bg_stat_02 m-2 ">
                            <div class="row mr-3 ml-3 mt-2">
                                <div class="col-md-6 col-sm-6 text-left p-2">
                                    <div class="counter-value f_20" data-count="2000">16000</div>
                                </div>
                                <div class="col-md-6 col-sm-6 text-right p-2">
                                    <span class="fas fa-wifi f_28"></span>
                                </div>
                            </div>
                            <hr class="ligne_white">
                            <p><spring:message code="label.NombreEIEdelivreeans"/></p>
                        </div>

                    </div>
                </div> --%>


            </div>


            <!-- Fin statistique -->


            <div class="w-100 pl-12 pr-12 mr-3 " style="display:none;" id="idNp">
                <div class="col-md-6 col-xl-6">
                    <div class="card project-task">
                        <div class="card-header">
                            <div class="card-header-left ">
                                <h5><spring:message code="label.NombredautorisationparRegion"/></h5>
                            </div>
                            <div class="card-header-right">
                                <ul class="list-unstyled card-option">
                                    <li><i class="fa fa-map-marker  "></i></li>
                                    <li><i class="icofont icofont-maximize full-card"></i></li>
                                    <li><i class="icofont icofont-minus minimize-card"></i></li>
                                    <li><i class="icofont icofont-refresh reload-card"></i></li>
                                    <li><i class="icofont icofont-error close-card"></i></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-block p-b-10">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th><spring:message code="label.Region"/></th>
                                        <th><spring:message code="label.Nombre"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-blue d-inline-block text-center">F</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.FesMeknes"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0"
                                                     aria-valuemax="100" style="width:80%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-pink d-inline-block text-center">T</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.TangerTtouanAlHoceima"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">20</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-pink" role="progressbar" aria-valuemin="0"
                                                     aria-valuemax="100" style="width:60%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-yellow d-inline-block text-center">R</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.RabatSaleKenitra"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">80</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-yellow" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.BeniMellalKhenifra"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">80</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-blue d-inline-block text-center">C</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.CasablancaSettat"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">100</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.MarrakechSafi"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.DraaTafilalet"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">90</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.SoussMassa"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-pink d-inline-block text-center">G</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.GuelmimOuedNoun"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">40</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-pink d-inline-block text-center">L</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.LaayouneSakiaElHamra"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-blue d-inline-block text-center">D</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.DakhlaOuedEdDahab"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-6">
                    <div class="card project-task">
                        <div class="card-header">
                            <div class="card-header-left ">
                                <h5><spring:message code="label.NombredEIEparRegion"/></h5>
                            </div>
                            <div class="card-header-right">
                                <ul class="list-unstyled card-option">
                                    <li><i class="fa fa-map-marker  "></i></li>
                                    <li><i class="icofont icofont-maximize full-card"></i></li>
                                    <li><i class="icofont icofont-minus minimize-card"></i></li>
                                    <li><i class="icofont icofont-refresh reload-card"></i></li>
                                    <li><i class="icofont icofont-error close-card"></i></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-block p-b-10">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th><spring:message code="label.Region"/></th>
                                        <th><spring:message code="label.Nombre"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-blue d-inline-block text-center">F</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.FesMeknes"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">70</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0"
                                                     aria-valuemax="100" style="width:80%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-pink d-inline-block text-center">T</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.TangerTtouanAlHoceima"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">80</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-pink" role="progressbar" aria-valuemin="0"
                                                     aria-valuemax="100" style="width:60%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-yellow d-inline-block text-center">R</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.RabatSaleKenitra"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-yellow" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.BeniMellalKhenifra"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">80</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-blue d-inline-block text-center">C</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.CasablancaSettat"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">100</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.MarrakechSafi"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.DraaTafilalet"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">90</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.SoussMassa"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-pink d-inline-block text-center">G</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.GuelmimOuedNoun"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">40</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-pink d-inline-block text-center">L</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.LaayouneSakiaElHamra"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="task-contain">
                                                <h6 class="bg-c-blue d-inline-block text-center">D</h6>
                                                <p class="d-inline-block m-l-20"><spring:message
                                                        code="label.DakhlaOuedEdDahab"/></p>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="d-inline-block m-r-20">30</p>
                                            <div class="progress d-inline-block">
                                                <div class="progress-bar bg-c-green" role="progressbar"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100" style="width:50%">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- ici -->


        </section>

    </div>
</div>
</div>
</div>
</div>
<div class="col-md-2">
</div>

<div id="myModal" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body justify-content-center">
                <h4 class="text-center">Voulez-vous ajouter cette demande à votre profil ?</h4>
                <i class="fa fa-info-circle"
                   style="font-size: 80px; justify-content: center; display: flex; color: #f1c40f"></i>
            </div>
            <div class="modal-footer justify-content-center">
                <div class="btn-group">
                    <button class="btn btn-danger" data-dismiss="modal"><span class="fa fa-times"></span> Non
                    </button>
                    <a class="btn btn-primary at" href="/Mon_profil#comptes"> Oui <span
                            class="fa fa-check"></span></a>
                </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dalog -->
</div>

<div class="row p-0 m-0 bg-dark">
    <div class="col-12 p-0 m-0 text-center pt-2 pb-2">
        <footer>Twins &copy; Copyright 2021 Systeme de dématérialisation des autorisations délivrées par le ministère de
            l'energie,
            des mines et de l'environement Département de l'environnement
        </footer>
    </div>
</div>

</div>


<!-- The Modal -->
<div id="myModal" style="overflow-y: scroll;" class="modal">
    <span class="close">&times;</span>
    <img class="modal-content" id="img01">
    <div id="caption"></div>
</div>

<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the image and insert it inside the modal - use its "alt" text as a caption
    var img = document.getElementById("myImg");
    var img2 = document.getElementById("myImg2");
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
    img.onclick = function () {
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }
    img2.onclick = function () {
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }
</script>
<script>

    function checknotifStatut() {
        var numnotif = $("#num_notifications").val();

        if (numnotif == "") {
            return false;
        }
        $.ajax({
            type: "GET",

            url: "/checknotif_statu/" + numnotif,
            contentType: 'application/json; charset=utf-8',

            data: JSON.stringify(numnotif),

            success: function (response) {
                console.log(response);
                <c:if test="${pageContext.response.locale=='fr'}">
                if (response == "Aucune")
                    response = "Aucune Résultat";
                $("#notifSt").html("<div style='width: 100%' id='alertetat' class='alert alert-danger' role='alert'>" + response + "</div>");
                </c:if>
                <c:if test="${pageContext.response.locale=='ar'}">
                if (response == "Aucune")
                    response = "لا توجد نتيجة";
                $("#notifSt").html("<div style='width: 100%' id='alertetat' class='alert alert-danger' role='alert'>" + response + "</div>");
                </c:if>
            },
            error: function (response) {

                alert('Erreur ajout non effectué');

            }
        });
    }

    function checkAut(checked, lien) {
        if (checked == 'on') {
            window.location = lien;
        } else {
            $("#myModal").modal('show');
        }
    }

    function retsecmain() {
        $("#sectmain").show();
        $("#sectautoris").hide();
        $("#btnprcd").hide();

        $(".disp_none").hide();

    }

    function retsecmainetat() {
        $(".etatmain").show();
        $("#retsecmainetat").hide();
    }

    function retsecmain2() {
        $("#section_01").hide();
        $("#section_02").hide();
        $("#zone_rech").show();
        retsecmain();
    }

    function verifetat() {
        $(".etatmain").hide();
        $("#retsecmainetat").show();
    }

    function sectautoris() {

        $("#sectmain").hide();
        $("#sectautoris").show();
        $("#slct1").show();
        $("#slct2").hide();
        $("#navss").hide();
        $("#navss3").hide();
        $("#navss4").hide();
        $("#navss5").hide();
        $("#navss6").hide();
        $("#navss7").hide();
        $("#navss8").hide();
        $("#navss9").hide();
        $("#navss2").hide();
        $("#btnprcd").show();
    }


    function sectevaluation() {
        $("#sectmain").hide();
        $("#sectautoris").show();
        $("#slct2").show();
        $("#slct1").hide();
        $("#navss").hide();
        $("#navss2").hide();
        $("#navss3").hide();
        $("#navss4").hide();
        $("#navss5").hide();
        $("#navss6").hide();
        $("#navss7").hide();
        $("#navss8").hide();
        $("#navss9").hide();
        $("#btnprcd").show();
    }


    function slct1() {
        var selected = $("#slct1change").val();
        if (selected == 0) {
            $("#slct1").hide();
            $("#navss").show();
            $("#navss3").hide();
            $("#section_01").show();
            $("#zone_rech").hide();
        } else if (selected == 1) {
            $("#slct1").hide();
            $("#navss3").show();
            $("#navss").hide();
            $("#section_01").show();
            $("#zone_rech").hide();
        } else if (selected == 2) {
            $("#slct1").hide();
            $("#navss4").show();
            $("#navss3").hide();
            $("#navss").hide();
            $("#section_01").show();
            $("#zone_rech").hide();
        } else if (selected == 3) {
            $("#slct1").hide();
            $("#navss5").show();
            $("#navss4").hide();
            $("#navss3").hide();
            $("#navss").hide();
            $("#section_01").show();
            $("#zone_rech").hide();
        } else if (selected == 4) {
            $("#slct1").hide();
            $("#navss6").show();
            $("#navss5").hide();
            $("#navss4").hide();
            $("#navss3").hide();
            $("#navss").hide();
            $("#section_01").show();
            $("#zone_rech").hide();
        } else if (selected == 5) {
            $("#slct1").hide();
            $("#navss7").show();
            $("#navss6").hide();
            $("#navss5").hide();
            $("#navss4").hide();
            $("#navss3").hide();
            $("#navss").hide();
            $("#section_01").show();
            $("#zone_rech").hide();
        } else if (selected == 6) {
            $("#slct1").hide();
            $("#navss7").hide();
            $("#navss8").show();
            $("#navss6").hide();
            $("#navss5").hide();
            $("#navss4").hide();
            $("#navss3").hide();
            $("#navss").hide();
            $("#section_01").show();
            $("#zone_rech").hide();
        } else if (selected == 7) {
            $("#slct1").hide();
            $("#navss7").hide();
            $("#navss8").hide();
            $("#navss9").show();
            $("#navss6").hide();
            $("#navss5").hide();
            $("#navss4").hide();
            $("#navss3").hide();
            $("#navss").hide();
            $("#section_01").show();
            $("#zone_rech").hide();
        }
    }

    function slct2() {

        var selected = $("#slct2change").val();
        if (selected == 3) {
            $("#slct2").hide();
            $("#navss2").show();
            $("#section_02").show();
            $("#zone_rech").hide();
        }


    }

    function calculer() {
        var ct = $("#inp_ct").val();
        var ctr = $("#inp_ctr").val();
        var cs = $("#inp_cs").val();
        var q = $("#inp_q").val();

        if ((!ct && ct === "") || (!ctr && ctr === "") || (!cs && cs === "") || (!q && q === "")) {
            swal("un ou plusieurs champs sont vides");
            return false;
        }
        var total = 0;

        var sum = parseFloat(ct) + parseFloat(ctr) + parseFloat(cs);
        total = parseFloat(sum) * parseFloat(q) * 1.2;

        $("#resultat_calcul").removeClass("disp_none");
        $("#res.res").html("").append(total.toFixed(2));

    }


    function calculer2() {
        var cu = $("#inp_cu").val();
        var d = $("#inp_d").val();
        var q = $("#inp_q2").val();

        if ((!cu && cu === "") || (!d && d === "") || (!q && q === "")) {
            swal("un ou plusieurs champs sont vides");
            return false;
        }
        var total = 0;

        total = parseFloat(cu) * parseFloat(q) * parseFloat(d);

        $("#resultat_calcul2").removeClass("disp_none");
        $("#res2.res2").html("").append(total.toFixed(2));

    }


    // counter
    function lancer_counter() {
        $('.counter-value').each(function () {
            $(this).prop('Counter', 0).animate({
                Counter: $(this).text()
            }, {
                duration: 4000,
                easing: 'swing',
                step: function (now) {
                    $(this).text(Math.ceil(now).toLocaleString('en'));
                }
            });
        });
    }


    //test position pour lancer counter
    lancer_counter();


    function DownloadFile(fileName) {
        //Set the File URL.
        var url = "../../assets/pdf/" + fileName;

        //Create XMLHTTP Request.
        var req = new XMLHttpRequest();
        req.open("GET", url, true);
        req.responseType = "blob";
        req.onload = function () {
            //Convert the Byte Data to BLOB object.
            var blob = new Blob([req.response], {type: "application/octetstream"});

            //Check the Browser type and download the File.
            var isIE = false || !!document.documentMode;
            if (isIE) {
                window.navigator.msSaveBlob(blob, fileName);
            } else {
                var url = window.URL || window.webkitURL;
                link = url.createObjectURL(blob);
                var a = document.createElement("a");
                a.setAttribute("download", fileName);
                a.setAttribute("href", link);
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
            }
        };
        req.send();
    };

</script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../includes/footer1.jsp"/>
