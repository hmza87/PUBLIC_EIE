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
            <th> Autorité </th>
            <th> Autorisation </th>
            <th> Action </th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty notif.paysAutorites}">
                <c:forEach items="${notif.paysAutorites}" var="p">
                    <tr id="tr${p.id_paysautorite}">
                        <td>${p.pays.nom_fr}</td>
                       <td class="text-center">
                            <c:if test="${not empty p.url_autorite}">
                                <a href="${url_admin}${fn:replace(p.url_autorite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a>
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



<div id="zone_form" class=" col-12 p-0 m-0">
    <form id="add_vehicules" >
        <div class="row m-0 p-0">
            <div class="col-6">
                <div class="form-group">
                    <label class="f-14">
                        Autorité
                    </label>
                    <select id="pays" name="pays" class="custom-select">
                        <c:forEach items="${pays}" var="t">
                            <option <c:if
                                    test="${paysautorites.pays.paysId== t[0]}"> selected </c:if>
                                    value="${t[0]}">${t[1]}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label class="f-14">
                        Autorisation
                    </label>
                    <c:if test="${empty paysautorites.url_autorite}">
                        <input type="file" id="doc_assurance" name="url_autorite" class="form-control">
                    </c:if>
                    <c:if test="${not empty paysautorites.url_autorite}">
                        <div class="row p-0">
                            <div class="col-10 pl-1">
                                <input type="file" id="url_autorite" name="url_autorite" class="form-control">
                            </div>
                            <div class="col-2 pr-1">
                                <a id="btn_downolad2" href="${url_Admin}${fn:replace(paysautorites.url_autorite,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary rounded "><span class="fa fa-download"></span></a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-3">
                <button onclick="Save_paysautorite()" class="btn btn-primary btn-block">Enregistrer l'autorité</button>
            </div>
        </div>
    </form>
</div>
