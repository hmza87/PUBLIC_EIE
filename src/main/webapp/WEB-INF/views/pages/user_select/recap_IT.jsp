<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${not empty installation}">
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


      <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
          <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.Installationdetraitementdesdechets"/></li>
        </ol>
      </nav>
    </div>
  </div>
  <div class="row justify-content-center"  style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-md-10 col-sm-12">
      <div class="jumbotron p-3">
       <spring:message code="label.Statutdelademande"/>: <span class="text-success h4 font-weight-bold">${installation.statut[lng]}</span>
      </div>
    </div>
  </div>
  <div class="row mb-5 justify-content-center">
    <div class="col-md-10 col-sm-12">
      <div class="row p-0 mt-2">

          <c:if test="${installation.statut.id_statut_projet==14 || installation.statut.id_statut_projet==51}">
            <div class="col-md-3">
              <a href="/api/addInstallation/${installation.id_installation }/N" class="btn btn-primary btn-block"><i class="fa fa-pencil-alt " title="Modifier" style="margin:0 !important"></i> <spring:message code="label.Editer"/></a>
            </div>
          </c:if>

          <div class="col-md-3 col-sm-6">
            <a href="/api/generate_recap_instalation/${installation.id_installation }" class="btn btn-primary btn-block"><i class="fa fa-print mr-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
          </div>


          <c:if test="${installation.statut.id_statut_projet==15 }">
            <div class="col-md-3">
                <a href="/api/infoInstallation/${installation.id_installation }" class="btn btn-primary rounded"><span class="fa fa-plus "></span> <spring:message code="label.Ameliorerlesdocuments"/></a>
            </div>
          </c:if>


          <c:if test="${installation.statut.id_statut_projet==17 }">
            <div class="col-md-3">
                <a href="/api/generateDocInstallFavorable/${installation.id_installation}" class="btn btn-primary rounded"><span class="fa fa-file-download"></span></a>
            </div>
          </c:if>

        <c:if test="${installation.statut.id_statut_projet==57}">
          <div class="col-md-3 col-sm-6">
            <a href="${url_Admin}${fn:replace(installation.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary"><i class="fa fa-download"></i> Télécharger l'autorisation </a>
          </div>
        </c:if>

      </div>
      <c:if test="${renouv=='oui'}">
        <div class="row-fluid mt-2 mb-3">
          <div class="col-3">
            <a class="btn btn-success btn-block" href="/api/newInstallRenouv/${installation.num_demande}"><spring:message code="label.Renouvellement"/> </a>
          </div>
        </div>
      </c:if>
    </div>
  </div>
  <div class="row justify-content-center" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-md-10 col-sm-12">
      <div id="accordion">
        <h2>
          <%--<spring:message code="button.informationdinstallation"/>--%>
            Installation de traitement des déchets
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
            </div>
          </div>


        </div>
        <h2>
          <%--<spring:message code="button.informationdemandeur"/>--%>
          Information sur le pétitionnaire
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
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <a href="${url_admin}${fn:replace(installation.qualification,"/assets/myFile/","/dowload_uploaded/")}" download target="_blank" class="btn btn-success btn-block">Télécharger fichier Qualification</a>
              </div>
            </div>

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
  <%-- <div class="row mb-5 justify-content-center">
    <div class="col-md-10 col-sm-12">
      <div class="row p-0 mt-2">

          <c:if test="${installation.statut.id_statut_projet==14 || installation.statut.id_statut_projet==51}">
            <div class="col-md-3">
              <a href="/api/addInstallation/${installation.id_installation }/N" class="btn btn-primary btn-block"><i class="fa fa-pencil-alt " title="Modifier" style="margin:0 !important"></i> <spring:message code="label.Editer"/></a>
            </div>
          </c:if>

          <div class="col-md-3 col-sm-6">
            <a href="/api/generate_recap_instalation/${installation.id_installation }" class="btn btn-primary btn-block"><i class="fa fa-print mr-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
          </div>


          <c:if test="${installation.statut.id_statut_projet==15 }">
            <div class="col-md-3">
                <a href="/api/infoInstallation/${installation.id_installation }" class="btn btn-primary rounded"><span class="fa fa-plus "></span> <spring:message code="label.Ameliorerlesdocuments"/></a>
            </div>
          </c:if>


          <c:if test="${installation.statut.id_statut_projet==17 }">
            <div class="col-md-3">
                <a href="/api/generateDocInstallFavorable/${installation.id_installation}" class="btn btn-primary rounded"><span class="fa fa-file-download"></span></a>
            </div>
          </c:if>

        <c:if test="${installation.statut.id_statut_projet==57}">
          <div class="col-md-3 col-sm-6">
            <a href="${url_Admin}${fn:replace(installation.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary"><i class="fa fa-download"></i> Télécharger l'autorisation </a>
          </div>
        </c:if>

      </div>
      <c:if test="${renouv=='oui'}">
        <div class="row-fluid mt-2 mb-3">
          <div class="col-3">
            <a class="btn btn-success btn-block" href="/api/newInstallRenouv/${installation.num_demande}"><spring:message code="label.Renouvellement"/> </a>
          </div>
        </div>
      </c:if>
    </div>
  </div> --%>


</c:if>
<c:if test="${(empty installation ) }"><spring:message code="label.Aucunresultat"/> </c:if>
<jsp:include page="../../includes/footer1.jsp" />
