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
    .bat_pos{
        position: absolute;
        width: 100%;
        bottom: 30%;
    }
    .titre_1{
        font-family: 'Didot, serif';
        font-weight: 600;
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

    #zone_select,#zone_image,#zone_Sele2{
        min-height: 500px;
        display: none;
    }
</style>
<div class="container-fluid mt_cont">
    <div class="card">
        <div class="row justify-content-center">
            <div class="col-md-10 col-sm-10 text-center">
                <h1 class="text-success mt-4 mb-4">Guide et Procédure</h1>
            </div>
        </div>

        <div id="presentation">
            <div class="row justify-content-center  pl-4 pr-4 pb-0">
                <div class="col-sm-12 col-md-6 text-center">
                    <h2 class="titre_1 pt-5">Autorisation des déchet</h2>
                    <p class="text-justify pt-3">
                        Dans cette section vous trouvez l'ensemble des informations
                        pour vous aidez à l'obtention de votre Autorisation des déchets
                    </p>
                    <div class="text-center bat_pos">
                        <button onclick="affiche_select_autoris()" class="btn btn-success"> <span class="fa fa-plus"></span> lire plus </button>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 pl-0">
                    <img src="../../assets/images/imgee.jpg">
                </div>
            </div>

            <div class="row justify-content-center pl-4 pr-4 pb-0 pt-0">
            <div class="col-sm-12 col-md-6 pr-0">
                <img src="../../assets/images/imgez.jpg">
            </div>
            <div class="col-sm-12 col-md-6 text-center">
                <h2 class="titre_1 pt-5">Evaluation Environnementale</h2>
                <p class="text-justify pt-3">
                    Dans cette section vous trouvez l'ensemble des informations et ressources
                    pour vous aidez à réaliser de votre évaluation environnementale
                </p>
                <div class="text-center bat_pos">
                    <button onclick="affiche_select_eval()" class="btn btn-success"> <span class="fa fa-plus"></span> lire plus </button>
                </div>
            </div>
        </div>
        </div>

        <div id="zone_select" class="hide">
            <div class="row justify-content-center p-4">
                <div class="col-sm-2 col-md-4 text-left">
                    <button class="btn btn-success" onclick="affiche_presentation()"><span class="fas fa-chevron-circle-left"></span> Retour</button>
                </div>
                <div class="col-sm-8 col-md-4">
                    <h2 class="titre_1 pt-5">Autorisation des déchet</h2>
                </div>
                <div class="col-sm-2 col-md-4 text-left"></div>

            </div>

            <div class="row justify-content-center">
                <div class="col-sm-8 col-md-4 text-center">
                    <select class="form-control select2" onchange="fun_select(this.value)">
                        <option value="">Choisir...</option>
                        <option value="0">Importation dechets (zone franche)</option>
                        <option value="1">Collecte/transport des déchets dangereux</option>
                        <option value="2">Importation des déchets non dangereux d’un pays étranger</option>
                        <option value="3">Installation de traitement des déchets</option>
                        <option value="4">Importation des déchets non dangereux d’une zone franche</option>
                        <option value="5">Exportation des déchets dangereux </option>
                        <option value="6">Transit des déchets </option>
                        <option value="7">Demande de  licence d’importation des déchets non ferreux </option>
                    </select>
                </div>
            </div>

            <div class="row justify-content-center" id="zone_image">
                <div class="col-md-10 col-sm-10">
                    <img id="image_change" src="../../assets/images/organigramme.png" >
                </div>
            </div>
        </div>
        <div id="zone_Sele2" >
            <div class="row justify-content-center p-4">
                <div class="col-sm-2 col-md-4 text-left">
                    <button class="btn btn-success" onclick="affiche_presentation2()"><span class="fas fa-chevron-circle-left"></span> Retour</button>
                </div>
                <div class="col-sm-8 col-md-4">
                    <h2 class="titre_1 pt-5">Autorisation des déchet</h2>
                </div>
                <div class="col-sm-2 col-md-4 text-left"></div>

            </div>

            <div class="row justify-content-center">
                <div class="col-sm-8 col-md-4 text-center">
                    <select class="form-control select2" onchange="fun_select2(this.value)">
                        <option value="">Choisir...</option>
                        <option value="">Évaluation environnementale stratégique (EES)</option>
                        <option value="">Audit environnementale</option>
                        <option value="">Notice d’impact</option>
                        <option value="8">Etude d’impact environnementale</option>
                    </select>
                </div>
            </div>

            <div class="row justify-content-center hide" id="zone_image22">
                <div class="col-12 p-5">
                    <img id="image_change22" src="">
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    function rech(){
        window.location.href="/api/rechercherQuestion/"+$("#rech").val();
    }

    function fun_select(val){
        if(val==""){
            swal("La page est en cours de Développement");
        }
        var url = "../../assets/images/organigramme.png";

        switch (val) {
            case '0':
                url = "../../assets/images/organigramme.png";
                break;
            case '1':
                url = "../../assets/images/etape3.png";
                break;
            case '2':
                url = "../../assets/images/etape4.png";
                break;
            case '3':
                url = "../../assets/images/etape5.png";
                break;
            case '4':
                url = "../../assets/images/etape6.png";
                break;
            case '5':
                url = "../../assets/images/etape7.png";
                break;
            case '6':
                url = "../../assets/images/etape8.png";
                break;
            case '7':
                url = "../../assets/images/etape9.png";
                break;
            case '8':
                url = "../../assets/images/diag2.png";
                break;
            default:
                url = "../../assets/images/organigramme.png";
        }
        $("#image_change").attr("src",url);
        $("#zone_image").show();
    }

    function fun_select2(val){
        if(val==""){
            swal("La page est en cours de Développement");
        }
        var url =  "../../assets/images/diag2.png";

        switch (val) {
            case '0':
                url =  "../../assets/images/diag2.png";
                break;
            default:
                url =  "../../assets/images/diag2.png";
        }
        $("#image_change22").attr("src",url);
        $("#zone_image22").show();
    }

    function affiche_select_autoris(){
        $("#presentation").hide('slide', {direction: 'left'}, 1400);
        $("#zone_select").show('slide', {direction: 'left'}, 1400);
    }

    function affiche_presentation(){
        $("#zone_select").hide('slide', {direction: 'left'}, 1400);
        $("#presentation").show('slide', {direction: 'left'}, 1400);
    }

    function affiche_presentation2(){
        $("#zone_Sele2").hide('slide', {direction: 'left'}, 1400);
        $("#presentation").show('slide', {direction: 'left'}, 1400);
    }

    function affiche_select_eval(){
        $("#presentation").hide('slide', {direction: 'left'}, 1400);
        $("#zone_Sele2").show('slide', {direction: 'left'}, 1400);
    }


</script>

<jsp:include page="../../includes/footer1.jsp"/>