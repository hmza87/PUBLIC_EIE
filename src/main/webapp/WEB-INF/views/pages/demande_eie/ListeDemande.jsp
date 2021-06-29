<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>


<jsp:include page="../../includes/head.jsp"/>

<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <section class="services-section container-fluid bg-white" >
                <c:choose>
                    <c:when test="${type=='EE' || type=='RS'}">
                        <spring:message code="option.Etudedimpactenvironnementale" var="p_page" />
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
                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                                <li class="breadcrumb-item"><a href="/api/checkEIESelect/${type=="RS"?"EE":type}">${p_page} </a></li>
                                <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.MesDossiers"/></li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                            <table id="tab2" class="table table-striped hover compact table-bordered text-md-nowrap">
                                <thead class="">
                                <tr>
                                    <th rowspan="2" ><spring:message code="label.NDemande"/> </th>
                                    <th rowspan="2" ><spring:message code="label.datedepot"/>  </th>
                                    <th rowspan="2" ><spring:message code="label.Statut"/></th>
                                    <c:if test="${type=='AE'}">
                                    <th rowspan="2" ><spring:message code="label.Intituledeprojet"/></th>
                                    </c:if>
                                    <c:if test="${type!='AE'}">
                                        <th rowspan="2" >Intitulé du projet</th>
                                    </c:if>
                                    <th colspan="5" style="text-align: center;background-color: #f6f6f6"><spring:message code="label.petitionnaire"/></th>
                                    <th rowspan="2" ><spring:message code="label.Region"/></th>
                                    <th rowspan="2" ><spring:message code="label.Recap"/></th>
                                    <th rowspan="2" ><spring:message code="label.TypedeProjet"/></th>
                                    <th rowspan="2" > <spring:message code="label.DatedeVisite"/> </th>
                                    <th rowspan="2" > <spring:message code="label.Pvdevisite"/> </th>

                                    <c:if test="${type!='NT'}">
                                        <th rowspan="2" ><spring:message code="label.Caracteretransfrontalier"/> </th>
                                    </c:if>
                                    <c:if test="${type=='NT'}">
                                        <th rowspan="2" > <spring:message code="label.Pvdevisite"/><spring:message code="label.Typeduprojet"/> </th>
                                        <th rowspan="2" > <spring:message code="label.Consistanceduprojet"/> </th>
                                    </c:if>
                                    <th rowspan="2" ><spring:message code="label.piecefournie"/></th>
                                    <c:if test="${type=='EE'}">
                                        <th rowspan="2"><spring:message code="label.EtudedimpcatenvirennementaleDefinitive"/> </th>
                                        <th rowspan="2"><spring:message code="label.CahierdechargeDefinitive"/> </th>
                                    </c:if>
                                    <c:if test="${type=='NT'}">
                                        <th rowspan="2"><spring:message code="label.Noticedimpactenvironnementaledefinitive"/> </th>
                                    </c:if>
                                    <c:if test="${type=='AE'}">
                                        <th rowspan="2"><spring:message code="label.Auditenvironnementaldefinitif"/> </th>
                                    </c:if>


                                        <%--<th rowspan="2" ><spring:message code="label.Informationcomplementaire"/></th>--%>
                                    <th class="all" rowspan="2" ><spring:message code="label.Action"/></th>
                                </tr>
                                <tr>
                                    <th><spring:message code="label.Raisonsocial"/>  </th>
                                    <th><spring:message code="label.Representant"/>  </th>
                                    <th><spring:message code="label.Tel"/> </th>
                                    <th> <spring:message code="label.Fax"/> </th>
                                    <th><spring:message code="label.Email"/>  </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${notif}" var="nt" varStatus="loopp">
                                    <tr>
                                        <td class="font-weight-semibold">${nt.num_demande}</td>
                                        <td>
                                            <fmt:formatDate   dateStyle="long" value="${nt.dateDepot }" />
                                        </td>
                                        <td> <span class="badge badge-success"> ${(nt.statut.id_statut_projet==1 || nt.statut.id_statut_projet==3 ||
                                                nt.statut.id_statut_projet==6 || nt.statut.id_statut_projet==7 || (nt.statut.id_statut_projet==73 && nt.type=='AE') || (nt.statut.id_statut_projet==12 && nt.type=='AE') ||
                                                nt.statut.id_statut_projet==10 || nt.statut.id_statut_projet==13 || (nt.statut.id_statut_projet==71 && nt.type=='AE') ||
                                                nt.statut.id_statut_projet==47 || nt.statut.id_statut_projet==59 || (type=='AE' && nt.statut.id_statut_projet==58) ||
                                                nt.statut.id_statut_projet==60 || nt.statut.id_statut_projet==75 )?nt.statut.nom_fr:'En cours de traitement'}</span>
                                        </td>
                                        <td> ${nt.intitule_projet}  </td>
                                        <td>${nt.raison_social}</td>
                                        <td>${nt.represantant}</td>
                                        <td>${nt.tel}</td>
                                        <td>${nt.fax}</td>
                                        <td>${nt.email}</td>
                                        <td>
                                            <c:if test="${not empty nt.detailRegion}">
                                                <button  onclick="fun_affiche_modal('#modal_DetailRegion','${nt.id_demande_information}')" class="btn btn-success btn-sm">Details Region</button>
                                            </c:if>
                                            <c:if test="${empty nt.detailRegion}">
                                                -
                                            </c:if>
                                                <%-- <c:forEach items="${nt.regions}" var="rg">${rg.nom_fr}</c:forEach>--%>
                                        </td>
                                        <td>
                                            <c:if test="${nt.statut.id_statut_projet!=47}">
                                            <div class="col-md-3 col-sm-6">
                                                <a href="/api/recapEie/${nt.id_demande_information}/${nt.type}" class="btn btn-primary"><i class="fa fa-print mr-2" title="Améliorer les documents"></i><spring:message code="label.Recap"/></a>
                                            </div>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${not empty nt.categories}">
                                                <button class="btn btn-success btn-sm" onclick="fun_affiche_modal('#modal_categorie','${nt.id_demande_information}')"><spring:message code="label.Categories"/></button>
                                            </c:if>
                                            <c:if test="${empty nt.categories}">
                                                -
                                            </c:if>
                                        </td>
                                        <td> ${nt.visite_date} </td>
                                        <td>
                                            <c:if test="${(not empty nt.visite_url)}">
                                                <a target="_blank" download="" href="${url_Admin}${fn:replace(nt.visite_url, "/assets/myFile/", "/dowload_uploaded/")}">
                                                    <span class="fa fa-eye"></span>
                                                </a>
                                            </c:if>
                                            <cif test="${(empty nt.visite_url)}">
                                                -
                                            </cif>
                                        </td>
                                        <c:if test="${type!='NT'}">
                                            <td>${nt.tronsfrontalier }</td>
                                        </c:if>
                                        <c:if test="${type=='NT'}">
                                            <td>${nt.nature_projet}</td>
                                            <td>${nt.consistance_proj}</td>
                                        </c:if>
                                        <td>
                                            <button class="btn btn-success rounded" onclick="affiche_files('${nt.id_demande_information}')">
                                                <span class="fa fa-archive"></span>
                                            </button>
                                        </td>

                                        <c:if test="${type=='EE'}">
                                            <td>
                                                <c:if test="${not empty nt.url_enquette_defenitive }">
                                                    <a class="removeStyle" download href="${url_Admin}${fn:replace(nt.url_enquette_defenitive, "/assets/myFile/", "/dowload_uploaded/")}" >
                                                        <span class="fa fa-eye" style="font-size:21px;color: #33994c;" ></span>
                                                    </a>
                                                </c:if>
                                                <c:if test="${empty nt.url_enquette_defenitive}">-</c:if>
                                            </td>
                                            <td>
                                                <c:if test="${not empty nt.url_cachier_defenitive }">
                                                    <a class="removeStyle" download href="${url_Admin}${fn:replace(nt.url_cachier_defenitive, "/assets/myFile/", "/dowload_uploaded/")}" >
                                                        <span class="fa fa-eye" style="font-size:21px;color: #33994c;" ></span>
                                                    </a>
                                                </c:if>
                                                <c:if test="${empty nt.url_cachier_defenitive}">-</c:if>
                                            </td>
                                        </c:if>
                                        <c:if test="${type=='NT'}">
                                            <td>
                                                <c:if test="${not empty nt.url_enquette_defenitive }">
                                                    <a class="removeStyle" download href="${url_Admin}${fn:replace(nt.url_enquette_defenitive, "/assets/myFile/", "/dowload_uploaded/")}" >
                                                        <span class="fa fa-eye" style="font-size:21px;color: #33994c;" ></span>
                                                    </a>
                                                </c:if>
                                                <c:if test="${empty nt.url_enquette_defenitive}">-</c:if>
                                            </td>
                                        </c:if>
                                        <c:if test="${type=='AE'}">
                                            <td>
                                                <c:if test="${not empty nt.url_enquette_defenitive }">
                                                    <a class="removeStyle" download href="${url_Admin}${fn:replace(nt.url_enquette_defenitive, "/assets/myFile/", "/dowload_uploaded/")}" >
                                                        <span class="fa fa-eye" style="font-size:21px;color: #33994c;" ></span>
                                                    </a>
                                                </c:if>
                                                <c:if test="${empty nt.url_enquette_defenitive}">-</c:if>
                                            </td>
                                        </c:if>


                                        <td>
                                            <c:if test="${nt.statut.id_statut_projet==7 || nt.statut.id_statut_projet==10 }">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">

