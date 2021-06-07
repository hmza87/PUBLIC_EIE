<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

    .main-panel {
        margin-top: 150px;
    }

    /* Style the tab content */

</style>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <section class="services-section bg-white">
                <div class="col-12 mb-4">

                    <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                            <li class="breadcrumb-item active" aria-current="page"><spring:message
                                    code="label.Installationdetraitementdesdechets"/></li>
                        </ol>
                    </nav>
                </div>
                <div class="col-lg-12 grid-margin stretch-card cardstatistic" id="pagereload">
                    <c:choose>
                    <c:when test="${empty notif}">
                        <c:set var="disabled" value="disabled"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="disabled" value=""/>
                    </c:otherwise>
                    </c:choose>

                    <div class="row-fluid mt-3" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">

                        <div class="tab">

                            <button class="tablinks btn-info btn" onclick="openCity(event, '1')" id="defaultOpen"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd">
                                1.<%--<spring:message code="label.InformationdepEtitionnaire"/>--%>
                                Information sur le pétitionnaire
                            </button>
                            <button class="tablinks btn-info btn my_tab " ${disabled} id="Btn2"
                                    onclick="openCity(event, '2')"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left; background-color: #7dc7bd;'} white-space: normal;">
                                2. <spring:message code="label.Installationdetraitementdesdechets"/></button>
                            </button>
                            <button class="tablinks btn-info btn my_tab" ${disabled} id="Btn3"
                                    onclick="openCity(event, '3')"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd">
                                3. <spring:message code="button.equipedetravail"/></button>
                            </button>
                            <button class="tablinks btn-info btn my_tab" ${disabled} id="Btn4"
                                    onclick="openCity(event, '4')"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd">
                                4. <spring:message code="button.mespieces"/></button>
                            </button>

                        </div>

                        <div id="1" class="tabcontent"
                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <h4 class="titre_abs ">
                                <%--<spring:message code="label.InformationdepEtitionnaire"/>--%>
                                Information sur le pétitionnaire
                            </h4>
                            <input type="hidden" name="id_installation" value="${notif.id_installation}"
                                   id="id_installation">

                            <form id="formnotif" name="formnotif">
                                <div class="row mt-5 p-0">

                                    <c:choose>
                                        <c:when test="${id!=0}">
                                            <input type="hidden" name="id_install_originale"
                                                   value="${notif.id_installOriginale}">
                                            <input type="hidden" name="id_statut"
                                                   value="${notif.statut.id_statut_projet}">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="hidden" name="id_install_originale" value="0">
                                            <input type="hidden" name="id_statut" value="51">
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${typeRenv=='N'}">
                                            <input type="hidden" name="id_type_renouvellement" value="1">
                                        </c:when>
                                        <c:when test="${typeRenv=='R'}">
                                            <input type="hidden" name="id_type_renouvellement" value="2">
                                        </c:when>
                                    </c:choose>

                                    <input type="hidden" name="id_compte" value="${user.compteId}">

                                    <c:if test="${typeRenv=='R'}">
                                        <div class="col-12 p-0 m-0">
                                            <div class="row m-0 p-0">
                                                <div class="col-6 ">
                                                    <div class="form-group"
                                                         style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                        <label><spring:message code="label.NumeroDemande"/> :</label>
                                                        <input value="${notif.num_demande}" type="text" disabled
                                                               required class="form-control"
                                                               onchange="getInstallRenouveller(this)">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label><spring:message code="label.nomdesociete"/> :</label>
                                            <input value="${notif.raison}" type="text" name="raison"
                                                   class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label><spring:message code="label.if"/> :</label>
                                            <input value="${notif.ife}" type="text" name="ife" id="telephone"
                                                   class="form-control">
                                        </div>
                                    </div>

                                </div>
                                <div class="row m-8 p-0">

                                    <div class="col-6 ">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label> <spring:message code="label.Adresse"/> :</label>
                                            <input value="${notif.adresse}" type="text" name="adresse" id="adresse"
                                                   class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label> <spring:message code="label.Tel"/> :</label>
                                            <input value="${notif.tel}" type="text" name="tel" id="telephone"
                                                   class="form-control">
                                        </div>
                                    </div>

                                </div>

                                <div class="row m-8 p-0">
                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label> <spring:message code="label.Fax"/> :</label>
                                            <input value="${notif.fax}" type="text" name="fax" id="fax"
                                                   class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label> <spring:message code="label.Email"/> :</label>
                                            <input value="${notif.email}" type="text" name="email" id="emailentrprs"
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>


                                <div class="row justify-content-center m-0 p-0 mt-2">

                                    <div class="col-3" style="text-align: center">
                                        <c:if test="${id==0 }">
                                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                    id="Suivant"
                                                    onclick="addObjectGeneral('formnotif','installation','','id_installation','2')"
                                                    class="btn btn-info btn-block"><spring:message code="button.Suivant"/>
                                            </button>
                                        </c:if>
                                        <c:if test="${id!=0 }">
                                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                    id="Suivant"
                                                    onclick="updateGeneral('formnotif','installation','2',${id},'id_installation','non')"
                                                    class="btn btn-info btn-block"><spring:message code="button.Suivant"/>
                                            </button>
                                        </c:if>
                                    </div>
                                </div>
                            </form>


                        </div>

                        <div id="2" class="tabcontent">

                            <h4 class="titre_abs"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                Installation de traitement des déchets</h4>
                            <form id="formimportateur1" name="formimportateur">


                                <div class="row m-0 p-0 mt-5">

                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label>Site de l'installation <%--<spring:message code="label.Site"/>--%> :</label>
                                            <input value="${notif.site}" type="text" required name="site"
                                                   class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">

                                            <label><spring:message code="label.Operation"/> :</label>
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-6 border-right">

                                                            <div class="form-check">

                                                                <input checked class="form-check-input" type="radio"
                                                                       id="valorisationRadio"
                                                                <c:if test="${notif.operation== 'valorisation'}">
                                                                       checked  </c:if> name="Operation"
                                                                       value="valorisation">

                                                                <label class="form-check-label"
                                                                       style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                    <spring:message code="label.valorisation"/>

                                                                </label>
                                                            </div>

                                                        </div>
                                                        <div class="col-6 border-left">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio"
                                                                       id="traitementRadio"
                                                                <c:if test="${notif.operation== 'traitement'}">
                                                                       checked  </c:if> name="Operation"
                                                                       value="traitement">

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

                                <!-- add type -->
                                <div class="row m-0 p-0 mt-2">
                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label><spring:message code="label.descriptiondinstallation"/> :</label>
                                            <input type="text" required name="description" value="${notif.description}"
                                                   class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label> <spring:message code="label.structuredinstallation"/> :</label>
                                            <input type="text" required name="structure" value="${notif.structure}"
                                                   class="form-control">
                                        </div>

                                    </div>
                                </div>
                                <!-- fin -->

                                <div class="row m-0 p-0 mt-2">

                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label> <spring:message code="label.Typedappareil"/> :</label>
                                            <input type="text" required name="type_appareil"
                                                   value="${notif.type_appareil}" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label> <spring:message code="label.Quantiteestime"/> du déchêt :</label>
                                            <input type="text" required name="quantite" value="${notif.quantite}"
                                                   id="quantite"
                                                   class="form-control">
                                        </div>
                                    </div>

                                </div>


                                <div class="row m-0 p-0 mt-2">

                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label> <spring:message code="label.Unite"/> :</label>
                                            <select name="id_unite" required id="unite" class="form-control select2"
                                                    data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/>...</option>
                                                <c:forEach items="${unite_id}" var="t">
                                                    <option  <c:if
                                                            test="${notif.unite.unite_id== t[0]}"> selected </c:if>
                                                            value="${t[0] }">${t[1] }</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>


                                <div class="row p-0">
                                    <div class="col-sm-8">
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

                                            <c:forEach items="${code}" var="c">

                                                <c:set var="checked" value=""/>
                                                <c:forEach items="${notif.code}" var="code_colle">
                                                    <c:if test="${code_colle.id_code==c.id_code}">
                                                        <c:set var="checked" value="checked disabled"/>
                                                    </c:if>
                                                </c:forEach>


                                                <tr>
                                                    <td>${c.nom_fr } -</td>
                                                    <td>${c.nom_ar }</td>
                                                    <td><input ${checked} class="h-15" type="checkbox"
                                                                          id="id-${c.id_code }"
                                                                          onchange="addCodeIT('id_installation','${c.id_code}','add')">
                                                    </td>
                                                </tr>
                                            </c:forEach>


                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="d-block h-100 my_rows" id="my_rows">

                                            <c:forEach items="${notif.code}" var="code_colle" varStatus="index">
                                                <div class="row p-0 m-0 ${index.index%2==0?'bg-light':''} ">
                                                    <div class="col-8"> ${code_colle.nom_ar} </div>
                                                    <div class="col-4 p-2 text-center">
                                                        <button class="btn btn-success rounded-circle"
                                                                onclick="addCodeIT('id_installation','${code_colle.id_code}','delete')">
                                                            <span class="fa fa-times"></span></button>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>

                                <div class="row justify-content-center mb-4">
                                    <div class="col-md-2 col-sm-6">
                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="prec1"
                                                onclick="openCity2('#defaultOpen', '1')"
                                                class="btn btn-info btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </div>
                                    <div class="col-md-2 col-sm-6">
                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Enregistrer"
                                                onclick="updateGeneral('formimportateur1','installation','3',${id},'id_installation','non')"
                                                class="btn btn-info btn-block"><spring:message code="button.Suivant"/>
                                        </button>
                                    </div>
                                </div>

                            </form>


                        </div>

                        <div id="3" class="tabcontent">

                            <h4 class="titre_abs"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.equipedetravail"/></h4>
                            <form id="formimportateur" name="formimportateur">

                                <div class="row m-0 p-0 mt-5">
                                    <div class="col-6 ">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label><spring:message code="label.nbequipe"/> :</label>
                                            <input value="${notif.nbr_equipe_travail}" type="number"
                                                   name="nbr_equipe_travail" id="Nom_fr" class="form-control">
                                            <input type="hidden" id="id_installation" class="form-control" name=""
                                                   value="${notif.id_installation}">

                                        </div>
                                    </div>

                                    <div class="col-6 ">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label><spring:message code="label.Horairedexploitation"/> :</label>
                                            <input value="${notif.horaire_exploitation}" type="text"
                                                   name="horaire_exploitation" id="Nom_ar" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-0 p-0 ">
                                    <div class="col-6">
                                        <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label><spring:message code="label.Nbrdeffectif"/> :</label>
                                            <input class="form-control" name="formation" value="${notif.formation}">
                                        </div>
                                    </div>
                                   <%-- <div class="col-6">
                                        <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label><spring:message code="label.qualification"/> / <spring:message
                                                    code="label.formation"/> :</label>
                                            <input type="file" id="qualif" class="form-control" onchange="fun_setqulaif()">
                                            <c:if test="${not empty notif.qualification}">
                                                <a href="${url_admin}${fn:replace(notif.qualification,"/assets/myFile/","/dowload_uploaded/")}" download target="_blank" class="btn btn-success mt-2">Télécharger fichier Qualification</a>
                                            </c:if>
                                            &lt;%&ndash;<textarea rows="3" name="qualification" id="represent_entreprise"
                                                      class="form-control">${notif.qualification}</textarea>&ndash;%&gt;
                                        </div>
                                    </div>--%>
                                </div>


                                <div class="row justify-content-center mb-4">
                                    <div class="col-md-2 col-sm-6">
                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="prec2"
                                                onclick="openCity2('#btn2', '2')"
                                                class="btn btn-info btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </div>
                                    <div class="col-md-2 col-sm-6">
                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Enregistrer"
                                                onclick="updateGeneral('formimportateur','installation','4',${id},'id_installation','non')"
                                                class="btn btn-info btn-block"><spring:message code="button.Suivant"/>
                                        </button>
                                    </div>
                                </div>
                            </form>


                        </div>

                        <!-- tab3 -->

                        <div id="4" class="tabcontent">

                            <h4 class="titre_abs "
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.mespieces"/></h4>

                            <c:forEach items="${doc}" var="dc">
                                <div class="row justify-content-center">
                                    <div class="col-6 mt-3  ">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <div>

                                                <label style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr} </label>
                                                <input
                                                        required
                                                        onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','IT','id_installation')"
                                                        accept=".pdf" type="file" id="doc${dc.id_docImport }"
                                                        class="form-control mydoc">

                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${not empty docNotify}">
                                        <div class="col-2">
                                            <c:forEach items="${docNotify}" var="d">
                                                <c:if test="${d.docImport.id_docImport==dc.id_docImport}">
                                                    <a href="${url_admin}${fn:replace(d.url, "/assets/myFile/", "/dowload_uploaded/")}"
                                                       class="btn btn-success rounded file_existe"><span
                                                            class="fa fa-download"></span></a>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </div>
                            </c:forEach>
                            <div class="row justify-content-center mb-5 mt-3">
                                <div class="col-md-2 col-sm-6">
                                    <button  type="button" id="prec2"
                                            onclick="openCity2('#btn3', '3')"
                                            class="btn btn-info btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-2 col-sm-6">
                                    <a href="#!" class="btn btn-info btn-block "
                                       onclick="verif_champs('4')"><spring:message code="button.Enregistrer"/></a>
                                </div>
                            </div>


                        </div>
                        <!-- TAB 3 FINs -->


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
                <input type="hidden" value="/api/generate_pdf_installation/"
                                             id="url_file_pdf">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message
                        code="label.Fermer"/></button>
            </div>
        </div>
    </div>
