<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



    <div class="col-sm-8 listCode" >
        <table class="table MonTable table-striped" data-page-length="15">
            <thead>
            <tr>
                <th scope="col" style="min-width: 100px"><spring:message
                        code="label.CodeA"/></th>
                <th scope="col"><spring:message code="label.TypeA"/></th>
                <th scope="col">Sélectionner</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${inst.code}" var="c">
                <c:set var="bg" value=""/>
                <c:forEach items="${inst.codeTmp}" var="code_colle">
                    <c:if test="${code_colle.id_code==c.id_code}">
                        <c:set var="bg" value="bg-danger"/>
                    </c:if>
                </c:forEach>
                <tr class="${bg}" id="tr-${c.id_code}">
                    <td>${c.nom_fr }</td>
                    <td>${c.nom_ar }</td>
                    <td>
                        <input checked disabled class="h-15" type="checkbox"
                               id="id-${c.id_code }">
                    </td>
                </tr>
            </c:forEach>


            </tbody>
        </table>
    </div>
    <input type="hidden" id="cpt" value="${inst.codeTmp.size()}">

    <div class="col-sm-4 listCode" style="margin-top: 4rem">
        <div class="row pb-2 m-0" >
            <table class="table table-striped">
                <tr>
                    <th>Type de déchet</th>
                    <th>Action</th>
                </tr>
                <tbody id="tbody_it">
                <c:forEach items="${inst.codeTmp}" var="code_colle" varStatus="loopp" >
                    <tr style="background-color:${loopp.index%2==0?'#FA8072':'#F08080'};color: white !important;font-weight:bold" >
                        <td class="col-8">${code_colle.nom_ar}</td>
                        <td class="col-4 p-2 text-center">
                            <button class="btn btn-success rounded-circle"
                                    onclick="addCodeIT_tmp('${code_colle.id_code}','delete')">
                                <span class="fa fa-times"></span></button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

