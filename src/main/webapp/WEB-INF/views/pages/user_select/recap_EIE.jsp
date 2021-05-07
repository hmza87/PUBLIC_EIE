<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${not empty demande}">
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
    <c:choose>
      <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/ListeEie')}">
        <spring:message code="option.Etudedimpactenvironnementale" var="p_page" />
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
            <li class="breadcrumb-item active" aria-current="page">Récap ${titre_dyn}</li>
          </ol>
        </nav>
      </div>
    </div>
    <div class="row" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
      <div class="col-2" >
        <a href="/api/checkEIESelect/${type}" class="btn btn-success btn-block mb-2"> <span class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/> </a>
      </div>
    </div>
  <div class="row justify-content-center"  style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-md-10 col-sm-12">
      <div class="jumbotron p-3">
        <spring:message code="label.Statutdelademande"/>: <span class="text-success h4 font-weight-bold">${demande.statut.nom_fr}</span>
      </div>
    </div>
  </div>
  <div class="row mb-5 justify-content-center">
    <div class="col-md-10 col-sm-12">
      <div class="row p-0">

        <c:if test="${demande.statut.id_statut_projet==14 || demande.statut.id_statut_projet==51}">
          <div class="col-md-3">
            <a href="/api/addInstallation/${demande.id_demande_information }/N" class="btn btn-primary btn-block"><i class="fa fa-pencil-alt " title="Modifier" style="margin:0 !important"></i> <spring:message code="label.Editer"/></a>
          </div>
        </c:if>
        <div class="col-md-3 col-sm-6">
          <a href="/api/generate_recap_Eie/${demande.id_demande_information }" class="btn btn-primary btn-block"><i class="fa fa-print mr-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
        </div>
        <c:if test="${demande.statut.id_statut_projet==15 }">
          <div class="col-md-3">
            <a href="/api/infoInstallation/${demande.id_demande_information }" class="btn btn-primary rounded"><span class="fa fa-plus "></span> <spring:message code="label.Ameliorerlesdocuments"/></a>
          </div>
        </c:if>

        <c:if test="${demande.statut.id_statut_projet==17 }">
          <div class="col-md-3">
            <a href="/api/generateDocInstallFavorable/${demande.id_demande_information}" class="btn btn-primary rounded"><span class="fa fa-file-download"></span></a>
          </div>
        </c:if>

        <c:if test="${demande.statut.id_statut_projet==57}">
          <div class="col-md-3 col-sm-6">
            <a href="${url_Admin}${fn:replace(demande.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary"><i class="fa fa-download"></i> Télécharger l'autorisation </a>
          </div>
        </c:if>

      </div>
      <c:if test="${renouv=='oui'}">
        <div class="row-fluid mt-2 mb-3">
          <div class="col-3">
            <a class="btn btn-success btn-block" href="/api/newInstallRenouv/${demande.num_demande}"><spring:message code="label.Renouvellement"/> </a>
          </div>
        </div>
      </c:if>
    </div>
  </div>
  <div class="row justify-content-center mb-5 "  style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'};margin-top: -20px">
    <div class="col-md-10 col-sm-12">
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
          <c:if test="${type=='EE'}">
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
                  <fmt:formatDate   dateStyle="long" value="${demande.dateDemarage}"  var="date"/>
                    <input disabled type="text" class="form-control" value="${date}">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Date Résiliation</label>
                  <fmt:formatDate   dateStyle="long" value="${demande.dateResiliation}"  var="date"/>
                  <input disabled type="text" class="form-control" value="${date}">
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
                  <label>Transfrontalier</label>
                  <input disabled type="text" class="form-control" value="${demande.tronsfrontalier}">
                </div>
              </div>
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Nature foncier</label>
                  <input disabled type="text" class="form-control" value="${demande.nature_foncier}">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Caractéristiques du projet</label>
                  <input disabled type="text" class="form-control" value="${demande.caracteristiques_projet}">
                </div>
              </div>
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Nature du projet</label>
                  <input disabled type="text" class="form-control" value="${demande.nature_projet}">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Ressources</label>
                  <input disabled type="text" class="form-control" value="${demande.ressource}">
                </div>
              </div>
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Source</label>
                  <input disabled type="text" class="form-control" value="${demande.source}">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Qualitative</label>
                  <input disabled type="text" class="form-control" value="${demande.qualitative}">
                </div>
              </div>
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Quantité estimée</label>
                  <input disabled type="text" class="form-control" value="${demande.quantite_projet}">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Unité</label>
                  <input disabled type="text" class="form-control" value="${demande.unite.nom_fr}">
                </div>
              </div>
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Caractéristique physique</label>
                  <input disabled type="text" class="form-control" value="${demande.caracteristquePhysique.nom_fr}">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
                  <label>Population</label>
                  <input disabled type="text" class="form-control" value="${demande.population.nom_fr}">
                </div>
              </div>
              <div class="col-md-6 col-sm-12">
                <div class="form-group">
            <c:if test="${not empty demande.impacts!=null }">
                  <label>Les Impacts positifs et négatifs du projet</label>
                  <a target="_blank" class="btn btn-success" download href="${url_Admin}${fn:replace(demande.impacts, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
            </c:if>
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
      </div>
    </div>
  </div>
  </div>
</c:if>
<c:if test="${(empty demande)}"><spring:message code="label.Aucunresultat"/></c:if>
<jsp:include page="../../includes/footer1.jsp" />
