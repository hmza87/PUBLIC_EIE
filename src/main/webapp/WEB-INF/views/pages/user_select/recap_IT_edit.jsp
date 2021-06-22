
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form id="recap_install">
<div class="row" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-md-12 col-sm-12">
        <div id="accordion">
            <h2>
                <%--<spring:message code="button.informationdinstallation"/>--%>
                    <spring:message code="label.Installationdetraitementdesdechets"/>
            </h2>
            <div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Numerodedemande"/>  </label>
                            <input type="text" disabled value="${installation.num_demande}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Site"/>  de l'installation </label>
                            <input type="text" disabled value="${installation.site}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Operation"/> </label>
                            <input type="text" disabled value="${installation.operation}" class="form-control">
                        </div>
                    </div>
                </div>



                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.descriptiondinstallation"/> </label>
                            <input type="text" disabled value="${installation.description}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.structuredinstallation"/>   </label>
                            <input type="text" disabled value="${installation.structure}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Typedappareil"/> </label>
                            <input type="text" disabled value="${installation.type_appareil}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Quantite"/>  </label>
                            <input type="text" disabled value="${installation.quantite}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Unite"/> </label>
                            <input type="text" disabled value="${installation.unite.nom_fr}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-12">
                        <c:if test="${installation.type==2}">
                            <table class="table table-bordered table-striped table-hover my_table">
                                <thead>
                                <tr>
                                    <th><spring:message code="label.code"/></th>
                                    <th><spring:message code="label.type"/></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${installation.code}" var="code">
                                    <tr>
                                        <td>${code.nom_fr}</td>
                                        <td>${code.nom_ar}</td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty installation.code}">
                                    <tr>
                                        <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                    </tr>
                                </c:if>

                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${installation.type==1}">
                            <h3 class="text-center">Vous avez droit à tous les codes à l'exception de la liste ci-dessous</h3>
                            <table class="table table-bordered table-striped table-hover my_table">
                                <thead>
                                <tr>
                                    <th><spring:message code="label.code"/></th>
                                    <th><spring:message code="label.type"/></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${installation.code}" var="code">
                                    <tr>
                                        <td>${code.nom_fr}</td>
                                        <td>${code.nom_ar}</td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty installation.code}">
                                    <tr>
                                        <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                    </tr>
                                </c:if>

                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${installation.type==3}">
                            <table class="table table-bordered table-striped table-hover my_table">
                                <thead>
                                <tr>
                                    <th><spring:message code="label.code"/></th>
                                    <th><spring:message code="label.type"/></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="2"><h3 class="text-center">Vous avez droit à tous les codes</h3></td>
                                </tr>
                                <c:if test="${empty installation.code}">
                                    <tr>
                                        <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${installation.type==0}">
                            <h3 class="text-center">Vous avez droit à les categories suivant :</h3>
                            <c:forEach items="${installation.categorie}" var="c">
                                <p>- ${c.nom_fr}</p>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>


            </div>
            <h2>
                <%--<spring:message code="button.informationdemandeur"/>--%>
                    <spring:message code="label.informationssurlepetitionnaire"/>
            </h2>
            <div>
                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.raisonsocial"/>  </label>
                            <input type="text" disabled value="${installation.raison}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.if"/></label>
                            <input type="text" disabled value="${installation.ife}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Adresse"/> </label>
                            <input type="text" disabled value="${installation.adresse}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Tel"/> </label>
                            <input type="text" disabled value="${installation.tel}" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Fax"/>  </label>
                            <input type="text" disabled value="${installation.fax}" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label> <spring:message code="label.Email"/> </label>
                            <input type="text" disabled value="${installation.email}" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
            <h2><spring:message code="button.equipedetravail"/></h2>
            <div>
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.nbequipe"/></label>
                            <input disabled type="text" class="form-control" value="${installation.nbr_equipe_travail}">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Horairedebutdexploitation"/></label>
                            <input disabled type="text" class="form-control" value="${installation.horaire_exploitation}">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                            <label><spring:message code="label.Nbrdeffectif"/></label>
                            <input type="text" class="form-control" disabled value="${installation.formation}">
                        </div>
                    </div>
                    <!--<div class="col-md-6 col-sm-12">
              <div class="form-group">
                <a href="${url_admin}${fn:replace(installation.qualification,"/assets/myFile/","/dowload_uploaded/")}" download target="_blank" class="btn btn-success btn-block">Télécharger fichier Qualification</a>
              </div>
            </div>-->

                </div>

            </div>
            <h2><spring:message code="button.mespieces"/></h2>
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
                            <td colspan="2"><spring:message code="label.AucunFichier"/>  </td>
                        </tr>
                    </c:if>

                </table>
            </div>
        </div>
    </div>
</div>
</form>
<c:if test="${(empty installation ) }"><spring:message code="label.Aucunresultat"/> </c:if>
<script>
    $( function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            heightStyle: "content",
        });
    } );
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
