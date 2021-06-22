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
    <div class="col-12">
      <div class="row">
        <div class="col-12">
          <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
           <c:if test="${type=='EE'}">
             <li class="breadcrumb-item"><a href="/api/ListeEie/${type}"><spring:message code="label.EtudedimpactEnvironnementale"/></a></li>
           </c:if>
              <c:if test="${type=='RS'}">
                <li class="breadcrumb-item"><a href="/api/ListeEie/${type}"><spring:message code="label.Renseignementprealable"/></a></li>
              </c:if>
              <c:if test="${type=='NT'}">
                <li class="breadcrumb-item"><a href="/api/ListeEie/${type}"><spring:message code="label.Noticedimpact"/></a></li>
              </c:if>
              <c:if test="${type=='AE'}">
                <li class="breadcrumb-item"><a href="/api/ListeEie/${type}"><spring:message code="label.Auditenvironnementale"/></a></li>
              </c:if>
              <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.Recap"/> ${titre_dyn}</li>
            </ol>
          </nav>
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
            <c:if test="${demande.statut.id_statut_projet==71 && demande.type=='AE' }">
              <button onclick="ajouter_rapport_ae('${demande.id_demande_information}')" class="btn btn-primary"><spring:message code="label.Ajouterlerapportdaudit"/></button>
            </c:if>
            <c:if test="${demande.statut.id_statut_projet==73 && type=='AE'}">
              <a href="/api/AttacherListDocAE/${demande.id_demande_information}" class="btn btn-primary" title="Attacher les documents">
                <i class="fa fa-check"></i>
                <spring:message code="label.Attacherlesdocuments"/>
              </a>
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
            <h2><spring:message code="label.informationssurlepetitionnaire"/></h2>
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
            <c:if test="${type=='AE'}">
              <h2><spring:message code="label.informationssurleprojet"/>  </h2>
            </c:if>
            <c:if test="${type!='AE'}">
              <h2>Information sur le projet  </h2>
            </c:if>
            <div>
              <c:if test="${type=='EE' || type=='RS'}">
                <div class="row">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label>Intitulé du projet</label>
                      <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                    </div>
                  </div>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label><spring:message code="label.MontantdinvestissementenMDH"/></label>
                      <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label><spring:message code="label.Transfrontalier"/></label>
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
                      <label><spring:message code="label.MontantdinvestissementenMDH"/></label>
                      <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                    </div>
                  </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label><spring:message code="label.Naturedactivite"/></label>
                        <textarea disabled type="text" class="form-control" rows="3">${demande.nature_projet}</textarea>
                      </div>
                    </div>
                  </div>
              </c:if>
              <c:if test="${type=='NT'}">
                <div class="row">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label>Intitulé du projet</label>
                      <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                    </div>
                  </div>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label><spring:message code="label.MontantdinvestissementenMDH"/></label>
                      <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label>Nature de projet</label>
                      <textarea disabled type="text" class="form-control">${demande.nature_projet}</textarea>
                    </div>
                  </div>
                </div>
              </c:if>
            </div>
            <c:if test="${type=='AE'}">
              <h2><spring:message code="label.localisationduprojet"/>  </h2>
            </c:if>
            <c:if test="${type!='AE'}">
              <h2>Localisation du projet</h2>
            </c:if>
            <div>
              <div class="row">
                <div class="col-sm-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
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

            <h2><spring:message code="label.mespieces" /></h2>
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
</c:if>
<c:if test="${(empty demande)}"><spring:message code="label.Aucunresultat"/></c:if>
<jsp:include page="../../includes/footer1.jsp" />
<script>
  function ajouter_rapport_ae(id){
    if(event!=null)
      event.preventDefault();
    $("#modal_AE").modal("show");
    $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url: "/api/affiche_FRM_Add_rapport_ae/" + id,
      data:{},
      success: function (response) {
        $("#zone_AE_fichier").html(response);
      },
      error: function () {

      }
    });
  }
</script>
