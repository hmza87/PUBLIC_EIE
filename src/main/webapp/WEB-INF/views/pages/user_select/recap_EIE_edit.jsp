<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form id="recap_ee">
<div class="row mb-5" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-md-12 col-sm-12">
        <div id="accordion">
            <h2>1. informations sur le pétitionnaire</h2>
            <div>
                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.NDemande"/>  </label>
                            <input type="text" disabled value="${demande.num_demande}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Representant"/>  </label>
                            <input type="text" disabled value="${demande.represantant}" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.RaisonsocialeA"/>  </label>
                            <input type="text" disabled value="${demande.raison_social}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.AdresseA"/> </label>
                            <input type="text" disabled value="${demande.adresse}" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.TelephoneA"/>  </label>
                            <input type="text" disabled value="${demande.tel}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.FaxA"/>  </label>
                            <input type="text" disabled value="${demande.fax}" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.EmailA"/> </label>
                            <input type="text" disabled value="${demande.email}" class="form-control">
                        </div>
                    </div>
                </div>

            </div>
            <h2>2. informations sur le projet </h2>
            <div>
                <c:if test="${type=='EE' || type=='RS'}">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label><spring:message code="label.Intituledeprojet"/></label>
                                <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Montant d'investissement en MDH</label>
                                <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Transfrontalier</label>
                                <input disabled type="text" class="form-control" value="${demande.tronsfrontalier}">
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${type=='AE'}">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label><spring:message code="label.Intituledeprojet"/></label>
                                <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Montant d'investissement en MDH</label>
                                <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Transfrontalier</label>
                                <input disabled type="text" class="form-control" value="${demande.tronsfrontalier}">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Date démarrage</label>
                                <c:set value="${fn:split(demande.dateDemarage, ' ')}" var="dt" />
                                <input disabled type="text" class="form-control" value="${dt[0]}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Date Résiliation</label>
                                <c:set value="${fn:split(demande.dateResiliation, ' ')}" var="dt2" />
                                <input disabled type="text" class="form-control" value="${dt2[0]}">
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${type=='NT'}">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label><spring:message code="label.Intituledeprojet"/></label>
                                <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Montant d'investissement en MDH</label>
                                <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Nature du Projet</label>
                                <input disabled type="text" class="form-control" value="${demande.nature_projet}">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Consistance du projet</label>
                                <input disabled type="text" class="form-control" value="${demande.consistance_proj}">
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
            <h2>3. localisation du projet </h2>
            <div>
                <div class="row">
                    <div class="col-sm-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <div class="row justify-content-center">
                            <div class="col-10">
                                <div class="row "
                                     style="background: gray;color: white;border-color: #737373;">
                                    <div class="col-4 border p-2 font_bold  btn-gris">
                                        Region
                                    </div>
                                    <div class="col-4 border p-2 font_bold  btn-gris">
                                        Préfécture
                                    </div>
                                    <div class="col-4 border p-2 font_bold  btn-gris">
                                        Commune
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4 border p-2">
                                        <c:if test="${not empty demande.detailRegion.region}">
                                            <ul>
                                                <c:forEach items="${demande.detailRegion.region}" var="det">
                                                    <li> - ${det.nom_fr}</li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                        <c:if test="${empty demande.detailRegion.region}">
                                            -
                                        </c:if>
                                    </div>
                                    <div class="col-4 border p-2">
                                        <c:if test="${not empty demande.detailRegion.prefectures}">
                                            <ul>
                                                <c:forEach items="${demande.detailRegion.prefectures}" var="det">
                                                    <li> - ${det.nom_fr}</li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                        <c:if test="${empty demande.detailRegion.prefectures}">
                                            -
                                        </c:if>
                                    </div>
                                    <div class="col-4 border p-2">
                                        <c:if test="${not empty demande.detailRegion.communes}">
                                            <ul>
                                                <c:forEach items="${demande.detailRegion.communes}" var="det">
                                                    <li> - ${det.nom_fr}</li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                        <c:if test="${empty demande.detailRegion.communes}">
                                            -
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${type=='EE' || type=='NT'}">
                <h2>4. <spring:message code="label.mespieces" /></h2>
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
                                <td colspan="2"> <spring:message code="label.AucunFichier"/> </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </c:if>
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