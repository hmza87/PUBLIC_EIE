<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="table-responsive">
    <table class="table table-bordered my_table">
        <thead>
        <tr>
            <th>Nom de la société</th>
            <th>Personne à contacter</th>
            <th>Identifiant fiscale</th>
            <th>Adresse</th>
            <th>Téléphone</th>
            <th>Fax</th>
            <th>Email</th>
            <th style="min-width: 120px"><spring:message code="label.Action"/></th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${(not empty notification)}">
                <c:forEach items="${notification}" var="p">
                    <tr id="trr_${p.id_producteur}">
                        <td> ${p.nom_fr}</td>
                        <td> ${p.contact_fr}</td>
                        <td> ${p.idf}</td>
                        <td> ${p.adresse_fr}</td>
                        <td> ${p.tel}</td>
                        <td> ${p.fax}</td>
                        <td> ${p.mail}</td>

                        <td class="">
                            <button onclick="deleteProducteurNotification('${p.id_producteur}','id_notification')"
                                    class="btn btn-danger rounded-circle"><span
                                    class="fas fa-trash"></span></button>
                            <button onclick="edit_producteur_notification('${p.id_producteur}','id_notification')"
                                    class="btn btn-warning rounded-circle"><span
                                    class="fa fa-pencil"></span></button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="7" class="bg-primary text-center">
                        Aucun producteur dans cette demande</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>
<div id="zone_form" class=" col-12 p-0 m-0">
    <div class="row m-0 p-0 mt-5">

        <div class="col-6 ">
            <div class="form-group">
                <label> <spring:message code="label.nomdesociete"/> </label>
                <input type="text" value="${one.nom_fr}" id="nom_fr" name="Nom_fr" class="form-control">
            </div>
        </div>
        <div class="col-6 ">
            <div class="form-group" style="text-align: right;">
                <label dir="rtl"> إسم الشركة : </label>
                <input dir="rtl" type="text" value="${one.nom_ar}" id="nom_ar" name="Nom_ar" class="form-control">
            </div>
        </div>

    </div>
    <div class="row m-0 p-0">
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.personneacontacter"/> </label>
                <input type="text" value="${one.contact_fr}" id="contact_fr" name="contact_fr" class="form-control">
            </div>
        </div>
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.identifiantfiscal"/> </label>
                <input type="text" value="${one.idf}" id="idf" name="idf" class="form-control">
            </div>
        </div>
    </div>
    <div class="row m-0 p-0">

        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.Adresse"/> </label>
                <input type="text" value="${one.adresse_fr}" id="adresse_fr" name="adresse_fr" class="form-control">
            </div>
        </div>
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.telephone"/> </label>
                <input type="text" value="${one.tel}" id="tel" name="tel" class="form-control">
            </div>
        </div>


    </div>
    <div class="row m-0 p-0">
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.Fax"/> </label>
                <input type="text" value="${one.fax}" id="fax" name="fax" class="form-control">
            </div>
        </div>
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.email"/> </label>
                <input type="text" value="${one.mail}" id="mail" name="mail" class="form-control">
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-3">
            <input type="hidden" value="${(not empty one)?one.id_producteur:'0'}" id="id_prod">
            <button onclick="ajouterProducteur('id_notification')" class="btn btn-primary btn-block">Enregistrer le producteur</button>
        </div>
    </div>
</div>