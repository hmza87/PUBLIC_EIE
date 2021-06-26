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
<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .select2_option {
           text-align: right;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale=='fr' }">
    <style>
        .select2_option {
          text-align: left;
        }
    </style>
</c:if>
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
                    <c:when test="${type=='EE'}">
                        <spring:message code="option.Etudedimpactenvironnementale" var="p_page" />
                    </c:when>
                    <c:when test="${type=='RS'}">
                        <spring:message code="label.Renseignementprealable" var="p_page" />
                    </c:when>
                    <c:when test="${type=='NT'}">
                        <spring:message code="option.Noticedimpact" var="p_page" />
                    </c:when>
                    <c:when test="${type=='AE'}">
                        <spring:message code="option.Auditenvironnementale" var="p_page" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                    </c:otherwise>
                </c:choose>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/> </a></li>
                        <li class="breadcrumb-item"><a href="/api/checkEIESelect/${type=="RS"?"EE":type}">${p_page} </a></li>
                        <li class="breadcrumb-item active" aria-current="page"> Demande </li>

                    </ol>
                </nav>
            </div>
        </div>

        <div class="row" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
            <div class="col-md-3 col-sm-12">

                <button class="btn btn-success btn-block active text-left pl-5 cls_step" id="step_id1" onclick="affiche_eie_zone('#step1','#step_id1')"><spring:message code="label.informationssurlepetitionnaire"/></button>
                <c:if test="${demande.statut.id_statut_projet!=13}">
                    <c:if test="${type=='AE'}">
                    <button class="btn btn-success btn-block text-left pl-5 cls_step" ${id==0?'disabled':''} id="step_id1_2" onclick="affiche_eie_zone('#step1_2','#step_id1_2')"><spring:message code="label.informationssurleprojet"/> </button>
                    <button class="btn btn-success btn-block text-left pl-5 cls_step" ${id==0?'disabled':''} id="step_id2" onclick="affiche_eie_zone('#step2','#step_id2')" ><spring:message code="label.Localisationduprojet"/></button>
                    </c:if>
                    <c:if test="${type!='AE'}">
                        <button class="btn btn-success btn-block text-left pl-5 cls_step" ${id==0?'disabled':''} id="step_id1_2" onclick="affiche_eie_zone('#step1_2','#step_id1_2')">Information sur le projet </button>
                        <button class="btn btn-success btn-block text-left pl-5 cls_step" ${id==0?'disabled':''} id="step_id2" onclick="affiche_eie_zone('#step2','#step_id2')" >Localisation du projet</button>
                    </c:if>
                    </c:if>
                <c:if test="${type=='EE'|| type=='NT'}">
                    <button class="btn btn-success btn-block text-left pl-5 cls_step" ${id==0?'disabled':''} id="step_id3" onclick="affiche_eie_zone('#step3','#step_id3')"><spring:message code="label.Piecefournir"/> </button>
                </c:if>
                <button class="btn btn-success btn-block text-left pl-5 cls_step montab" id="step_id4" onclick="affiche_eie_zone('#step4','#step_id4')" disabled> <spring:message code="label.Recapitulation"/> </button>

            </div>
            <div class="col-lg-8 col-sm-8 col-md-8 mx-4">
                <div class="row pb-2 mt-3">
                    <div class="col-12 pl-0 pr-0">
                        <h4 class="titre_abs " style="text-align:center">${titre_dyn} </h4>
                    </div>
                    <div id="step1" class="col-12 z_collecteur"  >
                        <form class="mt-3"  id="formAvisProjet" name="formAvisProjet" >
                            <input type="hidden" value="${(not empty demande)?demande.id_demande_information:'0'}" name="id_demande_information" id="id_demande_information">
                            <c:if test="${not empty demande}">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label ><spring:message code="label.NumeroDemande"/></label>
                                            <input onchange="checkUpdate(this.value)" disabled value="${demande.num_demande }" type="text" name="num_demande" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <%--information demandeur--%>
                            <div class="row">

                                <div class=" col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label ><spring:message code="label.Raisonsocial"/>   </label>
                                        <input  value="${demande.raison_social}" required ${disabled} type="text" name="raison_social" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">

                                    <div class="form-group">
                                        <label><spring:message code="label.Representant"/> </label>
                                        <input type="text" required value="${demande.represantant }" ${disabled} name="represantant" class="form-control" >
                                    </div>
                                </div>
                            </div>
                            <div class=" row">
                                <div class=" col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label ><spring:message code="label.Email"/></label>
                                        <input value="${demande.email }" required ${disabled} type="email" name="email" class="form-control" >
                                    </div>
                                </div>
                                <div class=" col-md-4 col-sm-12 ">
                                    <div class="form-group">
                                        <label ><spring:message code="label.tel"/>  </label>
                                        <input value="${demande.tel }" required type="text" ${disabled} name="tel" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-4 col-sm-12 ">
                                    <div class="form-group">
                                        <label ><spring:message code="label.Fax"/></label>
                                        <input ${disabled} required value="${demande.fax }" type="text" name="fax" class="form-control" >
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 ">
                                    <div class="form-group">
                                        <label ><spring:message code="label.Adresse"/></label>
                                        <input ${disabled} required value="${demande.adresse }" type="text" name="adresse" class="form-control" >
                                    </div>
                                </div>
                            </div>
                            <%--information Projet--%>
                            <c:if test="${demande.statut.id_statut_projet==13}">
                                <hr>
                                <div class="row">
                                    <div class=" col form-group">
                                        <label ><spring:message code="label.Avisdeprojet"/> </label>
                                        <input required ${demande.statut.id_statut_projet==13?"":"disabled" } id="avis_projet" accept=".doc,.docx,.pdf"  type="file"  class="form-control" >
                                    </div>
                                </div>
                            </c:if>
                            <div class="row justify-content-center p-0 mb-3">
                                <div class="col-md-3 col-sm-12">
                                    <c:if test="${demande.statut.id_statut_projet!=13}">
                                        <button class="btn btn-success btn_suiv btn-block" onclick="addDemandeInfomration('formAvisProjet','${type}','${id}','#step1_2','#step_id1_2')">  <spring:message code="button.Suivant"/> </button>
                                    </c:if>
                                    <c:if test="${demande.statut.id_statut_projet==13}">
                                        <button class="btn btn-success btn_suiv btn-block" onclick="set_avis_projet('#avis_projet','#id_demande_information')">  <spring:message code="button.Enregistrer"/> </button>
                                    </c:if>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div id="step1_2" class="col-12 z_collecteur collapse"  >
                        <form class="mt-3"  id="formProjet" name="formProjet" >
                            <div class="row">
                                <c:if test="${type=='AE'}">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label >Intitulé de l'activité</label>
                                        <input ${disabled} required value="${demande.intitule_projet }" type="text" name="intitule_projet" class="form-control">
                                    </div>
                                </div>
                                </c:if>
                                <c:if test="${type!='AE'}">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label >Intitulé du projet</label>
                                            <input ${disabled} required value="${demande.intitule_projet }" type="text" name="intitule_projet" class="form-control">
                                        </div>
                                    </div>
                                </c:if>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label ><spring:message code="label.montantIves"/></label>
                                        <input ${disabled} required value="${demande.montant_investissement }" type="text" name="montant_investissement" class="form-control">
                                    </div>
                                </div>

                                <c:choose>
                                    <c:when test="${type!='NT' && type!='AE'}">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Tronsfrontalier"/>  </label>
                                                <select name="tronsfrontalier" id="tron" required class="form-control select2" data-width="100%" >
                                                    <option ${demande.tronsfrontalier.equals('no')?"selected":"" }  value="no"><spring:message code="label.non"/></option>
                                                    <option value="yes" ${demande.tronsfrontalier.equals('yes')?"selected":"" } ><spring:message code="label.oui"/></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> Inter-région  </label>
                                                <select ${disabled } onchange="fun_disabled_region(this)" name="interregion" id="interregion" required class="form-control select2" data-width="100%" >
                                                    <option value="oui" ${demande.interregion.equals('oui')?"selected":"" } ><spring:message code="label.oui"/></option>
                                                    <option ${demande.interregion.equals('non')?"selected":"" }  value="non"><spring:message code="label.non"/></option>
                                                </select>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${type=='AE'}">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label>Nature de l'activité</label>
                                                    <textarea name="nature_projet" class="form-control" rows="3">${demande.nature_projet}</textarea>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${type!='AE'}">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label>Nature de projet</label>
                                                    <textarea name="nature_projet" class="form-control" rows="3">${demande.nature_projet}</textarea>
                                                </div>
                                            </div>
                                        </c:if>
                                       <!-- <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.ConsisitanceduProjet"/></label>
                                                <textarea name="consistance_proj" id="consit_proj" class="form-control" rows="3"></textarea>
                                            </div>
                                        </div>-->
                                    </c:otherwise>
                                </c:choose>


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
                                    <!-- <c:if test="${type=='AE'}">
                                    <div class="col-md-6 col-sm-12">

                                        <div class="form-group">
                                            <label> <spring:message code="label.Datederealisationduprojet"/> </label>
                                            <input ${disabled } type="date" name="dateResiliation" class="form-control" id="dateResiliation" value="${demande.dateResiliation}" required >
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 mt-2">
                                        <div class="form-group">
                                            <label><spring:message code="label.DatedeDemarrage"/> </label>
                                            <input ${disabled } type="date" name="dateDemarage" id="dateDemarage" class="form-control" value="${demande.dateDemarage}" required >
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 mt-2">
                                        <div class="form-group">
                                            <label ><spring:message code="label.Descriptionduprojet"/> </label>
                                            <input type="file" id="file_frm" class="form-control" onchange="update_new_AE()">
                                        </div>
                                    </div>
                                </c:if>-->
                            </div>
                            <div class="row justify-content-center p-0 mb-3">
                                <div class="col-md-3 col-sm-12">
                                    <button class="btn btn-success btn_suiv btn-block" onclick="affiche_eie_zone('#step1','#step_id1')">  <spring:message code="button.Precedent"/> </button>
                                </div>
                                <c:if test="${type=='EE' || type=='RS'}">
                                    <div class="col-sm-12 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="updateDemandeInfomrationEE('formProjet','id_demande_information','#step2','#step_id2')" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='NT'}">
                                    <div class="col-sm-12 col-md-3">
                                        <button class="btn btn-success btn_suiv btn-block" onclick="updateDemandeInfomration('formProjet','id_demande_information','#step2','#step_id2')" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='AE'}">
                                    <div class="col-sm-12 col-md-3">
                                        <button class="btn btn-success btn_suiv btn-block" onclick="updateDemandeInfomrationAE('formProjet','id_demande_information','#step2','#step_id2')" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
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
                                            <label><spring:message code="label.Regions"/></label>
                                            <select ${demande.interregion=="non"?"disabled":""} class="form-control select2 id_region" id="id_region" multiple onchange="load_pref_by_region(this)">
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
                                            <label><spring:message code="label.PrefecturesProvinces"/></label>
                                            <select ${demande.interregion=="non"?"disabled":""} class="form-control select2 id_prefecture" id="id_prefecture" multiple onchange="load_commune_by_pref(this)">
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
                                            <label><spring:message code="label.communes"/></label>
                                            <select ${demande.interregion=="non"?"disabled":""} class="form-control select2 id_commune" id="id_commune" multiple onchange="saveCommuneDetailregion(this)">
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
                                <c:if test="${type=='EE' || type=='NT'}">
                                    <div class="col-sm-12 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="updateRegionDemandeInfomration('${type}','#id_demande_information','#step3','#step_id3')" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='AE'}">
                                    <div class="col-sm-12 col-md-3">
                                        <button onclick="verif_champs1('step3','${type}','id_demande_information','#step4','#step_id4')" class="btn btn-success btn-block" ><spring:message code="label.Afficherlerecapitulatif"/></button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='RS'}">
                                    <div class="col-sm-12 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="verif_champs1('step3','${type}','id_demande_information','#step4','#step_id4')" ><spring:message code="label.Afficherlerecapitulatif"/></button>
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
                                                        onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','EE','id_demande_information')"
                                                        accept=".pdf" type="file" id="doc${dc.id_docImport }"
                                                        class="form-control mydoc">
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${not empty docNotify}">
                                            <div class="col-2 mt-5">
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
                                        <button onclick="verif_champs('step3','${type}','id_demande_information','#step4','#step_id4')" class="btn btn-success btn-block" ><spring:message code="label.Afficherlerecapitulatif"/></button>
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
                        <div id="step4" class="col-12 z_collecteur collapse">
                            <div id="recap_ee"></div>
                            <div class="row justify-content-center mt-2 mb-4">
                                <div class="col-md-2 col-sm-6">
                                    <button type="button"
                                            onclick="affiche_eie_zone('#step3','#step_id3')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-3 col-sm-6">

                                    <button type="button"
                                            onclick="changer_statut1('id_demande_information',1,'Votre demande est déposée avec succès','${type}')"
                                            class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </c:if>
                    <c:if test="${type=='AE' || type=='RS'}">
                        <div id="step4" class="col-12 z_collecteur collapse">
                            <div id="recap_ee"></div>
                            <div class="row justify-content-center mt-2 mb-4">
                                <div class="col-md-2 col-sm-6">
                                    <button type="button"
                                            onclick="affiche_eie_zone('#step2','#step_id2')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-3 col-sm-6">

                                    <button type="button"
                                            onclick="changer_statut2('${type}','id_demande_information',1,'Votre demande est déposée avec succès')"
                                            class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </c:if>
                    <c:if test="${type=='NT'}">
                        <div id="step3" class="col-12 z_collecteur collapse" >
                            <form  class="form-horizontal mt-3" id="formdoc">
                                <c:forEach items="${doc}" var="dc">
                                    <div class="row justify-content-center">
                                        <div class="col mt-3  ">
                                            <div class="form-group">
                                                <div>
                                                    <label style="width: 100%;"> ${dc.nom_fr } </label> <input
                                                        required
                                                        onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','AE','id_demande_information')"
                                                        accept=".doc,.docx,.pdf" type="file" id="doc${dc.id_docImport }"
                                                        class="form-control mydoc">
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${not empty docNotify}">
                                            <div class="col-2 mt-5">
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
                                        <button onclick="verif_champs('step3','${type}','id_demande_information','#step4','#step_id4')" class="btn btn-success btn-block" ><spring:message code="label.Afficherlerecapitulatif"/></button>
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
                        <div id="step4" class="col-12 z_collecteur collapse">
                            <div id="recap_ee"></div>
                            <div class="row justify-content-center mt-2 mb-4">
                                <div class="col-md-2 col-sm-6">
                                    <button type="button"
                                            onclick="affiche_eie_zone('#step3','#step_id3')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-3 col-sm-6">

                                    <button type="button"
                                            onclick="changer_statut2('${type}','id_demande_information',1,'Votre demande est déposée avec succès')"
                                            class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </c:if>

                </div>
            </div>

            <div class="col-md-3 col-sm-12"></div>
        </div>
    </section>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>

