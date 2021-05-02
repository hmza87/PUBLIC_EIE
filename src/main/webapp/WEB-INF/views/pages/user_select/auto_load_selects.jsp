<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<c:choose>
  <c:when test="${not empty prefecture}">
    <c:forEach items="${prefecture}" var="p">
      <option
              <c:forEach items="${demande.detailRegion.prefectures}" var="pp">
                ${pp.id_prefecture==p.id_prefecture?"selected":""}
              </c:forEach>
              value="${p.id_prefecture}" >${pageContext.response.locale=='ar'?p.nom_ar:p.nom_fr}</option>
    </c:forEach>
  </c:when>
  <c:when test="${not empty commune}">
    <c:forEach items="${commune}" var="c">
      <option
              <c:forEach items="${demande.detailRegion.communes}" var="cc">
                ${cc.id_commune==c.id_commune?"selected":""}
              </c:forEach>
              value="${c.id_commune}" >${pageContext.response.locale=='ar'?c.nom_ar:c.nom_fr}</option>
    </c:forEach>
  </c:when>
</c:choose>

