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
 body{
    background: linear-gradient(128deg,white 50%, #03b6d6 50%); height: 70vh; font-family: Poppins;
}
.container {
    margin-top: 15%
}

    .img-text{
        width: 300px;
    height: 400px;
    display: block;
    text-align: center;
    padding: 40% 5%;
    background: white;
    color: BLACK;
    border-radius: 15px;
    border: 1px solid #036;
    }
    .img-text h2 {
        font-size: 25px;
        text-transform: uppercase;
        letter-spacing: 2px;
        margin-top: 30px;
    }

    .img-text p {
        font-size: 14px;
    }
    .single-box{
        position: relative;
        margin-bottom: 30px;
    }
    .img-area {
        position: absolute;
        width: 100px;
        height: 100px;
        border: 5px solid #fff;
        overflow: hidden;
        top: 15px;
        left: 93px;
        border-radius: 50%;
    }
    .img-area img{
        width: 100%;
    }
    .carousel-indicators
    {
        left: 0;
        top: auto;
        bottom: -10%;
    }
    .carousel-indicators li
    {
        background: #000;
        border-radius: 50%;
        width: 36px;
        height: 15px;
    }
    .carousel-indicators .active
    {
        background: #03b6d6;;

    }

</style>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md_12">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class=" carousel-indicators" >
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active" ></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"  ></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/Arb1.png" alt=""></div>
                                    <div class="img-text">
                                        <h2>les derni??res informations</h2>
                                        <p>On sait que l'atmosph??re de la Terre laisse passer la lumi??re du soleil qui r??chauffe la surface du globe. La chaleur qui s'??l??ve de la surface est en partie absorb??e par les gaz et la vapeur d'eau pr??sents dans l'atmosph??re ??? on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/arbre2.png" alt=""></div>
                                    <div class="img-text">
                                        <h2>les derni??res informations</h2>
                                        <p>On sait que l'atmosph??re de la Terre laisse passer la lumi??re du soleil qui r??chauffe la surface du globe. La chaleur qui s'??l??ve de la surface est en partie absorb??e par les gaz et la vapeur d'eau pr??sents dans l'atmosph??re ??? on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/environnement.jpg" alt=""></div>
                                    <div class="img-text">
                                        <h2>les derni??res informations</h2>
                                        <p>On sait que l'atmosph??re de la Terre laisse passer la lumi??re du soleil qui r??chauffe la surface du globe. La chaleur qui s'??l??ve de la surface est en partie absorb??e par les gaz et la vapeur d'eau pr??sents dans l'atmosph??re ??? on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/audit.jpg" alt=""></div>
                                    <div class="img-text">
                                        <h2>les derni??res informations</h2>
                                        <p>On sait que l'atmosph??re de la Terre laisse passer la lumi??re du soleil qui r??chauffe la surface du globe. La chaleur qui s'??l??ve de la surface est en partie absorb??e par les gaz et la vapeur d'eau pr??sents dans l'atmosph??re ??? on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/envol.png" alt=""></div>
                                    <div class="img-text">
                                        <h2>les derni??res informations</h2>
                                        <p>On sait que l'atmosph??re de la Terre laisse passer la lumi??re du soleil qui r??chauffe la surface du globe. La chaleur qui s'??l??ve de la surface est en partie absorb??e par les gaz et la vapeur d'eau pr??sents dans l'atmosph??re ??? on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/RES.png" alt=""></div>
                                    <div class="img-text">
                                        <h2>les derni??res informations</h2>
                                        <p>On sait que l'atmosph??re de la Terre laisse passer la lumi??re du soleil qui r??chauffe la surface du globe. La chaleur qui s'??l??ve de la surface est en partie absorb??e par les gaz et la vapeur d'eau pr??sents dans l'atmosph??re ??? on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
<script>
    /*  $(document).ready(function() {
          $('.table').DataTable().destroy();
      });*/
    $(document).ready(function (){
        $('[type=search]').css({
            'height': '34px',
            'border-radius': '20px',
            'padding-left': '15px',
            'border-color': '#ddd',
            'box-shadow': 'none'
        });
    });
</script>
