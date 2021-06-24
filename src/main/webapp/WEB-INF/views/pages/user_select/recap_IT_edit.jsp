<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
    .accordion-toggle {
        background-color: #7dc7bd;
        display: block;
        padding: 10px;
        margin: -10px -15px;
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;
    }

    .accordion-toggle.collapsed {
        background-color: lightgrey;
    }
</style>

<div class="container-fluid bg-gray" id="accordion-style-1">
    <div class="container">
        <section>
            <div class="row">
                <div class="col-12">
                    <div class="accordion" id="accordionExample">
                        <div class="">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn text-left text-white" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <i class="fa fa-angle-double-right mr-3"></i><spring:message code="label.Installationdetraitementdesdechets"/>
                                    </a>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse show fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
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
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingTwo">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <i class="fa fa-angle-double-right mr-3"></i>
                                        <spring:message code="label.informationssurlepetitionnaire"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
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
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingThree">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <i class="fa fa-angle-double-right mr-3"></i>
                                        <spring:message code="button.equipedetravail"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body">
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
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingFour">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                        <i class="fa fa-angle-double-right mr-3"></i><spring:message code="button.mespieces"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFour" class="collapse fade" aria-labelledby="headingFour" data-parent="#accordionExample">
                                <div class="card-body">
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
                </div>
            </div>
        </section>
    </div>
</div>


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
