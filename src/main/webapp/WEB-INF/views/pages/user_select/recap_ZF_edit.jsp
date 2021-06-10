<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<form id="recap">
<div  class="row mb-5">
    <div class="col-md-12 col-lg-12 col-sm-12">
        <div id="accordion">
            <h2><spring:message code="label.Numerodenotification"/></h2>
            <div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Numerodenotification"/> </label>
                            <input type="text" disabled value="${notification.num_notification}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Classificationdesdechets"/>  </label>
                            <input type="text" disabled value="${notification.classification.nom_fr}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Operation"/> </label>
                            <input type="text" disabled value="${notification.operation}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.code"/> </label>
                            <input type="text" disabled value="${notification.code.nom_fr}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.typededechet"/> </label>
                            <input type="text" disabled value="${notification.code.nom_ar}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label>
                                <c:choose>
                                    <c:when test="${type=='ZF'}">
                                        <spring:message code="label.ZoneFranche"/>
                                    </c:when>
                                    <c:otherwise>
                                        <spring:message code="label.pays"/>
                                    </c:otherwise>
                                </c:choose>
                            </label>
                            <input type="text" disabled value="${notification.zonneFranche.nom_fr} ${notification.pays.nom_fr}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.producteur"/>  </label>
                            <input type="text" disabled value="${notification.producteur_text}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.quantitetotaleprevu"/> </label>
                            <input type="text" disabled value="${notification.quantite}" class="form-control">
                        </div>
                    </div>
                </div>


                <div class="row mb-2">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.unite"/>  </label>
                            <input type="text" disabled value="${notification.unite.nom_fr}" class="form-control">
                        </div>
                    </div>
                </div>

            </div>
            <h2><spring:message code="label.ImportateurNotifiant"/></h2>
            <div>
                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group" ${pageContext.response.locale=='ar'?'rtl':'ltr'}>
                            <label> <spring:message code="label.nomdesociete"/>  </label>
                            <c:choose>
                                <c:when test="${pageContext.response.locale=='ar'}">
                                    <input value="${notif.importateur.nom_ar}" type="text" name="Nom_ar" id="Nom_ar" class="form-control" dir="rtl">
                                </c:when>
                                <c:otherwise>
                                    <input type="text" disabled value="${notification.importateur.nom_fr}" class="form-control">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.personneacontacter"/></label>
                            <input type="text" disabled value="${notification.importateur.contact_fr}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Adresse"/> </label>
                            <input type="text" disabled value="${notification.importateur.adresse_fr}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.identifiantfiscal"/> </label>
                            <input type="text" disabled value="${notification.importateur.idf}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Telephone"/>  </label>
                            <input type="text" disabled value="${notification.importateur.tel}" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Fax"/> </label>
                            <input type="text" disabled value="${notification.importateur.fax}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Email"/> </label>
                            <input type="text" disabled value="${notification.importateur.mail}" class="form-control">
                        </div>
                    </div>
                </div>

            </div>
            <h2>
                <spring:message code="label.Documentdenotification"/>
                <button style="font-size: 12px !important;" type="button" id="Suivante" onclick="updatePdf(${notification.id_notification })" class="btn btn-warning btn-sm text-white">
                    <spring:message code="label.Imprimer"/>

                </button>
            </h2>
            <div>
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.quantitetotaleprevu"/></label>
                            <input disabled type="text" class="form-control" value="${notification.quantite}">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Nombretotalexpeditionsprevues"/></label>
                            <input disabled type="text" class="form-control" value="${notification.expedition}">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Operation"/></label>
                            <input disabled type="text" class="form-control" value="${notification.operation}">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.notificationconcernant"/></label>
                            <input disabled type="text" class="form-control" value="${notification.uniques}">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Premierdepart"/></label>
                            <input disabled class="form-control" value="${notification.premier}" type="text">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Dernierdepart"/></label>
                            <input disabled class="form-control" value="${notification.dernier}" type="text">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Typedeconditionnement"/></label>
                            <input disabled class="form-control" value="${notification.typeconditionnement.nom_fr}" type="text">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Prescriptionsspecialesdemanutention"/></label>
                            <input disabled class="form-control" value="${notification.manutention}" type="text">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Nomdeladestinationfinale"/></label>
                            <input disabled class="form-control" value="${notification.destination_final}" type="text">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Caracteristiquesphysiques"/></label>
                            <input disabled class="form-control" value="${notification.caracteristquePhysique.nom_fr}" type="text">
                        </div>
                    </div>
                </div>



            </div>
            <h2>Document de mouvement
                <button onclick="go_link('/api/okPDF/${notification.id_notification}')" style="font-size: 12px !important;" class="btn btn-warning text-white btn-sm">
                    <spring:message code="label.documentdemouvement"/>
                </button>
            </h2>
            <div>

            </div>
            <h2><spring:message code="label.transporteurprevu"/></h2>
            <div>
                <c:if test="${notification.zf_et=='XD' || (notification.zf_et=='ZF' && notification.classification.id_classification==1)}">
                    <table class="table my_table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th> <spring:message code="label.nomdesociete"/> </th>
                            <th> <spring:message code="label.identifiantfiscal"/> </th>
                            <th> <spring:message code="label.telephone"/> </th>
                            <th> <spring:message code="label.Fax"/> </th>
                            <th> <spring:message code="label.Adresse"/> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty notification.transporteur}">
                            <c:forEach items="${notification.transporteur}" var="tr">
                                <tr>
                                    <td>${tr.nom}</td>
                                    <td>${tr.identifiant}</td>
                                    <td>${tr.tel}</td>
                                    <td>${tr.fax}</td>
                                    <td>${tr.adresse}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${not empty declarationTrans}">
                            <tr class="bg-primary">
                                <td>${declarationTrans.transporteurParam.nom}</td>
                                <td>${declarationTrans.transporteurParam.identifiant}</td>
                                <td>${declarationTrans.transporteurParam.tel}</td>
                                <td>${declarationTrans.transporteurParam.fax}</td>
                                <td>${declarationTrans.transporteurParam.adresse}</td>
                            </tr>
                        </c:if>
                        <c:if test="${(empty notification.transporteur && empty declarationTrans)}">
                            <tr>
                                <td class="text-center" colspan="5"> <spring:message code="label.AucunTransporteur"/>  </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${notification.zf_et=='ET' ||notification.zf_et=='TR' || (notification.zf_et=='ZF' && notification.classification.id_classification==2)}">
                    <table class="table my_table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th> <spring:message code="label.raisonsocial"/> </th>
                            <th> <spring:message code="label.NMatriculation"/> </th>
                            <th> <spring:message code="label.Typedevehicules"/> </th>
                            <th> <spring:message code="label.Attestationdassurance"/> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty notification.transporteur_etranger}">
                            <c:forEach items="${notification.transporteur_etranger}" var="tr">
                                <tr>
                                    <td>${tr.raison_social}</td>
                                    <td>${tr.num_matricule}</td>
                                    <td>${tr.typeVehicule}</td>
                                    <td class="text-center"><a download="assurance" target="_blank" href="${fn:replace(tr.url_assurance, "/assets/myFile/","/dowload_uploaded/" )}" class="btn btn-success rounded"><span class="fa fa-download"></span></a></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty notification.transporteur_etranger}">
                            <tr>
                                <td class="text-center" colspan="5"> <spring:message code="label.AucunTransporteur"/>  </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </c:if>
            </div>
            <h2><spring:message code="label.producteursdesdechets"/></h2>
            <div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label><spring:message code="label.nomdesociete"/></label>
                            <c:choose>
                                <c:when test="">
                                    <input disabled class="form-control" value="${notification.producteur.nom_ar}" type="text">
                                </c:when>
                                <c:otherwise>
                                    <input disabled class="form-control" value="${notification.producteur.nom_fr}" type="text">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.personneacontacter"/></label>
                            <input disabled class="form-control" value="${notification.producteur.contact_fr}" type="text">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.identifiantfiscal"/></label>
                            <input disabled class="form-control" value="${notification.producteur.idf}" type="text">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Adresse"/></label>
                            <input disabled class="form-control" value="${notification.producteur.adresse_fr}" type="text">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.telephone"/></label>
                            <input disabled class="form-control" value="${notification.producteur.tel}" type="text">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Fax"/></label>
                            <input disabled class="form-control" value="${notification.producteur.fax}" type="text">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.email"/></label>
                            <input disabled class="form-control" value="${notification.producteur.mail}" type="text">
                        </div>
                    </div>
                </div>

            </div>
            <h2><spring:message code="label.Installationdevalorisationelimination"/></h2>
            <div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label><spring:message code="label.nomdesociete"/></label>
                            <c:choose>
                                <c:when test="">
                                    <input disabled class="form-control" value="${notification.eliminateur.nom_ar}" type="text">
                                </c:when>
                                <c:otherwise>
                                    <input disabled class="form-control" value="${notification.eliminateur.nom_fr}" type="text">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.personneacontacter"/></label>
                            <input disabled class="form-control" value="${notification.eliminateur.contact_fr}" type="text">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.identifiantfiscal"/></label>
                            <input disabled class="form-control" value="${notification.eliminateur.idf}" type="text">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Adresse"/></label>
                            <input disabled class="form-control" value="${notification.eliminateur.adresse_fr}" type="text">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.telephone"/></label>
                            <input disabled class="form-control" value="${notification.eliminateur.tel}" type="text">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Fax"/></label>
                            <input disabled class="form-control" value="${notification.eliminateur.fax}" type="text">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.email"/></label>
                            <input disabled class="form-control" value="${notification.eliminateur.mail}" type="text">
                        </div>
                    </div>
                </div>
            </div>
            <h2><spring:message code="label.mespieces"/></h2>
            <div>
                <table class="table my_table table-striped table-bordered table-hover">
                    <c:if test="${not empty doc}">
                        <c:forEach items="${doc}" var="file">
                            <tr>
                                <td>${file.docImport.nom_fr}</td>
                                <td>
                                    <a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(file.url, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <c:if test="${empty doc}">
                        <tr>
                            <td colspan="2"> <spring:message code="label.AucunFichier"/>   </td>
                        </tr>
                    </c:if>

                </table>
            </div>
        </div>
    </div>

</div>
</form>

<script>
    $( function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            heightStyle: "content",
        });
    } );
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>