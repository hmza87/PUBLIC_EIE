<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>



<jsp:include page="../../includes/head.jsp"/>

<%--<jsp:include page="card.jsp" />--%>

<div class="container-fluid page-body-wrapper ml-3 mr-3">
    <div class="main-panel" style="margin-top: 150px;">
        <div class="content-wrapper">
            <section class="services-section" style="background-color: white" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <div class="row-fluid pt-2">
                    <div class="col-12">
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

                        <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                                <li class="breadcrumb-item active" aria-current="page"> <a href="/api/checkUserHasCollecte/${type}" >${p_page}</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="col-12" id="pagereload" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                        <table id="tab2" class="table table-striped hover compact table-bordered text-md-nowrap">
                            <thead class="thead-bleu">
                            <tr>
                                <th class=""><spring:message code="label.Numerodenotification"/> </th>
                                <th class=""><spring:message code="label.datedepot"/>  </th>
                                <%--<th class=""><spring:message code="label.classification"/>  </th>--%>
                                <th class=""><spring:message code="label.code"/></th>
                                <th class=""><spring:message code="label.typededechet"/></th>
                                <c:choose>
                                    <c:when test="${type=='ZF'}">
                                        <th class=""><spring:message code="label.Zonnefranche"/></th>
                                    </c:when>
                                    <c:otherwise>
                                        <th class=""><spring:message code="label.pays"/></th>
                                    </c:otherwise>
                                </c:choose>

                                <th class=""><spring:message code="label.Statut"/></th>
                                <th class=""><spring:message code="label.Operation"/></th>
                                <th class=""><spring:message code="label.Quantite"/></th>


                                <th class="all"><spring:message code="label.Action"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${notif}" var="nt" varStatus="loopp">
                                <tr>
                                    <td class="font-weight-semibold">${nt.num_notification }</td>

                                    <td>
                                        <fmt:formatDate   dateStyle="long" value="${nt.dateDepot }" />

                                    </td>
                                    <%--<td> <span class="badge badge-info"> ${nt.classification.nom_fr }</span>  </td>--%>

                                    <td> ${nt.code.nom_fr }  </td>
                                    <td> ${nt.code.nom_ar }  </td>
                                    <td> ${nt.zonneFranche.nom_fr } ${nt.pays.nom_fr}</td>
                                    <td>
                                        <c:if test="${nt.statut.id_statut_projet==37 || nt.statut.id_statut_projet==55 || nt.statut.id_statut_projet==48 || nt.statut.id_statut_projet==65 || nt.statut.id_statut_projet==67 ||  nt.statut.id_statut_projet==68 || nt.statut.id_statut_projet==40}">
                                            <span class="badge badge-info">${nt.statut.nom_fr}</span>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet!=84 && nt.statut.id_statut_projet!=37 && nt.statut.id_statut_projet!=54 && nt.statut.id_statut_projet!=55 && nt.statut.id_statut_projet!=48 && nt.statut.id_statut_projet!=64 && nt.statut.id_statut_projet!=65 && nt.statut.id_statut_projet!=67 &&  nt.statut.id_statut_projet!=68 && nt.statut.id_statut_projet!=40}">
                                            <span class="badge badge-info">en cours de traitement</span>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet==54}">
                                            <a type="button" onclick="show_popup()" class="text-white"><span class="badge badge-info">${nt.statut.nom_fr}</span></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet==64}">
                                            <a type="button" onclick="show_popup2()" class="text-white"><span class="badge badge-info">${nt.statut.nom_fr}</span></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet==84}">
                                            <a type="button" onclick="show_popup3()" class="text-white"><span class="badge badge-info">${nt.statut.nom_fr}</span></a>
                                        </c:if>
                                    </td>
                                    <td>  ${nt.operation }  </td>
                                    <td> ${nt.quantite } ${nt.unite.nom_fr } </td>



                                    <td class="">
                                        <c:if test="${nt.statut.id_statut_projet==29 }">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
                                                <a type="button" style="background-color: #0db8db" onclick="goToLien('${type }/${nt.id_notification }')" data-popover="true" data-html=true data-content="Modifier"><i class="fa fa-edit"></i></a>
                                            </div>
                                            <div class="tool-box">
                                                <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                <div class="clear"></div>
                                            </div>
                                        </c:if>
                                        <c:if test="${(((type=='ZF' || type=='XD') && (nt.statut.id_statut_projet==54 || nt.statut.id_statut_projet==67 || nt.statut.id_statut_projet==68) && nt.classification.id_classification==1)) || nt.statut.id_statut_projet!=48 }">
                                            <c:if test="${nt.statut.id_statut_projet!=33 && nt.statut.id_statut_projet!=84 && nt.statut.id_statut_projet!=55 && nt.statut.id_statut_projet!=56 && nt.statut.id_statut_projet!=37 && nt.statut.id_statut_projet!=63 && nt.statut.id_statut_projet!=64 && nt.statut.id_statut_projet!=57 && type!='TR' && type!='ET'}">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
                                                <a type="button" style="background-color: #0db8db" onclick="goToLien1('${nt.id_notification }')" data-popover="true" data-html=true data-content="${nt.statut.id_statut_projet==54?'Ajouter':'Modifier'} le certificat d'élimination"><i class="fa fa-plus"></i></a>
                                                <a type="button" style="background-color: #0db8db" onclick="load_modal_transporteur('${nt.id_notification}')" data-popover="true" data-html=true data-content="Déclarer un nouveau transporteur"><i class="fa fa-plus"></i></a>
                                                <a type="button" style="background-color: #0db8db" onclick="goToLien3('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="Afficher le récapitulatif"><i class="fa fa-print"></i></a>
                                            </div>
                                            <div class="tool-box">
                                                <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                <div class="clear"></div>
                                            </div>
                                            </c:if>
                                        </c:if>

                                        <c:if test="${nt.statut.id_statut_projet==33 || nt.statut.id_statut_projet==84 || nt.statut.id_statut_projet==55 || nt.statut.id_statut_projet==56 || nt.statut.id_statut_projet==63 || nt.statut.id_statut_projet==64 || nt.statut.id_statut_projet==57 || (type=='ET' || type=='TR' && nt.statut.id_statut_projet==54)}">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
                                                <a type="button" style="background-color: #0db8db" onclick="goToLien3('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="Afficher le récapitulatif"><i class="fa fa-print"></i></a>
                                            </div>
                                            <div class="tool-box">
                                                <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                <div class="clear"></div>
                                            </div>
                                        </c:if>

                                        <c:if test="${nt.statut.id_statut_projet==48 }">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
                                                <a type="button" style="background-color: #0db8db" onclick="goToLien2('${nt.id_notification}/${type}/N')" data-popover="true" data-html=true data-content="Modifier"><i class="fa fa-edit"></i></a>
                                            </div>
                                            <div class="tool-box">
                                                <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                <div class="clear"></div>
                                            </div>
                                        </c:if>


                                        <c:if test="${nt.statut.id_statut_projet==37 }">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
                                                <a type="button" style="background-color: #0db8db" onclick="goToLien4('${nt.id_notification }/${type}')" data-popover="true" data-html=true data-content="Améliorer les documents"><i class="fa fa-upload"></i></a>
                                            </div>
                                            <div class="tool-box">
                                                <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                <div class="clear"></div>
                                            </div>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>

                </div>
            </section>

        </div>
    </div>
