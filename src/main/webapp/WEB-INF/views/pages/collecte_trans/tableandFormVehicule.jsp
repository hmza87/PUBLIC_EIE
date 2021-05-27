<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<div class="table-responsive">
    <table class="table table-bordered my_table" >
        <thead>
        <tr>
            <th> <spring:message code="label.NMatriculation"/> </th>
            <th> <spring:message code="label.NChassis"/> </th>
            <th> <spring:message code="label.Poidstotalencharge"/> </th>
            <th> <spring:message code="label.Poidsnetduvehicule"/> </th>
            <!-- <th> <spring:message code="label.Equipementdesecurite"/> </th>
            <th> <spring:message code="label.Attestationdassurance"/></th>-->
            <th style="min-width: 120px"> <spring:message code="label.Action"/> </th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty collect.vehicules}">
                <c:forEach items="${collect.vehicules}" var="v">
                    <tr id="tr${v.id_vehicule}">
                        <td>${v.num_mat_enrg_auto} - ${v.num_mat_enrg_voit} - ${v.num_mat_id_prefect}</td>
                        <td>${v.num_chassis}</td>
                        <td>${v.poit_totale_charge}</td>
                        <td>${v.point_net}</td>
                       <!--  <td>
                            <c:if test="${not empty v.equipementSecurite}">
                                <a href="${url_admin}${fn:replace(v.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle secur"><span class="fa fa-download"></span></a>
                            </c:if>
                        </td>
                        <td class="text-center">
                            <c:if test="${not empty v.doc_assurance}">
                                <a href="${url_admin}${fn:replace(v.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a>
                            </c:if>
                        </td>-->
                        <td class="">
                            <button class="btn btn-danger rounded-circle" onclick="deleteVehicule('${v.id_vehicule}')">
                                <span class="fas fa-trash-alt"></span>
                            </button>
                            <button class="btn btn-warning rounded-circle" onclick="getVehicule('${v.id_vehicule}',this)">
                                <span class="fas fa-pencil-alt"></span>
                            </button>


                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="7" class="bg-primary text-center"><spring:message code="label.Aucunvehiculedanscettedemande"/></td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>



<div id="zone_form" class=" col-12 p-0 m-0">
    <form id="add_vehicules" >
        <div class="row m-0 p-0">
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.NMatriculation"/>
                    </label>
                    <div class="row m-0 p-0">
                        <div class="col-sm-6 pl-0 pr-1">
                            <input type="text" class="form-control" value="${vehicules.num_mat_enrg_voit}" name="num_mat_enrg_voit">
                        </div>
                        <div class="col-sm-2 pl-1 pr-1">
                            <input type="text" class="form-control" value="${vehicules.num_mat_enrg_auto}" name="num_mat_enrg_auto">
                        </div>
                        <div class="col-sm-4 pl-1 pr-0">
                            <input type="text" class="form-control" value="${vehicules.num_mat_id_prefect}" name="num_mat_id_prefect">
                        </div>
                    </div>
                    <input type="hidden" class="form-control" id="id_vehicule" value="${vehicules.id_vehicule}" name="id_vehicule">
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.NChassis"/>
                    </label>
                    <input type="text" class="form-control" id="chassis" value="${vehicules.num_chassis}" name="num_chassis">
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.Poidstotalencharge"/>
                    </label>
                    <input type="text" class="form-control" id="poidsTotal" value="${vehicules.poit_totale_charge}" name="poit_totale_charge">
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.Poidsnetduvehicule"/>
                    </label>
                    <input type="text" class="form-control" id="poidsNet" value="${vehicules.point_net}" name="point_net">
                </div>
            </div>
             <input type="hidden" id="securiteEquip">
             <input type="hidden" id="file">
            <!-- 
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.Equipementdesecurite"/>
                    </label>
                   <input type="file" id="securiteEquip" class="form-control">
                    <c:if test="${not empty vehicules.equipementSecurite}">
                        <a href="${url_admin}${fn:replace(vehicules.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success" target="_blank" download="Equipement de securite">
                          <span class="fa fa-download"></span>
                        </a>
                    </c:if>

                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.Attestationdassurance"/>
                    </label>
                    <input type="file" class="form-control" id="file">
                    <c:if test="${not empty vehicules.doc_assurance}">
                        <a href="${url_admin}${fn:replace(vehicules.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success" target="_blank" download="Equipement de securite">
                            <span class="fa fa-download"></span>
                        </a>
                    </c:if>
                </div>
            </div>
        -->
        </div>
        <div class="row justify-content-center">
            <div class="col-md-3">
                <button onclick="Save_vehicule('file','securiteEquip')" class="btn btn-primary btn-block"><spring:message code="button.enregistrerlevehicule"/></button>
            </div>
        </div>
    </form>
</div>

<div class="row m-0 p-0 mt-2">
    <div class="col-md-6 col-sm-12">
        <div class="form-group">

            <label><spring:message code="label.NombredeVehiculeA"/> </label>
            <input class="form-control" type="text" readonly name="nombre_vehicule"
                   value="${collect.vehicules.size()}">
        </div>
    </div>
</div>