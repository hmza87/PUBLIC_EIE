<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>
<%--<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>--%>
<style>

    * {
        box-sizing: border-box
    }

    .file_existe {
        position: absolute;
        bottom: 16%;
    }

    .tab {
        float: left;
        width: 20%;
    }

    .tablinks {
        width: 100% !important;
        text-align: left;
        margin-bottom: 3px;
    }

    .tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current "tab button" class */
    .tab button.active {
        background-color: red;
    }

    /* Style the tab content */
    table.table-bordered.dataTable th, table.table-bordered.dataTable td {
        font-size: 13px;
    }

    .display-grid {
        display: grid;
    }
    .main-panel{
        margin-top:150px;
    }

    .badge-danger {
        color: #fff !important;
        background-color: #dc3545 !important;
    }
</style>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <section class="services-section"
                     style="background-color: white; margin-top: 2%">
                <div class="col-12 mb-4">
                    <c:choose>
                        <c:when test="${type=='IT'}">
                            <spring:message code="label.Installationdetraitementdesdechets" var="p_page"/>
                        </c:when>
                        <c:when test="${type=='CT'}">
                            <spring:message code="label.Collectetransportdesdechetsdangereux" var="p_page"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                        </c:otherwise>
                    </c:choose>

                    <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                            <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-lg-12 grid-margin stretch-card cardstatistic"
                     id="pagereload">
                    <c:choose>
                        <c:when test="${(empty collect) || (typeRenouv=='R')}">
                            <c:set var="disabled" value="disabled"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="disabled" value=""/>
                        </c:otherwise>
                    </c:choose>

                    <div class="row p-0 m-0">
                        <div class="col-md-3 col-sm-12 pl-0 pr-0 mb-3">
                            <div class="">
                                <button class="tablinks  btn-primary btn"
                                        onclick="openCity(event, '1')" id="${collect.statut.id_statut_projet!=42?'defaultOpen':'Btn2'}" ${collect.statut.id_statut_projet==42 ?'disabled':''}>1.
                                    <%--<spring:message code="label.InformationdemandeurA"/>--%><spring:message code="label.Informationdudemandeur"/> </button>
                                <button class="tablinks btn-primary btn ${collect.statut.id_statut_projet==42?'':'my_tab'}" id="${collect.statut.id_statut_projet==42 && count!=0?'defaultOpen':'Btn2'}"  <c:if test="${id==0}"> ${disabled}</c:if>
                                        onclick="openCity(event, '2')" ${count==0?'disabled':''}><spring:message
                                        code="label.DonneesurlesvehiculesA"/><c:if test="${collect.statut.id_statut_projet==42 && count!=0}"><span class="text-right ml-5 badge badge-danger">Vérifier votre véhicule</span></c:if></button>
                                <button class="tablinks btn-primary btn ${collect.statut.id_statut_projet==42?'':'my_tab'}"  id="${collect.statut.id_statut_projet==42 && count==0 && not empty collect.codeTmp?'defaultOpen':'Btn3'}" <c:if test="${id==0}"> ${disabled}</c:if>
                                        onclick="openCity(event, '3')" ${empty collect.codeTmp?'disabled':''}><spring:message
                                        code="label.CatalogueA"/> <c:if test="${collect.statut.id_statut_projet==42 && not empty collect.codeTmp}"><span class="text-right ml-5 badge badge-danger">Vérifier votre Codes des déchets</span></c:if></button>
                                <button class="tablinks btn-primary btn ${collect.statut.id_statut_projet==42?'active':'my_tab'}" id="${collect.statut.id_statut_projet==42 && count==0 && empty collect.codeTmp && cpt!=0?'defaultOpen':'Btn4'}" ${cpt==0?'disabled':''}  <c:if test="${id==0}"> ${disabled}</c:if>
                                        onclick="openCity(event, '4')"><spring:message
                                        code="label.MespiecesA"/><c:if test="${collect.statut.id_statut_projet==42 && cpt!=0}"><span class="text-right ml-5 badge badge-danger">Vérifier votre Document</span></c:if></button>
                                <button class="tablinks btn-primary btn ${collect.statut.id_statut_projet==42?'':'my_tab montab'}" id="Btn5" disabled <c:if test="${id==0}"> ${disabled}</c:if>
                                        onclick="verif_champs_recap('4','CT','id_collecte','5')">5. <spring:message code="label.Recapitulation"/></button>
                            </div>
                        </div>
                        <div class="col-md-9 col-sm-12 pl-sm-3 pl-0  pr-sm-3 pr-0">
                            <div id="1" class="tabcontent">
                                <div class="row m-0 p-0 ">
                                    <div class="col-auto  pl-sm-3 pl-0">
                                        <h4 class="titre_abs "><%--<spring:message code="label.InformationDemandeurA"/>--%><spring:message code="label.Informationdudemandeur"/> </h4>
                                    </div>
                                </div>

                                <input type="hidden" name="id_collecte" value="${collect.id_collecte}" id="id_collecte">

                                <form id="formdemandeur" name="formdemandeur">


                                    <input type="hidden" name="id_compte" value="${user.compteId}">
                                    <c:choose>
                                        <c:when test="${(not empty collect) && collect.id_collecte!=0}">
                                            <input type="hidden" name="id_statut"
                                                   value="${(collect.statut.id_statut_projet==25 && typeRenouv=='N')?'19':collect.statut.id_statut_projet}">
                                            <input type="hidden" name="id_collecte_originale"
                                                   value="${collect.id_collecteOriginale}">
                                        </c:when>
                                        <c:otherwise>
                                            <%-- 1 == etat encours --%>
                                            <input type="hidden" name="id_statut" value="50">
                                            <input type="hidden" name="id_collecte_originale" value="0">
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>

                                        <c:when test="${typeRenouv=='R'}">
                                            <input type="hidden" name="type_renouvellement" value="2">
                                            <input type="hidden" name="delete_date_time" value="">

                                        </c:when>
                                        <c:when test="${typeRenouv=='N'}">
                                            <c:choose>
                                                <c:when test="${(not empty collect) && collect.id_collecte!=0}">
                                                    <input type="hidden" name="type_renouvellement"
                                                           value="${collect.typeRenouvellement.id_type_renouvellement}">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="hidden" name="type_renouvellement" value="1">
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                    </c:choose>
                                    <div class="row m-0 p-0 mt-3 ">
                                        <c:if test="${typeRenouv=='R'}">
                                            <div class="col-md-12 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                                <div class="row p-0 m-0">
                                                    <div class="col-md-6 col-sm-12 p-0 m-0">
                                                        <div class="form-group">
                                                            <label><spring:message
                                                                    code="label.NumdelaDemanderenouvellerA"/> </label>
                                                            <input value="${collect.num_demande}" ${(not empty collect)?"disabled":""}
                                                                   class="form-control" type="text"
                                                                   onchange="getCollectRenouveller(this)">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:if>

                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label><spring:message code="label.RaisonsocialeA"/> </label>
                                                <input
                                                        value="${collect.raison}" type="text"
                                                        ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                        name="raison" id="raison" class="form-control">
                                            </div>
                                        </div>


                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label> IF : </label> <input value="${collect.idfiscale}"
                                                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                                             type="text" name="idfiscale" id="idfiscale"
                                                                             class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row m-0 p-0 ">
                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label><spring:message code="label.CINA"/> </label> <input
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    value="${collect.cin}" type="text"
                                                    name="cin" id="cin"
                                                    class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label><spring:message code="label.RepresantantA"/> </label> <input
                                                    type="text"
                                                    ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    value="${collect.demandeur_Nom}" name="demandeur_Nom"
                                                    id="demandeur_Nom" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-0 p-0 ">
                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label> <spring:message code="label.AdresseA"/></label> <input
                                                    value="${collect.demandeurAdresse}" type="text"
                                                ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}

                                                    name="demandeur_adresse" id="demandeur_adresse"
                                                    class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label> <spring:message code="label.TelephoneA"/> </label> <input
                                                    type="text"
                                                ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    value="${collect.demandeurTel}" name="demandeur_tel"
                                                    id="demandeur_tel" class="form-control">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row m-0 p-0">
                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label><spring:message code="label.FaxA"/> </label> <input
                                                    value="${collect.demandeurFax}"
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    type="text" name="demandeur_fax" id="demandeur_fax"
                                                    class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label> <spring:message code="label.EmailA"/> </label> <input
                                                    value="${collect.demandeurEmail}"
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    type="text" name="demandeur_email" id="demandeurEmail"
                                                    class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row justify-content-center mb-4">
                                        <div class="col-sm-3">
                                            <c:choose>
                                                <c:when test="${typeRenouv=='R'}">
                                                    <button type="button" id="Suivant"
                                                            onclick="updateGeneral('formdemandeur','collectetransporteur','2',${id},'id_collecte','non')"
                                                            class="btn btn-success mt-2 mb-4 btn-block">
                                                        <spring:message code="label.SuivantA"/> </label>
                                                            <%-- onclick="addObjectGeneral('formnotif','installation','','id_installation','2')" class="btn btn-success">Suivant --%>
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${id==0}">
                                                        <button type="button" id="Suivant"
                                                                onclick="addObjectGeneral('formdemandeur','collectetransporteur','','id_collecte','2')"
                                                                class="btn btn-success mt-2 mb-4 btn-block">
                                                            <spring:message code="label.SuivantA"/>
                                                                <%-- onclick="addObjectGeneral('formnotif','installation','','id_installation','2')" class="btn btn-success">Suivant --%>
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${id!=0}">
                                                        <button type="button" id="Suivant"
                                                                onclick="updateGeneral('formdemandeur','collectetransporteur','2',${id},'id_collecte','non')"
                                                                class="btn btn-success  mt-2 mb-4 btn-block">
                                                            <spring:message code="label.SuivantA"/></button>
                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>

                                    </div>
                                </form>

                            </div>
                            <div id="2" class="tabcontent">
                                <div class="row m-0 p-0 ">
                                    <div class="col-auto">
                                        <h4 class="titre_abs "><spring:message code="label.DonneeA"/></h4>
                                    </div>
                                </div>
                                <form id="formvehicule" name="formvehicule">
                                    <div class="row m-0 p-0 mt-3">
                                        <div class="col-md-4 col-sm-12">
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label><spring:message code="label.NombredeconteneursA"/> </label>
                                                    <input
                                                            class="form-control" lang="en" type="number" min="1"
                                                            name="nombre_conteneur"
                                                            value="${( (not empty collect.nombre_conteneur) && collect.nombre_conteneur!=0)?collect.nombre_conteneur:0 }">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                                <div class="row p-0 m-0">
                                    <div class="col-12 p-0 m-0" id="my_table">
                                        <div class="table-responsive">
                                            <table class="table table-bordered my_table">
                                                <thead>
                                                <tr>
                                                    <th><spring:message code="label.NMatriculation"/></th>
                                                    <th><spring:message code="label.NChassis"/></th>
                                                    <th><spring:message code="label.Poidstotalencharge"/></th>
                                                    <th><spring:message code="label.Poidsnetduvehicule"/></th>
                                                    <th><spring:message code="label.Typevehicule"/></th>
                                                    <th><spring:message code="label.typedeconteneursA"/></th>
                                                    <th style="min-width: 120px"><spring:message
                                                            code="label.Action"/></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:choose>
                                                    <c:when test="${(not empty collect.vehicules)}">
                                                        <c:forEach items="${collect.vehicules}" var="v">
                                                            <tr id="tr${v.id_vehicule}">
                                                                <td> ${v.num_mat_enrg_voit} - ${v.num_mat_enrg_auto}
                                                                    - ${v.num_mat_id_prefect}</td>
                                                                <td>${v.num_chassis}</td>
                                                                <td>${v.poit_totale_charge}</td>
                                                                <td>${v.point_net}</td>
                                                                <td>${v.typeVehicule}</td>
                                                                <td>${v.typeConteneur}</td>
                                                                <!--
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${not empty v.equipementSecurite}">
                                                                            <a href="${url_Admin}${fn:replace(v.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}"
                                                                               class="btn btn-primary rounded-circle">
                                                                                <span class="fa fa-download"></span>
                                                                            </a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            -
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="text-center">
                                                                    <a href="${url_Admin}${fn:replace(v.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}"
                                                                       class="btn btn-primary rounded-circle">
                                                                        <span class="fa fa-download"></span>
                                                                    </a>
                                                                </td>
                                                                -->
                                                                <td class="">
                                                                    <button class="btn btn-danger rounded-circle"
                                                                            onclick="deleteVehicule('${v.id_vehicule}')">
                                                                        <span class="fas fa-trash-alt"></span>
                                                                    </button>

                                                                    <button class="btn btn-warning rounded-circle"
                                                                            onclick="getVehicule('${v.id_vehicule}',this)">
                                                                        <span class="fas fa-pencil-alt"></span>
                                                                    </button>
                                                                    <c:if test="${v.commantaire!=null}">
                                                                        <div class="row mt-2">
                                                                            <div class="col" >
                                                                                <textarea rows="2" disabled class="form-control mb-0">${v.commantaire}</textarea>
                                                                            </div>
                                                                        </div>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <tr>
                                                            <td colspan="7" class="bg-primary text-center">
                                                                <spring:message
                                                                        code="label.Aucunvehiculedanscettedemande"/></td>
                                                        </tr>
                                                    </c:otherwise>
                                                </c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div id="zone_form" class=" col-12 p-0 m-0">
                                            <form id="add_vehicules" >
                                                <div class="row m-0 p-0">
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="f-14">
                                                                <spring:message code="label.NMatriculation"/>
                                                            </label>
                                                            <div class="row m-0 p-0">
                                                                <div class="col-sm-6 pl-0 pr-1">
                                                                    <input type="text" class="form-control" value="${vehicules.num_mat_enrg_voit}" name="num_mat_enrg_voit">
                                                                </div>
                                                                <div class="col-sm-2 pl-1 pr-1">
                                                                    <input type="text" class="form-control" value="${vehicules.num_mat_enrg_auto}" name="num_mat_enrg_auto">
                                                                </div>
                                                                <div class="col-sm-4 pl-1 pr-0">
                                                                    <input type="text" class="form-control" value="${vehicules.num_mat_id_prefect}" name="num_mat_id_prefect">
                                                                </div>
                                                            </div>
                                                            <input type="hidden" class="form-control" id="id_vehicule" value="${vehicules.id_vehicule}" name="id_vehicule">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="f-14">
                                                                <spring:message code="label.NChassis"/>
                                                            </label>
                                                            <input type="text" class="form-control" id="chassis" value="${vehicules.num_chassis}" name="num_chassis">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="f-14">
                                                                <spring:message code="label.Poidstotalencharge"/>
                                                            </label>
                                                            <input type="text" class="form-control" id="poidsTotal" value="${vehicules.poit_totale_charge}" name="poit_totale_charge">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="f-14">
                                                                <spring:message code="label.Poidsnetduvehicule"/>
                                                            </label>
                                                            <input type="text" class="form-control" id="poidsNet" value="${vehicules.point_net}" name="point_net">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.TypedevehiculesA"/> </label>
                                                            <input type="text" class="form-control" name="typeVehicule" value="${vehicules.typeVehicule}">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12">
                                                        <label> <spring:message code="label.typedeconteneursA"/> </label>
                                                        <input type="text" class="form-control" name="typeConteneur" value="${vehicules.typeConteneur}">
                                                    </div>
                                                    <input type="hidden" id="securiteEquip">
                                                    <input type="hidden" id="file">
                                                    <!--
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="f-14">
                                                                <spring:message code="label.Equipementdesecurite"/>
                                                            </label>
                                                            <input type="file" id="securiteEquip" class="form-control">
                                                            <c:if test="${not empty vehicules.equipementSecurite}">
                                                                <a href="${url_admin}${fn:replace(vehicules.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success" target="_blank" download="Equipement de securite">
                                                                    <span class="fa fa-download"></span>
                                                                </a>
                                                            </c:if>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="f-14">
                                                                <spring:message code="label.Attestationdassurance"/>
                                                            </label>
                                                            <input type="file" class="form-control" id="file">
                                                            <c:if test="${not empty vehicules.doc_assurance}">
                                                                <a href="${url_admin}${fn:replace(vehicules.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success" target="_blank" download="Equipement de securite">
                                                                    <span class="fa fa-download"></span>
                                                                </a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                -->
                                                </div>
                                                <div class="row justify-content-center">
                                                    <div class="col-md-3">
                                                        <button onclick="Save_vehicule('file','securiteEquip')" class="btn btn-primary btn-block"><spring:message code="button.enregistrerlevehicule"/></button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="row m-0 p-0 mt-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <c:choose>
                                                        <c:when test="${(not empty collect)}">
                                                            <c:set value="${collect.nombre_vehicule}" var="nbr_v"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set value="0" var="nbr_v"/>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <label><spring:message code="label.NombredeVehiculeA"/> </label>
                                                    <input class="form-control" type="text" readonly name="nombre_vehicule"
                                                           value="${nbr_v}">
                                                </div>
                                            </div>
                                            <%--<div class="col-md-2 col-sm-4 align-content-end display-grid pb-3">
                                                <button id="add_new" onclick="getVehicule('0')"
                                                        class="btn btn-success btn-block"><spring:message
                                                        code="label.jouterVehiculeA"/></button>
                                            </div>--%>
                                        </div>

                                    </div>

                                </div>



                                <div class="row justify-content-center  mb-5 mt-3">
                                    <div class="col-md-2 col-sm-4">
                                        <c:if test="${collect.statut.id_statut_projet!=42}">
                                            <button type="button"
                                                     onclick="openCity2('#defaultOpen', '1')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                        </c:if>
                                    </div>

                                    <div class="col-md-2 col-sm-4">
                                        <c:if  test="${collect.statut.id_statut_projet==42 && empty collect.codeTmp && cpt!=0}">
                                            <button type="button"
                                                    onclick="check_vehicule_ok('formvehicule','collectetransporteur','4',${id},'id_collecte','non')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="label.SuivantA"/></button>
                                        </c:if>
                                        <c:if  test="${collect.statut.id_statut_projet==42 && empty collect.codeTmp && cpt==0}">
                                            <a type="button"
                                                    onclick="changerStatutCT()";
                                                    class="btn btn-success btn-block">Enregistrer</a>
                                        </c:if>
                                        <c:if  test="${collect.statut.id_statut_projet==42 && not empty collect.codeTmp && cpt!=0}">
                                            <button type="button"
                                                    onclick="check_vehicule_ok('formvehicule','collectetransporteur','3',${id},'id_collecte','non')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="label.SuivantA"/></button>
                                        </c:if>
                                        <c:if  test="${collect.statut.id_statut_projet!=42}">
                                            <button type="button"
                                                    onclick="check_vehicule_ok('formvehicule','collectetransporteur','3',${id},'id_collecte','non')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="label.SuivantA"/></button>
                                        </c:if>
                                    </div>



                                </div>

                            </div>
                            <div id="3" class="tabcontent">
                                <div class="row m-0 p-0 ">
                                    <div class="col-auto">
                                        <h4 class="titre_abs "><spring:message code="label.CatalogueA"/></h4>
                                    </div>
                                </div>
                                <form id="formnotif" name="formnotif">
                                    <div class="row p-0">
                                        <div class="col-sm-8" id="zone_tableau">
                                            <table class="table table-striped" data-page-length="15">
                                                <thead>
                                                <tr>

                                                    <th scope="col" style="min-width: 100px"><spring:message
                                                            code="label.CodeA"/></th>
                                                    <th scope="col"><spring:message code="label.TypeA"/></th>
                                                    <th scope="col"><spring:message code="label.ValiderA"/></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${collect.statut.id_statut_projet!=42}">
                                                        <c:forEach items="${code}" var="c">

                                                            <c:set var="checked" value=""/>
                                                            <c:forEach items="${collect.code}" var="code_colle">
                                                                <c:if test="${code_colle.id_code==c.id_code}">
                                                                    <c:set var="checked" value="checked disabled"/>
                                                                </c:if>
                                                            </c:forEach>


                                                            <tr>
                                                                <td>${c.nom_fr }</td>
                                                                <td>${c.nom_ar }</td>
                                                                <td><input ${checked} class="h-15" type="checkbox"
                                                                                      id="id-${c.id_code }"
                                                                                      onchange="addCodeCT('id_collecte','${c.id_code}','add')">
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${collect.statut.id_statut_projet==42}">
                                                        <c:forEach items="${collect.code}" var="c">
                                                            <c:set var="bg" value=""/>
                                                            <c:forEach items="${collect.codeTmp}" var="code_colle">
                                                                <c:if test="${code_colle.id_code==c.id_code}">
                                                                    <c:set var="bg" value="bg-danger"/>
                                                                </c:if>
                                                            </c:forEach>
                                                                <tr class="${bg}" id="tr-${c.id_code}">
                                                                    <td>${c.nom_fr }</td>
                                                                    <td>${c.nom_ar }</td>
                                                                    <td>
                                                                        <input checked disabled class="h-15" type="checkbox"
                                                                               id="id-${c.id_code }">
                                                                    </td>
                                                                </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-sm-4" id="zone_list_tab">
                                            <div class="d-block h-100 my_rows" id="my_rows">
                                                <c:if test="${collect.statut.id_statut_projet!=42}">
                                                  <c:forEach items="${collect.code}" var="code_colle" varStatus="index">
                                                    <div class="row p-0 m-0 ${index.index%2==0?'bg-light':''} ">
                                                        <div class="col-8"> ${code_colle.nom_ar} </div>
                                                        <div class="col-4 p-2 text-center">
                                                            <button class="btn btn-success rounded-circle"
                                                                    onclick="addCodeCT('id_collecte','${code_colle.id_code}','delete')">
                                                                <span class="fa fa-times"></span></button>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                </c:if>
                                                <c:if test="${collect.statut.id_statut_projet==42}">
                                                    <c:forEach items="${collect.codeTmp}" var="code_colle" varStatus="index">
                                                        <div class="row p-0 m-0 ${index.index%2==0?'bg-light':''} ">
                                                            <div class="col-8"> ${code_colle.nom_ar} </div>
                                                            <div class="col-4 p-2 text-center">
                                                                <button class="btn btn-success rounded-circle"
                                                                        onclick="addCodeCT_tmp('id_collecte','${code_colle.id_code}','delete')">
                                                                    <span class="fa fa-times"></span></button>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row justify-content-center  mb-5 mt-3">
                                        <div class="col-md-2 col-sm-4">

                                                    <c:if test="${collect.statut.id_statut_projet!=42}">
                                                        <button style="margin-top: 10px; margin-bottom: 10px;"
                                                                type="button"
                                                        onclick="openCity2('#Btn2', '2')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                                    </c:if>
                                                    <c:if test="${collect.statut.id_statut_projet==42 && count!=0}">
                                                        <button style="margin-top: 10px; margin-bottom: 10px;"
                                                                type="button"
                                                        onclick="openCity2('#defaultOpen', '2')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                                    </c:if>

                                        </div>
                                        <div class="col-md-2 col-sm-4">

                                            <c:if test="${collect.statut.id_statut_projet==42 && cpt!=0}">
                                                <button style="margin-top: 10px; margin-bottom: 10px;"
                                                        type="button"
                                                        onclick="openCity2('#Btn4', '4')"
                                                        class="btn btn-success btn-block"><spring:message
                                                        code="label.SuivantA"/></button>
                                            </c:if>
                                            <c:if test="${collect.statut.id_statut_projet!=42}">
                                                <button style="margin-top: 10px; margin-bottom: 10px;"
                                                        type="button"
                                                        onclick="openCity2('#Btn4', '4')"
                                                        class="btn btn-success btn-block"><spring:message
                                                        code="label.SuivantA"/></button>
                                            </c:if>
                                            <c:if test="${collect.statut.id_statut_projet==42 && cpt==0}">
                                                <a style="margin-top: 10px; margin-bottom: 10px;"
                                                        type="button"
                                                        onclick="changerStatutCT()";
                                                        class="btn btn-success btn-block">Enregister</a>
                                            </c:if>
                                        </div>


                                    </div>
                                </form>
                            </div>
                            <div id="4" class="tabcontent">
                                <div class="row m-0 p-0 ">
                                    <div class="col-auto">
                                        <h4 class="titre_abs "><spring:message code="label.mespieces"/></h4>
                                    </div>
                                </div>
                                <p class="h5 text-center p-3 bg danger mt-2"> <span class=" p-2 "><spring:message code="label.Vouspouvezimporterdesdocumentsscannesen"/></span> </p>
                                <c:if test="${collect.statut.id_statut_projet==42}">
                                    <c:forEach items="${doc2}" var="dc">
                                        <c:if test="${dc.nom_ar!='oui'}">
                                            <div class="row justify-content-center">
                                                <div class="col-6 ml-3 mt-3  ">
                                                    <div class="${dc.nom_ar=='oui'?'Doc_ok':'Doc_Not_ok'}">
                                                        <div class="form-group">
                                                            <label class=""> ${dc.docImport.nom_fr } : </label>
                                                            <div class="${dc.nom_ar=='oui'?'hidden':'' }">
                                                                <input required
                                                                       onchange="addDocG(${dc.collecte.id_collecte},${dc.docImport.id_docImport},'doc${dc.docImport.id_docImport}','CT','')"
                                                                       accept=".pdf" type="file"
                                                                       id="doc${dc.docImport.id_docImport }"
                                                                       class="form-control mydoc">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                            <a class="btn btn-success rounded file_existe" download href="${url_Admin}${fn:replace(dc.url, "/assets/myFile/", "/dowload_uploaded/")}">
                                                                <i class="fa fa-upload " title="Télécharger le document"
                                                                   style="margin:0 !important"></i> </a>
                                                </div>
                                                <div class="col-4" style="margin-top: 4.5rem !important;">
                                                    <span class="bg-danger" id="id${dc.id_listDocNotif }"> ${dc.nom_fr } </span>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${collect.statut.id_statut_projet!=42}">
                                    <c:forEach items="${doc}" var="dc">
                                        <div class="row justify-content-center">
                                    <div class="col-6 mt-3  ">
                                        <div class="form-group">
                                            <div>
                                                <label style="width: 100%;"> ${dc.nom_fr } </label> <input
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    required
                                                    onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','CT','id_collecte')"
                                                    accept=".pdf" type="file" id="doc${dc.id_docImport }"
                                                    class="form-control mydoc">
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${not empty docNotify}">
                                        <div class="col-2">
                                            <c:forEach items="${docNotify}" var="d">
                                                <c:if test="${d.docImport.id_docImport==dc.id_docImport}">
                                                    <a href="${url_Admin}${fn:replace(d.url, "/assets/myFile/", "/dowload_uploaded/")}"
                                                       class="btn btn-success rounded file_existe"><span
                                                            class="fa fa-download"></span></a>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </div>
                                    </c:forEach>
                                </c:if>
                                <div class="row justify-content-center mb-5 mt-3">
                                    <div class="col-md-2 col-sm-4">
                                        <c:if test="${not empty collect.codeTmp}">
                                            <button type="button" id=""
                                                    onclick="openCity2('#Btn3', '3')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                        </c:if>
                                        <c:if test="${count!=0}">
                                            <button type="button" id=""
                                                    onclick="openCity2('#defaultOpen', '2')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                        </c:if>
                                        <c:if test="${collect.statut.id_statut_projet!=42}">
                                            <button type="button" id=""
                                                    onclick="openCity2('#Btn3', '3')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                        </c:if>
                                    </div>
                                    <div class="col-md-3 col-sm-4">
                                        <c:if test="${collect.statut.id_statut_projet!=42}">
                                            <input type="hidden" value="${url_Admin}/generate_pdf_collecte/"
                                                   id="url_file_pdf">
                                            <button class="btn btn-success btn-block "
                                                    onclick="verif_champs_ct('4','CT','id_collecte','5')"><spring:message code="label.Afficherlerecapitulatif"/>
                                            </button>
                                        </c:if>
                                        <c:if test="${collect.statut.id_statut_projet==42}">
                                            <input type="hidden" value="${url_Admin}/generate_pdf_collecte/"
                                                   id="url_file_pdf">
                                            <a class="btn btn-success btn-block "
                                                   href="/api/checkUserHasCollecte/CT">Enregistrer
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div id="5" class="tabcontent">

                                <h4 class="titre_abs "><spring:message code="label.Recapitulation"/></h4>
                                <div id="recap_ct"></div>
                                <div class="row justify-content-center mt-2 mb-4">
                                    <div class="col-md-2 col-sm-6">
                                        <button type="button"
                                                onclick="openCity2('btn4','4')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </div>
                                    <div class="col-md-2 col-sm-6">

                                        <button type="button"
                                                onclick="verif_recap_ct('5','CT','id_collecte')"
                                                class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/>
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>


