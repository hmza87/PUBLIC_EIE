<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<style>
    h6{
        color:#036;
    }
</style>
<!-- Main Footer -->
<%--<footer class="main-footer">--%>

    <%--<!--End pagewrapper-->--%>
    <%--<!--Scroll to top-->--%>
    <%--<!--<script type="text/javascript">--%>
          <%--function confirmEmail() {--%>
              <%--var email = document.getElementById("email").value--%>
              <%--var confemail = document.getElementById("confemail").value--%>
              <%--var pass = document.getElementById("pass").value--%>
              <%--var confemail2 = document.getElementById("confemail2").value--%>
              <%--if(email != confemail) {--%>
                  <%--document.getElementById("confemail").style.backgroundColor = "#ff6a6a94";--%>
                  <%--document.getElementById("confemail").style.Color = "red";--%>
              <%--}else {document.getElementById("confemail").style.backgroundColor = "rgb(255 255 255)";--%>
                  <%--document.getElementById("confemail").style.color = "#495057";}--%>
              <%--if(pass != confemail2) {--%>
                  <%--document.getElementById("confemail2").style.backgroundColor = "#ff6a6a94";--%>
                  <%--document.getElementById("confemail2").style.color = "red";--%>
              <%--}else {document.getElementById("confemail2").style.backgroundColor = "rgb(255 255 255)";--%>
                  <%--document.getElementById("confemail2").style.color = "#495057";}--%>
          <%--}--%>
      <%--</script>-->--%>


      <%--<!-- Footer Bottom -->--%>
    <%--<div class="footer-bottom">--%>
        <%--<div class="auto-container">--%>
            <%--<div class="inner">--%>
                <%--<div class="copyright">Copyrights <a href="#">&copy; 2020.</a>Tous droits réservés par <a href="https://twinsgroupe.com/">Twins</a></div>--%>
                <%--<ul class="social-links clearfix">--%>
                    <%--<li><a href="#"><span class="fab fa-facebook-f"></span></a></li>--%>
                    <%--<li><a href="#"><span class="fab fa-twitter"></span></a></li>--%>
                    <%--<li><a href="#"><span class="fab fa-linkedin-in"></span></a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

<%--</footer>--%>


<!--End pagewrapper-->
<!--Scroll to top-->

