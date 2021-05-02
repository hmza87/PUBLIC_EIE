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
    <table class="table table-bordered " >
        <thead>
        <tr>
            <th> N° matriculation </th>
            <th> N° châssis </th>
            <th> Poids total en charge </th>
            <th> Poids net du véhicule </th>
            <th> Equipement de sécurité </th>
            <th> Attestation d'assurance</th>
            <th> Action </th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty collect.vehicules}">
                <c:forEach items="${collect.vehicules}" var="v">
                    <tr id="tr${v.id_vehicule}">
                        <td>${v.num_matricule}</td>
                        <td>${v.num_chassis}</td>
                        <td>${v.poit_totale_charge}</td>
                        <td>${v.point_net}</td>
                        <td>${(not empty v.equipementSecurite)?v.equipementSecurite.nom_fr:"-"}</td>
                        <td class="text-center">
                            <c:if test="${not empty v.doc_assurance}">
                                <a href="${url_Admin}${fn:replace(v.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a>

                            </c:if>
                        </td>
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
                    <td colspan="7" class="bg-primary text-center"> Aucun véhicule dans cette demande</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>



<div id="zone_form" class=" col-12 p-0 m-0">
    <form id="add_vehicules" >
        <div class="row m-0 p-0">
            <div class="col-4">
                <div class="form-group">
                    <label class="f-14">
                        N° d'immatricule
                    </label>
                    <input type="text" class="form-control" id="matricule" value="${vehicules.num_matricule}" name="num_matricule">
                    <input type="hidden" class="form-control" id="id_vehicule" value="${vehicules.id_vehicule}" name="id_vehicule">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label class="f-14">
                        N° Châssis
                    </label>
                    <input type="text" class="form-control" id="chassis" value="${vehicules.num_chassis}" name="num_chassis">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label class="f-14">
                        Poids total en charge
                    </label>
                    <input type="text" class="form-control" id="poidsTotal" value="${vehicules.poit_totale_charge}" name="poit_totale_charge">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label class="f-14">
                        Poids net du véhicule
                    </label>
                    <input type="text" class="form-control" id="poidsNet" value="${vehicules.point_net}" name="point_net">
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label class="f-14">
                        Equipement de sécurité
                    </label>
                   <input type="file" id="securiteEquip" class="form-control">

                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label class="f-14">
                        Attestation d'assurance
                    </label>
                    <input type="file" class="form-control" id="file">
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-3">
                <button onclick="Save_vehicule('file','securiteEquip')" class="btn btn-primary btn-block">Enregistrer le Vehicule</button>
            </div>
        </div>
    </form>
</div>
