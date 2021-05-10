<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>



<jsp:include page="../../includes/head.jsp" />
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>

<jsp:include page="card.jsp" />


    <div class="col-md-12 div2" style="margin-top: 10%;">

                                    <div class="tab-content tab-content-vertical">
                                        <div class="tab-pane fade active show" id="home-2" role="tabpanel" aria-labelledby="home-tab-vertical">
                                            <div class="row m-0 p-0 zone_table ">
                                                <div class="col-2 m-0 p-0"></div>
                                                <div class="col-8 m-0 p-0">


                                                    <form  class="form-horizontal mt-3" action="" >
                                                    <h4 class="titre_abs "> Attacher les documents définitifs</h4>
                                                        <input type="hidden" id="id_dmd" value="${iddemande}">
                                                  <div class="row m-0 p-0 mt-5">
                                                    <c:if test="${type=='EE'}">
                                                            <div class="col-6">
                                                                <label >Etude d’Impact sur l’Environnement définitive: </label>
                                                                 <input multiple onchange="addDoc_eie('id_dmd','7','docr')"  type="file" class="form-control"  id="docr"  ></input>

                                                            </div>
                                                    </c:if>
                                                      <c:if test="${type=='NT'}">
                                                          <div class="col-6">
                                                              <label >Notice d’Impact sur l’Environnement définitive: </label>
                                                              <input multiple onchange="addDoc_eie('id_dmd','7','docr1')"  type="file" class="form-control"  id="docr1"  ></input>

                                                          </div>
                                                      </c:if>
                                                      <c:if test="${type=='AE'}">
                                                          <div class="col-6">
                                                              <label >Audit Environnemental définitif: </label>
                                                              <input multiple onchange="addDoc_eie('id_dmd','7','docr2')"  type="file" class="form-control"  id="docr2"  ></input>

                                                          </div>
                                                      </c:if>
                                                            <div class="col-6">
                                                                <label > Cahier des charges définitif: </label><br/>
                                                                <input multiple onchange="addDoc_eie('id_dmd','6','docp')"  type="file" class="form-control"  id="docp"  ></input>
                                                            </div>
                                                        </div>

                                                      


                                                        <div class="row m-0 p-0 mt-5">
                                                            <div class="col-3">
                                                            </div>
                                                            <div class="col-6" style="text-align: center">
                                                                <button onclick="changer_statut_type('id_dmd','9','Les fichiers sont enregistrés','${type}')" style="margin-top: 10px;margin-bottom: 10px;" class="btn btn-success" ><spring:message code="button.Enregistrer"/></button>

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
<script>

    function addDoc_eie(id_name, type, idInput) {
        var data = new FormData();

        var ins = document.getElementById(idInput).files.length;

        for (var x = 0; x < ins; x++) {
            data.append("fileToUpload", document.getElementById(idInput).files[x]);
        }
        var id = $("#" + id_name).val();
        alert(id)
        if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
            swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
            return false;
        }


        $.ajax({

            type: "POST",
            enctype: 'multipart/form-data',
            url: "/api/addDoc/" + id + "/" + type,
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success: function (response) {


            },
            error: function () {


            }
        });
    }

</script>
<jsp:include page="../../includes/footer1.jsp" />