<footer dir="auto" class="text-center text-lg-start bg-light text-muted w-100 d-inline-block mt-5" id="footer_footer">
    <!-- Section: Social media -->

    <section class="d-sm-none d-md-block" style="margin: 0 3rem 0 3rem">
        <div class="mt-3 mx-auto">
            <!-- Grid row -->
            <div class="row pl-5 "  >
                <!-- Grid column -->
                <div class="col-md-12 col-lg-12 col-xl-12 mb-4" >
                    <div class="row mt-2 justify-content-start" >
                        <div class="col-md-auto col-sm-12 pr-3 text-sm-center p-2 text-lg-left pl-auto">
                            <h6 class="text-uppercase text-white text-left fw-bold mb-4 font-weight-bold size_12">
                                <spring:message code="label.Ressources"/>
                            </h6>
                            <p class="mb-1">
                                <a class="text-white" href="/Actualite"><spring:message code="label.Acualite"/></a>
                            </p>

                            <p class="mb-1">
                                <a class="text-white" href="/guide" ><spring:message code="label.GuideetProcedure"/></a>
                            </p>
                            <p class="mb-1">
                                <a class="text-white" href="/videoList" ><spring:message code="label.Videos"/></a>
                            </p>
                            <p class="mb-1">
                                <a class="text-white" href="/CatalogueDesDechet"><spring:message code="label.Cataloguedesdechets"/></a>
                            </p>

                            <p class="mb-1">
                                <a class="text-white" href="/faq"><spring:message code="label.FA"/></a>
                            </p>
                        </div>

                        <div class="col-md-auto col-sm-12 text-sm-center  p-2 text-lg-left ">
                            <div class="col-12">
                                <h6 class="text-uppercase text-white text-left fw-bold mb-4 size_12 font-weight-bold" >
                                    <spring:message code="label.Preparezvotredemarche"/>
                                </h6>
                                <div class="row">
                                    <div class="col-12">

                                        <p class="text-white" onclick="show_footer_action('#autorisation_footer',this)">
                                            <span class="fa fa-caret-right" style="font-size: 18px !important;"></span>
                                            <spring:message code="label.Autorisationdesdechets"/>
                                        </p>
                                        <div id="autorisation_footer" class="collapse">
                                            <p><a class="text-white"  href="/Preparezvotredemarche"><spring:message code="label.Importationdechetszonefranche"/></a></p>
                                            <p><a class="text-white" style=" font-size: 14px;" href="/Preparezvotredemarche"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></a></p>
                                            <p><a class="text-white" href="/Preparezvotredemarche"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></p>
                                            <p><a class="text-white" href="/Preparezvotredemarche"><spring:message code="label.Installationdetraitementdesdechets"/></a></p>
                                            <p><a class="text-white" href=/Preparezvotredemarche"><spring:message code="label.Exportationdesdechetsdangereux"/> </a></p>
                                            <p><a class="text-white" href="/Preparezvotredemarche"><spring:message code="label.Transitdesdechets"/></a></p>
                                        </div>


                                        <p class="text-white" onclick="show_footer_action('#eie_footer',this)">
                                            <span class="fa fa-caret-right" style="font-size: 18px !important;"></span>
                                            <spring:message code="label.EvaluationEnvironnementale"/>
                                        </p>
                                        <div id="eie_footer" class="collapse">
                                            <p class="mb-1 ">
                                                <a class="text-white" href="/Preparezvotredemarche"><spring:message code="label.Etudedimpactenvironnementale"/></a>                                       </p>
                                            <p class="mb-1 ">
                                                <a class="text-white" href="/Preparezvotredemarche"><spring:message code="label.Noticedimpact"/></a>
                                            </p>
                                            <p class="mb-1">
                                                <a class="text-white" href="/Preparezvotredemarche"><spring:message code="label.Auditenvironnementale"/></a></a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-auto col-sm-12 text-sm-center  p-2 text-lg-left ">
                            <div class="col-12">
                                <h6 class="text-uppercase text-white text-left fw-bold mb-4 size_12 font-weight-bold" >
                                    <spring:message code="label.Eservices"/>
                                </h6>
                                <div class="row">
                                    <div class="col-12">

                                        <p class="text-white" onclick="show_footer_action('#autorisation_footer_E',this)">
                                            <span class="fa fa-caret-right" style="font-size: 18px !important;"></span>
                                            <spring:message code="label.Autorisationdesdechets"/>
                                        </p>
                                        <div id="autorisation_footer_E" class="collapse">
                                            <p><a class="text-white"  href="/api/checkUserDispatch/ZF"><spring:message code="label.Importationdechetszonefranche"/></a></p>
                                            <p><a class="text-white" style=" font-size: 14px;" href="/api/checkUserDispatch/ET"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></a></p>
                                            <p><a class="text-white" href="/api/checkUserDispatch/CT"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></p>
                                            <p><a class="text-white" href="/api/checkUserDispatch/IT"><spring:message code="label.Installationdetraitementdesdechets"/></a></p>
                                            <p><a class="text-white" href=/api/checkUserDispatch/XD"><spring:message code="label.Exportationdesdechetsdangereux"/> </a></p>
                                            <p><a class="text-white" href="/api/checkUserDispatch/TR"><spring:message code="label.Transitdesdechets"/></a></p>
                                        </div>


                                        <p class="text-white" onclick="show_footer_action('#eie_footer_E',this)">
                                            <span class="fa fa-caret-right" style="font-size: 18px !important;"></span>
                                            <spring:message code="label.EvaluationEnvironnementale"/>
                                        </p>
                                        <div id="eie_footer_E" class="collapse">
                                            <p class="mb-1 ">
                                                <a class="text-white" href="/api/checkEIESelect/EE"><spring:message code="label.Etudedimpactenvironnementale"/></a>                                       </p>
                                            <p class="mb-1 ">
                                                <a class="text-white" href="/api/checkEIESelect/NT"><spring:message code="label.Noticedimpact"/></a>
                                            </p>
                                            <p class="mb-1">
                                                <a class="text-white" href="/api/checkEIESelect/AE"><spring:message code="label.Auditenvironnementale"/></a></a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-md-auto col-sm-12 text-sm-center  p-2 text-lg-left ">
                            <div class="col-12 pl-0">
                                <h6 class="text-uppercase text-white text-left fw-bold mb-4 size_12 font-weight-bold" >
                                    <spring:message code="label.Authentification"/>
                                </h6>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="col-md-6 col-lg-6 col-sm-12 pl-0">
                                            <div>
                                                <p > <a class="text-white text-nowrap" href="/connexion"><spring:message code="label.sedeconnecter"/></a></p>
                                                <p> <a class="text-white" href="/demandez_compte"><spring:message code="label.Senregistrer"/></a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-auto col-sm-12 text-sm-center  p-2 text-lg-left ">
                            <div class="col-12 pl-0">
                                <h6 class="text-uppercase text-white text-left fw-bold mb-4 font-weight-bold size_12" style="text-align: ${pageContext.response.locale=='ar'? 'right !important;' :''}  " >
                                    <spring:message code="label.Mentionlegale"/>
                                </h6>
                                <div class="row">
                                    <div class="col-sm-12 pl-0  ">
                                        <p class="pl-3">
                                            <a class="text-white" href="#"><spring:message code="label.Conditiondutilisation"/></a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-12 text-sm-center p-2 text-lg-left ">
                            <h6 class="text-uppercase text-white text-left fw-bold mb-4 font-weight-bold size_12" style="text-align: ${pageContext.response.locale=='ar'? 'right !important;' :''}  ">
                                <spring:message code="label.contact"/>
                            </h6>
                            <p class="mb-1" style=" font-size: 14px; text-align: ${pageContext.response.locale=='ar'? 'right !important;' :''}  ">
                                <spring:message code="label.AdresseNAvenueAlAraarSecteurHayRiadRabat"/>  <br>

                                <spring:message code="label.Tele"/>  (+212) 537 576 647 / (+212) 537 576 661 <br>

                                <spring:message code="label.Faxi"/>  (+212) 537 570 471 <br>

                                <spring:message code="label.Emaili"/> sg@environnement.gov.ma<br>
                                <spring:message code="label.LeDepartementenligne"/>
                            <a href="https://www.facebook.com/DENVMAROC/" target="_blank" class="me-4 text-reset pr-3 ml-3">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="https://www.youtube.com/channel/UCAXNgXbjL7LXnWgSGn-1aSA" target="_blank" class="me-4 text-reset pr-3">
                                <i class="fab fa-youtube"></i>
                            </a>
                            <a href="https://www.environnement.gov.ma/fr/" target="_blank" class="me-4 text-reset pr-3">
                                <i class="fa fa-globe"></i>
                            </a>

                            </p>

                            <p class="mb-1 " style="text-align: ${pageContext.response.locale=='ar'? 'right !important;' :''}  ">
                                <a class="text-white" href="/contact/0"><spring:message code="label.Contacteznous"/></a>
                            </p>


                        </div>
                    </div>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->
    <div class="text-center p-2" style="background-color: rgba(0, 0, 0, 0.05); font-size: 11px">
       © Copyright 2021 Département de l'environnement | Powerded By Twins
    </div>
    <!-- Copyright -->