<%--                                                    <a href="/api/piecejointdemande/${nt.id_demande_information}/${nt.type}" class="btn btn-primary" title="Attacher les documents définitifs"><i class="fa fa-check" style="margin:0 !important"></i><spring:message code="label.Attacherlesdocumentsdefinitifs"/> </a>--%>
                                                    <a type="button" style="background-color: #0db8db" onclick="goToLien('${nt.id_demande_information}/${nt.type}')" data-popover="true" data-html=true data-content="Attacher les documents définitifs"><i class="fa fa-check"></i></a>
                                            </div>
                                            <div class="tool-box">
                                                <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                <div class="clear"></div>
                                            </div>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==6}">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
<%--                                                    <a class="btn btn-primary btn-sm"  download href="${url_Admin}${fn:replace(nt.url_document_signee, "/assets/myFile/", "/dowload_uploaded/")}" ><spring:message code="label.Telechargerlautorisation"/> </a>--%>
                                                    <a class="btn btn-primary btn-sm" type="button"  download onclick="window.location.href='${url_Admin}${fn:replace(nt.url_document_signee, "/assets/myFile/", "/dowload_uploaded/")}'"  data-popover="true" data-html=true data-content="Telecharger l'autorisation"><i class="fa fa-file-download"></i></a>
                                            </div>
                                                <div class="tool-box">
                                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                    <div class="clear"></div>
                                                </div>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==47}">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
