<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>

<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head.jsp"/>

<style>
    .badge-danger{
        color: #0f0f0f  !important;
        background-color: #d5d5d5  !important;
    }

    .badge-primary{
        color: #0f0f0f !important;
        background-color: #d5d5d5 !important;
    }

    .badge-warning{
        color: #0f0f0f  !important;
        background-color: #d5d5d5  !important;
    }
    .badge-success{
        color: #0f0f0f  !important;
        background-color: #d5d5d5  !important;
    }
    .d_haut_right{
        position: absolute !important;
        right: 0px;
    }

    .d_right2{
        direction:RTL ;
        text-align: right;
    }
    .d_right1{
        direction:LTR ;
        text-align: left;
    }



    ol.style_number_sub {
        counter-reset: item
    }
    ol.style_number_sub li {
        display: block
    }
    ol.style_number_sub li:before {
        content: counters(item, ".") " ";
        counter-increment: item
    }
    .d_haut_rightv2{
        position: absolute !important;
        right: 0;
        top: 0px;
        margin-top: 0 !IMPORTANT;
        border-radius: 0;
        padding: 5px;
    }

    .d_haut_leftv2{
        position: absolute !important;
        left: 0;
        top: 0px;
        margin-top: 0 !IMPORTANT;
        border-radius: 0;
        padding: 5px;
    }

    .bg_stat_01{
        background: linear-gradient(to right, #01a9ac, #01dbdf);
        color: white;
    }

    .page_content{
        min-height: 800px;
    }

    .bg_stat_02{
        background: linear-gradient(to right, #b1eed9, #e3dddd);
        color: white;
    }
    .mt_cont{
        margin-top: 140px;
    }
    @media screen and (max-width: 992px) {
        .mt_cont{
            margin-top: 190px;
        }
    }
    @media screen and (max-width: 650px) {
        .mt_cont{
            margin-top: 250px;
        }
    }

    .style_square>li{
        list-style: square !important;
    }

    .style_number>li{
        list-style: inherit !important;
    }

    .style_square,.style_number{
        margin-left: 10px;
    }

</style>
<c:choose>
    <c:when test="${pageContext.response.locale=='ar'}">
        <c:set var="dr" value="style='direction: LTR; text-align: right !important' "/>
        <c:set var="dr_s" value="data-dir='RTL'' "/>
        <style>.select2-results__option{text-align: right}</style>
    </c:when>

    <c:otherwise>
        <c:set var="dr" value="style='direction: LTR; text-align: left !important' "/>
        <c:set var="dr_s" value="data-dir='LTR'"/>
        <style>.select2-results__option{text-align: left}</style>
    </c:otherwise>

</c:choose>





<div class="container-fluid mt_cont">
    <div class="pt-4 page_content">

        <div class="row justify-content-center">

            <div class="col-10">

                <div class="row justify-content-center m-0 p-0">

                    <div class="col-sm-12 col-md-10 mt-3">
                        <div class="bg_stat_02 p-3 mb-3" ${dr}>
                            <h4><spring:message code="label.faqTitre"/></h4>



                            <div id="zone_evaluation" >
                                <div class="row justify-content-center mt-4">
                                    <div class="col-sm-8 col-md-8 text-center">
                                        <div class="row justify-content-center">
                                            <div class="col-12">
                                                <form method="post" action="/getQuestionByAutorisation">
                                                    <div class="form-group pt-2" ${dr}>
                                                        <input type="hidden" name="type" value="2">
                                                        <select class="form-control select2" onchange="this.form.submit()" name="autor" ${dr_s}>
                                                            <option><spring:message code="option.Choisir"/> </option>
    <option value="1"><spring:message code="label.faqOptionun"/></option>
    <option value="2"><spring:message code="label.faqOptiondeux"/></option>
    <option value="3"><spring:message code="label.faqOptiontrois"/></option>
                                                        </select>
                                                    </div>
                                                </form>

                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <p class="text-left h4" ${dr}>
    <spring:message code="label.faqmsgun"/> <a href="/contact/0"  class="font-weight-700 text-dark"> <spring:message code="label.faqmsgdeux"/></a>
                                </p>
                            </div>

                        </div>
                        <div id="accordion1">
                            <c:if test="${not empty questions}">
                                <c:forEach items="${questions}" var="q">


                                    <c:choose>
                                        <c:when test="${(not empty q.description_ar) && pageContext.response.locale=='ar'}">
                                            <c:set var="q_quest" value="${q.description_ar}"/>
                                            <c:set var="badge" value="badge badge-pill badge-primary d_haut_leftv2"/>
                                            <c:set var="badge_msg" value="${(not empty q.eveluation)?q.eveluation.nom_ar:q.autorisation.nom_ar}"/>
                                            <c:set var="orient" value="d_right2"/>
                                            <c:if test="${(empty q.description) }">
                                                <div class="card rounded mb-2">
                                                    <div ${dr} class="card-header bg-light" id="heading${q.id_question}" data-toggle="collapse" data-target="#collapse${q.id_question}" aria-expanded="false" aria-controls="collapse${q.id_question}">
                                                        <h5 class="mb-0" >
                                                            <p class="h5" >
                                                                    ${q_quest}
                                                            </p>
                                                        </h5>
                                                        <span class="${badge}">${badge_msg}</span>
                                                    </div>
                                                    <div id="collapse${q.id_question}" class="collapse border-top" aria-labelledby="heading${q.id_question}" data-parent="#accordion1">
                                                        <div class="card-body bg-light ${orient}">
                                                            <p >
                                                                    ${(q.reponses!=null && q.reponses.size()>0)?q.reponses.get(0).description:""}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:when>

                                        <c:otherwise>
                                            <c:if test="${(not empty q.description) && (empty q.description_ar) &&  pageContext.response.locale!='ar' }">
                                                <c:set var="q_quest" value="${q.description}"/>
                                                <c:set var="badge" value="badge badge-pill badge-primary d_haut_rightv2"/>
                                                <c:set var="badge_msg" value="${(not empty q.eveluation)?q.eveluation.nom_fr:q.autorisation.nom_fr}"/>
                                                <c:set var="orient" value="d_right1"/>
                                                <div class="card rounded mb-2">
                                                    <div ${dr} class="card-header bg-light" id="heading${q.id_question}" data-toggle="collapse" data-target="#collapse${q.id_question}" aria-expanded="false" aria-controls="collapse${q.id_question}">
                                                        <h5 class="mb-0" >
                                                            <p class="h5" >
                                                                    ${q_quest}
                                                            </p>
                                                        </h5>
                                                        <span class="${badge}">${badge_msg}</span>
                                                    </div>
                                                    <div id="collapse${q.id_question}" class="collapse border-top" aria-labelledby="heading${q.id_question}" data-parent="#accordion1">
                                                        <div class="card-body bg-light ${orient}">
                                                            <p >
                                                                    ${(q.reponses!=null && q.reponses.size()>0)?q.reponses.get(0).description:""}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>

                                        </c:otherwise>


                                    </c:choose>


                                </c:forEach>
                            </c:if>

                            <c:if test="${empty questions}">
                                <div class="alert alert-warning" role="alert">
                                    <spring:message code="label.faqerrorun"/>
                                </div>
                            </c:if>


                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row justify-content-center pt-2">
            <div class="col-sm-8 col-md-8">

            </div>
        </div>





    </div>

</div>


<script>
    /*function rech(){
        window.location.href="/rechercherQuestion/"+$("#rech").val();
    }*/

    function show_evaluation(){
        $("#zone_evaluation").removeClass("d-none");
        $("#zone_autorisation").addClass("d-none");
    }
    function show_autorisation(){
        $("#zone_evaluation").addClass("d-none");
        $("#zone_autorisation").removeClass("d-none");
    }


</script>

<jsp:include page="../../includes/footer1.jsp"/>