</footer>

<!-- Footer -->
<div class="scroll-to-top scroll-to-target" data-target="html"><span class="icon flaticon-up-arrow-angle"></span></div>


<script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.fancybox.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/owl.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/appear.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/wow.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom-script.js"></script>



<!--views-->
<script src="${pageContext.request.contextPath}/assets/jsp/js/demandez_compte.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/stockage.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/menu.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/stockage_affich.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/home_page.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/suivi_demande_page.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/demande.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/notifications.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/avis_projet_table.js"></script>









<%--sweetAlert--%>
<script src="${pageContext.request.contextPath}/assets/js/sweet-alert.min.js"></script>

<%--VALIDATION FORM--%>
<script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/custom-script2.js"></script>


<%--DataTable%--%>
<script src="${pageContext.request.contextPath}/assets/js/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/responsive.bootstrap4.min.js"></script>


<%--SELECT2--%>
<script src="${pageContext.request.contextPath}/assets/js/select2.min.js" ></script>


<script src="${pageContext.request.contextPath}/assets/js/jquery.canvasjs.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/statistique.js"></script>
<script >



function onAcceptTerms() {

    if ($('#isTermsAccepted').is(":checked")) {

        window.location.href = "/affichMov";
    } else {
        $('#msgValidationStep3').show();
    }
}

function fin() {


    window.location.href = "/notifi_affich";

}

$(document).ready(function() {
    $('.dropdown-toggle').dropdown();
    $(".select2").select2({
        closeOnSelect: true
    });

    if(location.hash == "#ressources"){

        $([document.documentElement, document.body]).animate({
            scrollTop: $("#ressources").offset().top
        }, 2000);

    }
});

$(document).ready(function() {
    $('table:not(.my_table)').DataTable({
        "searching": true,
        "bLengthChange": false,
        "pageLength":4,
        "responsive":true,
        "ordering": false,
        language: {
            "sProcessing":     "Traitement en cours...",
            "sSearch":         "Rechercher&nbsp;:",
            "sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
            "sInfo":           "",
            "sInfoEmpty":      "",
            "sInfoFiltered":   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
            "sInfoPostFix":    "",
            "sLoadingRecords": "Chargement en cours...",
            "sZeroRecords":    "Aucun &eacute;l&eacute;ment &agrave; afficher",
            "sEmptyTable":     "Aucune donn&eacute;e disponible dans le tableau",
            "oPaginate": {
                "sFirst":      "Premier",
                "sPrevious":   "Pr&eacute;c&eacute;dent",
                "sNext":       "Suivant",
                "sLast":       "Dernier"
            },
            "oAria": {
                "sSortAscending":  ": activer pour trier la colonne par ordre croissant",
                "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
            },
            "select": {
                "rows": {
                    _: "%d lignes sÃ©lÃ©ctionnÃ©es",
                    0: "Aucune ligne sÃ©lÃ©ctionnÃ©e",
                    1: "1 ligne sÃ©lÃ©ctionnÃ©e"
                }
            }
        }
    });
} );

function show_footer_action(val,that){
    if($(val).is(":visible")){
        $(val).hide();
        $(that).find(".fa-caret-down").removeClass("fa-caret-down").addClass("fa-caret-right");

    }else{
        $(val).show();
        $(that).find(".fa-caret-right").removeClass("fa-caret-right").addClass("fa-caret-down");

    }
}
</script>

</div>

</body>
</html>