<%--                                                    <a class="btn btn-primary btn-sm"  href="/api/demandeinformation/${nt.id_demande_information}/${nt.type}" ><spring:message code="label.Modifier"/> </a>--%>
                                                    <a type="button" style="background-color: #0db8db" onclick="goToLien1('${nt.id_demande_information}/${nt.type}')" data-popover="true" data-html=true data-content="Modifier"><i class="fa fa-edit"></i></a>
                                            </div>
                                                <div class="tool-box">
                                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                    <div class="clear"></div>
                                                </div>
    </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==60}">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
<%--                                                    <button class="btn btn-primary btn-sm" onclick="affiche_msg_file('${nt.id_demande_information}')" ><spring:message code="label.CompleterleDossier"/></button>--%>
                                                    <a type="button" style="background-color: #0db8db" onclick="affiche_msg_file('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="Completer le Dossier"><i class="fa fa-edit"></i></a>
                                            </div>
                                                <div class="tool-box">
                                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                    <div class="clear"></div>
                                                </div>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==13 }">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
<%--                                                    <a href="/api/demandeinformation/${nt.id_demande_information}/RS" class="btn btn-primary" title="Attacher Avis de projet"><i class="fa fa-check"></i><spring:message code="label.Attacherlavisdeprojet"/> </a>--%>
                                                    <a type="button" style="background-color: #0db8db" onclick="goToLien2('${nt.id_demande_information}/RS')" data-popover="true" data-html=true data-content="Attacher Avis de projet"><i class="fa fa-check"></i></a>
                                            </div>
                                                <div class="tool-box">
                                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                    <div class="clear"></div>
                                                </div>
    </c:if>
                                                <c:if test="${(nt.statut.id_statut_projet==59 && nt.documents_AE.size()==0) }">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