</div>

<script>

    function addCodeIT(id_installation, id_code, type) {
        event.preventDefault();
        var id_ins = $("#" + id_installation).val();
        if (id_ins == "") {
            return false;
        }
        $.ajax({
            url: '/api/setcodeInstall/' + id_ins + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data) {
                if (!data.user) {
                    window.location.href = '/index';
                }
                $("#my_rows").html("");
                $(data.codes).each(function (ind, el) {
                    console.log(el);
                    var cls = "";
                    if (ind % 2 == 0) {
                        cls = "bg-light";
                    }
                    var row = '<div class="row p-0 m-0 ' + cls + ' "> <div class="col-8"> ' + el.nom_ar + ' </div> <div class="col-4 p-2 text-center"> <button class="btn btn-success rounded-circle" onclick="addCodeIT(\'' + id_installation + '\',\'' + el.id_code + '\',\'delete\')"> <span class="fa fa-times"></span> </button> </div> </div>';
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

    function fun_affiche_modal_recap() {
        event.preventDefault();
        Swal.close();
        var id = $("#id_installation").val();
        if ($.trim(id) == "") {
            swal('Champs vide', "merci d'enristrer la demande", "warning");
            return false;
        }

        $.ajax({
            url: '/api/getCollectById1/' + id + "/IT",
            type: 'POST',
            dataType: 'html',
            data: {},
        })
            .done(function (response) {
                console.log(response);
                if (response == "" || $.trim(response) == "aucun resultat") {
                    swal("Aucun resultat", "merci de saisir un numeros valide", "info");
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

    function getInstallRenouveller(val) {
        event.preventDefault();
        var num = $(val).val();
        $.ajax({
            url: '/api/getOneInstall',
            type: 'post',
            data: {"id": $(val).val()},
        })
            .done(function (response) {

                if (response != "not existe") {
                    window.location.href = "/api/addInstallation/" + response + "/R";
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
        })
        ;
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
                test = true;
            }
        });

        if (test) {
            if (${pageContext.response.locale=='fr'}) {
                swal("Avertisement!", "un ou plusieur champs sont vide", "error");
            } else if (${pageContext.response.locale=='ar'}) {
                swal("تحذير!", "مجال واحد أو أكثر فارغ", "error");
            }
        } else {
            changer_statut_install('id_installation',14);
        }
    }

    function changer_statut_install(id_name,id_statut){

        var id_install = $("#"+id_name).val();
        var type="IT";
        var link_recap = "/api/checkUserHasCollecte/IT";

        $.ajax({
            url: '/api/changerStatus',
            type: 'POST',
            data: {"id_notif":parseInt(id_install),"id_statut":parseInt(id_statut),"type":type},
        })
            .done(function() {
                down_load_recu();
                Swal.fire({
                    title: '<strong>votre demande a été effectuée avec succès</strong>',
                    icon: 'success',
                    html:
                        '<a href="'+link_recap+'" class="btn btn-success ml-2 ">Recapitulation</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                    allowOutsideClick: false
                });
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
// EDH 18/04/2021
    function down_load_recu() {
        var url = $("#url_file_pdf").val();
        var id = $("#id_installation").val();
        var link = url + id;
        window.location = link;
    }
// fin de modification
</script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>