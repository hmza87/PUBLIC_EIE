<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head.jsp"/>


<style>
    * {
        box-sizing: border-box
    }


    .tabcontent {
        float: left;
        padding: 0px 20px;
        width: 80%;
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

</style>
<div class="col-12 p-0">
    <section class="services-section mt-5" style="background-color: white;margin-top: 2%; ${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">

        <a href="/api/ListeAutorisation/${type }/n" class="btn btr " style="background-color: #7dc7bd;margin:12px;color:white"><span class=" fa fa-arrow-down"></span>   <spring:message code="label.numero"/></a>
        <%--<a href="/api/addNumNotification" class="btn " style="background-color: #7dc7bd;margin-bottom:12px;color:white"><spring:message code="label.Demandedenumerodenotification"/></a>--%>
        <a href="/api/ListeAutorisationDemande/${type}/d" class="btn " style="background-color: #7dc7bd;color:white"><spring:message code="label.Depot"/> </a>

        <hr>

        <div class="col-lg-12 grid-margin stretch-card cardstatistic" id="pagereload">
            <c:choose>
                <c:when test="${empty notif}">
                    <c:set var="disabled" value="disabled"/>
                </c:when>
                <c:otherwise>
                    <c:set var="disabled" value=""/>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/addNumNotification/ZF')}">
                    <c:choose>
                        <c:when test="${pageContext.response.locale=='ar'}">
                            <c:set var="p_page" value="استيراد منطقة خالية من النفايات"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="p_page" value="Importation Déchets Zone Franche"/>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/addNumNotification/ET')}">
                    <c:choose>
                        <c:when test="${pageContext.response.locale=='ar'}">
                            <c:set var="p_page" value="استيراد مخلفات غير خطرة من دولة أجنبية"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="p_page" value="Importation des déchets non dangereux d’un pays étranger"/>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/addNumNotification/XD')}">
                    <c:choose>
                        <c:when test="${pageContext.response.locale=='ar'}">
                            <c:set var="p_page" value="تصدير المخلفات الخطرة"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="p_page" value="Exportation des déchets dangereux "/>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/addNumNotification/TR')}">
                    <c:choose>
                        <c:when test="${pageContext.response.locale=='ar'}">
                            <c:set var="p_page" value="عبور النفايات"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="p_page" value="Transit des déchets"/>
                        </c:otherwise>
                    </c:choose>
                </c:when>


                <c:otherwise>
                    <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                </c:otherwise>
            </c:choose>

            <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="float:${pageContext.response.locale=='ar'?'right':'left'}; width: 100%!important;">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/" ><spring:message code="label.Accueil"/> </a></li>
                    <li class="breadcrumb-item active" aria-current="page"> <a href="/api/checkUserHasCollecte/${type}" > ${p_page} </a></li>
                </ol>
            </nav>



            <div class="tab"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="float: ${pageContext.response.locale=='ar'?'right':'left'}">

                <button class="tablinks btn-primary btn" onclick="openCity(event, '1')" id="defaultOpen">1. <spring:message code="label.Demandedenumerodenotification"/> </button>
                <button class="tablinks btn-primary btn my_tab " ${disabled} id="Btn2" onclick="openCity(event, '2')">2. <spring:message code="label.ImportateurNotifiant"/> </button>

            </div>

            <div id="1" class="tabcontent pr-0">
                <h4 class="titre_abs "><spring:message code="label.Demandedenumerodenotification"/> </h4>
                <input type="hidden" id="id_notification" name="id_notification" value="${notif.id_notification}">
                <form id="formnotif" name="formnotif">

                    <input type="hidden" name="compte_id" value="${user.compteId}">

                    <c:choose>
                        <c:when test="${id>0}">
                            <input type="hidden" name="id_notif_original" value="${notification.id_notif_original}">
                            <input type="hidden" name="id_statut" value="${notification.statut.id_statut_projet}">
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="id_notif_original" value="0">
                            <input type="hidden" name="id_statut" value="29">
                        </c:otherwise>
                    </c:choose>

                    <div class="row m-0 p-0 mt-5">
                        <div class="col-6">
                            <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Classificationdesdechet"/> <sup class="text-danger">*</sup>  </label>

                                <select name="classification_id" id="Classification" required
                                        onchange="getOptionByFilter(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                        class="form-control select2 bg_error" data-width="100%">
                                    <option value=""><spring:message code="option.Choisir"/></option>
                                    <c:forEach items="${classification}" var="t">
                                        <option  <c:if test="${notif.classification.id_classification== t[0]}"> selected </c:if> value="${t[0] }">${t[1] }</option>
                                    </c:forEach>
                                </select>






                            </div>
                        </div>

                        <div class="col-6">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <p class="m-0">
                                    <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Operation"/> </label>
                                </p>

                                <div class="card w-100 mb-0">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-6 border-right">

                                                <div class="form-check">

                                                    <input checked class="form-check-input" type="radio"
                                                           id="valorisationRadio"
                                                    <c:if test="${notif.operation== 'valorisation'}">
                                                           checked  </c:if> name="Operation" value="valorisation">

                                                    <label class="form-check-label" style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                        <spring:message code="label.valorisation"/>
                                                    </label>
                                                </div>

                                            </div>
                                            <div class="col-6 border-left">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio"
                                                           id="traitementRadio"
                                                    <c:if test="${notif.operation== 'traitement'}">
                                                           checked  </c:if> name="Operation" value="traitement">

                                                    <label class="form-check-label" style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
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
                            <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.code"/> <sup class="text-danger">*</sup> </label>
                                <select name="code_id" id="code" required
                                        onchange="getOptionByFilter(' id_Code = '+this.value,' id_Code,nom_ar  from Code ','id_type')"
                                        class="form-control select2" data-width="100%">
                                    <option value=""><spring:message code="option.Choisir"/></option>
                                    <c:if test="${notif!=null }">
                                        <option value="${notif.code.id_code }" selected>${notif.code.nom_fr}</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>

                        <div class="col-6">
                            <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.typededechet"/> <sup class="text-danger">*</sup> </label>
                                <select onchange="alert_error_disabled('#id_type');" id="id_type" required class="form-control select2" data-width="100%">
                                    <option value=""><spring:message code="option.Choisir"/></option>
                                    <c:if test="${notif!=null }">
                                        <option value="${notif.code.id_code }" selected>${notif.code.nom_ar}</option>
                                    </c:if>
                                </select>
                            </div>

                        </div>
                    </div>

                    <div class="row m-0 p-0 mt-2">


                        <div class="col-6">
                            <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}">
                                    <c:choose>
                                        <c:when test="${type=='ZF'}">
                                            <spring:message code="label.Zonnefranche"/> <sup class="text-danger">*</sup>
                                        </c:when>
                                        <c:otherwise>
                                            <spring:message code="label.pays"/> étranger
                                        </c:otherwise>
                                    </c:choose>


                                </label>

                                <select onchange="alert_error_disabled('#Zone_Franche');" name="${type=='ZF'?'idzonne_franche':'id_pays' }" required id="Zone_Franche" class="form-control select2"
                                        data-width="100%">
                                    <option value=""><spring:message code="option.Choisir"/></option>

                                    <c:forEach items="${zonnefranche}" var="t">
                                        <option  <c:if test="${notif.zonneFranche.id_zonnefranche== t[0]}"> selected </c:if>
                                                value="${t[0]}">${t[1]}</option>
                                    </c:forEach>


                                </select>
                            </div>

                        </div>
                        <div class="col-6">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.producteur"/></label>
                                <input value="${notif.producteur_text}" type="text" required name="producteur_text" class="form-control">
                                <input value="${type}" type="hidden"  name="zf_et" class="form-control">

                            </div>
                        </div>

                    </div>


                    <div class="row m-0 p-0 mt-2">
                        <div class="col-6">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Quantite"/> </label>
                                <input min="0" type="number" required name="quantite" value="${notif.quantite}" id="quantite"
                                       class="form-control">
                            </div>
                        </div>

                        <div class="col-6">
                            <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.unite"/> <sup class="text-danger">*</sup> </label>
                                <select onchange="alert_error_disabled('#unite');" name="unite_id" required id="unite" class="form-control select2" data-width="100%">
                                    <option value=""><spring:message code="option.Choisir"/></option>
                                    <c:forEach items="${unite_id}" var="t">
                                        <option  <c:if test="${notif.unite.unite_id== t[0]}"> selected </c:if>
                                                value="${t[0] }">${t[1] }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row m-0 p-0 mt-2">

                        <div class="col-6">

                        </div>
                    </div>
                    <input type="hidden" name="val_ou_trait" id="val_ou_trait">
                    <div class="row justify-content-center m-0 p-0 mt-2">

                        <div class="col-md-2 col-sm-6" style="text-align: center">
                            <c:if test="${id==0}">
                                <button type="button" id="Suivant"
                                    <%--onclick="addObject_step('formnotif','notification','2','0')"--%>
                                        onclick="verifier_champ_vide('formnotif','notification','','id_notification','2')"
                                        class="btn btn-success btn-block mt-2 mb-4"><spring:message code="button.Suivant"/>
                                </button>
                            </c:if>
                            <c:if test="${id>0}">
                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivant"
                                        onclick="addObjectGeneral('formnotif','notification',2,'${id}','id_notification','non')" class="btn btn-success btn-block mt-2 mb-4"><spring:message code="button.Suivant"/>
                                </button>

                            </c:if>
                        </div>


                    </div>
                </form>


            </div>

            <div id="2" class="tabcontent pr-0">

                <h4 class="titre_abs "><spring:message code="label.ImportateurNotifiant"/> </h4>
                <form id="formimportateur" name="formimportateur">
                    <div class="row m-0 p-0 mt-5">
                        <input type="hidden" id="notification_id" name="notification_id" value="${notif.importateur.notification_id}">
                        <div class="col-6 ">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.nomdesociete"/> </label>
                                <input value="${notif.importateur.nom_fr}" type="text" name="Nom_fr" id="Nom_fr" class="form-control">
                            </div>
                        </div>

                        <div class="col-6 ">
                            <div class="form-group" style="text-align: right;">
                                <label dir="rtl">إسم الشركة : </label>
                                <input value="${notif.importateur.nom_ar}" type="text" name="Nom_ar" id="Nom_ar" class="form-control" dir="rtl">
                            </div>
                        </div>

                    </div>
                    <div class="row m-0 p-0 ">
                        <div class="col-6">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.personneacontacter"/></label>
                                <input value="${notif.importateur.contact_fr}" type="text"
                                       name="contact_fr" id="represent_entreprise" class="form-control">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.identifiantfiscal"/> </label>
                                <input type="text" value="${notif.importateur.idf}" name="idf" id="num_patente" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="row m-0 p-0">

                        <div class="col-6">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Adresse"/> </label>
                                <input value="${notif.importateur.adresse_fr}" type="text" name="adresse_fr" id="adresse"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Telephone"/> </label>
                                <input value="${notif.importateur.tel}" type="text" name="tel" id="telephone"
                                       class="form-control">
                            </div>
                        </div>


                    </div>


                    <div class="row m-0 p-0">
                        <div class="col-6">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Fax"/> </label>
                                <input value="${notif.importateur.fax}" type="text" name="fax" id="fax" class="form-control">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Email"/> </label>
                                <input  value="${notif.importateur.mail}" type="text" name="mail" id="emailentrprs"
                                        class="form-control emailValide">
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-2 col-sm-6">
                            <button type="button" id="ret"
                                    class="btn btn-success btn-block mt-2 mb-4"
                                    onclick="openCity2('#defaultOpen', '1')"/> <spring:message code="label.Retour"/>
                            </button>
                        </div>
                        <div class="col-md-2 col-sm-6">
                            <button type="button" id="Enregistrer"
                                    onclick="addObject2('formimportateur','importateurnotifiant','${type}')" class="btn btn-success btn-block mt-2 mb-4"><spring:message code="button.Enregistrer"/>
                            </button>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center mb-4">

                    </div>
                </form>

            </div>


        </div>
    </section>
</div>


<script>
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
            if($(data).length==1){
                $("#"+select_id +" option").eq(0).prop("selected",true);
            }
        })
        ;
    }
    // validation email

    function isEmail() {
        alert("hh");
        var email="h";
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
        alert(regex.test(email));

    }

</script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>