<%--                                                    <a href="/api/validateDocEIE/${nt.id_demande_information}/${nt.type}" class="btn btn-primary" title="Valider les documents"><i class="fa fa-check"></i><spring:message code="label.Validerlesdocuments"/> </a>--%>
                                                    <a type="button" style="background-color: #0db8db" onclick="goToLien3('${nt.id_demande_information}/${nt.type}')" data-popover="true" data-html=true data-content="Valider les documents"><i class="fa fa-check"></i></a>
                                            </div>
                                                <div class="tool-box">
                                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                    <div class="clear"></div>
                                                </div>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==59 && nt.type=='AE' && nt.documents_AE.size()>0}">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
<%--                                                    <a href="/api/getListdocument/${nt.id_demande_information}" class="btn btn-primary"> <i class="fa fa-check"></i><spring:message code="label.Completerlesdocuments"/> </a>--%>
                                                    <a type="button" style="background-color: #0db8db" onclick="goToLien4('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="Completer les documents"><i class="fa fa-check"></i></a>
                                            </div>
                                                <div class="tool-box">
                                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                    <div class="clear"></div>
                                                </div>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==71 && nt.type=='AE' }">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
<%--                                                    <button onclick="ajouter_rapport_ae('${nt.id_demande_information}')" class="btn btn-primary"><spring:message code="label.Ajouterlerapportdaudit"/></button>--%>
                                                    <a type="button" style="background-color: #0db8db" onclick="ajouter_rapport_ae('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="Ajouter le rapport d'audit"><i class="fa fa-plus"></i></a>
                                            </div>
                                                <div class="tool-box">
                                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                    <div class="clear"></div>
                                                </div>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==12 && nt.type=='RS'}">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
<%--                                                    <a href="/api/demandeinformation/${nt.id_demande_information}/EE" class="btn btn-primary" title="Attacher les documents définitive"><i class="fa fa-pencil"></i> <spring:message code="label.Deposerlademande"/></a>--%>
                                                    <a type="button" style="background-color: #0db8db" onclick="goToLien5('${nt.id_demande_information}/EE')" data-popover="true" data-html=true data-content="Attacher les documents définitive"><i class="fa fa-pencil"></i></a>
                                            </div>
                                                <div class="tool-box">
                                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                    <div class="clear"></div>
                                                </div>
    </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==73 && type=='AE'}">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