</div>



<!-- Modal -->
<div class="modal fade" id="declarationTransp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.Declarationdutransporteur"/></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12" id="groupe_select" >
                        <spring:message code="label.AucunTransporteurnestcompatibleavecletypedesdechetsdevotreautorisation"/>
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.Annuler"/></button>
                <button id="btn_valide_trans" type="button" class="btn btn-primary" onclick="saveDeclarationTransporteur()"><spring:message code="button.Enregistrer"/></button>
            </div>
        </div>
    </div>
</div>



<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content" style="width: 900px !important;max-width:900px !important ;margin-left: -20%; !important;">

            <div class="modal-body">

                <div id="dossierbd" class="row m-0 p-0">
                    <div id="blockOne" class="col-6"></div>
                    <div id="blocktwo" class="col-6"></div>
                </div>
<%--                <table id="dossiertable" class="table table-striped table-bordered dt-responsive nowrap">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>

<%--                        <th>DOC Notification </th>--%>
<%--                        <th>DOC Mouvement </th>--%>
<%--                        <th>Garantie Financière </th>--%>
<%--                        <th>Contrat</th>--%>
<%--                        <th>Analyses/Fiche d’identification DD</th>--%>
<%--                        <th>CAP</th>--%>
<%--                        <th>Autorisation d’exploitation de l’installation</th>--%>
<%--                        <th>Autorisation de l’installation</th>--%>
<%--                        <th>Assurance de la Responsabilité Civile de l’installation</th>--%>
<%--                        <th>Autorisation de Collecte et transport </th>--%>
<%--                        <th>Déclaration sur l’honneur sur l’exactitude des informations présentées </th>--%>
<%--                        <th> Cahier de charge </th>--%>


<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                   --%>
<%--                </table>--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal"><spring:message code="label.Fermer"/></button>
            </div>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
<script>

    $('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'top', delay: {show: 50, hide: 400}});

    function goToLien(val){
        window.location.href="/api/addNumNotification/"+val;
    }
    function goToLien1(val){
        window.location.href="/api/addDocmouvement/"+val;
    }
    function goToLien2(val){
        window.location.href="/api/addDemandNotification/"+val;
    }
    function goToLien3(val){
        window.location.href="/api/getnotifById1/"+val;
    }
    function goToLien4(val){
        window.location.href="/api/validateDoc/"+val;
    }



    function show_popup(){
        swal("","Vous pouvez vous déplacez pour l'obtention de votre autorisation","success");
    }
    function show_popup2(){
        swal("","Vous pouvez vous déplacez pour l'obtention de votre garantie financière","success");
    }
    function show_popup3(){
        swal("","Vous pouvez vous déplacez pour l'obtention de votre lettre originale","success");
    }
</script>




