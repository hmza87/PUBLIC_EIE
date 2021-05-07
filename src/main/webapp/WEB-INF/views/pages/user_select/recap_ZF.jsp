<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../../includes/head.jsp" />
<c:if test="${not empty notification}">
  <script>
    $( function() {
      $( "#accordion" ).accordion({
        collapsible: true,
        heightStyle: "content",
      });
    } );

    function updatePdf(id) {

      fetch('/api/test/'+id)
              .then(resp => resp.blob())
              .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                // the filename you want
                a.download = 'Notification.pdf';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);

              });

    }
  </script>
  <style>
    .scroll-to-target{
      display: none !important;
    }
  </style>
  <div class="row-fluid mt-5" style="margin-top: 150px !important;">
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

      <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
          <li class="breadcrumb-item active" aria-current="page"><a href="/api/checkUserHasCollecte/${type}" >${p_page}</a></li>
        </ol>
      </nav>
    </div>
  </div>

  <div class="row justify-content-center pl-3 pr-3">
    <div class="col-12">
      <div class="jumbotron p-3">
      <spring:message code="label.Statutdelademande"/>   : <span class="text-success h4 font-weight-bold"> ${(notification.statut.id_statut_projet==37 || notification.statut.id_statut_projet==54 || notification.statut.id_statut_projet==64 || notification.statut.id_statut_projet==65 || notification.statut.id_statut_projet==67 || notification.statut.id_statut_projet==68)?notification.statut.nom_fr:"en cours de traitement" } </span>
      </div>
    </div>
  </div>

  <div class="row justify-content-center mb-2">
    <div class="col-md-10 col-sm-12">
      <div class="row p-0 mt-2">
        <div class="col-md-3 col-sm-6 col-mt-4" >
          <a href="/api/generate_recap_imp/${notification.id_notification }" class="btn btn-primary btn-block"><i class="fa fa-print mr-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
        </div>
        <c:if test="${notification.statut.id_statut_projet==48 }">
          <div class="col-md-2 col-sm-6 ">
            <a href="/api/addDemandNotification/${notification.id_notification}/${type}/N" class="btn btn-primary btn-block"><i class="fa fa-pen " title="Améliorer les documents" ></i><spring:message code="label.modifier"/></a>
          </div>
        </c:if>
        <c:if test="${notification.statut.id_statut_projet==37 }">
          <!-- <div class="col-md-3 col-sm-6 ">
          <a href="/api/validateDoc/${notification.id_notification }/${type}" class="btn btn-primary btn-block"><i class="fa fa-upload " title="Améliorer les documents" style="margin:0 !important"></i><spring:message code="label.Ameliorerlesdocuments"/></a>
          </div>-->
        </c:if>
        <c:if test="${notification.statut.id_statut_projet==54}">
          <div class="col-md-auto col-sm-6 ">
            <a href="${url_Admin}${fn:replace(notification.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary btn-block"><i class="fa fa-upload " ></i> Télécharger l'autorisation signée</a>
          </div>
        </c:if>
        <c:if test="${(type=='ZF' || type=='XD') && (notification.statut.id_statut_projet==54 || notification.statut.id_statut_projet==65) }">
          <div class="col-md-auto col-sm-6 ">
            <a href="/api/addDocmouvement/${notification.id_notification}" class="btn btn-primary btn-block"><i class="fa fa-plus " ></i> ${notification.statut.id_statut_projet==54?'Ajouter':'Modifier'} le certificat d'élimination</a>
          </div>
        </c:if>
        <c:if test="${(type=='ZF' || type=='XD') && (notification.statut.id_statut_projet==64 || notification.statut.id_statut_projet==68 ) && notification.classification.id_classification==1 }">
          <div class="col-md-auto col-sm-6 ">
            <button onclick="load_modal_transporteur('${notification.id_notification}')" class="btn btn-primary btn-block"><i class="fa fa-plus " ></i> Déclarer un nouveau transporteur</button>
          </div>
        </c:if>



      </div>

    </div>
  </div>
  <div class="row justify-content-center  mb-5">
    <div class="col-md-10 col-sm-12">
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
                <label> <spring:message code="label.nom"/>  </label>
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
              <th> <spring:message code="label.nom"/> </th>
              <th> <spring:message code="label.identifiantfiscal"/> </th>
              <th> <spring:message code="label.telephone"/> </th>
              <th> <spring:message code="label.Fax"/> </th>
              <th> <spring:message code="label.email"/> </th>
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
                  <td>${tr.email}</td>
                </tr>
              </c:forEach>
            </c:if>
            <c:if test="${not empty declarationTrans}">
              <tr class="bg-primary">
                <td>${declarationTrans.transporteurParam.nom}</td>
                <td>${declarationTrans.transporteurParam.identifiant}</td>
                <td>${declarationTrans.transporteurParam.tel}</td>
                <td>${declarationTrans.transporteurParam.fax}</td>
                <td>${declarationTrans.transporteurParam.email}</td>
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
                <label><spring:message code="label.nom"/></label>
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
        <h2><spring:message code="label.installationdelimination"/></h2>
        <div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label><spring:message code="label.nom"/></label>
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


  <!-- Modal -->
  <div class="modal fade" id="declarationTransp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Déclaration du transporteur</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12" id="groupe_select" >
              <label>Déclarer le nouveau Transporteur </label>
              <select class="form-control select2" id="id_transp">
                  <%-- load_dynamique--%>
              </select>
            </div>
            <div class="col-12">
              <label>Assurance</label>
              <input type="file" class="form-control" id="file_declaration">
            </div>
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
          <button type="button" class="btn btn-primary" onclick="saveDeclarationTransporteur(this)">Enregistrer</button>
        </div>
      </div>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
  <jsp:include page="../../includes/footer1.jsp"/>
</c:if>
<c:if test="${(empty notification ) }"><spring:message code="label.Aucunresultat"/></c:if>
<jsp:include page="../../includes/footer1.jsp" />
