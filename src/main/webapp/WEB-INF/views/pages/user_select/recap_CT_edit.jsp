<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<form id="recap_ct">
<div class="row mb-5" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-md-12 col-sm-12">
        <div id="accordion">
            <h2>1. <spring:message code="label.InformationdemandeurA" /></h2>
            <div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Numerodedemande"/>  </label>
                            <input type="text" disabled value="${collect.num_demande}" class="form-control">
                        </div>
                    </div>

                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.RaisonsocialeA"/>  </label>
                            <input type="text" disabled value="${collect.raison}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> IF : </label>
                            <input type="text" disabled value="${collect.idfiscale}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.CINA"/> </label>
                            <input type="text" disabled value="${collect.cin}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.RepresantantA"/> </label>
                            <input type="text" disabled value="${collect.demandeur_Nom}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.AdresseA"/> </label>
                            <input type="text" disabled value="${collect.demandeurAdresse}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.TelephoneA"/>  </label>
                            <input type="text" disabled value="${collect.demandeurTel}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.FaxA"/>  </label>
                            <input type="text" disabled value="${collect.demandeurFax}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.EmailA"/> </label>
                            <input type="text" disabled value="${collect.demandeurEmail}" class="form-control">
                        </div>
                    </div>
                </div>


            </div>
            <h2><spring:message code="label.CatalogueA" /></h2>
            <div>
                <div class="row mb-2">
                    <div class="col-12">
                        <table class="table table-bordered table-striped table-hover my_table">
                            <thead>
                            <tr>
                                <th><spring:message code="label.code"/></th>
                                <th><spring:message code="label.type"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${collect.code}" var="code">
                                <tr>
                                    <td>${code.nom_fr}</td>
                                    <td>${code.nom_ar}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty collect.code}">
                                <tr>
                                    <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                </tr>
                            </c:if>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <h2><spring:message code="label.DonneesurlesvehiculesA" /></h2>
            <div>
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.TypedevehiculesA"/></label>
                            <input disabled type="text" class="form-control" value="${collect.typevehicule}">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.typedeconteneursA"/></label>
                            <input disabled type="text" class="form-control" value="${collect.typeConteneurs.nom_fr}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.NombredeVehiculeA"/></label>
                            <input disabled type="text" class="form-control" value="${collect.nombre_vehicule}">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.NombredeconteneursA"/></label>
                            <input disabled type="text" class="form-control" value="${collect.nombre_conteneur}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <table class="table table-bordered my_table">
                            <thead>
                            <tr>
                                <th><spring:message code="label.NMatriculation"/></th>
                                <th><spring:message code="label.NChassis"/></th>
                                <th><spring:message code="label.Poidstotalencharge"/></th>
                                <th><spring:message code="label.Poidsnetduvehicule"/></th>
                                <!-- <th><spring:message code="label.Equipementdesecurite"/></th>
                  <th><spring:message code="label.Attestationdassurance"/></th>-->
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${(not empty collect.vehicules)}">
                                    <c:forEach items="${collect.vehicules}" var="v">
                                        <tr id="tr${v.id_vehicule}">
                                            <td>${v.num_mat_enrg_auto} - ${v.num_mat_enrg_voit} - ${v.num_mat_id_prefect}</td>
                                            <td>${v.num_chassis}</td>
                                            <td>${v.poit_totale_charge}</td>
                                            <td>${v.point_net}</td>
                                            <!-- <td>
                          <c:choose>
                            <c:when test="${not empty v.equipementSecurite}">
                              <a href="${url_admin}${fn:replace(v.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle">
                                <span class="fa fa-download"></span>
                              </a>
                            </c:when>
                            <c:otherwise>
                              -
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="text-center">
                          <a href="${url_admin}${fn:replace(v.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle">
                            <span class="fa fa-download"></span>
                          </a>
                        </td>-->
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="7" class="bg-primary text-center"><spring:message code="label.Aucunvehicule"/></td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <h2>4. <spring:message code="label.mespieces" /></h2>
            <div>
                <table class="table my_table table-striped table-bordered table-hover">
                    <c:if test="${not empty doc}">
                        <c:forEach items="${doc}" var="file">
                            <tr>
                                <td>${file.docImport.nom_fr}</td>
                                <td>
                                    <a target="_blank" class="btn btn-success" href="${url_admin}${fn:replace(file.url, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
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
        </div>
    </div>
</div>
</form>
<c:if test="${(empty collect ) && (empty installation) && (empty notification)}"><spring:message code="label.Aucunresultat"/></c:if>
<script>
    $( function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            heightStyle: "content",
        });
    } );
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
