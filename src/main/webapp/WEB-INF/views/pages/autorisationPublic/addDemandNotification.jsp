<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>
<style>
    .file_existe {
        position: absolute;
        bottom: 16%;
    }

    .tabcontent {
        float: left;
        padding: 0px 20px;
        width: 80%;
    }

    .tab {
    / / float: left;
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

    .tab button.active {
        background-color: red;
    }

    .tabsu {
     pl-auto    padding-left: 50px;
        background-color: #045ab1 !important;
    }

    .main-panel {
        margin-top: 150px !important;
    }


</style>
<div class="container-fluid page-body-wrapper" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="main-panel" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">

        <%--<a href="/api/ListeAutorisation/${type }/n" class="btn " style="background-color: #7dc7bd;margin-bottom:12px;color:white"><spring:message code="label.numero"/></a>


        &lt;%&ndash;<a href="/api/addNumNotification" class="btn " style="background-color: #7dc7bd;margin-bottom:12px;color:white;color:white"><spring:message code="label.Demandedenumerodenotification"/></a>&ndash;%&gt;
        <a href="/api/ListeAutorisationDemande/${type}/d" class="btn btr" style="background-color: #7dc7bd;margin-bottom:12px;color:white"><spring:message code="label.Depot"/> </a>
    --%>
        <c:choose>
            <c:when test="${type=='ZF'}">
                <spring:message code="label.Importationdechetszonefranche" var="p_page"/>
            </c:when>
            <c:when test="${type=='ET'}">
                <spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger" var="p_page"/>
            </c:when>
            <c:when test="${type=='XD'}">
                <spring:message code="label.Exportationdesdechetsdangereux" var="p_page"/>
            </c:when>
            <c:when test="${type=='TR'}">
                <spring:message code="label.Transitdesdechets" var="p_page"/>
            </c:when>
            <c:otherwise>
                <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
            </c:otherwise>
        </c:choose>


        <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}"
             style="width: 100%!important;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/> </a></li>
                <li class="breadcrumb-item active" aria-current="page"><a
                        href="/api/checkUserHasCollecte/${type}">${p_page}</a></li>
            </ol>
        </nav>


        <%-- <a href="/api/ListeAutorisation/${type }/n" class="btn " style="background-color: #7dc7bd;margin-bottom:12px;color:white;color:white"><spring:message code="label.numero"/></a>


            <a href="/api/addNumNotification" class="btn " style="background-color: #7dc7bd;margin-bottom:12px;color:white;color:white"><spring:message code="label.Demandedenumerodenotification"/></a>
            <a href="/api/ListeAutorisationDemande/${type}/d" class="btn btr" style="background-color: #7dc7bd;margin-bottom:12px;color:white;color:white"><spring:message code="label.Depot"/> </a>

         <hr> --%>

        <section class="services-section" style="background-color: white;margin-top: 2%">
            <div class="col-lg-12 p-0 grid-margin stretch-card cardstatistic" id="pagereload"
                 style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">

                <div class="tab" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}"
                     style="${pageContext.response.locale=='ar'?'float:right;':'float:left;'}">

                    <button class="tablinks btn-primary btn my_tab" onclick="openCity(this, '1')" id="defaultOpen"
                            style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">1.
                        <spring:message code="label.Numerodenotification" var="numNot"/>
                        ${type.equals("ZF")?numNot:"Exportateur - Notifiant"}
                    </button>
                    <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab}  id="Btn2"
                            onclick="openCity(this, '2')"
                            style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                       2. Importateur-${type.equals("ZF")?"Notifiant":"Destinataire"}
                    </button>
                    <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab} id="Btn3"
                            onclick="openCity(this, '3')"
                            style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                        3. <spring:message code="label.Documentdenotification"/>
                    </button>
                    <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==1)}">
                        <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn4"
                                onclick="openCity(this, '4')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            Transporteur National
                        </button>
                    </c:if>
                    <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==2) || (type.equals('ET'))}">
                        <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn5"
                                onclick="openCity(this, '5')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            Transporteur National
                        </button>
                    </c:if>
                    <c:if test="${(type.equals('ET')|| type.equals( 'XD' ) || type.equals( 'TR'))}">
                        <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn55"
                                onclick="openCity(this, '55')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            Transporteur International
                        </button>
                    </c:if>
                    <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn6"
                            onclick="openCity(this, '6')"
                            style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                        <spring:message code="label.producteursdesdechets"/>
                    </button>
                    <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn7"
                            onclick="openCity(this, '7')"
                            style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'} white-space: normal;">
                        <%--<spring:message code="label.installationdelimination"/>--%>
                            Installation d’élimination / valorisation
                    </button>
                    <%--<button style="white-space: normal;" class="tablinks btn-primary btn my_tab" ${disabledBtnTab}
                            id="Btn8" onclick="openCity(this, '8')"
                            style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                        4. <spring:message code="label.Documentdemouvementsdesdechets"/>
                    </button>--%>

                    <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab} id="Btn9"
                            onclick="openCity(this, '9')"
                            style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                        4. <spring:message code="label.mespieces"/>
                    </button>


                </div>

                <%--********************Tab1***************************--%>
                <div id="1" class="tabcontent pr-0">
                    <h4 class="titre_abs ">${type.equals("ZF")?numNot:"Exportateur - Notifiant"}</h4>

                    <form id="formnotif" name="formnotif">

                        <input type="hidden" value="${type}" name="zf_et">
                        <input type="hidden" name="compte_id" value="${user.compteId}">
                        <c:choose>
                            <c:when test="${id>0}">
                                <input type="hidden" name="id_notif_original" value="${notification.id_notif_original}">
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="id_notif_original" value="0">
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${id>0 && notification.statut.id_statut_projet != 29}">
                                <input type="hidden" name="id_statut" value="${notification.statut.id_statut_projet}">
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="id_statut" value="48">
                            </c:otherwise>
                        </c:choose>



                        <div class="row m-0 p-0 mt-5">
                            <c:if test="${!type.equals('ZF')}">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Nom de l'exportateur Notifiant</label>
                                    <input class="form-control" type="text" name="nom" value="${notification.nom}">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Télécopie</label>
                                    <input class="form-control" type="text" name="telecopie" value="${notification.telecopie}">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Personne à contacter</label>
                                    <input class="form-control" type="text" name="personne" value="${notification.personne}">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Tél</label>
                                    <input class="form-control" type="text" name="tel" value="${notification.tel}">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>courrier électronique</label>
                                    <input class="form-control" type="text" name="courrier" value="${notification.courrier}">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Adresse</label>
                                    <input class="form-control" type="text" name="adresse" value="${notification.adresse}">
                                </div>
                            </div>

                            <hr class="w-100">
                            </c:if>

                                <div class="col-6">
                                    <div class="form-group">
                                        <label><spring:message code="label.Numerodenotification"/></label>
                                        <c:choose>
                                            <c:when test="${typeRenouv=='N'}">
                                                <input class="form-control" name="num_notification" id="num_notifications"
                                                       value="${notification.num_notification}" ${(type=="XD" || type=="ZF")?"disabled":""}
                                                       onchange="checkNumNotif('${type }')" ${disabled}>
                                            </c:when>
                                            <c:when test="${typeRenouv=='R'}">
                                                <input class="form-control" name="num_notification" id="num_notifications"
                                                       value="${notification.num_notification}"
                                                       onchange="checkNumNotifRenouv('${type }',this)" ${disabled}>
                                            </c:when>
                                        </c:choose>

                                    </div>

                                    <div class="form-group">
                                        <label><spring:message code="label.Classificationdesdechets"/> </label>
                                        <c:if test="${type.equals('ZF') || type.equals('XD') || type.equals('TR') }">
                                            <select name="classification_id" id="Classification" ${disabled}
                                                    onchange="getOptionByFilter(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                    class="form-control select2" data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <c:forEach items="${classification}" var="t">
                                                    <option  <c:if
                                                            test="${notification.classification.id_classification== t[0]}"> selected </c:if>
                                                            value="${t[0] }">${t[1] }</option>
                                                </c:forEach>
                                            </select>
                                        </c:if>
                                        <c:if test="${type.equals('ET') }">
                                            <select name="classification_id" id="Classification"
                                                ${(not empty notification && notification.statut.id_statut_projet!=48)?'disabled':''}
                                                    onchange="getOptionByFilter(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                    class="form-control select2" data-width="100%">
                                                <option value="" selected><spring:message code="label.choisir"/></option>

                                                <option ${not empty notification?'selected':''} value="2"><spring:message
                                                        code="label.nondangereux"/></option>

                                            </select>
                                        </c:if>
                                    </div>

                                </div>


                            <div class="col-6">
                                <div class="form-group">

                                    <label><spring:message code="label.Operation"/></label>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-6 border-right">

                                                    <div class="form-check">

                                                        <input checked class="form-check-input" type="radio" ${disabled}
                                                               id="valorisationRadio"
                                                        <c:if test="${notification.operation== 'valorisation'}">
                                                               checked  </c:if> name="Operation" value="valorisation">

                                                        <label class="form-check-label"
                                                               style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                            <spring:message code="label.valorisation"/>
                                                        </label>
                                                    </div>

                                                </div>
                                                <div class="col-6 border-left">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" ${disabled}
                                                               id="traitementRadio"
                                                        <c:if test="${notification.operation== 'traitement'}">
                                                               checked  </c:if> name="Operation" value="traitement">

                                                        <label class="form-check-label"
                                                               style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                            <spring:message code="label.traitement"/>
                                                        </label>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>





                        </div>
                        <div class="row m-0 p-0 mt-2">


                                    <div class="col-6">
                                        <div class="form-group">

                                            <label><spring:message code="label.code"/></label>
                                            <select name="code_id" id="code" ${disabled}
                                                    onchange="getOptionByFilter(' id_Code = '+this.value,' id_Code,nom_ar  from Code ','id_type')"
                                                    class="form-control select2" data-width="100%">
                                                <c:if test="${notification!= null}">
                                                    <option value="">${notification.code.nom_fr}</option>
                                                </c:if>
                                                <option value=""><spring:message code="option.Choisir"/></option>

                                            </select>
                                        </div>
                                    </div>



                            <div class="col-6">
                                <div class="form-group">
                                    <label><spring:message code="label.typededechet"/></label>
                                    <select id="id_type" class="form-control select2" data-width="100%" ${disabled}>
                                        <c:if test="${notification!= null}">
                                            <option value="">${notification.code.nom_ar}</option>
                                        </c:if>
                                        <option value=""><spring:message code="option.Choisir"/></option>
                                    </select>
                                </div>

                            </div>




                        </div>

                        <div class="row m-0 p-0 mt-2">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>${champ_zf_et }: </label>
                                    <select name="${champ_zf_et=='Zone franche'?'idzonne_franche':'id_pays'}"
                                            id="Zone_Franche"
                                            class="form-control select2" ${disabled}
                                            onchange="changer_zoneFranche(this)"
                                            data-width="100%">
                                        <c:if test="${type.equals('TR') || type.equals('ET') }">
                                            <option value=""><spring:message code="option.Choisir"/></option>
                                        </c:if>

                                        <c:forEach items="${zonnefranche}" var="t">
                                            <option  <c:if
                                                    test="${notification.zonneFranche.id_zonnefranche== t[0]}"> selected </c:if>
                                                    value="${t[0] }">${t[1] }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="col-6">
                                <div class="form-group">
                                    <label><spring:message code="label.producteur"/> </label>
                                    <input type="text" name="producteur_text" class="form-control"
                                           value="${notification.producteur_text}"  ${disabled}>
                                </div>
                            </div>


                        </div>
                        <div class="row m-0 p-0 mt-2">
                            <div class="col-6">
                                <div class="form-group">
                                    <label><spring:message code="label.quantitetotaleprevu"/></label>
                                    <input type="text" name="quantite" id="quantite" onchange="changer_quantite(this)"
                                           value="${notification.quantite}"   ${disabled}
                                           class="form-control">
                                </div>
                            </div>

                            <div class="col-6">
                                <div class="form-group">
                                    <label><spring:message code="label.unite"/></label>
                                    <select name="unite_id" id="unite" class="form-control select2"
                                            onchange="changer_unite(this)"
                                            data-width="100%" ${disabled}>
                                        <option value=""><spring:message code="option.Choisir"/></option>
                                        <c:forEach items="${unite_id}" var="t">
                                            <option  <c:if
                                                    test="${notification.unite.unite_id== t[0]}"> selected </c:if>
                                                    value="${t[0] }">${t[1] }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="val_ou_trait" id="val_ou_trait">



                    </form>


                    <div class="row justify-content-center mt-3 mb-5">
                        <div class="col-md-2 col-sm-6">
                            <%-- <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                     id="Suivant"
                                     onclick="openCity1('Btn2','2')" class="btn btn-success"><spring:message code="button.Suivant"/>
                             </button>--%>
                            <c:if test="${id==0}">
                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivant"
                                    <%--onclick="addObject_step('formnotif','notification','2','0')"--%>
                                        onclick="addObjectGeneral('formnotif','notification','','id_notification','2')"
                                        class="btn btn-success btn-block"><spring:message code="button.Suivant"/>
                                </button>
                            </c:if>
                            <c:if test="${id>0}">
                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivant"
                                        onclick="updateGeneral('formnotif','notification',2,'${id}','id_notification','non')"
                                        class="btn btn-success btn-block"><spring:message code="button.Suivant"/>
                                </button>
                            </c:if>
                        </div>

                    </div>


                </div>
                <%--********************Tab2***************************--%>
                <div id="2" class="tabcontent pr-0">

                    <h4 class="titre_abs ">Importateur-${type.equals("ZF")?"Notifiant":"Destinataire"}</h4>
                    <form id="formimportateur" name="formimportateur">
                        <div class="row m-0 p-0 mt-5">
                            <input type="hidden" id="id_notification" name="notification_id"
                                   value="${notification.id_notification}">
                            <div class="col-6 ">
                                <div class="form-group">
                                    <label> <spring:message code="label.nom"/> </label>
                                    <input value="${notification.importateur.nom_fr}"  ${disabled} type="text"
                                           name="Nom_fr"
                                           id="Nom_fr" class="form-control">
                                </div>
                            </div>
                            <div class="col-6 ">
                                <div class="form-group" style="text-align: right;">
                                    <label dir="rtl"> الإسم : </label>
                                    <input dir="rtl" value="${notification.importateur.nom_ar}"  ${disabled} type="text"
                                           name="Nom_ar"
                                           id="Nom_ar" class="form-control">
                                </div>
                            </div>

                        </div>
                        <div class="row m-0 p-0 ">
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.personneacontacter"/> </label>
                                    <input value="${notification.importateur.contact_fr}"  ${disabled} type="text"
                                           name="contact_fr" id="represent_entreprise" class="form-control">
                                </div>
                            </div>
                            <c:if test="${type.equals('ZF')}">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label> <spring:message code="label.identifiantfiscal"/> </label>
                                        <input type="text" value="${notification.importateur.idf}"  ${disabled} name="idf"
                                               id="num_patente" class="form-control">
                                    </div>
                                </div>
                            </c:if>
                        </div>

                        <div class="row m-0 p-0">

                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.Adresse"/> </label>
                                    <input value="${notification.importateur.adresse_fr}"  ${disabled} type="text"
                                           name="adresse_fr" id="adresse"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.Telephone"/> </label>
                                    <input value="${notification.importateur.tel}"  ${disabled} type="text" name="tel"
                                           id="telephone"
                                           class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row m-0 p-0">
                            <div class="col-6">
                                <div class="form-group">

                                    <label> Ville/province </label>
                                    <select name="prefecture_id" id="prefecture_id"

                                            class="form-control select2" data-width="100%">
                                        <option value=""><spring:message code="option.Choisir"/></option>
                                        <c:forEach items="${prefectures}" var="t">
                                            <option  <c:if
                                                    test="${notification.prefecture.id_prefecture== t[0]}"> selected </c:if>
                                                    value="${t[0] }">${t[1] }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.Region"/> </label>
                                    <select name="region_id" id="region_id"

                                            class="form-control select2" data-width="100%">
                                        <option value=""><spring:message code="option.Choisir"/></option>
                                        <c:forEach items="${region}" var="t">
                                            <option <c:if
                                                    test="${notification.region.regionId== t[0]}"> selected </c:if>
                                                    value="${t[0] }">${t[1] }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="row m-0 p-0">
                            <div class="col-6">
                                <div class="form-group">
                                    <label> ${type.equals("ZF")?"Fax":"Télécopie"} </label>
                                    <input value="${notification.importateur.fax}"  ${disabled} type="text" name="fax"
                                           id="fax"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> ${type.equals("ZF")?"E-mail":"Courrier électronique"} </label>
                                    <input value="${notification.importateur.mail}"  ${disabled} type="text" name="mail"
                                           id="emailentrprs"
                                           class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row justify-content-center mt-3 mb-5">
                            <div class="col-md-2 col-sm-6">
                                <button type="button"
                                        onclick="openCity1('defaultOpen','1')"
                                        class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                </button>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <c:choose>
                                    <c:when test="${type=='XD' || type=='ZF' || (not empty notification && notification.statut.id_statut_projet!=48)}">
                                        <button type="button"
                                                onclick="openCity1('Btn3','3')"
                                                class="btn btn-success btn-block"><spring:message
                                                code="button.Suivant"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" id="Enregistrer"
                                                onclick="addObject_step('formimportateur','importateurnotifiant','3','id_notification')"
                                                class="btn btn-success btn-block"><spring:message
                                                code="button.Suivant"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>


                            </div>
                        </div>

                    </form>

                </div>
                <%--********************Tab3***************************--%>
                <div id="3" class="tabcontent pr-0">
                    <h4 class="titre_abs "><spring:message code="label.Notification"/></h4>
                    <form id="formnotif3" name="formnotif3">

                        <input type="hidden" id="id_obj3" value="${notification.id_notification}">
                        <div class="row m-0 p-0 mt-5">
                            <div class="col-6">
                                <div class="form-group">
                                    <label><spring:message code="label.quantitetotaleprevu"/> </label>
                                    <input type="text" class="form-control quantiteTotalPrevu" name="quantite" disabled
                                           value="${notification.quantite}"   ${disabled}>
                                </div>
                            </div>

                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.Nombretotalexpeditionsprevues" var="ex"/>
                                        ${type.equals("ZF")?ex:"Nombre Total de transferts prévus"}
                                    </label>
                                    <input type="text" name="expedition" value="${notification.expedition}"
                                           class="form-control">
                                </div>
                            </div>


                        </div>
                        <div class="row m-0 p-0 mt-2">
                            <div class="col-6">
                                <div class="form-group">

                                    <label><spring:message code="label.Operation"/></label>
                                    <div class="card" style=" height: 76px;">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-6 border-right">

                                                    <div class="form-check">

                                                        <input checked class="form-check-input" type="radio" disabled
                                                        ${( (type=='ET' || type=='TR') && id==0)?"disabled":""}
                                                        <c:if test="${notification.operation== 'valorisation'}">
                                                               checked  </c:if> value="valorisation">

                                                        <label class="form-check-label"
                                                               style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                            <spring:message code="label.valorisation"/>
                                                        </label>
                                                    </div>

                                                </div>
                                                <div class="col-6 border-left">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" disabled
                                                        ${( (type=='ET' || type=='TR') && id==0)?"disabled":""}
                                                        <c:if test="${notification.operation== 'traitement'}">
                                                               checked  </c:if> value="traitement">

                                                        <label class="form-check-label"
                                                               style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                            <spring:message code="label.traitement"/>
                                                        </label>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">

                                    <label><spring:message code="label.notificationconcernant"/> </label>
                                    <div class="card" style=" height: 76px;">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-6 border-right">

                                                    <div class="form-check">

                                                        <input checked class="form-check-input" type="radio"
                                                               name="uniques"

                                                        <c:if test="${notification.uniques == 'Expédition unique'}">
                                                               checked  </c:if> value="Expédition unique ">

                                                        <label class="form-check-label"
                                                               style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                            <spring:message code="label.Expeditionunique"/>
                                                        </label>
                                                    </div>

                                                </div>
                                                <div class="col-6 border-left">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="uniques"

                                                        <c:if test="${notification.uniques== 'Expéditions multiples'}">
                                                               checked  </c:if> value="Expéditions multiples">

                                                        <label class="form-check-label"
                                                               style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                            <spring:message code="label.Expeditionsmultiples"/>
                                                        </label>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-6">
                                <spring:message code="label.Periodeprevuedesexpeditions" var="tttt"/>
                                <label> ${type.equals("ZF")?tttt:"Période prévue Pour le(s) Transfert(s)"}  </label>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label><spring:message code="label.Premierdepart"/> </label>
                                            <input type="date" name="premier" value="${notification.premier}"
                                                   id="premierdepart"
                                                   class="form-control">
                                        </div>

                                        <div class="form-group">
                                            <label><spring:message code="label.Dernierdepart"/></label>
                                            <input type="date" name="dernier" value="${notification.dernier}"
                                                   id="dernierdepart"
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row m-0 p-0 mt-2">
                            <div class="col-6">
                                <div class="form-group">
                                    <label><spring:message code="label.Typedeconditionnement"/></label>
                                    <select name="idtypeconditionnement" id="conditionement"
                                            class="form-control select2"
                                            data-width="100%">
                                        <option value=""><spring:message code="option.Choisir"/></option>
                                        <c:forEach items="${type_conditionement}" var="t">
                                            <option  <c:if
                                                    test="${notification.typeconditionnement.typeConditionement_id== t[0]}"> selected </c:if>
                                                    value="${t[0] }">${t[1] }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label><spring:message code="label.Nomdeladestinationfinale"/> </label>
                                    <input type="text" name="destination_final"
                                           value="${notification.destination_final}" id="destributionfinal"
                                           class="form-control">
                                </div>
                            </div>

                        </div>
                        <div class="row m-0 p-0 mt-2">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>${type=="ZF"?"Zone Franche":"Pays Etranger"}</label>
                                    <select class="form-control select2 changerZonneFranche" disabled
                                    ${( (type=='ET' || type=='TR') && id==0)?"disabled":""}
                                            data-width="100%">
                                        <option value=""><spring:message code="option.Choisir"/></option>
                                        <c:forEach items="${zonnefranche}" var="t">
                                            <option  <c:if
                                                    test="${notification.zonneFranche.id_zonnefranche== t[0] || notification.pays.paysId==t[0]}"> selected </c:if>
                                                    value="${t[0] }">${t[1] }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label><spring:message code="label.Caracteristiquesphysiques"/> </label>
                                    <select name="idcaracteristque_physique" id="caracteristiquephysique"
                                            class="form-control select2"
                                            data-width="100%">
                                        <option value=""><spring:message code="option.Choisir"/></option>
                                        <c:forEach items="${caracteristiquephysique}" var="t">
                                            <option  <c:if
                                                    test="${notification.caracteristquePhysique.id_classification== t[0]}"> selected </c:if>
                                                    value="${t[0] }">${t[1] }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>


                        </div>

                        <div class="row justify-content-center mt-3 mb-5">
                            <div class="col-md-2 col-sm-6">
                                <button type="button"
                                        onclick="openCity1('Btn2','2')"
                                        class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                </button>
                            </div>
                            <div class="col-md-2 col-sm-6">

                                <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==1)}">
                                    <button type="button" id="Suivante"
                                            onclick="updateGeneral('formnotif3','notification',4,'${id}','id_notification','non')"
                                            class="btn btn-success btn-block">
                                        <spring:message code="button.Suivant"/>
                                            <%-- onclick="updateObject('formnotif3','notification','','4', ' id_notification='+$('#id_notification').val())"--%>
                                    </button>
                                </c:if>
                                <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==2) || (type.equals('ET'))}">
                                    <button type="button" id="Suivante"
                                            onclick="updateGeneral('formnotif3','notification',5,'${id}','id_notification','non')"
                                            class="btn btn-success btn-block">
                                        <spring:message code="button.Suivant"/>
                                    </button>
                                </c:if>
                                <c:if test="${(type.equals('TR'))}">
                                    <button type="button" id="Suivante"
                                            onclick="updateGeneral('formnotif3','notification',55,'${id}','id_notification','non')"
                                            class="btn btn-success btn-block">
                                        <spring:message code="button.Suivant"/>
                                    </button>
                                </c:if>



                            </div>

                        </div>

                    </form>
                </div>
                <%--********************Tab4***************************--%>
                <div id="4" class="tabcontent pr-0">
                    <h4 class="titre_abs "><spring:message code="label.transporteurprevu"/></h4>

                            <div class="row m-0 p-0 mt-3" id="divTableTranport">
                                <form id="formTransporteur" name="formTransporteur" style=" width: 100%;">
                                    <div class="row m-0 p-0 mt-5">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label> </label><input type="hidden" name="id_notification"
                                                                       id="id_notification4"
                                                                       value="${notification.id_notification}">
                                                <select name="id_transporteur" id="id_Transporteur"
                                                        class="form-control select2"
                                                        data-width="100%">
                                                    <option value="">Déclarer votre transporteur</option>
                                                    <c:forEach items="${Transporteur_liste}" var="t">
                                                        <option value="${t[0] }">${t[1] }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">

                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                        onclick="addObject_TR('formTransporteur','notif_tranport','divTableTranport')"
                                                        class="btn btn-success">
                                                    <spring:message code="button.ajouter"/>
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <table id="tableProfils"
                                       class="table my_table table-striped hover compact table-bordered text-md-nowrap">
                                    <thead class="thead-bleu">
                                    <tr>
                                        <th class=""><spring:message code="label.nom"/></th>


                                        <th class=""><spring:message code="label.identifiantfiscal"/></th>
                                            <%--<th class="">Adresse</th>--%>
                                        <th class=""><spring:message code="label.telephone"/></th>
                                        <th class=""><spring:message code="label.Fax"/></th>
                                        <th class=""><spring:message code="label.email"/></th>

                                        <th class=""><spring:message code="label.Action"/></th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbodyTransporteur">
                                    <c:forEach items="${notification.transporteur}" var="Tr_l">

                                        <tr>
                                            <td>${Tr_l.nom} </td>


                                            <td>${Tr_l.identifiant} </td>
                                                <%--<td>${Tr_l.adresse} </td>--%>
                                            <td>${Tr_l.tel} </td>
                                            <td>${Tr_l.fax} </td>
                                            <td>${Tr_l.email} </td>

                                            <td class="">
                                                <ul class="list-inline m-0">
                                                    <li class="list-inline-item">
                                                        <button onclick="delete_tr(this)"
                                                                class="btn btn-danger btn-sm rounded-circle tab_trash"
                                                                type="button" data-toggle="tooltip" data-placement="top"
                                                                title="Supprimer">
                                                            <div class="icon_trash_1">
                                                                <svg version="1.1" id="Capa_1"
                                                                     xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                                                     width="20px" height="20px" viewBox="0 0 489.74 489.74"
                                                                     style="enable-background:new 0 0 489.74 489.74;"
                                                                     xml:space="preserve">
                                                             <g>
                                                                 <g>
                                                                     <path d="M399.179,67.285l-74.794,0.033L324.356,0L166.214,0.066l0.029,67.318l-74.802,0.033l0.025,62.914h307.739L399.179,67.285z
                                                                    M198.28,32.11l94.03-0.041l0.017,35.262l-94.03,0.041L198.28,32.11z"/>
                                                                     <path d="M91.465,490.646h307.739V146.359H91.465V490.646z M317.461,193.372h16.028v250.259h-16.028V193.372L317.461,193.372z
                                                                    M237.321,193.372h16.028v250.259h-16.028V193.372L237.321,193.372z M157.18,193.372h16.028v250.259H157.18V193.372z"/>
                                                                 </g>
                                                             </g>
                                                           </svg>
                                                            </div>
                                                            <div class="icon_trash_2 d-none">
                                                                <svg version="1.1" id="Capa_1"
                                                                     xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                                                     width="20px" height="20px" viewBox="0 0 489.74 489.74"
                                                                     style="enable-background:new 0 0 489.74 489.74;"
                                                                     xml:space="preserve">
                                                             <g>
                                                                 <g>
                                                                     <path d="M361.051,199.929H102.01V489.74h259.041V199.929L361.051,199.929z M170.818,450.163h-13.492V239.505h13.492V450.163z
                                                                    M238.276,450.163h-13.492V239.505h13.492V450.163z M305.734,450.163h-13.492V239.505h13.492V450.163z"/>
                                                                     <path d="M387.73,145.959l-52.74-30.672l28.129-48.365L248.047,0l-28.127,48.362l-56.113-32.634l-26.678,45.875l223.922,130.231
                                                                   L387.73,145.959z M257.808,36.891l68.421,39.792l-14.564,25.038L243.241,61.93L257.808,36.891z"/>
                                                                 </g>
                                                             </g>
                                                           </svg>
                                                            </div>
                                                        </button>
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="row">
                                <div class="col-12 p-0">
                                    <div class="row justify-content-center mt-3 mb-5">
                                        <div class="col-md-2 col-sm-6">
                                            <button type="button"
                                                    onclick="openCity1('Btn3','3')"
                                                    class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                            </button>
                                        </div>
                                        <div class="col-md-2 col-sm-6">
                                            <c:choose>
                                                <c:when test="${type.equals('ZF')}">
                                                    <button type="button" id=""
                                                            onclick="openCity1('Btn6','6')" class="btn btn-success btn-block">
                                                        <spring:message code="button.Suivant"/>
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" id=""
                                                            onclick="openCity1('Btn55','55')" class="btn btn-success btn-block">
                                                        <spring:message code="button.Suivant"/>
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>
                                </div>
                            </div>


                </div>
                <%--********************Tab4_2***************************--%>
                <div id="5" class="tabcontent pr-0">
                    <h4 class="titre_abs "><spring:message code="label.transporteur"/></h4>
                        <div id="row_from_groupe" class="mb-5">
                            <div class="row m-0 p-0">
                                <div class="col-12 p-0 table-responsive">
                                    <table class="table my_table table-bordered table-striped table-hover">
                                        <thead>
                                        <tr>
                                            <th class="text-center"> Raison Social</th>
                                            <th class="text-center"> Matricule</th>
                                            <th class="text-center"> Type de transport</th>
                                            <th class="text-center"> Assurance</th>
                                            <th class="text-center"> Adresse</th>
                                            <th class="text-center"> Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${not empty notification.transporteur_etranger}">
                                            <c:forEach items="${notification.transporteur_etranger}" var="trans">
                                                <tr>
                                                    <td>${trans.raison_social}</td>
                                                    <td>${trans.num_matricule}</td>
                                                    <td>${trans.typeVehicule}</td>
                                                    <td><a target="_blank" download="assurance"
                                                           href="${url_Admin}${fn:replace(trans.url_assurance,"/assets/myFile/","/dowload_uploaded/")}"
                                                           class="btn btn-primary btn-sm"> <span
                                                            class="fa fa-download"></span> Assurance</a></td>
                                                    <td>${trans.adresse}</td>
                                                    <td class="text-center">
                                                        <button onclick="delete_transp_etrang('${trans.id_TransporteurEtranger}','id_notification','nationale')"
                                                                class="btn btn-danger rounded-circle"><span
                                                                class="fa fa-trash-alt"></span></button>
                                                        <button onclick="edit_transp_trang('${trans.id_TransporteurEtranger}','id_notification','nationale')"
                                                                class="btn btn-warning rounded-circle"><span
                                                                class="fa fa-pen"></span></button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty notification.transporteur_etranger}">
                                            <td colspan="7" class="bg-primary text-center"> Aucun transporteur</td>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row mt-3 justify-content-center p-0">
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label> Raison Sociale </label>
                                        <input type="text" id="raison_social_n" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label> Matricule </label>
                                        <input type="text" id="num_matriule_n" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 justify-content-center p-0">
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label> Type de transport </label>
                                        <input type="text" id="type_vehicule_n" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12 ">
                                    <div class="form-group">
                                        <label> Assurance </label>
                                        <input type="File" id="doc_assurance_n" class="form-control">
                                    </div>
                                </div>

                            </div>
                            <div class="row mt-3 justify-content-center p-0">
                                <div class="col-md-8 col-sm-12">
                                    <div class="form-group">
                                        <label> Adresse </label>
                                        <input type="text" id="adresseTr_n" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-sm-6 col-md-3">
                                    <input type="hidden" value="0" id="id_trans_n">
                                    <button class="btn btn-success btn-block"
                                            onclick="ajouterTranporteur_EtrangerNational('id_notification')">Enregistrer
                                        transporteur
                                    </button>
                                </div>
                            </div>
                        </div>
                    <div class="row">
                        <div class="col-12 p-0">
                            <div class="row justify-content-center mt-3 mb-5">
                                <div class="col-md-2 col-sm-6">
                                    <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==1)}">
                                        <button type="button"
                                                onclick="openCity1('Btn3','3')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </c:if>
                                    <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==2) || (type.equals('ET') || (type.equals('TR')) )}">
                                        <button type="button"
                                                onclick="openCity1('Btn3','3')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </c:if>


                                </div>
                                <div class="col-md-2 col-sm-6">
                                    <c:choose>
                                        <c:when test="${type.equals('ET') || type.equals('XD') || type.equals('TR')}">
                                            <button type="button" onclick="openCity1('Btn55','55')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Suivant"/></button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" onclick="openCity1('Btn6','6')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Suivant"/></button>
                                        </c:otherwise>
                                    </c:choose>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--********************Tab55***************************--%>  <%--********************Tab4_2***************************--%>
                <div id="55" class="tabcontent pr-0">
                    <h4 class="titre_abs "><spring:message code="label.transporteur"/></h4>
                          <div id="row_from_groupe_port" class="mb-5">
                            <div class="row m-0 p-0">
                                <div class="col-12 p-0 table-responsive">
                                    <table class="table my_table table-bordered table-striped table-hover">
                                        <thead>
                                        <tr>
                                            <th class="text-center"> Raison Social</th>
                                            <th class="text-center"> Matricule</th>
                                            <th class="text-center"> Type de transport</th>
                                            <th class="text-center"> Assurance</th>
                                            <th class="text-center"> Adresse</th>
                                            <th class="text-center"> Port</th>
                                            <th class="text-center"> Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${not empty notification.transporteur_etranger}">
                                            <c:forEach items="${notification.transporteur_etranger}" var="trans">
                                                <tr>
                                                    <td>${trans.raison_social}</td>
                                                    <td>${trans.num_matricule}</td>
                                                    <td>${trans.typeVehicule}</td>
                                                    <td><a target="_blank" download="assurance"
                                                           href="${url_Admin}${fn:replace(trans.url_assurance,"/assets/myFile/","/dowload_uploaded/")}"
                                                           class="btn btn-primary btn-sm"> <span
                                                            class="fa fa-download"></span> Assurance</a></td>
                                                    <td>${trans.adresse}</td>
                                                    <td>
                                                        <button class="btn btn-primary  btn-sm"
                                                                onclick="fun_affiche_modal('#modal_DetailPort','${trans.id_TransporteurEtranger}')">
                                                            Detail Port
                                                        </button>
                                                    </td>
                                                    <td class="text-center">
                                                        <button onclick="delete_transp_etrang('${trans.id_TransporteurEtranger}','id_notification','etranger')"
                                                                class="btn btn-danger rounded-circle"><span
                                                                class="fa fa-trash-alt"></span></button>
                                                        <button onclick="edit_transp_trang('${trans.id_TransporteurEtranger}','id_notification','etranger')"
                                                                class="btn btn-warning rounded-circle"><span
                                                                class="fa fa-pen"></span></button>
                                                    </td>
                                                </tr>
                                                <div class="modal fade"
                                                     id="modal_DetailPort_${trans.id_TransporteurEtranger}"
                                                     tabindex="-1" role="dialog"
                                                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
                                                     style="background: none">
                                                    <div class="modal-dialog modal-dialog-centered modal-lg"
                                                         role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Détail Port</h5>
                                                                <button onclick="close_modal(this)" type="button"
                                                                        class="close" data-dismiss="modal"
                                                                        aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row justify-content-center">
                                                                    <div class="col-10">
                                                                        <div class="row "
                                                                             style="background: gray;color: white;border-color: #737373;">
                                                                            <div class="col-6 border p-2 font_bold  btn-gris">
                                                                                #
                                                                            </div>
                                                                            <div class="col-6 border p-2 font_bold  btn-gris">
                                                                                Port
                                                                            </div>
                                                                        </div>

                                                                        <c:forEach items="${trans.port}" var="xx"
                                                                                   varStatus="loopp">
                                                                            <div class="row">
                                                                                <div class="col-6 border p-2">
                                                                                        ${loopp.index+1}
                                                                                </div>
                                                                                <div class="col-6 border p-2">
                                                                                        ${xx.nom_fr}
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button onclick="close_modal(this)" type="button"
                                                                        class="btn btn-secondary" data-dismiss="modal">
                                                                    Fermer
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty notification.transporteur_etranger}">
                                            <td colspan="7" class="bg-primary text-center"> Aucun transporteur</td>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="row mt-3 justify-content-center p-0">
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label> Raison Social </label>
                                        <input type="text" id="raison_social" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label> Matricule </label>
                                        <input type="text" id="num_matriule" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 justify-content-center p-0">
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label> Type de transport </label>
                                        <input type="text" id="type_vehicule" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12 ">
                                    <div class="form-group">
                                        <label> Assurance </label>
                                        <input type="file" class="form-control" id="doc_assurance">
                                    </div>
                                </div>

                            </div>
                            <div class="row mt-3 justify-content-center p-0">
                                <div class="col-md-8 col-sm-12">
                                    <div class="form-group">
                                        <label> Adresse </label>
                                        <input type="text" id="adresseTr" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 justify-content-center p-0">
                                <div class="col-sm-8 nopadding">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="port[]"
                                                   placeholder="Entrez Un Port">
                                            <div class="input-group-btn">
                                                <button class="btn btn-success" type="button"
                                                        onclick="education_fields();"><span class="fa fa-plus"
                                                                                            aria-hidden="true"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div id="education_fields"></div>
                            <div class="row justify-content-center">
                                <div class="col-sm-6 col-md-3">
                                    <input type="hidden" value="0" id="id_trans">
                                    <button class="btn btn-success btn-block"
                                            onclick="ajouterTranporteur_Etranger('id_notification')">Enregistrer
                                        transporteur
                                    </button>
                                </div>
                            </div>
                        </div>
                    <div class="row">
                        <div class="col-12 p-0">
                            <div class="row justify-content-center mt-3 mb-5">
                                <div class="col-md-2 col-sm-6">
                                    <c:if test="${(type=='ZF' || type=='XD') && notification.classification.id_classification==1}">
                                        <button type="button"
                                                onclick="openCity1('Btn4','4')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </c:if>

                                    <c:if test="${ type=='XD' && notification.classification.id_classification==2}">
                                        <button type="button"
                                                onclick="openCity1('Btn5','5')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </c:if>
                                    <c:if test="${type=='ET'}">
                                        <button type="button"
                                                onclick="openCity1('Btn5','5')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </c:if>
                                    <c:if test="${type=='TR'}">
                                        <button type="button"
                                                onclick="openCity1('Btn3','3')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </c:if>

                                </div>
                                <div class="col-md-2 col-sm-6">
                                    <button type="button" onclick="openCity1('Btn6','6')"
                                            class="btn btn-success btn-block"><spring:message
                                            code="button.Suivant"/></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--********************Tab55***************************--%>
                <div id="6" class="tabcontent pr-0">

                    <h4 class="titre_abs "><spring:message code="label.producteursdesdechets"/></h4>

                    <form id="formproducteur" name="formproducteur">
                        <div class="row m-0 p-0 mt-5">

                            <div class="col-6 ">
                                <div class="form-group">
                                    <label> <spring:message code="label.nom"/> </label>
                                    <input value="${notification.producteur.nom_fr}" type="text"
                                           name="Nom_fr" class="form-control">
                                </div>
                            </div>
                            <div class="col-6 ">
                                <div class="form-group" style="text-align: right;">
                                    <label dir="rtl"> الإسم : </label>
                                    <input dir="rtl" value="${notification.producteur.nom_ar}"
                                           type="text"
                                           name="Nom_ar" class="form-control">
                                </div>
                            </div>

                        </div>
                        <div class="row m-0 p-0">
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.personneacontacter"/> </label>
                                    <input value="${notification.producteur.contact_fr}" type="text"
                                           name="contact_fr" class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.identifiantfiscal"/> </label>
                                    <input type="text" value="${notification.producteur.idf}"
                                           name="idf" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row m-0 p-0">

                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.Adresse"/> </label>
                                    <input value="${notification.producteur.adresse_fr}" type="text"
                                           name="adresse_fr" class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.telephone"/> </label>
                                    <input value="${notification.producteur.tel}" type="text"
                                           name="tel"
                                           class="form-control">
                                </div>
                            </div>


                        </div>
                        <div class="row m-0 p-0">
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.Fax"/> </label>
                                    <input value="${notification.producteur.fax}" type="text"
                                           name="fax"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.email"/> </label>
                                    <input value="${notification.producteur.mail}" type="text"
                                           name="mail"
                                           class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row justify-content-center mt-3 mb-5">
                            <div class="col-md-2 col-sm-6">
                                <c:if test="${(type=='ZF') && notification.classification.id_classification==1 }">
                                    <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                            onclick="openCity1('Btn4','4')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </c:if>
                                <c:if test="${type=='ZF' && notification.classification.id_classification==2}">
                                    <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                            onclick="openCity1('Btn5','5')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </c:if>
                                <c:if test="${type=='TR'|| type=='ET' || (type=='XD')}">
                                    <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                            onclick="openCity1('Btn55','55')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </c:if>

                            </div>
                            <div class="col-md-2 col-sm-6">
                                <c:choose>
                                    <c:when test="${notification.producteur.id_producteur == null}">
                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                onclick="addObject_step('formproducteur','producteur','7','id_notification')"
                                                class="btn btn-success btn-block">
                                            <spring:message code="button.Suivant"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                onclick="updateObject('formproducteur','producteur','','7',' id_producteur = '+${notification.producteur.id_producteur})"
                                                class="btn btn-success btn-block">
                                            <spring:message code="button.Suivant"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                    </form>

                </div>
                <%--********************Tab6***************************--%>
                <div id="7" class="tabcontent pr-0">

                    <h4 class="titre_abs ">
                        Installation d’élimination / valorisation
                       <%-- <spring:message code="label.installationdelimination"/>--%>
                    </h4>

                    <form id="formeliminateur" name="formeliminateur">
                        <div class="row m-0 p-0 mt-5">

                            <div class="col-6 ">
                                <div class="form-group">
                                    <label> <spring:message code="label.nom"/> </label>
                                    <input value="${notification.eliminateur.nom_fr}" type="text"
                                           name="Nom_fr" class="form-control">
                                </div>
                            </div>
                            <div class="col-6 ">
                                <div class="form-group" style="text-align: right;">
                                    <label dir="rtl"> الإسم : </label>
                                    <input dir="rtl" value="${notification.eliminateur.nom_ar}"
                                           type="text"
                                           name="Nom_ar" class="form-control">
                                </div>
                            </div>

                        </div>
                        <div class="row m-0 p-0 ">
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.personneacontacter"/> </label>
                                    <input value="${notification.eliminateur.contact_fr}" type="text"
                                           name="contact_fr" class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.identifiantfiscal"/> </label>
                                    <input type="text" value="${notification.eliminateur.idf}"
                                           name="idf" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row m-0 p-0">

                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.Adresse"/> </label>
                                    <input value="${notification.eliminateur.adresse_fr}" type="text"
                                           name="adresse_fr" class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.telephone"/> </label>
                                    <input value="${notification.eliminateur.tel}" type="text"
                                           name="tel"
                                           class="form-control">
                                </div>
                            </div>


                        </div>


                        <div class="row m-0 p-0">
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.Fax"/> </label>
                                    <input value="${notification.eliminateur.fax}" type="text"
                                           name="fax"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.email"/> </label>
                                    <input value="${notification.eliminateur.mail}" type="text"
                                           name="mail"
                                           class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row justify-content-center mt-3 mb-5">
                            <div class="col-md-2 col-sm-6">
                                <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                        onclick="openCity1('Btn6','6')"
                                        class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                </button>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <c:choose>
                                    <c:when test="${notification.eliminateur.id_eliminateur == null}">
                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                onclick="addObject_step('formeliminateur','eliminateur','9','id_notification')"
                                                class="btn btn-success btn-block"><spring:message
                                                code="button.Suivant"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                onclick="updateObject('formeliminateur','eliminateur','','9','id_eliminateur = '+${notification.eliminateur.id_eliminateur})"
                                                class="btn btn-success btn-block">
                                            <spring:message code="button.Suivant"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                    </form>

                </div>
                <%--********************Tab7***************************--%>
                <%--<div id="8" class="tabcontent">

                    <h4 class="titre_abs "><spring:message code="label.Documentdemouvementsdesdechets"/></h4>

                    <form id="formDoc_Mouv" name="formnotif">
                        <div class="row m-0 p-0 mt-5">
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="form-group">
                                            <label> <spring:message code="label.Quantitereelle"/> </label>
                                            <input onchange="compareQuantite(this.value,${notification.quantite},${notification.id_notification })"
                                                   type="text" name="quantite_reel"
                                                   value="${notification.quantite_reel}"
                                                   class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label><spring:message code="label.unite"/> </label>
                                            <select name="unite_id" id="uniter"
                                                    class="form-control select2 changerUnite"
                                                    disabled
                                                    data-width="100%" ${disabled}>
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <c:forEach items="${unite_id}" var="t">
                                                    <option  <c:if
                                                            test="${notification.unite.unite_id== t[0]}"> selected </c:if>
                                                            value="${t[0] }">${t[1] }</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="col-6">
                                <div class="form-group">
                                    <label><spring:message code="label.Datereelledelexpedition"/>

                                    </label>
                                    <c:set value="" var="date_reel"/>
                                    <c:if test="${not empty notification.date_reel}">
                                        <fmt:formatDate value="${notification.date_reel}" pattern="yyyy-MM-dd"
                                                        var="date_reel"/>
                                    </c:if>


                                    <input type="date" name="date_reel" id="date_reel" value="${date_reel}"
                                           class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row m-0 p-0 mt-2 ">
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message code="label.Nombredecolis"/> </label>
                                    <input type="text" name="nbr_colis" value="${notification.nbr_colis}"
                                           id="quantiteReelle"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <label><spring:message code="label.Prescriptionsspecialesdemanutention"/></label>
                                <div class="row">
                                    &lt;%&ndash;                                        <div class="col-2"></div>&ndash;%&gt;
                                    <div class="col-4 pl-4 border-right">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio"
                                                   name="manutention"
                                                   onclick="fun_prescription_show()"
                                                   id="prescription1" value="oui"
                                            ${notification.manutention.equals('oui')?'checked':''} >
                                            <label class="form-check-label"
                                                   style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}"
                                                   for="prescription1"><spring:message code="label.oui"/></label>
                                        </div>
                                    </div>
                                    <div class="col-4 border-left">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio"
                                                   name="manutention"
                                                   id="prescription2"
                                                   onclick="fun_prescription_hide()"
                                                   value="non" ${notification.manutention.equals('non')?'checked':''} >
                                            <label class="form-check-label"
                                                   style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}"
                                                   for="prescription2"><spring:message code="label.non"/></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label> <spring:message
                                            code="label.Lieueffectifdeleliminationvalorisation"/> </label>

                                    <c:choose>
                                        <c:when test="${notification.classification.id_classification==1 || type=='TR'}">
                                            <select name="lieux_elimination" class="form-control select2"
                                                    id="select_lieux">
                                                <c:forEach items="${lieuElimination}" var="lieux">
                                                    <option ${lieux.id_lieuElimination==notification.lieux_elimination.id_lieuElimination?"selected":''}
                                                            value="${lieux.id_lieuElimination}">${lieux.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" name="lieu" value="${notification.lieu }"
                                                   id="lieuEffectif"
                                                   class="form-control">
                                        </c:otherwise>

                                    </c:choose>

                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group " id="azertyui" style="display: none;">
                                    <label>Joindre les Renseignements Détaillés</label>
                                    <input type="file" class="form-control" >
                                </div>
                            </div>

                        </div>
                        <div class="row m-0 p-0 mt-2">

                        </div>


                        <div class="m-0 p-0 mt-2 " style="display: none">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><spring:message code="label.transporteur"/> : 1</h5>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label><spring:message code="label.transporteur"/> </label>
                                                <select name="transporteur" id="transporteur"
                                                        class="form-control select2" data-width="100%">
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <option value="Transporteur1"><spring:message
                                                            code="label.transporteur"/> 1
                                                    </option>
                                                    <option value="Transporteur2"><spring:message
                                                            code="label.transporteur"/> 2
                                                    </option>
                                                    <option value="Transporteur3"><spring:message
                                                            code="label.transporteur"/> 3
                                                    </option>

                                                </select>
                                            </div>

                                        </div>
                                        <div class="col-4">
                                            <label><spring:message code="label.moyenTransport"/></label>
                                            <select name="moyenTransport" id="moyenTransport"
                                                    class="form-control select2" data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <option value="Route"><spring:message code="option.route"/></option>
                                                <option value="Train/Rail"><spring:message
                                                        code="option.train"/></option>
                                            </select>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label><spring:message code="label.Datedelapriseencharge"/></label>
                                                <input type="text" name="datePriseEnCharge" value=""
                                                       id="datePriseEnCharge" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <hr>

                                    <h5 class="card-title"><spring:message code="label.transporteur"/> : 2</h5>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label><spring:message code="label.transporteur"/> </label>
                                                <select name="transporteur" id="transporteur"
                                                        class="form-control select2" data-width="100%">
                                                    <option value="">Choisir...</option>
                                                    <option value="Transporteur1"><spring:message
                                                            code="label.transporteur"/> 1
                                                    </option>
                                                    <option value="Transporteur2"><spring:message
                                                            code="label.transporteur"/> 2
                                                    </option>
                                                    <option value="Transporteur3"><spring:message
                                                            code="label.transporteur"/> 3
                                                    </option>

                                                </select>
                                            </div>

                                        </div>
                                        <div class="col-4">
                                            <label><spring:message code="label.moyenTransport"/></label>
                                            <select name="moyenTransport" id="moyenTransport"
                                                    class="form-control select2" data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <option value="Route"><spring:message code="option.route"/></option>
                                                <option value="Train/Rail"><spring:message
                                                        code="option.train"/></option>
                                            </select>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label><spring:message code="label.Datedelapriseencharge"/></label>
                                                <input type="text" name="datePriseEnCharge" value=""
                                                       id="datePriseEnCharge" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <hr>


                                    <h5 class="card-title"><spring:message code="label.transporteur"/> : 3</h5>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label><spring:message code="label.transporteur"/> : </label>
                                                <select name="transporteur" id="transporteur"
                                                        class="form-control select2" data-width="100%">
                                                    <option value=""><spring:message code="option.Choisir"/></option>


                                                </select>
                                            </div>

                                        </div>
                                        <div class="col-4">
                                            <label><spring:message code="label.moyenTransport"/></label>
                                            <select name="moyenTransport" id="moyenTransport"
                                                    class="form-control select2" data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <option value="Route"><spring:message code="option.route"/></option>
                                                <option value="Train/Rail"><spring:message
                                                        code="option.train"/></option>
                                            </select>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label><spring:message code="label.Datedelapriseencharge"/></label>
                                                <input type="text" name="datePriseEnCharge" value=""
                                                       id="datePriseEnCharge" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div style="display: none">
                            <div class="row m-0 p-0 mt-2">
                                <c:if test="${notification.operation.equals('traitement') }">
                                    <div class="col-6">
                                        <div class="form-group" id="formElimination">
                                            <label><spring:message code="label.Operationdelimination"/></label>
                                            <select name="opElimination" id="opElimination"
                                                    class="form-control select2" data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <c:forEach items="${operation_el}" var="t">
                                                    <option value="${t[0] }">${t[1] }</option>
                                                </c:forEach>

                                            </select>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${notification.operation.equals('valorisation') }">
                                    <div class="col-6">
                                        <div class="form-group" id="formValorisation">
                                            <label> <spring:message code="label.Operationdevalorisation"/> </label>
                                            <select name="" id="opValorisation"
                                                    class="form-control select2" data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <c:forEach items="${operation_va}" var="t">
                                                    <option value="${t[0] }">${t[1] }</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </c:if>
                            </div>

                            <div class="row m-0 p-0 mt-2">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="denoEtCompoDechets"><spring:message
                                                code="label.Denominationetcompositiondesdechets"/> </label>
                                        <textarea class="form-control" id="denoEtCompoDechets"
                                                  rows="1"></textarea>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label><spring:message code="label.Caracteristiquesphysiques"/> </label>
                                        <select name="idcaracteristque_physique" id="caracteristiquephysique7"
                                                class="form-control select2"
                                                data-width="100%">
                                            <option value=""><spring:message code="option.Choisir"/></option>
                                            <c:forEach items="${caracteristiquephysique}" var="t">
                                                <option  <c:if
                                                        test="${notification.caracteristquePhysique.id_classification== t[0]}"> selected </c:if>
                                                        value="${t[0] }">${t[1] }</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                </div>
                            </div>

                            <div class="m-0 p-0 mt-5">
                                <div class="card" style="width: 100%">
                                    <div class="card-body">
                                        <h5 class="card-title"><spring:message code="label.Identificationdesdechets"/>
                                            <span
                                                    class="mb-2 text-muted" style="font-size: medium">(<spring:message
                                                    code="label.indiquerlescodescorrespondants"/> )</span>
                                            :</h5>
                                        <div class="row m-0 p-0 mt-4">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label for="conventienBale"><spring:message
                                                            code="label.ConventiondeBale"/> </label>
                                                    <input type="text" name="" value=""
                                                           id="conventienBale" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Codenational"/> </label>

                                                    <select ${disabled}
                                                            class="form-control select2" data-width="100%">
                                                        <c:if test="${notification!= null}">
                                                            <option value="">${notification.code.nom_fr}</option>
                                                        </c:if>
                                                        <option value=""><spring:message
                                                                code="option.Choisir"/></option>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-0 p-0 mt-2">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label for="codeDouanes"><spring:message
                                                            code="label.Codedesdouanes"/> </label>
                                                    <input type="text" name="codeDouanes" value=""
                                                           id="codeDouanes" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label><spring:message code="label.code"/> H </label>
                                                    <select name="" id="codeH" class="form-control select2"
                                                            data-width="100%">
                                                        <option value=""><spring:message
                                                                code="option.Choisir"/></option>
                                                        <c:forEach items="${operation_codeh}" var="t">
                                                            <option value="${t[0] }">${t[1] }</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-0 p-0 mt-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="identificationDechetsAutre"><spring:message
                                                            code="label.Autrepreciser"/> </label>
                                                    <textarea class="form-control" id="identificationDechetsAutre"
                                                              rows="2"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row justify-content-center mt-3 mb-5">
                            <div class="col-md-2 col-sm-6">
                                <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                        onclick="openCity1('Btn7','7')"
                                        class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                </button>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivante7"
                                        onclick="updateGeneral('formDoc_Mouv','notification',9,'${id}','id_notification','non')"
                                        class="btn btn-success btn-block"><spring:message code="button.Suivant"/>
                                </button>
                                &lt;%&ndash;<button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivante7"
                                        onclick="updateObject('formDoc_Mouv','notification','','8', ' id_notification='+$('#id_obj3').val())"
                                        class="btn btn-success kouidi">Suivant
                                </button>&ndash;%&gt;
                            </div>
                        </div>

                    </form>

                </div>--%>
                <%--********************Tab8***************************--%>
                <div id="9" class="tabcontent">

                    <h4 class="titre_abs "><spring:message code="label.mespieces"/></h4>
                    <input type="hidden" name="id_notif" id="id_notifss" value="${id_notif}">
                    <p>Les fichiers uploader doivent être scanner </p>

                    <c:forEach items="${doc}" var="dc">
                        <c:set var="id_doc" value="${dc.id_docImport}"/>
                        <div class="row justify-content-center">
                            <div class="col-6 mt-3  ">
                                <div class="form-group">
                                    <div>
                                        <c:if test="${(type!='ET') && (type!='TR') }">
                                            <label style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr} </label>
                                            <input
                                                    required
                                                    onchange="addDocs(${notification.id_notification},${id_doc},'doc${id_doc}')"
                                                    accept=".pdf" type="file" class=""
                                                    id="doc${id_doc}"
                                            >
                                        </c:if>
                                        <c:if test="${(type=='ET') ||( type=='TR')}">
                                            <label style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr} </label>
                                            <input
                                                    required
                                                    onchange="addDocs2('id_notification',${id_doc},'doc${id_doc}')"
                                                    accept=".pdf" type="file" class=""
                                                    id="doc${id_doc}"
                                            >
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                            <c:if test="${not empty docExiste}">
                                <div class="col-2">
                                    <c:forEach items="${docExiste}" var="d">
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

                    <div class="row justify-content-center mt-2 mb-4">
                        <div class="col-md-2 col-sm-6">
                            <button type="button"
                                    onclick="openCity1('Btn7','7')"
                                    class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                            </button>
                        </div>
                        <div class="col-md-2 col-sm-6">
                            <button type="button"
                                    onclick="verif_champs('9','${type}','id_notification')"
                            <%--onclick="openCityValidate('Btn9','9','formcompos','/api/ListeAutorisationDemande/${type}/d')"--%>
                                    class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/>
                            </button>
                        </div>
                    </div>

                    <%-- <form enctype="multipart/form-data" class="form-horizontal "
                           id="formcompos" name="formcompos" method="post">

                         <div class="row m-0 p-0 mt-5">
                             <c:forEach items="${doc }" var="doc" varStatus="status">
                                 <div class="col-6">
                                     <div class="form-group">
                                         <input type="hidden" name="id_notif" id="id_notifss" value="${id_notif}">
                                         <label>${doc.nom_fr} </label>
                                         <c:if test="${docExiste[status.index].docImport.id_docImport ==doc.id_docImport}">
                                             <a class="removeStyle" download
                                                href="${url_Admin}${fn:replace(docExiste[status.index].url, "/assets/myFile/", "/dowload_uploaded/")}">
                                                 <span class="fa fa-eye" style="font-size:21px;color: #33994c;"></span> </a>
                                         </c:if>
                                         <input required
                                                onchange="addDocs(${notification.id_notification},${doc.id_docImport},'doc${doc.id_docImport }')"
                                                accept=".pdf" type="file" class="custom-file-input" id="doc${doc.id_docImport }"
                                                class="form-control mydoc">
                                     </div>
                                 </div>
                             </c:forEach>
                         </div>


                         <div class="row m-0 p-0 mt-2">
                             <div class="col-3">
                             </div>
                             <div class="col-12" style="text-align: center">
                                 <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                        onclick="openCity1('Btn7','7')"
                                        class="btn btn-success">Précédent
                                 </button>

                                     <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                             onclick="openCityValidate('Btn9','9','formcompos','/api/ListeAutorisationDemande/${type}/d')"
                                             class="btn btn-success">Suivant
                                     </button>

                             </div>
                             <div class="col-3">
                             </div>

                         </div>
                     </form>--%>
                </div>
            </div>
        </section>
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
    $(document).ready(function(){
        $("#defaultOpen").click();
    });
    function checkNumNotifRenouv(type, val) {
        event.preventDefault();
        $.ajax({
            url: '/api/getOneNotification',
            type: 'post',
            data: {
                "id": $(val).val(),
                "type": type
            },
        })
            .done(function (response) {

                if (response != "not existe") {
                    window.location.href = "/api/addDemandNotification/" + response + "/" + type + "/R";
                } else {
                    swal("aucun Résultat", "aucun résultat ne correspond au critère de recherche", "error");
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
        $(evt).addClass("active");
        /*evt.currentTarget.className += " active";*/
    }

    // Get the element with id="defaultOpen" and click on it
    /*document.getElementById("defaultOpen").click();*/

    function schowform(blo_none, cityName) {

        document.getElementById(cityName).style.display = blo_none;
    }

    function compareQuantite(val, quantite, id) {
        if (quantite < val) {
            swal({

                title: "Information",
                text: "La quantité reél depasse la quantité déja entré",
                type: "warning",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#00695c',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Oui, Consulter !',

            }, function (isConfirm) {
                if (isConfirm) {
                    // window.location.href = "/api/addDemandNotification/" + id;
                    openCity1('Btn1', '1')
                }
            });
        }
    }

    /* add doument  */

    $(document).ready(function () {
        var validator = $("form").validate({});

        $(".mydoc").rules("add", {
            required: true,
            minlength: 3
        });
    });

    function updatePdf(id, form, table, url2, tap, id_obj) {

        fetch('/api/test/' + id)
            .then(resp => resp.blob())
            .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                // the filename you want
                a.download = 'Notification.pdf';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
                updateObject(form, table, url2, tap, id_obj);
            })
            .catch(() => alert(''));


    }

    function verif_champs(id_form, type, id_name) {
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


        if (test) {
            swal("Avertisement!", "un ou plusieur champs sont vide", "error");
        } else {
            changer_Statut(id, 33, type);
        }
    }

    function changer_Statut(id_notif, id_statut, type) {
        var link_recap = "/api/getnotifById1/" + type + "/" + id_notif;
        $.ajax({
            url: '/api/changerStatus',
            type: 'POST',
            data: {"id_notif": parseInt(id_notif), "id_statut": parseInt(id_statut), "type": type},
        })
            .done(function () {
                Swal.fire({
                    title: '<strong>votre demande a été effectué avec succès</strong>',
                    icon: 'success',
                    html:
                        '<a href="' + link_recap + '" class="btn btn-success ml-2 ">Recapitulation</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                    allowOutsideClick: false
                });
                window.location.href = '/api/downloadRecuDepo/' + id_notif;
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });


    }

    var room = 1;

    function education_fields() {
        room++;
        var objTo = document.getElementById('education_fields')
        var divtest = document.createElement("div");
        divtest.setAttribute("class", "form-group removeclass" + room);
        var rdiv = 'removeclass' + room;
        divtest.innerHTML = '<div class="row mt-3 justify-content-center p-0"> <div class="col-sm-8 nopadding"><div class="form-group"> <div class="input-group"><input type="text" class="form-control"  name="port[]"  placeholder="Entrez Un Port"> <button class="btn btn-danger" type="button" onclick="remove_education_fields(' + room + ');"> <span class="fa fa-minus" aria-hidden="true"></span> </button></div></div></div></div></div><div class="clear"></div>';

        objTo.appendChild(divtest)
    }

    function remove_education_fields(rid) {
        $('.removeclass' + rid).remove();
    }

    function fun_affiche_modal(id_modal, id_dmd) {
        $(id_modal + "_" + id_dmd).modal("toggle");
    }
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>