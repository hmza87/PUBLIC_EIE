<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<style>
    .main-panel {
        margin-top: 150px !important;
    }

    .card-body {
        text-align: center !important;
    }
</style>

<jsp:include page="../../includes/head.jsp"/>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="row">
            <div class="col-12">
                <c:choose>

                    <c:when test="${type=='ZF'}">
                        <spring:message code="label.Importationdesdechetsdunezonefranche" var="p_page"/>
                    </c:when>
                    <c:when test="${type=='ET'}">
                        <spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger" var="p_page"/>
                    </c:when>
                    <c:when test="${type=='XD'}">
                        <spring:message code="label.Exportationdesdechetsdangereux" var="p_page"/>
                    </c:when>
                    <c:when test="${type=='TR'}">
                        <spring:message code="label.Transitdesdechets" var="p_page"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                    </c:otherwise>
                </c:choose>

                <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                        <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="row justify-content-center mt-5">
            <div class="col-md-10 col-sm-12">
                <div class="row">
                    <div class="col-12">
                        <div class="card w-100">
                            <div class="card-body">
                                <p class="h5 font_bold  text-left text-uppercase mt-3"><spring:message
                                        code="label.Bienvenue"/></p>
                                <p class="text-left font_bold"><spring:message code="label.Cette"/>
                                    <spring:message code="label.demandesdautorisation"/> .</p>
                                <p class="text-left"><spring:message code="label.Vouspouvez"/>.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-lg-6">
                        <div class="card w-100" style="min-height: 210px">
                            <div class="card-body">
                                <div class="row">
                                    <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                                        <div class="rounded-circle my_bg p-3 m-3">
                                            <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-12 pr-0 pl-0">
                                        <p class="text-success font_bold text-left pl-2"><spring:message
                                                code="label.Deposerundossier"/></p>
                                        <hr>
                                        <p class="pl-2 text-justify"><spring:message code="label.cliquezsurleboutonconcerne"/></p>
                                    </div>
                                    <div class="col-12">
                                                <a href="/api/addInstallation/0/N"
                                                   class="btn btn-sm btn-success"><spring:message
                                                        code="label.Demandedenumerosdenotification"/>
                                                    <span class="fa fa-angle-double-right"></span></a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-lg-6">
                        <div class="card w-100" style="min-height: 210px">
                            <div class="card-body">

                                <div class="row">
                                    <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                                        <div class="rounded-circle my_bg p-3 m-3">
                                            <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-12 pr-0 pl-0">
                                        <p class="text-success font_bold text-left pl-2"><spring:message
                                                code="label.Suivremondossier"/></p>
                                        <hr>
                                        <p class="pl-2 text-justify"><spring:message
                                                code="label.Poursuivreletatdavancementdundossierdejadepose"/></p>
                                    </div>
                                    <div class="col-12">

                                            <button onclick="affiche_nume_zone('zone_tab1')"
                                            <c:if test="${empty install}">disabled</c:if>
                                                    class="btn btn-sm btn-success">
                                                <spring:message code="label.Parnumerodenotification"/> <span
                                                    class="fa fa-angle-double-right"></span></button>


                                            <button onclick="go_to('/api/ListInstallation')"
                                            <c:if test="${empty install}"></c:if>
                                               class="btn btn-sm btn-success">
                                                <spring:message code="label.Affichermesdossiers"/> <span
                                                    class="fa fa-angle-double-right"></span></button>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center zone_tab collapse" id="zone_tab">
            <div class="col-md-10 col-sm-12">
                <a class="btn btn-primary mb-2"><spring:message code="label.Mesnumerosdenotification"/> </a>
                <table class="my_table table table-hover table-bordered">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col"><spring:message code="label.Numerodenotification"/></th>
                        <th scope="col"><spring:message code="label.datededemandedenumerodenotification"/></th>
                        <th scope="col"><spring:message code="label.code"/></th>
                        <th scope="col"><spring:message code="label.Typededechets"/></th>
                        <th scope="col"><spring:message code="label.Action"/></th>
                    </tr>
                    <c:forEach items="${notif}" var="n" varStatus="loop">

                        <tr>
                            <td scope="col">${loop.index +1}</td>
                            <td scope="col"> ${n.num_notification}</td>
                            <td scope="col"><fmt:formatDate value="${n.dateDepot}" pattern="dd/MM/yyyy"/></td>
                            <td scope="col">${n.code.nom_fr}</td>
                            <td scope="col">${n.code.nom_ar}</td>
                            <td scope="col"><a href="/api/addDemandNotification/${n.id_notification}/${type}/N"
                                               class="btn btn-success"><spring:message code="label.Deposerlademande"/></a></td>
                        </tr>


                    </c:forEach>
                </table>
                <c:if test="${empty notif}">
                    <spring:message code="label.AucunnumerodeNotificationenregistrer"/>.
                </c:if>
            </div>
        </div>
        <div class="row justify-content-center zone_tab collapse" id="zone_tab1">
            <div class="col-md-10 col-sm-12">
                <a class="btn btn-primary mb-2"> <spring:message code="label.Mesnumerosdedossier"/></a>


                <table class="my_table table table-hover table-bordered">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Numero D'installation</th>
                        <th scope="col"><spring:message code="label.dateDedepot"/></th>
                        <th scope="col"><spring:message code="label.Detail"/></th>
                        <th scope="col"><spring:message code="label.Action"/></th>
                    </tr>
                    <c:forEach items="${install}" var="n" varStatus="loop">
                        <tr>
                            <td scope="col">${loop.index +1}</td>
                            <td scope="col"> ${n.num_demande}</td>
                            <td scope="col"><fmt:formatDate value="${n.dateDepot}" pattern="dd/MM/yyyy"/></td>
                            <td>
                                <c:if test="${not empty n.code}">
                                    <button class="btn btn-success btn-circle"
                                            onclick="show_code('${n.id_installation}')">
                                        <span class="fa fa-dumpster"></span>
                                    </button>
                                </c:if>
                                <c:if test="${empty n.code}">
								<span class="f-12">
									<spring:message code="label.Pasdecode"/>
								</span>
                                </c:if>

                            </td>
                            <td><a href="/api/recapIT/${n.id_installation}"
                                   class="btn btn-success"><spring:message code="label.Recapitulation"/></a></td>
                        </tr>

                    </c:forEach>
                </table>
                <c:if test="${empty notifall}">
                    <spring:message code="label.AucunnumerodeDossierenregistrer"/>.
                </c:if>
            </div>
        </div>

        <div class="modal fade" id="staticBackdrop1" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabele" aria-hidden="true" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="modal-dialog modal-lg modal-dialog-centered" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabele"><spring:message code="label.listdescodes" /></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                onclick="hide_code()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12 table-responsive">
                                <table class="table table-hover table-striped table-bordered tab_vehicule" id="tab_code">
                                    <thead>
                                    <tr>
                                        <th> <spring:message code="label.code" /> </th>
                                        <th> <spring:message code="label.Typededechet" /></th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <tr>
                                        <td><spring:message code="label.Erreur" /></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="hide_code()" data-dismiss="modal"><spring:message code="button.fermer" /></button>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<script>
    function fun_recher() {
        var id = $('#recap').val();
        $.ajax({
            url: '/api/checknotif/' + id + '/${type}',
            type: 'GET',
            dataType: 'html',
            data: {},
        })
            .done(function (data) {
                if (data == 0) {
                    swal("Aucun résultat", "merci de verifier le numero saisie", "error");
                } else {
                    window.location.href = "/api/getnotifById1/${type}/" + data;
                }

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }
    function show_code(id) {
        event.preventDefault();
        $("#staticBackdrop1").modal("show")
        var data = new FormData();
        data.append("id", id);
        $
            .ajax({
                type : "POST",
                enctype : 'multipart/form-data',
                url : "/api/getcode",
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                success : function(response) {
                    console.log(response);
                    if(response.url_Admin==null || response.url_Admin==""){
                        window.location.href="/index";
                    }
                    $("#tab_code tbody").html("");
                    if ($(response.codes).length > 0)

                        $(response.codes)
                            .each(
                                function(idx, el) {
                                    var btn_url = "";

                                    var tr = "<tr> <td>"
                                        + el.nom_fr
                                        + "</td> <td>"
                                        + el.nom_ar
                                        + "</td> </tr>";

                                    $(".tab_vehicule tbody")
                                        .append(tr);
                                })

                },
                error : function() {

                }
            });
    }
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>


<jsp:include page="../../includes/footer1.jsp"/>
