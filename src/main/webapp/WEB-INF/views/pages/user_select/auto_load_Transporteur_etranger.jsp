<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<div class="row m-0 p-0">
  <div class="col-12 p-0 table-responsive">
    <table class="table my_table table-bordered table-striped table-hover">
      <thead>
      <tr>
        <th class="text-center"> <spring:message code="label.Raisonsocial"/>  </th>
        <th class="text-center"> <spring:message code="label.Matricule"/> </th>
        <th class="text-center"> <spring:message code="label.Typevehicule"/> </th>
        <th class="text-center"> <spring:message code="label.Assurance"/> </th>
        <th class="text-center">  <spring:message code="label.Adresse"/> </th>
        <th class="text-center"> <spring:message code="label.Port"/> </th>
        <th class="text-center">  <spring:message code="label.Action"/>  </th>
      </tr>
      </thead>
      <tbody>
      <c:if test="${not empty transporteur_etranger}">
        <c:forEach items="${transporteur_etranger}" var="trans">
          <c:if test="${trans.type=='ti'}">
          <tr id="trr_${trans.id_TransporteurEtranger}">
            <td>${trans.raison_social}</td>
            <td>${trans.num_matricule}</td>
            <td>${trans.typeVehicule}</td>
            <td> <a target="_blank" download="assurance" href="${url_Admin}${fn:replace(trans.url_assurance,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary btn-sm"> <span class=""></span> <spring:message code="label.Assurance"/> </a> </td>
            <td>${trans.adresse}</td>
            <td> <button class="btn btn-primary  btn-sm"
                         onclick="fun_affiche_modal('#modal_DetailPort','${trans.id_TransporteurEtranger}')">
              <spring:message code="label.DetailPort"/>
            </button> </td>
            <td class="text-center">
              <button  onclick="delete_transp_etrang2('${trans.id_TransporteurEtranger}','id_notification','etranger')" class="btn btn-danger rounded-circle"><span class="fa fa-trash-alt"></span></button>
              <button  onclick="edit_transp_trang('${trans.id_TransporteurEtranger}','id_notification','etranger')" class="btn btn-warning rounded-circle"><span class="fa fa-pen"></span></button>
            </td>
          </tr>
          <div class="modal fade" id="modal_DetailPort_${trans.id_TransporteurEtranger}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="background: none">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title"><spring:message code="label.DetailPort"/></h5>
                  <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="row justify-content-center">
                    <div class="col-10">
                      <div class="row " style="background: gray;color: white;border-color: #737373;" >
                        <div class="col-6 border p-2 font_bold  btn-gris">
                          #
                        </div>
                        <div class="col-6 border p-2 font_bold  btn-gris">
                          <spring:message code="label.Port"/>
                        </div>
                      </div>

                      <c:forEach items="${trans.port}" var="xx" varStatus="loopp">
                        <div class="row">
                          <div class="col-6 border p-2">
                              ${loopp.index+1}
                          </div>
                          <div class="col-6 border p-2">
                              ${xx.nom_fr}
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button onclick="close_modal(this)" type="button" class="btn btn-secondary" data-dismiss="modal"> <spring:message code="label.Fermer"/> </button>
                </div>
              </div>
            </div>
          </div>
          </c:if>
        </c:forEach>
      </c:if>
      <c:if test="${empty transporteur_etranger}">
        <td colspan="5" class="bg-primary text-center"><spring:message code="label.AucunTransporteur"/> </td>
      </c:if>
      </tbody>
    </table>
  </div>
</div>
<div class="row mt-3 justify-content-center p-0">
  <div class="col-md-4 col-sm-12">
    <div class="form-group">
      <label> <spring:message code="label.Raisonsocial"/> </label>
      <input type="text" id="raison_social" class="form-control" value="${one.raison_social}">
    </div>
  </div>
  <div class="col-md-4 col-sm-12">
    <div class="form-group">
      <label><spring:message code="label.Matricule"/>  </label>
      <input type="text" id="num_matriule" class="form-control" value="${one.num_matricule}">
    </div>
  </div>
</div>
<div class="row mt-3 justify-content-center p-0">
  <div class="col-md-4 col-sm-12">
    <div class="form-group">
      <label><spring:message code="label.Typevehicule"/> </label>
      <input class="form-control" type="text" value="${one.typeVehicule}" id="type_vehicule">
    </div>
  </div>
  <div class="col-md-4 col-sm-12">
    <div class="form-group">
      <label> <spring:message code="label.Assurance"/> </label>
      <c:if test="${empty one.url_assurance}">
        <input type="File" id="doc_assurance" class="form-control">
      </c:if>
      <c:if test="${not empty one.url_assurance}">
        <div class="row p-0">
          <div class="col-10 pl-1">
            <input type="File" id="doc_assurance" class="form-control">
          </div>
          <div class="col-2 pr-1">
            <a id="btn_downolad2" href="${url_Admin}${fn:replace(one.url_assurance,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary rounded "><span class="fa fa-download"></span></a>
          </div>
        </div>
      </c:if>

    </div>
  </div>


</div>
<div class="row mt-3 justify-content-center p-0">
  <div class="col-md-8 col-sm-12">
    <div class="form-group">
      <label> <spring:message code="label.Adresse"/> </label>
      <input type="text" id="adresseTr" class="form-control" value="${one.adresse}">
    </div>
  </div>
</div>
<div id="education_fields"></div>
<div class="row mt-3 justify-content-center p-0">
  <div class="col-sm-8 nopadding">
    <div class="form-group">
      <div class="input-group">
        <input type="text" class="form-control" name="port[]"  placeholder="Entrez Un Port">
        <div class="input-group-btn">
          <button class="btn btn-success" type="button"  onclick="education_fields();"> <span class="fa fa-plus" aria-hidden="true"></span> </button>
        </div>
      </div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<div class="row justify-content-center">
  <div class="col-sm-6 col-md-3">
    <input type="hidden" value="${(not empty one)?one.id_TransporteurEtranger:'0'}" id="id_trans">
    <button class="btn btn-success btn-block" onclick="ajouterTranporteur_Etranger('id_notification')"><spring:message code="label.Enregistrertransporteur"/></button>
  </div>
</div>

