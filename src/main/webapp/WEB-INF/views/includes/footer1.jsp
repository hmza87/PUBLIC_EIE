<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
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
        "searching": false,
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

</script>

</div>

</body>
</html>
