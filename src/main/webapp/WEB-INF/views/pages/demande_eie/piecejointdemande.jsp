<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>


<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>


<div class="col-md-12 div2" style="margin-top: 10%;">

    <div class="tab-content tab-content-vertical">
        <div class="tab-pane fade active show" id="home-2" role="tabpanel" aria-labelledby="home-tab-vertical">
            <div class="row m-0 p-0 zone_table ">
                <div class="col-2 m-0 p-0"></div>
                <div class="col-8 m-0 p-0">


                    <form class="form-horizontal mt-3" action="">
                        <h4 class="titre_abs "> <spring:message code="label.Attacherlesdocumentsdefinitifs"/></h4>
                        <input type="hidden" id="id_dmd" value="${iddemande}">
                        <div class="row m-0 p-0 mt-5">
                            <c:if test="${type=='EE'}">
                                <div class="col-6">
                                    <label><spring:message code="label.EtudedImpactsurlEnvironnementdefinitive"/>: </label>
                                    <input multiple onchange="addDoc_eie('id_dmd','7','docr')" type="file"
                                           class="form-control" id="docr"></input>

                                </div>
                            </c:if>
                            <c:if test="${type=='NT'}">
                                <div class="col-6">
                                    <label><spring:message code="label.NoticedImpactsurlEnvironnementdefinitive"/>: </label>
                                    <input multiple onchange="addDoc_eie('id_dmd','7','docr1')" type="file"
                                           class="form-control" id="docr1"></input>

                                </div>
                            </c:if>
                            <c:if test="${type=='AE'}">
                                <div class="col-6">
                                    <label><spring:message code="label.Auditenvironnementaldefinitif"/>: </label>
                                    <input multiple onchange="addDoc_eie('id_dmd','7','docr2')" type="file"
                                           class="form-control" id="docr2"></input>

                                </div>
                            </c:if>
                            <div class="col-6">
                                <label><spring:message code="label.Cahierdeschargesdefinitif"/> : </label><br/>
                                <input multiple onchange="addDoc_eie('id_dmd','6','docp')" type="file"
                                       class="form-control" id="docp"></input>
                            </div>
                        </div>


                        <div class="row m-0 p-0 mt-5">
                            <div class="col-3">
                            </div>
                            <div class="col-6" style="text-align: center">
                                <button onclick="changer_statut_type('id_dmd','9','Les fichiers sont enregistrés','${type}')"
                                        style="margin-top: 10px;margin-bottom: 10px;" class="btn btn-success">
                                    <spring:message code="button.Enregistrer"/></button>

                            </div>
                            <div class="col-3">
                            </div>
                        </div>
                    </form>

                </div>
                <div class="col-2 m-0 p-0"></div>
            </div>
        </div>
    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
