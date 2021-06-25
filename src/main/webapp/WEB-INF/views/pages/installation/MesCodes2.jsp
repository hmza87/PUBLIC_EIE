<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:forEach items="${notif.codeTmp}" var="code_colle" varStatus="loopp" >
    <tr style="background-color:${loopp.index%2==0?'#FA8072':'#F08080'};color: white !important;font-weight:bold" >
        <td class="col-8">${code_colle.nom_ar}</td>
        <td class="col-4 p-2 text-center">
            <button class="btn btn-success rounded-circle"
                    onclick="addCodeIT_tmp('${code_colle.id_code}','delete')">
                <span class="fa fa-times"></span></button>
        </td>
    </tr>
</c:forEach>