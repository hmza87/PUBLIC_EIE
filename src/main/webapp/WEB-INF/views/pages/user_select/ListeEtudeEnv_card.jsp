<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<style>
<!--

-->
.card-body{
text-align:center !important;}
.modal{
  overflow: auto !important;
}
.main-panel{
  margin-top: 150px !important;
}
.margin10{
  margin: 10px !important;
}
</style>
<style>
<c:if test="${pageContext.response.locale=='ar'}">
.select2-results__option{
direction:rtl;
text-align:right !important;


}
</c:if>
</style>
<jsp:include page="../../includes/head.jsp"/>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
      <div class="row mt-3">
        <div class="col-12 text-center">
          <%--<h1><spring:message code="option.Etudedimpactenvironnementale"/></h1>--%>
        </div>
        <div class="col-12 text-center">
          <%--<p><spring:message code="label.msgMerci"/></p>--%>
          <%--<div class="row m-0 p-0 justify-content-center">--%>
            <%--<div class="col-md-4 col-sm-12">--%>
              <%--<div class="form-group">--%>
                <input type="hidden" value="${type}" id="type">
                <%--<select onchange="changer_select()" class="form-control select2" id="choix" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">--%>
                  <%--<option value=""><spring:message code="label.ChoisirA"/></option>--%>
                  <%--<option value="1"><spring:message code="label.Nouvelledemande"/></option>--%>
                  <%--<option value="2"><spring:message code="label.SuivremademandeEIE"/></option>--%>
                  <%--<option value="3"><spring:message code="label.dmdRensPre"/></option>--%>
                  <%--<option value="4"><spring:message code="label.AfficherlesdemandeEIE"/></option>--%>
                <%--</select>--%>
              <%--</div>--%>
            <%--</div>--%>
          <%--</div>--%>
          <div class="row justify-content-center mt-5">
            <div class="col-md-10 col-sm-12">
              <div class="row">
                <div class="col-12">
                  <div class="card w-100">
                    <div class="card-body" >
                      <h1>${titre_dyn}</h1>
                      <%--<p class="text-left font_bold"><spring:message code="label.msgMerci"/>.</p>--%>
                      <%--<p class="text-left"><spring:message code="label.Vouspouvez"/>.</p>--%>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6 col-lg-6" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                  <div class="card w-100" style="min-height: 210px">
                    <div class="card-body"  id="Row_Nouvelle_EIE_1" style="min-height: 295px;">
                      <div class="row">
                        <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                          <div class="rounded-circle my_bg p-3 m-3">
                            <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                          </div>
                        </div>

                        <div class="col-md-9 col-sm-12 pr-0 pl-0">
                          <p class="text-success font_bold text-left pl-2"><spring:message code="label.Deposerundossier"/></p>
                         <hr>
                            <p class="pl-2 text-justify margin10" >
                              Pour d??poser  ${(type=="EE" || type=="RS")?"le dossier d'une demande de l\'EIE":(type=="NT"?"votre demande d'obtention de la D??cision d'Acceptabilit?? Environnementale de votre projet soumis ?? la NIE":"votre demande de conformit?? environnementale de votre projet")} <spring:message code="label.cliquezsur"/>  <b>${titre_dyn} :</b><br>
                            </p>
                          <div class="text-left">
                            <button onclick="go_to_l('/api/demandeinformation/0/${type}')" class="btn btn-sm btn-success margin10" >${titre_dyn} <span class="fa fa-angle-double-right"></span></button>
                          </div>
                        <c:if test="${type=='EE'}">
                          <p class="pl-2 text-justify margin10" >Pour v??rifier si votre projet est assujetti ou non ?? la proc??dure des EIE, veuillez cliquer sur ?? Renseignements pr??alables ??. Ceci vous permettra ??galement de prendre connaissance du niveau d???examen de ladite EIE (Comit?? National de l???Evaluation Environnementale ou Commission R??gionale Unifi??e d???Investissement).<spring:message code="label.cliquezsur"/> <b><spring:message code="label.Renseignementsprealables"/> </b></p>
                          <div class="text-left">
                            <button onclick="go_to_l('/api/demandeinformation/0/RS')" class="btn btn-sm btn-success margin10" > <spring:message code="label.RenseignementsprealablesA"/> <span class="fa fa-angle-double-right"></span></button>
                          </div>
                        </c:if>
                        </div>
                        <div class="col-12">


                          </div>
                    </div>
                    </div>

                  </div>
                </div>
                <div class="col-md-6 col-sm-6 col-lg-6" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                  <div class="card w-100" style="min-height: 210px">
                    <div class="card-body" style="min-height: 295px;">

                      <div class="row">
                        <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                          <div class="rounded-circle my_bg p-3 m-3">
                            <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                          </div>
                        </div>
                        <div class="col-md-9 col-sm-12 pr-0 pl-0" >
                          <p class="text-success font_bold text-left pl-2"><spring:message
                                  code="label.Suivremondossier"/></p>
                          <hr>
                          <p class="pl-2 text-justify margin10" >
                            <spring:message code="label.Vouspouvezsuivreletatdevosdossiers"/>  <b><spring:message code="label.Affichermesdossiers"/> </b></p>
                        </div>
                        <div class="col-12" >
                            <input placeholder="<spring:message code="label.EntrerNdelademande"/>" type="text" class="form-control mb-2 margin10" id="num_demande23" style=" width: 201px; display: inline;height: 32px;">

                            <button ${RS==0?'disabled':''} onclick="fun_affiche_modal_recap()" class="btn btn-sm btn-success" style="margin: 10px 10px 17px -10px;">  <span class="fa fa-search"></span></button>


                          <button ${type==null?'disabled':''} onclick="go_to_l('/api/ListeEie/${type}')" class="btn btn-sm btn-success" style="margin: 10px 0px 17px 10px;">
                            <spring:message code="label.Affichermesdossiers"/> <span
                                  class="fa fa-angle-double-right"></span></button>


                                 <%-- <button ${RS==0?'disabled':''} onclick="go_to_l('/api/ListeEieRe')" class="btn btn-sm btn-success" style="margin: 10px 0px 17px 10px;">Afficher les Renseignements pr??alables <span class="fa fa-angle-double-right"></span></button>--%>
                                  

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
    </div>