<div class="modal fade" id="modalRecap" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="recapLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content ">
            <div class="modal-header">
                <h5 class="modal-title" id="recapLabel"><spring:message code="label.Recap"/></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="recap_tab">
                <%--Remplissage dynamique--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message
                        code="label.Fermer"/></button>
            </div>
        </div>
    </div>
</div>

<script>


    function check_vehicule_ok(from,table,tap,id_notif,nameId,returns){
        nbr_vehicule = $("input[name=nombre_vehicule]").val();
        if(nbr_vehicule==0 || $.trim(nbr_vehicule)=="" || nbr_vehicule==null){
            swal("Avertissement!", "Les véhicules sont obligatoires, merci de saisir au moins un seul véhicule", "error");
            return false;
        }
       updateGeneral(from,table,tap,id_notif,nameId,returns)
    }
    function down_load_recu() {
        var url = $("#url_file_pdf").val();
        var id = $("#id_collecte").val();
        var link = url + id;
        window.location = link;
    }

    function fun_affiche_modal_recap() {
        event.preventDefault();
        Swal.close();
        var id = $("#id_collecte").val();
       /*  if ($.trim(id) == "") {
            swal('Champs vide', "merci d'enristrer la demande", "warning");
            return false;
        } */

        $.ajax({
            url: '/api/getCollectById1/' + id + '/CT',
            type: 'POST',
            dataType: 'html',
            data: {},
        })
            .done(function (response) {
                console.log(response);
                if (response == "" || $.trim(response) == "Aucun résultat") {
                    swal("Aucun résultat", "Merci de saisir un numero valide", "info");
                    return false;
                } else {
                    $("#recap_tab ").html("");
                    $("#recap_tab").html(response);
                    $("#accordion").accordion({
                        collapsible: true,
                        heightStyle: "content",
                    });
                    $("#modalRecap").modal("toggle");
                }


            })
            .fail(function () {
                alert("erreur")
            })
            .always(function () {
                console.log("complete");
            });
    }

    function getCollectRenouveller(val) {
        event.preventDefault();
        $.ajax({
            url: '/api/getOneCollecte',
            type: 'post',
            data: {"id": $(val).val()},
        })
            .done(function (response) {

                if (response != "not existe") {
                    window.location.href = "/api/addCollectTrans/" + response + "/R";
                } else {
                    swal("Aucun Résultat", "Aucun résultat ne correspond à vos critères de recherche", "error");
                }
                console.log(response);
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }

    function openCity(evt, cityName) {

        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";

        if($("#zone_tableau").is(":visible") && $("#zone_list_tab").is(":visible") ){
            var h = $("#zone_tableau").innerHeight();
            console.log("height : ",h);
            $("#my_rows").attr("style",'height : '+h+'px !important');
        }

    }

    function openCity2(id_active, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        $(id_active).addClass("active");
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();


    function getOptionByFilter(val, table, select_id) {
        $.get('/api/tronsactionCO/select/' + table + '/delete_date_time is null and ' + val, function (data) {

            $("#" + select_id)
                .empty()
                .append('<option selected="selected" value="">Choisir...</option>');
            $.each(data, function (i, v) {
                $("#" + select_id).prepend(new Option(v[1], v[0]));
            })
        })
        ;
    }

    //show form_vehicule
    function getVehicule(id) {
        $("#add_new").prop("disabled", true);
        var id_coll = $("#id_collecte").val();
        if (id_coll == "") {
            swal("Avertissement!", "Merci de saisir les informations du demandeur", "error");
            return false;
        }
        event.preventDefault();
        $.get('/api/getVehiculeById/' + id + "/" + id_coll, function (data) {
            $("#my_table").html(data);
            $("#add_new").prop("disabled",true);
        });

    }

    // save vehicule Collecte/transport :
    function Save_vehicule(idInput, idequipement) {
        event.preventDefault();
        var matricule1 = $("input[name=num_mat_enrg_voit]").val();
        var matricule2 = $("input[name=num_mat_enrg_auto]").val();
        var matricule3 = $("input[name=num_mat_id_prefect]").val();
        if( ($.trim(matricule1)==="" || matricule1==null) || ($.trim(matricule2)==="" || matricule2==null) || ($.trim(matricule3)==="" || matricule3==null) ){
            swal("Avertissement!", "Le numero de la  plaque d'immatriculation du véhicule est obligatoire", "error");
            return false;
        }

        var data = new FormData();
        var id_collect = $("#id_collecte").val();
        var form = $("#add_vehicules").serializeObject();
        //var ins = document.getElementById(idInput).files.length;
        /*for (var x = 0; x < ins; x++) {
            var file = document.getElementById(idInput).files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "Type de Fichier non pris en charge", "error");
                return false;
            }
            data.append("fileToUpload", file);
        }
        var ins1 = document.getElementById(idequipement).files.length;
        for (var x1 = 0; x1 < ins1; x1++) {
            var file1 = document.getElementById(idequipement).files[x1];
            if (file1.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "Type de Fichier non pris en charge", "error");
                return false;
            }
            data.append("equipementsecurite", file1);
        }
        */

        data.append("id_collect", parseInt(id_collect));
        data.append("v", JSON.stringify(form));

        $.ajax({

            type: "POST",
            enctype: 'multipart/form-data',
            url: "/api/saveVehicule",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success: function (response) {

                swal({
                        title: "Véhicule enregistrer avec success",
                        text: "Voulez-vous Ajouter un nouveau véhicule?",
                        type: "success",
                        showCancelButton: true,
                        confirmButtonClass: "btn-success",
                        confirmButtonText: "Oui, Ajouter un véhicule",
                        cancelButtonText: "Non",
                        closeOnConfirm: true,
                        closeOnCancel: true
                    },
                    function(isConfirm) {
                        if (isConfirm) {
                            getVehicule('0');
                        } else {
                            updateGeneral('formvehicule','collectetransporteur','2',parseInt(id_collect),'id_collecte','non');
                        }
                    });
                /*$("#add_new").removeAttr("disabled");*/

            },
            error: function () {

            }
        });
    }

    function deleteVehicule(id) {
        event.preventDefault();
        var id_coll = $("#id_collecte").val();
        $.get("/api/deleteVehicule/" + id + "/" + id_coll, function (rep) {
            $("#my_table").html(rep);
        });
    }

    function verif_champs(id_form) {
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");

        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
                $(input).addClass("bg_error");
                test = true
            }
        });

        if (test) {
            swal("Avertissement!", "un ou plusieurs champs sont vides", "error");
        } else {
            changer_status_collecte('id_collecte',19);

        }
    }

    function verif_recap_ct(id_form, type, id_name) {
        if(event!=null)
            event.preventDefault();
        // var tr = $("#" + id_form).find(".document").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        changer_status_collecte('id_collecte',19);

    }

    function verif_champs_ct(id_form, type, id_name, tap) {
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
                $(input).addClass("bg_error");
                test = true;
            }
        });

        if (test) {
            if (${pageContext.response.locale=='fr'}) {
                swal("Avertisement!", "un ou plusieur champs sont vides", "error");
            } else if (${pageContext.response.locale=='ar'}) {
                swal("تحذير!", "مجال واحد أو أكثر فارغ", "error");
            }
        } else {
            $("#Btn5").removeAttr("disabled");
            searchByRecapCT(type);
            openCity2('Btn'+tap,tap);
        }
    }

    function verif_champs_recap(id_form, type, id_name, tap) {
        if(event!=null)
            event.preventDefault();
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();

        searchByRecapCT(type);
        openCity2('Btn'+tap,tap);

    }

    function changer_status_collecte(id_name,id_statut){
        var id_col = $("#"+id_name).val();
        var type="CT";
        var link_recap = "/api/checkUserHasCollecte/CT";
        Swal.fire({
            title: 'Si vous cliquez sur enregistrer vous ne pouvez plus modifier votre demande',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: `Enregistrer`,
            denyButtonText: `Annuler`,
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: '/api/changerStatus',
                    type: 'POST',
                    data: {"id_notif":parseInt(id_col),"id_statut":parseInt(id_statut),"type":type},
                })
                down_load_recu();
                Swal.fire({
                    title: '<strong>votre demande a été effectuée avec succès</strong>',
                    icon: 'success',
                    html:
                        '<a href="' + link_recap + '" class="btn btn-success ml-2 ">Récapitulatif</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                    allowOutsideClick: false
                });
            }
        })
    }

    function addCodeCT(id_collect, id_code, type) {
        event.preventDefault();
        var id_coll = $("#" + id_collect).val();
        if (id_coll == "") {
            return false;
        }
        $.ajax({
            url: '/api/setcode/' + id_coll + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data) {
                if (!data.user) {
                    window.location.href = '/index';
                }
                $("#my_rows").html("");
                $(data.codes).each(function (ind, el) {
                    var cls = "";
                    if (ind % 2 == 0) {
                        cls = "bg-light";
                    }
                    var row = '<div class="row p-0 m-0 ' + cls + ' "> <div class="col-8"> ' + el.nom_ar + ' </div> <div class="col-4 p-2 text-center"> <button class="btn btn-success rounded-circle" onclick="addCodeCT(\'' + id_collect + '\',\'' + el.id_code + '\',\'delete\')"> <span class="fa fa-times"></span> </button> </div> </div>';
                    $("#my_rows").append(row);


                });

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                if (type == "add") {
                    $('#id-' + id_code).attr("disabled", "true");
                }
                if (type == "delete") {
                    var table1 = $("#DataTables_Table_0").dataTable();
                    var checkbox = table1.$("input[type=checkbox]#id-" + id_code);
                    $(checkbox).removeAttr("disabled");
                    $(checkbox).prop("checked", false);

                }
                console.log("complete");
            });

    }
    function addCodeCT_tmp(id_collect, id_code, type) {
        event.preventDefault();
        var id_coll = $("#" + id_collect).val();
        if (id_coll == "") {
            return false;
        }
        $.ajax({
            url: '/api/deleteCodeTmp/' + id_coll + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data) {
                if (!data.user) {
                    window.location.href = '/index';
                }
                $("#my_rows").html("");
                $(data.codes).each(function (ind, el) {
                    var cls = "";
                    if (ind % 2 == 0) {
                        cls = "bg-light";
                    }
                    var row = '<div class="row p-0 m-0 ' + cls + ' "> <div class="col-8"> ' + el.nom_ar + ' </div> <div class="col-4 p-2 text-center"> <button class="btn btn-success rounded-circle" onclick="addCodeCT_tmp(\'' + id_collect + '\',\'' + el.id_code + '\',\'delete\')"> <span class="fa fa-times"></span> </button> </div> </div>';
                    $("#my_rows").append(row);
                });

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                if (type == "add") {
                    $('#id-' + id_code).attr("disabled", "true");
                }
                if (type == "delete") {
                    $("#tr-"+id_code).hide();

                }
                console.log("complete");
            });

    }
    function changerStatutCT(){
        var id = $("#id_collecte").val();
        $.ajax({

            type: "GET",
            url : "/api/ChangerStatutCT/"+id,
            data: {},
            success : function(response) {
                window.location.href="/api/checkUserHasCollecte/CT";
            },
            error : function() {

            }
        });
    }

</script>

<jsp:include page="../../includes/footer1.jsp"/>
