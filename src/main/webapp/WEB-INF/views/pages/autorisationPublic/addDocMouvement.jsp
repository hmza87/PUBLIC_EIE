<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>
<%--<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>--%>
<style>
    .select2-container--default .select2-selection--multiple {
        padding: 0px;
    }
    .main-panel{
        margin-top:150px !important;
    }
</style>

<div class="main-panel">
    <section class="mt-2 bg-white container-fluid" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="row">
            <div class="col-12">
                <c:choose>
                    <c:when test="${type=='ZF'}">
                        <spring:message code="label.Importationdechetszonefranche" var="p_page"/>
                    </c:when>
                    <c:when test="${type=='XD'}">
                        <spring:message code="label.Exportationdesdechetsdangereux" var="p_page"/>
                    </c:when>
                </c:choose>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/> </a></li>
                        <li class="breadcrumb-item"><a href="/api/checkEIESelect">${p_page} </a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Ajouter Documents de mouvement </li>

                    </ol>
                </nav>
            </div>
        </div>

        <div class="row" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
            <div class="col-md-3 col-sm-12">
                <button class="btn btn-success btn-block active text-left pl-5 cls_step" id="step_id1" onclick="affiche_eie_zone('#step1','#step_id1')">1. Documents de mouvements </button>

            </div>
            <div class="col-lg-6 col-sm-8 col-md-9 mx-4">
                <div class="row pb-2 mt-3">
                    <div class="col-12 pl-0 pr-0">
                        <h4 class="titre_abs " style="text-align:center">Documents de mouvement </h4>
                    </div>

                    <div id="step1" class="col-12 z_collecteur"  >
                        <form class="mt-3"  id="formAvisProjet" name="formAvisProjet" >
                            <input type="hidden" value="${notification.id_notification}" name="id_notification" id="id_notification">
                            <div class="form-group">
                                <label>certificat d'élimination</label>
                                <input type="file" class="form-control" id="certificat">
                            </div>
                            <div class="row" id="detail_mouvement">
                               <div class="col-md-6">
                                   <label>Quantité</label>
                                   <input type="text" value="" class="form-control">
                               </div>
                                <div class="col-md-6">
                                    <label>Rapport Quantité</label>
                                    <input type="file" value="" class="form-control">
                                </div>
                                <div class="col-12 mt-2">
                                    <div class="row justify-content-end">
                                        <div class="col-auto">
                                            <button onclick="add_detail_mouvement()" class="btn btn-primary"> <span class="fa fa-plus"></span> Ajouter</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group d-none">
                                <label>Quantité justifier</label>
                                <input type="file" class="form-control" id="certificat">
                            </div>

                            <div class="row justify-content-center">
                                <div class="col-auto">
                                    <button class="btn btn-primary btn-block">
                                        <spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div id="step1_2" class="col-12 z_collecteur collapse"  >
                        <form class="mt-3"  id="formProjet" name="formProjet" >
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label ><spring:message code="label.IntituleDeProjet"/></label>
                                        <input ${disabled} value="${demande.intitule_projet }" type="text" name="intitule_projet" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label ><spring:message code="label.montantIves"/></label>
                                        <input ${disabled} value="${demande.montant_investissement }" type="text" name="montant_investissement" class="form-control">
                                    </div>
                                </div>
                                <c:if test="${not empty demande.categories}">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.TypedeProjet"/> </label>
                                            <select disabled multiple  required class="form-control select2 p-0" data-width="100%" >
                                                <c:forEach items="${demande.categories}"  var="cat" varStatus="loop">
                                                    <option selected value="${cat.id_categorie}" >${pageContext.response.locale=='ar'?cat.nom_ar:cat.nom_fr} </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.Tronsfrontalier"/>  </label>
                                        <select ${disabled }  onchange="fun_disabled_region(this)" name="tronsfrontalier" id="tron" required class="form-control select2" data-width="100%" >
                                            <option ${demande.tronsfrontalier.equals('non')?"selected":"" }  value="non"><spring:message code="label.non"/></option>
                                            <option value="oui" ${demande.tronsfrontalier.equals('oui')?"selected":"" } ><spring:message code="label.oui"/></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center p-0 mb-3">
                                <div class="col-md-3 col-sm-12">
                                    <button class="btn btn-success btn_suiv btn-block" onclick="affiche_eie_zone('#step1','#step_id1')">  <spring:message code="button.Precedent"/> </button>
                                </div>
                                <div class="col-md-3 col-sm-12">
                                    <button class="btn btn-success btn_suiv btn-block" onclick="updateDemandeInfomration('formProjet','id_demande_information','#step2','#step_id2')">  <spring:message code="button.Suivant"/> </button>
                                </div>
                            </div>
                        </form>
                    </div>


                    <div id="step2" class="col-12 z_collecteur collapse" >
                        <form class="mt-3"  id="formDetailRegion" name="formDetailRegion" >
                            <%--information region si possible--%>

                            <div id="zone_region">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label>Régions</label>
                                            <select class="form-control select2 id_region" id="id_region" multiple onchange="load_pref_by_region(this)">
                                                <c:forEach items="${regions}" var="reg" varStatus="loop">
                                                    <option
                                                            <c:forEach items="${demande.detailRegion.region}" var="rr">
                                                                ${rr.regionId==reg.regionId?"selected":""}
                                                            </c:forEach>
                                                            value="${reg.regionId}">${pageContext.response.locale=='ar'?reg.nom_ar:reg.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label>Préféctures / Provinces</label>
                                            <select class="form-control select2 id_prefecture" id="id_prefecture" multiple onchange="load_commune_by_pref(this)">
                                                <%--auto load dynamique--%>
                                                <c:forEach items="${lp}" var="p">
                                                    <option
                                                            <c:forEach items="${demande.detailRegion.prefectures}" var="pp">
                                                                ${pp.id_prefecture==p.id_prefecture?"selected":""}
                                                            </c:forEach>
                                                            value="${p.id_prefecture}">${pageContext.response.locale=='ar'?p.nom_ar:p.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label>Communes</label>
                                            <select class="form-control select2 id_commune" id="id_commune" multiple onchange="saveCommuneDetailregion(this)">
                                                <%--auto load dynamique--%>
                                                <c:forEach items="${lc}" var="c" varStatus="loopp">
                                                    <option
                                                            <c:forEach items="${demande.detailRegion.communes}" var="cc">
                                                                ${cc.id_commune==c.id_commune?"selected":""}
                                                            </c:forEach>
                                                            value="${c.id_commune}">${pageContext.response.locale=='ar'?c.nom_ar:c.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row p-0 justify-content-center mb-3">
                                <div class="col-sm-12 col-md-3">
                                    <button class="btn btn-success btn-block" onclick="affiche_eie_zone('#step1_2','#step_id1_2')"><spring:message code="button.Precedent"/> </button>
                                </div>
                                <c:if test="${type=='EE'}">
                                    <div class="col-sm-12 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="updateRegionDemandeInfomration('${type}','#id_demande_information','#step3','#step_id3')" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='RS'}">
                                    <div class="col-sm-12 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="updateRegionDemandeInfomration('${type}','#id_demande_information','end','end')" >  <spring:message code="button.Enregistrer"/> </button>
                                    </div>
                                </c:if>
                            </div>

                        </form>
                    </div>

                    <c:if test="${type=='EE'}">
                        <div id="step3" class="col-12 z_collecteur collapse" >
                            <form  class="form-horizontal mt-3" >

                                <c:forEach items="${doc}" var="dc">
                                    <div class="row justify-content-center">
                                        <div class="col mt-3  ">
                                            <div class="form-group">
                                                <div>
                                                    <label style="width: 100%;"> ${dc.nom_fr } </label> <input
                                                        required
                                                        onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','EIE','id_demande_information')"
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



                                <div class="row p-0 justify-content-center mb-3 mt-4">
                                    <div class="col-sm-12 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="affiche_eie_zone('#step2','#step_id2')"><spring:message code="button.Precedent"/> </button>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <button onclick="changer_statut('id_demande_information',1,'Votre demande est déposée avec succès')" class="btn btn-success btn-block" ><spring:message code="button.Enregistrer"/> </button>
                                    </div>
                                </div>



                                <div class="row m-0 p-0 mt-5">
                                    <div class="col-3">
                                    </div>
                                    <div class="col-6" style="text-align: center">


                                    </div>
                                    <div class="col-3">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </section>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>