<%--                                                    <a href="/api/AttacherListDocAE/${nt.id_demande_information}" class="btn btn-primary" title="Attacher les documents"><i class="fa fa-check"></i><spring:message code="label.Attacherlesdocuments"/></a>--%>
                                                    <a type="button" style="background-color: #0db8db" onclick="goToLien6('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="Attacher les documents"><i class="fa fa-check"></i></a>
                                            </div>
                                                <div class="tool-box">
                                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #41BFFB, #059cf9) !important;"><i class="fa fa-cog"></i></div>
                                                    <div class="clear"></div>
                                                </div>
                                                </c:if>
                                        </td>
                                    </tr>
                                    <!-- Modal -->
                                    <div class="modal fade" id="modal_categorie_${nt.id_demande_information}" tabindex="-1"
                                         role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog " role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title"><spring:message code="label.TypedeProjet"/></h5>
                                                    <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row justify-content-center">
                                                        <div class="col-10">
                                                            <div class="row "
                                                                 style="background: gray;color: white;border-color: #737373;">
                                                                <div class="col-2 border p-2 font_bold  btn-gris">
                                                                    #
                                                                </div>
                                                                <div class="col-10 border p-2 font_bold  btn-gris">
                                                                    <spring:message code="label.nom"/>
                                                                </div>
                                                            </div>
                                                            <c:forEach items="${nt.categories}" var="cat" varStatus="loopp">
                                                                <div class="row">
                                                                    <div class="col-2 border p-2">
                                                                            ${loopp.index+1}
                                                                    </div>
                                                                    <div class="col-10 border p-2">
                                                                            ${cat.nom_fr}
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>


                                                </div>
                                                <div class="modal-footer">
                                                    <button onclick="close_modal(this)" type="button" class="btn btn-secondary"
                                                            data-dismiss="modal"><spring:message code="button.fermer"/></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="modal_DetailRegion_${nt.id_demande_information}" tabindex="-1"
                                         role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id=""><spring:message code="label.DetailRegion"/></h5>
                                                    <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row justify-content-center">
                                                        <div class="col-10">
                                                            <div class="row "
                                                                 style="background: gray;color: white;border-color: #737373;">
                                                                <div class="col-4 border p-2 font_bold  btn-gris">
                                                                    <spring:message code="label.Region"/>
                                                                </div>
                                                                <div class="col-4 border p-2 font_bold  btn-gris">
                                                                    <spring:message code="label.prefecture"/>
                                                                </div>
                                                                <div class="col-4 border p-2 font_bold  btn-gris">
                                                                    <spring:message code="label.commune"/>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-4 border p-2">
                                                                    <c:if test="${not empty nt.detailRegion.region}">
                                                                        <ul>
                                                                            <c:forEach items="${nt.detailRegion.region}" var="det">
                                                                                <li>  ${det.nom_fr}</li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </c:if>
                                                                    <c:if test="${empty nt.detailRegion.region}">
                                                                        -
                                                                    </c:if>
                                                                </div>
                                                                <div class="col-4 border p-2">
                                                                    <c:if test="${not empty nt.detailRegion.prefectures}">
                                                                        <ul>
                                                                            <c:forEach items="${nt.detailRegion.prefectures}" var="det">
                                                                                <li>  ${det.nom_fr}</li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </c:if>
                                                                    <c:if test="${empty nt.detailRegion.prefectures}">
                                                                        -
                                                                    </c:if>
                                                                </div>
                                                                <div class="col-4 border p-2">
                                                                    <c:if test="${not empty nt.detailRegion.communes}">
                                                                        <ul>
                                                                            <c:forEach items="${nt.detailRegion.communes}" var="det">
                                                                                <li>  ${det.nom_fr}</li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </c:if>
                                                                    <c:if test="${empty nt.detailRegion.communes}">
                                                                        -
                                                                    </c:if>
                                                                </div>


                                                            </div>

                                                        </div>
                                                    </div>


                                                </div>
                                                <div class="modal-footer">
                                                    <button onclick="close_modal(this)" type="button" class="btn btn-secondary"
                                                            data-dismiss="modal"><spring:message code="button.fermer"/></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
<div class="modal fade" id="modal_AE" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitleAE"><spring:message code="label.Envoyerlerapportdaudit"/> </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="zone_AE_fichier">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal"><spring:message code="button.Enregistrer"/></button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="modal_fichiers" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.piecefournie"/> </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="zone_tab_fichier">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="button.fermer"/></button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="complementDocument" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" ><spring:message code="label.CompleterleDossier"/></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="completerlesdocuments">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="button.fermer"/></button>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
<script type="text/javascript">
    $('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'top', delay: {show: 50, hide: 400}});
    function goToLien(val){
        window.location.href='/api/piecejointdemande/'+val;
    }
    function goToLien1(val){
        window.location.href='/api/demandeinformation/'+val;
    }
    function goToLien2(val){
        window.location.href='/api/demandeinformation/'+val;
    }
    function goToLien3(val){
        window.location.href='/api/validateDocEIE/'+val;
    }
    function goToLien4(val){
        window.location.href='/api/getListdocument/'+val;
    }
    function goToLien5(val){
        window.location.href='/api/demandeinformation/'+val;
    }
    function goToLien6(val){
        window.location.href='/api/AttacherListDocAE'+val;
    }
    function close_modal(val){
        $(val).closest(".modal").modal('hide');
    }

    function fun_affiche_modal(id_modal, id_dmd) {
        $(id_modal + "_" + id_dmd).modal("toggle");
    }
</script>
