<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<c:choose>
    <c:when test="${type=='getfile'}">
        <table class="table table-striped table-hover table-bordered">
            <thead>
            <tr>
                <th>#</th>
                <th>Nom documents</th>
                <th>Documents</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty doc}">
                <c:forEach items="${doc}" var="d" varStatus="loop">
                    <tr>
                        <td>${loop.index+1}</td>
                        <td>
                                ${d.docImport.nom_fr}
                        </td>
                        <td>
                            <a href="${url_Admin}${fn:replace(d.url,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary rounded-circle">
                                <span class="fa fa-download"></span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty doc}">
                <tr>
                    <td class="text-center" colspan="3">Aucun fichier</td>
                </tr>
            </c:if>


            </tbody>
        </table>
    </c:when>
    <c:when test="${type=='sendfile'}">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <p>
                    ${reunion.commentaire}
                </p>
            </div>
            <div class="col-10 mt-3">
                <input id="file_to_complete" onchange="setfileReunionToDemande('${demande.id_demande_information}')" type="file" class="form-control" multiple accept=".doc,.docx,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
            </div>
        </div>

    </c:when>
</c:choose>

