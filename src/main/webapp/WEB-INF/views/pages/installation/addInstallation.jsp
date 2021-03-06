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

    .myLabel label{
        line-height: 33px;
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
                            <li class="breadcrumb-item active" aria-current="page"><a href="/api/checkUserHasCollecte/IT"><spring:message
                                    code="label.Installationdetraitementdesdechets"/></a></li>
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
                        <input type="hidden" name="id_installation" value="${notif.id_installation}"
                               id="id_installation">

                        <div class="tab">
                            <c:if test="${notif.statut.id_statut_projet!=87}">
                                <button class="tablinks btn-info btn" onclick="openCity(event, '1')" id="defaultOpen"
                                        style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd">
                                    1.<%--<spring:message code="label.InformationdepEtitionnaire"/>--%>
                                    <spring:message code="label.informationssurlepetitionnaire"/>
                                </button>
                            </c:if>
                            <c:if test="${notif.statut.id_statut_projet==87 && not empty notif.codeTmp}">
                                <button class="tablinks btn-info btn ${notif.statut.id_statut_projet==87?'':'my_tab'} " ${disabled}
                                        onclick="openCity(event, '2')"
                                        style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left; background-color: #7dc7bd;'} white-space: normal;" id="${notif.statut.id_statut_projet==87 ?'defaultOpen':'Btn2'}">
                                    2. <spring:message code="label.Installationdetraitementdesdechets"/></button>
                                </button>
                            </c:if>
                            <c:if test="${notif.statut.id_statut_projet!=87}">
                                <button class="tablinks btn-info btn ${notif.statut.id_statut_projet==87?'':'my_tab'} " ${disabled} id="Btn2"
                                        onclick="openCity(event, '2')"
                                        style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left; background-color: #7dc7bd;'} white-space: normal;">
                                    2. <spring:message code="label.Installationdetraitementdesdechets"/></button>
                                </button>
                            </c:if>
                            <c:if test="${notif.statut.id_statut_projet!=87}">
                                <button class="tablinks btn-info btn ${notif.statut.id_statut_projet==87?'':'my_tab'}" ${disabled} id="Btn3"
                                        onclick="openCity(event, '3')"
                                        style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd" >
                                    3. <spring:message code="button.equipedetravail"/></button>
                                </button>
                            </c:if>
                            <c:if test="${notif.statut.id_statut_projet!=87}">
                                <button class="tablinks btn-info btn ${notif.statut.id_statut_projet==87?'':'my_tab'}" ${disabled} id="Btn4"
                                        onclick="openCity(event, '4')"
                                        style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd" id="${notif.statut.id_statut_projet==87 && empty notif.codeTmp ?'defaultOpen':'Btn4'}" ${notif.statut.id_statut_projet==87 && empty notif.codeTmp ?'':'disabled'}>
                                    4. <spring:message code="button.mespieces"/></button>
                                </button>
                            </c:if>
                            <c:if test="${notif.statut.id_statut_projet!=87}">
                                <button class="tablinks btn-primary btn ${notif.statut.id_statut_projet==87?'':'my_tab'}" ${disabledBtnTab} id="Btn5"
                                        onclick="verif_champs_recap('4','IT','id_installation','5')" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd" >
                                    5. R??capitulation
                                </button>
                            </c:if>

                        </div>

                        <c:if test="${notif.statut.id_statut_projet!=87}">
                            <div id="1" class="tabcontent"
                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <h4 class="titre_abs ">
                                <%--<spring:message code="label.InformationdepEtitionnaire"/>--%>
                                    <spring:message code="label.informationssurlepetitionnaire"/>
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
                                            <input value="${notif.email}" type="email" name="email" id="emailentrprs"
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>


                                <div class="row justify-content-center m-0 p-0 mt-2">

                                    <div class="col-3" style="text-align: center">
                                        <c:if test="${id==0 }">
                                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                    id="Suivant" disabled
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
                        </c:if>

                        <c:if test="${notif.statut.id_statut_projet!=87}">
                            <div id="2" class="tabcontent">

                            <h4 class="titre_abs"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.Installationdetraitementdesdechets"/></h4>
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
                                            <label> <spring:message code="label.Quantiteestime"/><spring:message code="label.dudechet"/>  :</label>
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
                               <%-- <div class="row m-0 p-0 mt-2" id="DivCat" style="display:${notif.type== '0'?'block':'none'} ">
                                    <div class="col-6">
                                        <div class="form-group"
                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <label> <spring:message code="label.Categorie"/> :</label>
                                            <select multiple required id="cat" class="form-control select2"
                                                    data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/>...</option>
                                                <c:forEach items="${categories}" var="c">
                                                    <c:forEach items="${notif.categorie}" var="x">
                                                        <option  <c:if
                                                                test="${x.nom_fr== c.nom_fr}"> selected </c:if>
                                                                value="${c.id_categorie}">${c.nom_fr }
                                                        </option>
                                                    </c:forEach>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="row m-0 justify-content-center p-0 mt-2">
                                    <section class="border p-3 justify-content-center col-sm-12">

                                        <!--Radio buttons-->
                                        <div class="btn-group col-sm-12 justify-content-center myLabel" data-toggle="buttons">

                                            <label class="btn btn-warning active form-check-label text-white col-md-4 m-2">
                                                <input class="form-check-input " type="radio" id="saufque" ${notif.type== '3'?'checked':''} name="type" value="3" onchange="my_function('3','id_installation')"  autocomplete="off"> je veux traiter tous les d??chets
                                            </label>

                                            <label class="btn btn-primary form-check-label col-md-4 m-2">
                                                <input class="form-check-input" type="radio" autocomplete="off" id="tous" ${notif.type== '2'?'checked':''} name="type" value="2" onchange="my_function('2','id_installation')">  je veux traiter les d??chets de la liste  sous-dessous
                                            </label>

                                            <label class="btn btn-danger form-check-label col-md-4 m-2">
                                                <input class="form-check-input" type="radio" autocomplete="off"  id="parType" ${notif.type== '1'?'checked':'checked'}  name="type" value="1" onchange="my_function('1','id_installation')">  je veux traiter tous les d??chets sauf
                                            </label>

                                        </div>
                                        <!--Radio buttons-->

                                    </section>
                                </div>
                                <div class="row m-0 p-0 mt-4">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-sm-8" style="display: none;" id="msg">
                                                <h4>Vous avez choisi tous les codes</h4>
                                            </div>
                                            <div class="col-sm-8 listCode">
                                                <table class="table MonTable table-striped" data-page-length="15">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col" style="min-width: 100px"><spring:message
                                                                code="label.CodeA"/></th>
                                                        <th scope="col"><spring:message code="label.TypeA"/></th>
                                                        <th scope="col">S??lectionner</th>
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
                                                            <td>${c.nom_fr }</td>
                                                            <td>${c.nom_ar }</td>
                                                            <td>
                                                                <input ${checked} class="h-15" type="checkbox"
                                                                                  id="id-${c.id_code }"
                                                                                  onchange="addCodeIT('id_installation','${c.id_code}','add')">
                                                            </td>
                                                        </tr>
                                                    </c:forEach>


                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-sm-4 listCode" style="margin-top: 4rem">
                                                <div class="row pb-2 m-0" id="monT">
                                                    <table class="table table-striped">
                                                        <tr>
                                                            <th>Type de d??chet</th>
                                                            <th>Action</th>
                                                        </tr>
                                                        <c:forEach items="${notif.code}" var="code_colle" varStatus="loopp" >
                                                            <tr>
                                                                <td class="col-8">${code_colle.nom_ar}</td>
                                                                <td class="col-4 p-2 text-center">
                                                                    <button class="btn btn-success rounded-circle"
                                                                            onclick="addCodeIT('id_installation','${code_colle.id_code}','delete')">
                                                                        <span class="fa fa-times"></span></button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </table>
                                                </div>
                                            </div>
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
                                                onclick="updateGeneral_installation('formimportateur1','installation','3',${id},'id_installation','non')" class="btn btn-info btn-block"><spring:message code="button.Suivant"/>
                                        </button>
                                    </div>
                                </div>
                            </form>

                        </div>
                        </c:if>

                        <c:if test="${notif.statut.id_statut_projet==87 && not empty notif.codeTmp}">
                            <div id="2" class="tabcontent">

                                <h4 class="titre_abs"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                    <spring:message code="label.Installationdetraitementdesdechets"/></h4>
                                <form id="formimportateur1" name="formimportateur" class="">
                                    <div class="row m-0 p-0 ">
                                        <div class="col-12">
                                            <h4>${notif.type.equals('2') && not empty notif.codeTmp?'Suite a l\'??tude de votre demande d\'installation et traitement des d??chets la commission a d??cid??e de retirer les d??chets ci-dessous  , pour suivre le traitement de votre demande  veuillez retirer  les d??chets suivant :':'Suite a l\'??tude de votre demande d\'installation et traitement des d??chets la commission a d??cid??e d\'ajouter ?? la liste des d??chets ci-dessous  , pour suivre le traitement de votre demande  veuillez d\'ajouter  les d??chets suivant :'}</h4>
                                            <div class="row justify-content-center" id="my_rows">
                                                <input type="hidden" id="cpt" value="${notif.codeTmp.size()}">
                                                <input type="hidden" id="typeIT" value="${notif.type}">
                                                <div class="col-sm-10 listCode" style="margin-top: 4rem">

                                                        <table class="table table-striped">
                                                            <tr>
                                                                <th>Type de d??chet</th>
                                                                <th>Action</th>
                                                            </tr>
                                                            <tbody id="tbody_it">
                                                            <c:forEach items="${notif.codeTmp}" var="code_colle" varStatus="loopp" >
                                                                <c:choose>
                                                                    <c:when test="${loopp.index%2==0}">
                                                                        <c:set var="bg" value="#FA8072"/>
                                                                    </c:when>
                                                                    <c:when test="${loopp.index%2!=0}">
                                                                        <c:set var="bg" value="#F08080"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:set var="bg" value=""/>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <tr style="background-color:${bg};color: white !important;font-weight:bold" >
                                                                    <td class="col-8">${code_colle.nom_ar}</td>
                                                                    <td class="col-4 p-2 text-center" id="myBtn${code_colle.id_code}">
                                                                        <button class="btn btn-info rounded-circle"
                                                                                onclick="addCodeIT_tmp('${code_colle.id_code}','delete')">
                                                                            <span class="${notif.type.equals('2')?'fa fa-times':'fa fa-plus'}"></span></button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center">
                                        <div class="col-10 mt-3  ">
                                            <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                <div>
                                                    <label style="width: 100%;"> ${pageContext.response.locale=='ar'?doc[14].nom_ar:doc[14].nom_fr} </label>
                                                    <input
                                                         required
                                                         onchange="addDocG('0',${doc[14].id_docImport},'doc${doc[14].id_docImport }','IT','id_installation')"
                                                         accept=".pdf" type="file" id="doc${doc[14].id_docImport }"
                                                         class="form-control mydoc">
                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center mb-4">
                                            <div class="col-md-2 col-sm-6">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="MyBtn"
                                                        onclick="changerEtat_IT()"  class="btn btn-info btn-block">Enregistrer
                                                </button>
                                            </div>
                                    </div>
                                </form>
                            </div>
                        </c:if>

                        <c:if test="${notif.statut.id_statut_projet!=87}">
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
                                                <a href="${url_admin}${fn:replace(notif.qualification,"/assets/myFile/","/dowload_uploaded/")}" download target="_blank" class="btn btn-success mt-2">T??l??charger fichier Qualification</a>
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
                        </c:if>

                        <!-- tab3 -->
                        <c:if test="${notif.statut.id_statut_projet!=87}">
                            <div id="4" class="tabcontent">

                                <h4 class="titre_abs "
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                    <spring:message code="label.mespieces"/></h4>
                            <p>
                                <%--                            cette modification demande par Mr mhamdi le 25/06--%>
                                <img src="/assets/images/warning.png" style="width: 40px;margin-left: 10px">
                                <spring:message code="label.Vouspouvezimporterdesdocumentsscannesen"/>
                            </p>
                                <c:forEach items="${doc}" var="dc">
                                    <div class="row justify-content-center">
                                            <div class="col-6 mt-3  ">
                                                <div class="form-group"
                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <div>
                                                        <c:if test="${dc.id_docImport!=1581}">
                                                        <label style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr} </label>
                                                        <input
                                                                required
                                                                onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','IT','id_installation')"
                                                                accept=".pdf" type="file" id="doc${dc.id_docImport }"
                                                                class="form-control mydoc">
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        <c:if test="${not empty docNotify}">
                                        <c:if test="${dc.id_docImport!=1581}">
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
                                        <div class="col-md-3 col-sm-6">
                                            <a class="btn btn-success btn-block "
                                               onclick="verif_champs_it('4','IT','id_installation','5')"><spring:message code="label.Afficherlerecapitulatif"/></a>
                                        </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${notif.statut.id_statut_projet!=87}">
                           <div id="5" class="tabcontent">

                            <h4 class="titre_abs "><spring:message code="label.Recapitulation"/></h4>
                            <div id="recap_install"></div>
                            <div class="row justify-content-center mt-2 mb-4">
                                <div class="col-md-2 col-sm-6">
                                    <button type="button"
                                            onclick="openCity2('btn4','4')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-2 col-sm-6">

                                    <button type="button"
                                            onclick="verif_recap_it('5','IT','id_installation')"
                                            class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>

                        </div>
                        </c:if>
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

    var xx = 0;
    function changerEtat_IT() {


        var id_ins = $("#id_installation").val ();

        $.ajax ({
            type: "GET",
            url: "/api/ChangerTypeIT/" + id_ins,
            contentType: 'application/json; charset=utf-8',
            data: {},
            success: function (response) {
               window.location.href="/api/ListInstallation";
            },
            error: function (response) {
            }
        });


    }

    function addCodeIT_tmp(id_code, type) {
        event.preventDefault();

        var id_ins = $("#id_installation").val();
        var cpt = $("#cpt").val();
        var typeIT = $("#typeIT").val();
        var rowCount = $("#tbody_it tr").length;
        console.log(cpt);
        console.log(xx);

        if (id_ins == "") {
            return false;
        }
        $.ajax({
            url: '/api/deleteCodeTmp_inst/' + id_ins + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data){
                if(typeIT ==="2"){
                    $("#my_rows").html(data);
                }
                else{
                    $("#myBtn"+id_code).html('<button class="btn btn-info rounded-circle" disabled style="cursor: not-allowed" onclick="addCodeIT_tmp(\'' + id_code + '\',\'delete\')"> <span class="fa fa-check"></span></button>')
                    xx++;
                }

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {

                if(rowCount===1 && typeIT==="2"){
                    $("#MyBtn").removeAttr("disabled");
                    $("#Btn4").removeAttr("disabled");
                }
                if(xx===rowCount && typeIT!=="2"){
                    $("#MyBtn").removeAttr("disabled");
                    $("#Btn4").removeAttr("disabled");
                }
                if (type == "add") {
                    $('#id-' + id_code).attr("disabled", "true");
                }
                if (type == "delete" && typeIT =="1") {
                    $("#tr-"+id_code).hide();
                }
                console.log("complete");
            });

    }

    /*function ChangerEtat() {

        var id_ins = $ ("#id_installation").val ();

            $.ajax ({
                type: "POST",
                url: "/api/ChangerEtat/" + id_ins + "/" + categories,
                contentType: 'application/json; charset=utf-8',
                data: {},
                success: function (response) {
                    window.location.href = "/api/getListeInstallation/0/6/0";
                },
                error: function (response) {
                }
            });
    }*/
    function my_function(val,id_installation){

        var id_ins = $("#id_installation").val();

            $.ajax({
                url: '/api/deleteAllByCode/' + id_ins,
                type: 'GET',
                data: {},
            })
                .done(function (data) {
                    $("#monT").html(data);
                    if(val==='3'){
                        $("#msg").show()
                        $(".listCode").hide()
                    }
                    else{
                        var table1 = $(".MonTable").dataTable();
                        var checkbox = table1.$("input[type=checkbox]");
                        $(checkbox).removeAttr("disabled");
                        $(checkbox).prop("checked", false);
                        $("#msg").hide()
                        $(".listCode").show();
                    }

                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                });
    }
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
                $("#monT").html(data);
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
                    swal("aucun R??sultat", "aucun r??sultat ne correspond au crit??re de recherche", "error");
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

    function verif_champs_it(id_form, type, id_name, tap) {
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
                swal("??????????!", "???????? ???????? ???? ???????? ????????", "error");
            }
        } else {
            searchByRecap(type);
            openCity2('Btn'+tap,tap);
        }
    }

    function verif_recap_it(id_form, type, id_name) {
        if(event!=null)
            event.preventDefault();
        // var tr = $("#" + id_form).find(".document").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        changer_statut_install('id_installation',14);

    }
    function verif_champs_recap(id_form, type, id_name, tap) {
        if(event!=null)
            event.preventDefault();
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();

        searchByRecap(type);
        openCity2('Btn'+tap,tap);

    }
    function changer_statut_install(id_name,id_statut){

        var id_install = $("#"+id_name).val();
        var type="IT";
        Swal.fire({
            title: 'Si vous cliquez sur enregistrer vous ne pouvez plus modifier votre demande',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: `Enregistrer`,
            denyButtonText: `Annuler`,
        }).then((result) => {
            down_load_recu();
            if (result.value) {
                $.ajax({
                    url: '/api/changerStatus',
                    type: 'POST',
                    data: {"id_notif":parseInt(id_install),"id_statut":parseInt(id_statut),"type":type},
                })
                Swal.fire({
                    title: '<strong>votre demande a ??t?? effectu??e avec succ??s</strong>',
                    icon: 'success',
                    html:
                        '<a href="/api/ListInstallation" class="btn btn-success mx-2 ">Retour ?? la liste</a> <a type="button" href="/api/generate_recap_instalation/'+id_install+'" class="btn btn-success ml-2 text-white">Imprimer le r??capulatif</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                    allowOutsideClick: false
                });
            }
        })
    }
// EDH 18/04/2021
    function down_load_recu() {
        var url = $("#url_file_pdf").val();
        var id = $("#id_installation").val();
        var link = url + id;
        window.location = link;
    }

    function  goToRecap(){
        window.location.href="/api/checkUserHasCollecte/IT";
    }
// fin de modification
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formnotif']").validate({

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
                email: "S'il vous pla??t, mettez une adresse email valide",
                tel: "S'il vous pla??t, mettez un telephone valide",
                fax: "S'il vous pla??t, mettez un fax valide",

            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });
</script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
