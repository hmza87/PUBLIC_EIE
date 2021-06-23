<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${not empty collect}">
  <jsp:include page="../../includes/head.jsp" />
  <script>
    $( function() {
      $( "#accordion" ).accordion({
        collapsible: true,
        heightStyle: "content",
      });
    } );
  </script>
  <style>
    .scroll-to-target{
      display: none !important;
    }
  </style>
<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">
	<c:set var="lng" value="nom_ar"/>
</c:when>
<c:otherwise>
<c:set var="lng" value="nom_fr"/>
</c:otherwise>
</c:choose>
  <div class="row-fluid mt-5" style="margin-top: 150px !important;">
    <div class="col-12">
      <c:choose>
        <c:when test="${type=='IT'}">
          <spring:message code="label.Installationdetraitementdesdechets" var="p_page"/>
        </c:when>
        <c:when test="${type=='CT'}">
          <spring:message code="label.Collectetransportdesdechetsdangereux" var="p_page"/>
        </c:when>
        <c:otherwise>
          <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
        </c:otherwise>
      </c:choose>

      <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
          <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
        </ol>
      </nav>
    </div>
  </div>




  <div class="row justify-content-center "  style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-md-10 col-sm-12">
      <div class="jumbotron p-3 mb-2">
        <spring:message code="label.Statutdelademande"/> : <span class="text-success h4 font-weight-bold">${collect.statut[lng]}</span>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-md-10 col-sm-12">
      <div class="row p-0 mb-2">

        <c:choose>
          <c:when test="${collect.statut.id_statut_projet==20 || collect.statut.id_statut_projet==41}">
            <div class="col-auto">
              <a href="/api/validateDocCt/${collect.id_collecte }"
                 class="btn btn-primary"><i class="fa fa-upload "
                                            title="Améliorer les documents" style="margin: 0 !important"></i><spring:message code="label.Ameliorerlesdocuments"/></a>
            </div>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${collect.statut.id_statut_projet==22}">
                <div class="col-auto">
                  <a class="btn btn-warning rounded"
                     href="${url_admin}/generate_pdf_collecte/${collect.id_collecte}">
                    <span class="fa fa-download"></span>
                  </a>
                </div>
              </c:when>
              <c:when test="${collect.statut.id_statut_projet==25}">
                <div class="col-auto">
                  <a class="btn btn-warning rounded"
                     href="${url_admin}/generate_word_collecte/${collect.id_collecte}">
                    <span class="fa fa-download"><spring:message code="label.Telechargerlarrete"/> </span>
                  </a>
                </div>
              </c:when>
            </c:choose>
          </c:otherwise>
        </c:choose>
        <!--<c:if test="${collect.statut.id_statut_projet==56}">
          <div class="col-md-3 col-sm-6">
            <a href="${url_Admin}${fn:replace(collect.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary"><i class="fa fa-download"></i> Télécharger l'autorisation </a>
          </div>
        </c:if>-->
        <c:if test="${collect.statut.id_statut_projet==56}">
          <%-- non conforme - dmd_complement - favorable--%>
          <div class="col-md-3 col-sm-6">
            <a class="btn btn-success btn-block"
               href="/api/addCollectTrans/${collect.id_collecte}/N"> <span class="fa fa-edit"></span>
              <spring:message code="label.Ajouter_Vehicules" />
            </a>
          </div>
        </c:if>
        <c:if test="${collect.statut.id_statut_projet==50}">
          <div class="col-md-3 col-sm-6">
            <a href="/api/addCollectTrans/${collect.id_collecte}/N" class="btn btn-primary btn-block"><i class="fa fa-pencil mr-2"></i><spring:message code="label.deposerDossier"/></a>
          </div>
        </c:if>
        <c:if test="${collect.statut.id_statut_projet==42}">
          <div class="col-md-3 col-sm-6">
            <a href="/api/addCollectTrans/${collect.id_collecte}/N" class="btn btn-primary btn-block"><i class="fa fa-pencil mr-2"></i><spring:message code="label.Completerlesdocuments"/></a>
          </div>
        </c:if>
        <div class="col-md-3 col-sm-6">
          <a href="/api/generate_recap_collecte/${collect.id_collecte}" class="btn btn-primary btn-block"><i class="fa fa-print mr-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
        </div>

      </div>
      <c:if test="${renouv=='oui'}">
        <div class="row mt-2 mb-3">
          <div class="col-2">
            <a class="btn btn-success btn-block" href="/api/newCollecteRenouv/${collect.num_demande}"> <spring:message code="label.Renouvellement"/></a>
          </div>
        </div>
      </c:if>
    </div>
  </div>

  <div class="row justify-content-center mb-5"  style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-md-10 col-sm-12">
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
                  <th><spring:message code="label.TypedevehiculesA"/></th>
                  <th><spring:message code="label.typedeconteneursA"/></th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                  <c:when test="${(not empty collect.vehicules)}">
                    <c:forEach items="${collect.vehicules}" var="v">
                      <tr id="tr${v.id_vehicule}">
                        <td>${v.num_mat_enrg_voit} - ${v.num_mat_enrg_auto} - ${v.num_mat_id_prefect}</td>
                        <td>${v.num_chassis}</td>
                        <td>${v.poit_totale_charge}</td>
                        <td>${v.point_net}</td>
                        <td>${v.typeVehicule}</td>
                        <td>${v.typeConteneur}</td>
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
</c:if>
<c:if test="${(empty collect ) && (empty installation) && (empty notification)}"><spring:message code="label.Aucunresultat"/></c:if>
<jsp:include page="../../includes/footer1.jsp" />
