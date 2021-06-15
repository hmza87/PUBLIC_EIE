<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<div class="table-responsive">
    <table class="table table-bordered my_table" >
        <thead>
        <tr>
            <th> Autorité </th>
            <th> Autorisation </th>
            <th style="min-width: 120px"> <spring:message code="label.Action"/> </th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty notif.paysAutorites}">
                <c:forEach items="${notif.paysAutorites}" var="p">
                    <tr id="tr${p.id_paysautorite}">
                        <td>${p.pays.nom_fr}</td>
                        <td class="">
                            <c:if test="${not empty p.url_autorite}">
                                <a href="${url_Admin}${fn:replace(p.url_autorite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a>
                            </c:if>
                        </td>
                        <td class="">
                            <button class="btn btn-danger rounded-circle" onclick="deletePaysautorite('${p.id_paysautorite}')">
                                <span class="fas fa-trash-alt"></span>
                            </button>
                            <button class="btn btn-warning rounded-circle" onclick="getPaysautorite('${p.id_paysautorite}',this)">
                                <span class="fas fa-pencil-alt"></span>
                            </button>


                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="7" class="bg-primary text-center"> Aucune autorité dans cette demande</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>

<div class="row m-0 p-0 mt-2">
    <div class="col-md-2 col-sm-4 align-content-end display-grid pb-3">
        <button id="add_new" onclick="getPaysautorite('0')"
                class="btn btn-success btn-block"><spring:message
                code="label.jouterVehiculeA"/></button>
    </div>
</div>