</div>



<!-- Modal information-->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.Information"/></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row justify-content-center">
          <div class="col-10">
            <p>
              <spring:message code="label.msgSaisirNum"/>
            </p>

          </div>
          <div class="col-10">
            <input type="text" class="form-control mb-2" id="num_demande2">
            <%--<p class="text-small" style="font-size: 11px"><spring:message code="label.Sivousnavezpaslenumerosdelademandevouspouvezgenererunnouveaunumerosencliquant"/> <a href="/api/demandeinformation/0/RS"><spring:message code="label.ici"/></a></p>--%>
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button class="btn btn-success" onclick="fun_affiche_modal_recap()"><spring:message code="label.rech"/></button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modalRenouv" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="renouvLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="renouvLabel"><spring:message code="label.suivredmd"/></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="renouv_tab">
        <div class="row justify-content-center">
          <div class="col-10">
            <p> <spring:message code="label.msgSaisirNum"/> </p>
          </div>
          <div class="col-10">
            <input type="text" class="form-control mb-2" id="num_demande1">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-success" onclick="fun_affiche_modal_recap()"><spring:message code="label.rech"/></button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modalRecap" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="recapLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content ">
      <div class="modal-header">
        <h5 class="modal-title" id="recapLabel"><spring:message code="label.Recap"/></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="recap_tab">
        <%--Remplissage dynamique--%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.Fermer"/></button>
      </div>
    </div>
  </div>
</div>



<script>
  function schow_Row_Nouvelle_EIE_2(){
    $("#Row_Nouvelle_EIE_2").show();
    $("#Row_Nouvelle_EIE_1").hide();
  }
  
  
  function fun_affiche_modal_recap(){
    var id = $("#num_demande1").val();
    var typee = $("#type").val();
    if($.trim(id)==""){
       id = $("#num_demande2").val();
    }
    if($.trim(id)==""){
       id = $("#num_demande23").val();
    }


    if($.trim(id)==""){
      swal('Champs vide',"merci de saisir un numero valide","warning");
      return false;
    } 

    $.ajax({
      url: '/api/CheckEIE/'+id,
      type: 'POST',
      dataType:'html',
      data: {},
    })
            .done(function(response) {
              console.log(response);
              if(response=="" || $.trim(response)=="Aucun r??sultat"){
                $("#num_demande1").val("");
                $("#num_demande2").val("");
                $("#num_demande23").val("");
                //$("#staticBackdrop").modal("toggle");
                swal("Aucun r??sultat","merci de saisir un numero valide","info");
                return false;
              }else{
                window.location.href="/api/demandeinformation/"+response+"/"+typee;
              }


            })
            .fail(function() {
              alert("erreur")
            })
            .always(function() {
              console.log("complete");
            });
  }



  function afficher_choix(){
    swal({
      title:"Confirmation",
      text:"Voulez-vous remplir l'??tude d'impacte environnementale sans Renseignement pr??alable ?",
      type:"info",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#7dc7bd',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Oui',
      cancelButtonText: 'Non',
    }, function (isConfirm) {
      if (isConfirm) {
        window.location.href="/api/demandeinformation/0/EE";
      }else{
        $("#staticBackdrop").modal("toggle");
      }
    });
  }

  function changer_select(){
    var id = $("#choix").val();
    if($.trim(id)===""){
      return false;
    }
    var type = $("#type").val();

      if(id==1){
        afficher_choix();
      }else if(id==2){
        $("#modalRenouv").modal("toggle");
      }else if(id==3){
        window.location.href="/api/ListeEieRe";
      }else if(id==4){
        window.location.href="/api/ListeEie";
      }

  }
  function go_to_l(url){
    window.location.href=url;
  }
</script>





<jsp:include page="../../includes/footer1.jsp"/>
