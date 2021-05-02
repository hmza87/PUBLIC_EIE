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
    .plr_10{
        padding-left: 10px;
        padding-right: 10px;
        font-size: 14px;
    }
    .mt_cont{
        margin-top: 150px;
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
</style>
<div class="container-fluid mt_cont">
    <div class="card">
        <div class="row justify-content-center">
            <div class="col-md-10 col-sm-10 text-center">
                <h1 class="text-success mt-4 mb-4">Vidéos</h1>
            </div>
        </div>

        <div class="row justify-content-center p-4">
            <div class="col-sm-6 col-md-4">
                <video width="100%" height="auto" controls>
                    <source src="../../assets/video/001.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
            <div class="col-sm-6 col-md-4">
                <video width="100%" height="auto" controls>
                    <source src="../../assets/video/002.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
            <div class="col-sm-6 col-md-4">
                <video width="100%" height="auto" controls>
                    <source src="../../assets/video/003.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>



    </div>

</div>


<script>
    function rech(){
        window.location.href="/api/rechercherQuestion/"+$("#rech").val();
    }
</script>

<jsp:include page="../../includes/footer1.jsp"/>