<script>



    function updateDemandeInfomrationAE(form, id_name, step, id_btn_step) {
        if (event != null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        if ($.trim(id) === "" || id == null) {
            return false;
        }
        var montant = $("input[name=montant_investissement]").val();
        if ($.trim(montant) == "" || montant == null || !$.isNumeric(montant)) {
            swal("Avertissement ! ", 'Le champs Montant d\'investissement est incorrecte', 'error');
            return false;
        }
        var se = $("#"+form).serialize();

        $empty = $('#'+form).find("input").filter(function() {
            return this.value === "";
        });
        if($empty.length) {
            swal("Avertissement ! ", 'Tous Les Champs est obligatoire', 'error');
            return false;
        } else{
            $.ajax({
                type: "GET",
                url: "/api/updateDemandeInfomrationAE/" + id,
                contentType: 'application/json; charset=utf-8',
                data: se,
                success: function (response) {
                    console.log("success : " + response);
                    affiche_eie_zone(step, id_btn_step);
                },
                error: function (response) {

                    alert('Erreur ajout non effectue');

                }
            });
        }
    }
    function changer_statut2(type,id_name, code_statut, msg_alert) {
        if (event != null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var link_recap = "/api/recapEie/" + id + "/" + type;
        var test = false;
        var tr = $("#formdoc").find("input[type=file]").closest(".row.justify-content-center");
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
                $(input).addClass("bg_error");
                test = true
            }
        });
        if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
            swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
            return false;
        }
        if (test) {
            swal("Avertisement!", "un ou plusieur champs sont vides", "error");
        } else {
                Swal.fire({
                    title: 'Si vous cliquez sur enregistrer vous ne pouvez plus modifier votre demande',
                    showDenyButton: true,
                    showCancelButton: false,
                    confirmButtonText: `Enregistrer`,
                    denyButtonText: `Annuler`,
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "/api/changerStatuts2/" + id + "/" + code_statut,
                            type: 'GET',
                            data: {},
                        })
                        Swal.fire({
                            title: '<strong>' + msg_alert + '</strong>',
                            icon: 'success',
                            html: '<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                            showCloseButton: false,
                            showCancelButton: false,
                            showConfirmButton: false,
                            focusConfirm: false,
                        })
                    }
                })
            }

    }

    function searchByEE(id,type) {

        $.ajax({
            url: "/api/recapEieEdit/"+id+"/"+type,
            type: "GET",
            data: {},
            success: function (response) {
                $("#recap_ee").html(response);
            },
            error: function (response) {
                alert('Erreur ajout non effectué');
            }
        });
    }
    function verif_champs(id_form, type, id_name, next_step, tap) {
        if(event!=null)
            event.preventDefault();
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
                $(input).addClass("bg_error");
                test = true
            }
        });
        //$(".cls_step").removeClass('active')
        //$(tap).addClass('active');
        //$(".z_collecteur").hide();
        //$(next_step).show();

        if (test) {
            swal("Avertisement!", "un ou plusieur champs sont vides", "error");
        } else {
            $("#step_id4").removeAttr("disabled");
            searchByEE(id, type);
            affiche_eie_zone(next_step,tap);
        }
    }
    function verif_champs1(id_form, type, id_name, next_step, tap) {
        if(event!=null)
            event.preventDefault();

        var region = ""
        var prefecture = "";
        var commune = "";

        var test = false;
        var id = $("#" + id_name).val();
        var trans = $("#interregion").val();
        var tmp = $("#id_region").val();

        if(trans == "oui" || type=="AE"){
            region = $("#id_region").val().join();
            prefecture = $("#id_prefecture").val().join();
            commune = $("#id_commune").val().join();
        }else if(trans=="non"){
            region = "0";
            prefecture = "0";
            commune = "0";
        }

        $("#step_id4").removeAttr("disabled");
        searchByEE(id, type);
        affiche_eie_zone(next_step,tap);
    }

    function changer_statut1(id_name, code_statut, msg_alert,type) {
        if (event != null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var link_recap = "/api/recapEie/" + id + "/" + type;
        if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
            swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
            return false;
        }
        Swal.fire({
            title: 'Si vous cliquez sur enregistrer vous ne pouvez plus modifier votre demande',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: `Enregistrer`,
            denyButtonText: `Annuler`,
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: "/api/changerStatuts/" + id + "/" + code_statut,
                    type: 'GET',
                    data: {},
                })
                Swal.fire({
                    title: '<strong>' + msg_alert + '</strong>',
                    icon: 'success',
                    html: '<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                })
            }
        })
    }
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formAvisProjet']").validate({




            // Specify validation rules
            rules: {
                email: {
                    required: true
                },
                tel : {
                    required: true,
                    number : true,
                    minlength:10,
                    maxlength:10
                },
                fax : {
                    required: true,
                    number : true,
                    minlength:10,
                    maxlength:10
                },



            },


            // Specify validation error messages
            messages: {
                email: "S'il vous plaît, mettez une adresse email valide",
                tel: "S'il vous plaît, mettez un telephone valide",
                fax: "S'il vous plaît, mettez un fax valide",

            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });
</script>
