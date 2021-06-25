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
    .accordion-toggle {
      background-color: #7dc7bd;
      display: block;
    //padding: 10px;
      margin: -11px -20px;
      border-top-left-radius: 4px;
      border-top-right-radius: 4px;
    }

    .accordion-toggle.collapsed {
      background-color: #f6f6f6;
      border-top-color: #c5c5c5;
      font-weight: normal;
      color: #454545 !important;
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
      <spring:message code="label.Statutdelademande"/>   : <span class="text-success h4 font-weight-bold"> ${(notification.statut.id_statut_projet==84 || notification.statut.id_statut_projet==37 || notification.statut.id_statut_projet==54 || notification.statut.id_statut_projet==64 || notification.statut.id_statut_projet==65 || notification.statut.id_statut_projet==67 || notification.statut.id_statut_projet==68 || notification.statut.id_statut_projet==40)?notification.statut.nom_fr:"en cours de traitement" } </span>
      </div>
    </div>
  </div>

  <div class="row justify-content-center mb-2">
    <div class="col-md-10 col-sm-12">
      <c:if test="${notification.statut.id_statut_projet==54}">
        <h4 style="text-decoration: underline; color: #0d128e">Votre demande est bien validée vous pouvez vous déplacez pour l'obtention de votre autorisation</h4>
      </c:if>
      <c:if test="${notification.statut.id_statut_projet==64}">
        <h4 style="text-decoration: underline; color: #0d128e">Vous pouvez vous déplacez pour l'obtenion votre garantie financière </h4>
      </c:if>
      <c:if test="${notification.statut.id_statut_projet==84}">
        <h4 style="text-decoration: underline; color: #0d128e">Vous pouvez vous déplacez pour l'obtention de votre lettre originale</h4>
      </c:if> <br>
      <div class="row p-0 mt-2 pl-3">
        <div class="col-md-3 col-sm-6 col-mt-4 pr-1 pl-1" >
          <a href="/api/generate_recap_imp/${notification.id_notification }" class="mt-1 mb-1 btn btn-primary btn-block"><i class="fa fa-print mr-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
        </div>
        <c:if test="${notification.statut.id_statut_projet==48 }">
          <div class="col-md-2 col-sm-6  pr-1 pl-1">
            <a href="/api/addDemandNotification/${notification.id_notification}/${type}/N" class="mt-1 mb-1 btn btn-primary btn-block"><i class="fa fa-pen " title="Améliorer les documents" ></i><spring:message code="label.modifier"/></a>
          </div>
        </c:if>
        <c:if test="${notification.statut.id_statut_projet==84}">
          <div class="col-md-3 col-sm-6  pr-1 pl-1">
            <a href="${url_Admin}${fn:replace(notification.url_lettre_conforme,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-upload " ></i>Télécharger la lettre de consentement</a>
          </div>
        </c:if>
        <c:if test="${notification.statut.id_statut_projet==37 }">
          <!-- <div class="col-md-3 col-sm-6 ">
          <a href="/api/validateDoc/${notification.id_notification }/${type}" class="btn btn-primary btn-block"><i class="fa fa-upload " title="Améliorer les documents" style="margin:0 !important"></i><spring:message code="label.Ameliorerlesdocuments"/></a>
          </div>-->
        </c:if>
        <c:if test="${(type=='ET' || type=='TR') && (notification.statut.id_statut_projet==54)}">
          <div class="col-md-auto col-sm-6  pr-1 pl-1">
            <a href="${url_Admin}${fn:replace(notification.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-upload " ></i><spring:message code="label.Telechargerlautorisationsignee"/> </a>
          </div>
        </c:if>
        <c:if test="${(type=='ZF' || type=='XD') && (notification.statut.id_statut_projet==54) }">
          <div class="col-md-auto col-sm-6  pr-1 pl-1">
            <a href="/api/addDocmouvement/${notification.id_notification}" class="btn btn-primary btn-block mb-1 mt-1"><i class="fa fa-plus " ></i> ${notification.statut.id_statut_projet==54?'Ajouter':'Modifier'}<spring:message code="label.lecertificatdelimination"/> </a>
          </div>
        </c:if>
        <c:if test="${(type=='ZF' || type=='XD') && (notification.statut.id_statut_projet==54|| notification.statut.id_statut_projet==68 ) && notification.classification.id_classification==1 }">
          <div class="col-md-auto col-sm-6  pr-1 pl-1">
            <button onclick="load_modal_transporteur('${notification.id_notification}')" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-plus " ></i><spring:message code="label.Declarerunnouveautransporteur"/>  </button>
          </div>
        </c:if>



      </div>

    </div>
  </div>
  <div class="row justify-content-center pl-2 pr-2">
  <div class="col-10">
  <div class="bg-white" id="accordion-style-1">
    <div class="row">
      <div class="col-12">
        <div class="accordion" id="accordionExample">
          <c:if test="${notification.zf_et=='XD' || notification.zf_et=='ZF'}">
            <div class="">
              <div class="card-header" id="headingOne1">
                <h5 class="mb-0">
                  <a class="accordion-toggle btn text-left text-white" type="button" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                    <i class="fa fa-angle-double-right mr-3"></i><spring:message code="label.Numerodenotification"/>
                  </a>
                </h5>
              </div>

              <div id="collapseOne1" class="collapse show fade" aria-labelledby="headingOne1" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="row m-0 p-0 mt-2">
                    <div class="col-6">
                      <div class="form-group">
                        <label><spring:message code="label.Numerodenotification"/></label>
                        <input class="form-control" value="${notification.num_notification}" disabled>

                      </div>



                    </div>


                    <div class="col-6">
                      <div class="form-group">
                        <label><spring:message code="label.Classificationdesdechets"/> </label>
                        <input class="form-control" value="${notification.classification.nom_fr}" disabled>
                      </div>
                    </div>
                  </div>


                  <div class="row m-0 p-0 mt-2">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label> <spring:message code="label.code"/> </label>
                        <input type="text" disabled value="${notification.code.nom_fr}" class="form-control">
                      </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label><spring:message code="label.typededechet"/> </label>
                        <input type="text" disabled value="${notification.code.nom_ar}" class="form-control">
                      </div>
                    </div>

                  </div>

                  <div class="row m-0 p-0 mt-2">
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

                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label> <spring:message code="label.producteur"/>  </label>
                        <input type="text" disabled value="${notification.producteur_text}" class="form-control">
                      </div>
                    </div>

                  </div>

                  <div class="row m-0 p-0 mt-2">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label> <spring:message code="label.quantitetotaleprevu"/> </label>
                        <input type="text" disabled value="${notification.quantite}" class="form-control">
                      </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label> <spring:message code="label.unite"/>  </label>
                        <input type="text" disabled value="${notification.unite.nom_fr}" class="form-control">
                      </div>
                    </div>

                  </div>

                </div>
              </div>
            </div>
            <c:if test="${notification.zf_et != 'ZF'}">
              <div class="">
                <div class="card-header" id="headingOne2">
                  <h5 class="mb-0">
                    <a class="accordion-toggle btn text-left collapsed text-white" type="button" data-toggle="collapse" data-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne2">
                      <i class="fa fa-angle-double-right mr-3"></i><c:if test="${notification.zf_et!='ZF'}">Exportateur - Notifiant</c:if>
                    </a>
                  </h5>
                </div>

                <div id="collapseOne2" class="collapse fade" aria-labelledby="headingOne2" data-parent="#accordionExample">
                  <div class="card-body">
                    <c:if test="${notification.zf_et!='TR' && notification.zf_et != 'XD'}">
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
                    </c:if>
                    <c:if test="${notification.zf_et == 'XD'}">
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.nomdesociete"/> </label>
                            <input type="text" disabled value="${notification.importateur.nom_fr}" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label dir="rtl"> إسم الشركة : </label>
                            <input dir="rtl" value="${notification.importateur.nom_ar}" disabled type="text" class="form-control">
                          </div>
                        </div>
                      </div>

                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.personneacontacter"/> </label>
                            <input value="${notification.importateur.contact_fr}" disabled type="text" class="form-control">
                          </div>
                        </div>
                      </div>

                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.Adresse"/> </label>
                            <input value="${notification.importateur.adresse_fr}" disabled type="text"
                                   class="form-control">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.Telephone"/> </label>
                            <input value="${notification.importateur.tel}" disabled type="text" class="form-control">
                          </div>
                        </div>
                      </div>


                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.Region"/>  </label>
                            <input type="text" disabled value="${notification.region.nom_fr}" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.Province"/>  </label>
                            <input type="text" disabled value="${notification.prefecture.nom_fr}" class="form-control">
                          </div>
                        </div>
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> Télécopie </label>
                            <input value="${notification.importateur.fax}" disabled type="text" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> Courrier électronique </label>
                            <input value="${notification.importateur.mail}" disabled type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                    </c:if>
                    <c:if test="${notification.zf_et=='TR'}">
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.NomdelexportateurNotifiant"/></label>
                            <input class="form-control" type="text" disabled value="${notification.nom}">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Telecopie"/></label>
                            <input class="form-control" type="text" disabled value="${notification.telecopie}">
                          </div>
                        </div>
                      </div>

                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.personneacontacter"/></label>
                            <input class="form-control" type="text" disabled value="${notification.personne}">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Tel"/></label>
                            <input class="form-control" type="text" disabled value="${notification.tel}">
                          </div>
                        </div>
                      </div>

                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.courrierelectronique"/></label>
                            <input class="form-control" type="text" disabled value="${notification.courrier}">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Adresse"/></label>
                            <input class="form-control" type="text" disabled value="${notification.adresse}">
                          </div>
                        </div>
                      </div>


                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                            <input class="form-control" type="text" disabled value="${notification.codeNationalXD}">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                            <input class="form-control" type="text" disabled value="${notification.codeNationalIm}">
                          </div>
                        </div>
                      </div>

                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                            <input class="form-control" type="text" disabled value="${notification.codeCE}">
                          </div>
                        </div>
                      </div>

                    </c:if>
                  </div>
                </div>
              </div>
            </c:if>
          </c:if>
          <c:if test="${notification.zf_et!='XD' && notification.zf_et!='ZF'}">
            <div class="">
              <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                  <a class="accordion-toggle btn text-left text-white" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <i class="fa fa-angle-double-right mr-3"></i>Exportateur - Notifiant
                  </a>
                </h5>
              </div>

              <div id="collapseOne" class="collapse show fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                  <c:if test="${notification.zf_et!='TR' && notification.zf_et != 'XD'}">
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
                  </c:if>
                  <c:if test="${notification.zf_et == 'XD'}">
                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.nomdesociete"/> </label>
                          <input type="text" disabled value="${notification.importateur.nom_fr}" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label dir="rtl"> إسم الشركة : </label>
                          <input dir="rtl" value="${notification.importateur.nom_ar}" disabled type="text" class="form-control">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.personneacontacter"/> </label>
                          <input value="${notification.importateur.contact_fr}" disabled type="text" class="form-control">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Adresse"/> </label>
                          <input value="${notification.importateur.adresse_fr}" disabled type="text"
                                 class="form-control">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Telephone"/> </label>
                          <input value="${notification.importateur.tel}" disabled type="text" class="form-control">
                        </div>
                      </div>
                    </div>


                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Region"/>  </label>
                          <input type="text" disabled value="${notification.region.nom_fr}" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Province"/>  </label>
                          <input type="text" disabled value="${notification.prefecture.nom_fr}" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> Télécopie </label>
                          <input value="${notification.importateur.fax}" disabled type="text" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> Courrier électronique </label>
                          <input value="${notification.importateur.mail}" disabled type="text" class="form-control">
                        </div>
                      </div>
                    </div>
                  </c:if>
                  <c:if test="${notification.zf_et=='TR'}">
                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.NomdelexportateurNotifiant"/></label>
                          <input class="form-control" type="text" disabled value="${notification.nom}">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Telecopie"/></label>
                          <input class="form-control" type="text" disabled value="${notification.telecopie}">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.personneacontacter"/></label>
                          <input class="form-control" type="text" disabled value="${notification.personne}">
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Tel"/></label>
                          <input class="form-control" type="text" disabled value="${notification.tel}">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.courrierelectronique"/></label>
                          <input class="form-control" type="text" disabled value="${notification.courrier}">
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Adresse"/></label>
                          <input class="form-control" type="text" disabled value="${notification.adresse}">
                        </div>
                      </div>
                    </div>


                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                          <input class="form-control" type="text" disabled value="${notification.codeNationalXD}">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                          <input class="form-control" type="text" disabled value="${notification.codeNationalIm}">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                          <input class="form-control" type="text" disabled value="${notification.codeCE}">
                        </div>
                      </div>
                    </div>

                  </c:if>
                </div>
              </div>
            </div>
          </c:if>
          <div class="">
            <div class="card-header" id="headingTwo">
              <h5 class="mb-0">
                <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  <i class="fa fa-angle-double-right mr-3"></i>
                  Importateur - ${type.equals("XD")?"Destinataire":"Notifiant"}
                </a>
              </h5>
            </div>
            <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
              <div class="card-body">
                <c:if test="${notification.zf_et=='XD'}">
                  <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label>Nom de l'importateur destinataire</label>
                        <input class="form-control" type="text" disabled value="${notification.nom}">
                      </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label><spring:message code="label.Telecopie"/></label>
                        <input class="form-control" type="text" disabled value="${notification.telecopie}">
                      </div>
                    </div>
                  </div>
                  <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label><spring:message code="label.personneacontacter"/></label>
                        <input class="form-control" type="text" disabled value="${notification.personne}">
                      </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label><spring:message code="label.Tel"/></label>
                        <input class="form-control" type="text" disabled value="${notification.tel}">
                      </div>
                    </div>
                  </div>
                  <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label><spring:message code="label.courrierelectronique"/></label>
                        <input class="form-control" type="text" disabled value="${notification.courrier}">
                      </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label><spring:message code="label.Adresse"/></label>
                        <input class="form-control" type="text" disabled value="${notification.adresse}">
                      </div>
                    </div>
                  </div>
                  <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                        <input class="form-control" type="text" disabled value="${notification.codeNationalXD}">
                      </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                        <input class="form-control" type="text" disabled value="${notification.codeNationalIm}">
                      </div>
                    </div>
                  </div>
                  <div class="row mb-2">
                    <div class="col-md-6 col-sm-12 ">
                      <div class="form-group">
                        <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                        <input class="form-control" type="text" disabled value="${notification.codeCE}">
                      </div>
                    </div>
                  </div>
                </c:if>
                <c:if test="${notification.zf_et!='XD'}">
                  <div class="row mb-2">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group" ${pageContext.response.locale=='ar'?'rtl':'ltr'}>
                        <label> <spring:message code="label.nomdesociete"/>  </label>
                        <c:choose>
                          <c:when test="${pageContext.response.locale=='ar'}">
                            <input value="${notification.importateur.nom_ar}" type="text" name="Nom_ar" id="Nom_ar" class="form-control" dir="rtl">
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
                    <c:if test="${type.equals('ZF')}">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.identifiantfiscal"/> </label>
                          <input type="text" disabled value="${notification.importateur.idf}" class="form-control">
                        </div>
                      </div>
                    </c:if>

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
                        <label><spring:message code="label.Region"/> </label>
                        <input type="text" disabled value="${notification.region.nom_fr}" class="form-control">
                      </div>
                    </div>

                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label> <spring:message code="label.Province"/>  </label>
                        <input type="text" disabled value="${notification.prefecture.nom_fr}" class="form-control">
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
                </c:if>
              </div>

            </div>
          </div>
          <c:if test="${notification.zf_et=='XD' || notification.zf_et=='TR'}">
            <div class="">
              <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                  <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <i class="fa fa-angle-double-right mr-3"></i>
                    Autorité
                  </a>
                </h5>
              </div>
              <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">
                <div class="card-body">
                  <c:if test="${notification.zf_et=='XD'}">
                    <h2>Autorité</h2>
                    <div>
                      <div class="row">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Adresse"/></label>
                            <input disabled class="form-control" value="${notification.autorite.adresse}" type="text">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.telephone"/></label>
                            <input disabled class="form-control" value="${notification.autorite.tel}" type="text">
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Fax"/></label>
                            <input disabled class="form-control" value="${notification.autorite.fax}" type="text">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.email"/></label>
                            <input disabled class="form-control" value="${notification.autorite.email}" type="text">
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.pays"/></label>
                            <input disabled class="form-control" value="${notification.pays.nom_fr}" type="text">
                          </div>
                        </div>
                      </div>

                    </div>
                  </c:if>


                  <c:if test="${notification.zf_et=='TR'}">
                    <div>
                      <div class="row">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Adresse"/></label>
                            <input disabled class="form-control" value="${notification.autorite.adresse}" type="text">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.telephone"/></label>
                            <input disabled class="form-control" value="${notification.autorite.tel}" type="text">
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Fax"/></label>
                            <input disabled class="form-control" value="${notification.autorite.fax}" type="text">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.email"/></label>
                            <input disabled class="form-control" value="${notification.autorite.email}" type="text">
                          </div>
                        </div>
                      </div>
                      <table class="table my_table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                          <th> Autorité </th>
                          <th> Autorisation </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty notification.paysAutorites}">
                          <c:forEach items="${notification.paysAutorites}" var="tr">
                            <tr>
                              <td>${tr.pays.nom_fr}</td>
                              <td><a href="${url_Admin}${fn:replace(tr.url_autorite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a></td>
                            </tr>
                          </c:forEach>
                        </c:if>
                        <c:if test="${empty notification.paysAutorites}">
                          <tr>
                            <td class="text-center" colspan="5"> Aucune autorité  </td>
                          </tr>
                        </c:if>
                        </tbody>
                      </table>

                    </div>
                  </c:if>


                </div>

              </div>
            </div>
          </c:if>

          <div class="">
            <div class="card-header" id="headingFor">
              <h5 class="mb-0">
                <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseFor" aria-expanded="false" aria-controls="collapseFor">
                  <i class="fa fa-angle-double-right mr-3"></i>
                  <spring:message code="label.Documentdenotification"/>
                  <button style="font-size: 12px !important;" type="button" id="Suivante" onclick="updatePdf(${notification.id_notification })" class="btn btn-warning btn-sm text-white">
                    <spring:message code="label.Imprimer"/>
                  </button>
                </a>
              </h5>
            </div>
            <div id="collapseFor" class="collapse fade" aria-labelledby="headingFor" data-parent="#accordionExample">
              <div class="card-body">
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
            </div>
          </div>
          <div class="">
            <div class="card-header" id="headingFive">
              <h5 class="mb-0">
                <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                  <i class="fa fa-angle-double-right mr-3"></i><spring:message code="label.documentdemouvement"/>
                  <button onclick="go_link('/api/okPDF/${notification.id_notification}')" style="font-size: 12px !important;" class="btn btn-warning text-white btn-sm">
                    <spring:message code="label.documentdemouvement"/>
                  </button>
                </a>
              </h5>
            </div>
            <div id="collapseFive" class="collapse fade" aria-labelledby="headingFive" data-parent="#accordionExample">
              <div class="card-body">

              </div>
            </div>
          </div>
          <c:if test="${notification.zf_et=='ET' ||notification.zf_et=='XD' || notification.zf_et=='ZF'}">
            <div class="">
              <div class="card-header" id="headingZero">
                <h5 class="mb-0">
                  <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseZero" aria-expanded="false" aria-controls="collapseZero">
                    <i class="fa fa-angle-double-right mr-3"></i>Transporteur national prévu
                  </a>
                </h5>
              </div>
              <div id="collapseZero" class="collapse fade" aria-labelledby="headingZero" data-parent="#accordionExample">
                <div class="card-body">
                  <c:if test="${(notification.zf_et=='XD' || notification.zf_et=='ZF') && notification.classification.id_classification==1}">
                    <table id="tableProfils"
                           class="table my_table table-striped hover compact table-bordered text-md-nowrap">
                      <thead class="thead-bleu">
                      <tr>
                        <th class=""><spring:message code="label.nomdesociete"/></th>
                        <th class=""><spring:message code="label.identifiantfiscal"/></th>
                        <th class=""><spring:message code="label.telephone"/></th>
                        <th class=""><spring:message code="label.Fax"/></th>
                        <th class=""><spring:message code="label.Adresse"/></th>
                      </tr>
                      </thead>
                      <tbody id="tbodyTransporteur">
                      <c:forEach items="${notification.transporteur}" var="Tr_l">
                        <tr>
                          <td>${Tr_l.nom} </td>
                          <td>${Tr_l.identifiant} </td>
                          <td>${Tr_l.tel} </td>
                          <td>${Tr_l.fax} </td>
                          <td>${Tr_l.adresse} </td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </c:if>
                  <c:if test="${(notification.zf_et=='XD' || notification.zf_et=='ZF') && notification.classification.id_classification==2}">
                    <table class="table my_table table-striped table-bordered table-hover">
                      <thead>
                      <tr>
                        <th> <spring:message code="label.nomdesociete"/> </th>
                        <th> <spring:message code="label.NMatriculation"/> </th>
                        <th> <spring:message code="label.Typedetransport"/> </th>
                        <th> <spring:message code="label.Assurance"/> </th>
                      </tr>
                      </thead>
                      <tbody>
                      <c:if test="${not empty notification.transporteur_etranger}">
                        <c:forEach items="${notification.transporteur_etranger}" var="tr">
                          <tr>
                            <c:if test="${tr.type=='tn'}">
                              <td>${tr.raison_social}</td>
                              <td>${tr.num_matricule}</td>
                              <td>${tr.typeVehicule}</td>
                              <td class="text-center"><a download="assurance" target="_blank" href="${fn:replace(tr.url_assurance, "/assets/myFile/","/dowload_uploaded/" )}" class="btn btn-success rounded"><span class="fa fa-download"></span></a></td>
                            </c:if>
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
                      <c:if test="${(empty notification.transporteur_etranger && empty declarationTrans)}">
                        <tr>
                          <td class="text-center" colspan="5"> <spring:message code="label.AucunTransporteur"/>  </td>
                        </tr>
                      </c:if>
                      </tbody>
                    </table>
                  </c:if>
                  <c:if test="${notification.zf_et !='ZF' && notification.zf_et!='XD'}">
                    <table class="table my_table table-striped table-bordered table-hover">
                      <thead>
                      <tr>
                        <th> <spring:message code="label.nomdesociete"/> </th>
                        <th> <spring:message code="label.NMatriculation"/> </th>
                        <th> <spring:message code="label.Typedetransport"/> </th>
                        <th> <spring:message code="label.Assurance"/> </th>
                      </tr>
                      </thead>
                      <tbody>
                      <c:if test="${not empty notification.transporteur_etranger}">
                        <c:forEach items="${notification.transporteur_etranger}" var="tr">
                          <tr>
                            <c:if test="${tr.type=='tn'}">
                              <td>${tr.raison_social}</td>
                              <td>${tr.num_matricule}</td>
                              <td>${tr.typeVehicule}</td>
                              <td class="text-center"><a download="assurance" target="_blank" href="${fn:replace(tr.url_assurance, "/assets/myFile/","/dowload_uploaded/" )}" class="btn btn-success rounded"><span class="fa fa-download"></span></a></td>
                            </c:if>
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
                      <c:if test="${(empty notification.transporteur_etranger && empty declarationTrans)}">
                        <tr>
                          <td class="text-center" colspan="5"> <spring:message code="label.AucunTransporteur"/>  </td>
                        </tr>
                      </c:if>
                      </tbody>
                    </table>
                  </c:if>
                </div>
              </div>
            </div>
          </c:if>

          <c:if test="${notification.zf_et=='XD' || notification.zf_et=='ET' ||notification.zf_et=='TR'}">
            <div class="">
              <div class="card-header" id="headingZero1">
                <h5 class="mb-0">
                  <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseZero1" aria-expanded="false" aria-controls="collapseZero1">
                    <i class="fa fa-angle-double-right mr-3"></i><spring:message code="label.TransporteurInternational"/>
                  </a>
                </h5>
              </div>
              <div id="collapseZero1" class="collapse fade" aria-labelledby="headingZero1" data-parent="#accordionExample">
                <div class="card-body">

                  <table class="table my_table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                      <th> <spring:message code="label.nomdesociete"/> </th>
                      <th> <spring:message code="label.NMatriculation"/> </th>
                      <th> <spring:message code="label.Typedetransport"/> </th>
                      <th> <spring:message code="label.Assurance"/> </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty notification.transporteur_etranger}">
                      <c:forEach items="${notification.transporteur_etranger}" var="tr">
                        <tr>
                          <c:if test="${tr.type=='ti'}">
                            <td>${tr.raison_social}</td>
                            <td>${tr.num_matricule}</td>
                            <td>${tr.typeVehicule}</td>
                            <td class="text-center"><a download="assurance" target="_blank" href="${fn:replace(tr.url_assurance, "/assets/myFile/","/dowload_uploaded/" )}" class="btn btn-success rounded"><span class="fa fa-download"></span></a></td>
                          </c:if>
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
                </div>
              </div>
            </div>
          </c:if>
          <div class="">
            <div class="card-header" id="headingSix">
              <h5 class="mb-0">
                <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                  <i class="fa fa-angle-double-right mr-3"></i><c:if test="${notification.zf_et=='XD'}"><spring:message code="label.producteursdesdechets"/></c:if>
                  <c:if test="${notification.zf_et!='XD'}">Producteur</c:if>
                </a>
              </h5>
            </div>
            <div id="collapseSix" class="collapse fade" aria-labelledby="headingSix" data-parent="#accordionExample">
              <div class="card-body">
                <c:if test="${notification.zf_et=='XD'}">
                  <table class="table my_table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                      <th> <spring:message code="label.nomdesociete"/> </th>
                      <th> <spring:message code="label.personneacontacter"/> </th>
                      <th> <spring:message code="label.identifiantfiscal"/> </th>
                      <th> <spring:message code="label.Adresse"/> </th>
                      <th> <spring:message code="label.telephone"/> </th>
                      <th> <spring:message code="label.Fax"/> </th>
                      <th> <spring:message code="label.Email"/> </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty notification.producteurs}">
                      <c:forEach items="${notification.producteurs}" var="tr">
                        <tr>
                          <td>${tr.nom_fr}</td>
                          <td>${tr.contact_fr}</td>
                          <td>${tr.idf}</td>
                          <td>${tr.adresse_fr}</td>
                          <td>${tr.tel}</td>
                          <td>${tr.fax}</td>
                          <td>${tr.mail}</td>
                        </tr>
                      </c:forEach>
                    </c:if>

                    <c:if test="${empty notification.producteurs}">
                      <tr>
                        <td class="text-center" colspan="5"> Aucun producteur  </td>
                      </tr>
                    </c:if>
                    </tbody>
                  </table>
                </c:if>
                <c:if test="${notification.zf_et!='XD'}">
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
                </c:if>

              </div>
            </div>
          </div>
          <div class="">
            <div class="card-header" id="headingSeven">
              <h5 class="mb-0">
                <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseseven" aria-expanded="false" aria-controls="collapseseven">
                  <i class="fa fa-angle-double-right mr-3"></i><spring:message code="label.Installationdevalorisationelimination"/>
                </a>
              </h5>
            </div>
            <div id="collapseseven" class="collapse fade" aria-labelledby="headingseven" data-parent="#accordionExample">
              <div class="card-body">
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
            </div>
          </div>
          <div class="">
            <div class="card-header" id="headingeight">
              <h5 class="mb-0">
                <a class="accordion-toggle btn collapsed text-left text-white" type="button" data-toggle="collapse" data-target="#collapseeight" aria-expanded="false" aria-controls="collapseeight">
                  <i class="fa fa-angle-double-right mr-3"></i><spring:message code="label.mespieces"/>
                </a>
              </h5>
            </div>
            <div id="collapseeight" class="collapse fade" aria-labelledby="headingeight" data-parent="#accordionExample">
              <div class="card-body">
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
      </div>
    </div>
  </div>
  </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="declarationTransp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle"> <spring:message code="label.Declarationdutransporteur"/></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12" id="groupe_select" >
              <spring:message code="label.AucunTransporteurnestcompatibleavecletypededechetsdevotreautorisation"/>
            </div>
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.Annuler"/></button>
          <button type="button" id="btn_valide_trans" class="btn btn-primary" onclick="saveDeclarationTransporteur()"><spring:message code="button.Enregistrer"/></button>
        </div>
      </div>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

</c:if>
<c:if test="${(empty notification ) }"><spring:message code="label.Aucunresultat"/></c:if>
<jsp:include page="../../includes/footer1.jsp" />
