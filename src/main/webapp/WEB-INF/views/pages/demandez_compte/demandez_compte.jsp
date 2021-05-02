<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>


<jsp:include page="../../includes/head.jsp"/>

<style>
    .input-container {
        display: -ms-flexbox; /* IE10 */
        display: flex;
        width: 100%;
        margin-bottom: 15px;
    }
    .field_icon{
        padding: 7px;
        background: dodgerblue;
        color: white;
        min-width: 50px;
        text-align: center;
    }
</style>

<div class="container-fluid mt_cont" style="overflow:hidden">
    <div class="pt-4 page_content">
        <div class="row justify-content-center">

            <div class="col-10">

            <div class="row justify-content-center m-0 p-0">
            <div class="col-lg-4 col-md-4 col-sm-12" >
                <img src="${pageContext.request.contextPath}/assets/images/img1.png" style="height: 700px;margin-top:25%">
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12">
                <div class="inner">
                    <div style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                        <h2 style="margin-top: 16%"><spring:message code="label.Inscription"/></h2> 
                    </div>
                    <form class="form-horizontal" id="registration" name="registration">
                        <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <div class="row mt-4" >
                                <div class="col-md-6">
                                    <label ><spring:message code="label.Username"/> </label>
                                    <input type="hidden" name="societesId" id="compteId" value="${societe.st.societesId}">
                                    <input required  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}"  type="text" name="name_fr" id="username" value="${societe.st.name_fr}" placeholder="<spring:message code="label.Username"/>" class="form-control">
                                    <input type="hidden" name="etat" id="etat" >
                                </div>
                                        <div class="col-md-6" >
                                            <label class="numRc" style="visibility: hidden">numRc</label>
                                            <div class="input-container">
                                                <input  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="text" name="numRc" value="${societe.st.numRc}" placeholder="<spring:message code="label.NumeroRC"/>" class="form-control"  onkeyup="ses_rc()"><p id="in_RC"></p>
                                                <div class="tooltip_" >
                                                    <i  class="fa fa-info-circle field_icon" style="background-color: #7d90c7;margin-left:3px;border-radius:7px;"></i>
                                                    <div class="tooltiptext"><img src="../../assets/css/images/RC.jpg" width="100%" style="width: 320px !important;max-width: unset;" /></div>
                                                </div>
                                            </div>


                                        </div>
                            </div>
                                <div class="row mt-4">
                                    <div class="col-md-6">
                                        <input required dir="rtl" type="text" name="raison_ar" placeholder="إسم الشركة " value="${societe.st.raison_ar}" class="form-control"  onkeyup="ses_ras()"><p id="in_Raison_Sociale"></p>
                                    </div>
                                    <div class="col-md-6">
                                        <input  required type="text" name="raison_fr" placeholder="Raison Sociale " value="${societe.st.raison_fr}" class="form-control"  onkeyup="ses_ras()"><p id="in_Raison_Sociale_fr"></p>
                                    </div>
                                </div>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                <textarea dir="rtl" name="adresse_ar" placeholder="العنوان" class="form-control"  onkeyup="ses_ad()">${societe.st.adresse_ar}</textarea><p id="in_Adresse"></p>
                            </div>
                                <div class="col-md-6">
                                <textarea name="adresse_fr" placeholder="Adresse" class="form-control"  onkeyup="ses_ad()">${societe.st.adresse_fr}</textarea><p id="in_Adresse_fr"></p>
                            </div>
                            </div>
                            <div class="row mt-4">
                                  <div class="col-md-6">
                                        <input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="tel" name="tel" value="${societe.st.tel}" placeholder="<spring:message code="label.Telephone"/>" class="form-control" ></input><p id="in_Telephone"></p>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="hidden" id="maill">
                                        <input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="email" name="email" value="${societe.emailRecup}" placeholder="<spring:message code="label.Emaile"/>"  onblur="checkmail()" class="form-control"  id="emaily"></input><p id="in_email"></p>
                                        <label id="chekmail" style=" color: red;"></label>
                                    </div>
                            </div>
                                <div class="row" id="comptes" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                    <div class="col-md-12" >
                                        <div class="input-container">
                                        <input required dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="password" value="${societe!=null?'drdrdrdr':'' }" placeholder="<spring:message code="label.Motdepasse"/>" name="password" class="form-control" id="psw">
                                                <i toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password" style="background-color: #7d90c7;margin-left:3px; border-radius:7px;"></i>
                                    </div>
                                    </div>
                                </div>
                            </div>

                        <div class="infor-supl" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <div class="form-group" style="width: 100%;margin-bottom: 15px;display: inline-block">
                                <div class="col2 select" style="position: relative;box-sizing: border-box;">
                                    <label style="display: block;font-size: 120%;margin-bottom: 7px;"><spring:message code="label.jesouhaiteformulermademandede"/> </label>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="custom-control custom-checkbox incsc rounded">
                                                <input name="environnement" ${societe.st.environnement.equals('on')?'checked':''} type="checkbox" data-name="EIE1" class="custom-control-input" id="EIE">
                                                <label class="custom-control-label" for="EIE"><spring:message code="label.EvaluationEnvironnementale"/></label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="custom-control custom-checkbox incsc rounded">
                                                <input name="autorisation" ${societe.st.autorisation.equals('on')?'checked':''} type="checkbox" data-name="Autorisation1" class="custom-control-input" id="AUT">
                                                <label class="custom-control-label" for="AUT" ><spring:message code="label.Autorisationdesdechets"/></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="EIE_Autorisation1">
                            <div class="row" >
                                <div class="col-md-6 col-lg-6 ">
                                <div class="form-group" style="" id="EIE1">


                                <div class="custom-control custom-checkbox">
                                <input  type="checkbox" ${societe.st.EIE.equals('on')?'checked':''} class="custom-control-input" name="eie" id="EIE_1">
                                <label class="custom-control-label" for="EIE_1"><spring:message code="label.etudeimpactenvironnemental"/></label>
                                </div>
                                    <div class="custom-control custom-checkbox">
                                        <input  type="checkbox" ${societe.st.NT.equals('on')?'checked':''} class="custom-control-input" name="nt" id="NI_1">
                                        <label class="custom-control-label" for="NI_1"><spring:message code="label.Noticedimpact"/></label>
                                    </div>
                                    <div class="custom-control custom-checkbox" >
                                        <input  type="checkbox" ${societe.st.EA.equals('on')?'checked':''} class="custom-control-input" name="ea" id="AE_1" >
                                        <label class="custom-control-label" for="AE_1" ><spring:message code="label.Auditenvironnementale"/></label>
                                    </div>
                                        </div>
                            </div>
                                <div class="col-md-6 col-lg-6 ">
                                
                            <div class="form-group" style="width: 100%;margin-bottom: 15px;display: inline-block" id="Autorisation1">
                            <div class="custom-control custom-checkbox">
                                <input  type="checkbox" ${societe.st.IT.equals('on')?'checked':''} class="custom-control-input" name="it" id="IT_1">
                                <label class="custom-control-label" for="IT_1"><spring:message code="label.Installationdetraitementdesdechets"/></label>
                            </div>
                                <div class="custom-control custom-checkbox">
                                <input  type="checkbox" ${societe.st.CT.equals('on')?'checked':''} class="custom-control-input" name="ct" id="CT_1">
                                <label class="custom-control-label" for="CT_1"><spring:message code="label.Collectetransportdesdechetsdangereux"/></label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                <input  type="checkbox" ${societe.st.XD.equals('on')?'checked':''} class="custom-control-input" name="xd" id="XD_1">
                                <label class="custom-control-label" for="XD_1"><spring:message code="label.Exportationdesdechetsdangereux"/></label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                <input  type="checkbox" ${societe.st.TR.equals('on')?'checked':''} class="custom-control-input" name="tr" id="TR_1">
                                <label class="custom-control-label" for="TR_1"><spring:message code="label.Transitdesdechets"/></label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                <input  type="checkbox" ${societe.st.ZF.equals('on')?'checked':''} class="custom-control-input" name="zf" id="ZF_1">
                                <label class="custom-control-label" for="ZF_1"><spring:message code="label.Importationdechetszonefranche"/></label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                <input  type="checkbox" ${societe.st.ET.equals('on')?'checked':''} class="custom-control-input" name="et" id="ET_1">
                                <label class="custom-control-label" style="width: 340px;" for="ET_1"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></label>
                                </div>
                            </div>
                                </div>
                            </div>
                            </div>
                            <hr class="hr-hub" style="width: 100%;margin-top: 8px;margin-bottom: 8px;margin-left: 0% !important;margin-right: 0% !important;">

                            <br>
                            <div class="capbox">

                                <div id="CaptchaDiv"></div>

                                <div class="capbox-inner" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                   <spring:message code="label.Tapezlenumero"/><br>


                                    <%--<input type="hidden" name="societesId" value="10">--%>

                                    <input type="hidden" id="txtCaptcha">
                                    <input type="text" name="captcha" id="Captchay" size="15"><br>

                                </div>
                            </div>
                            <br><br>
                            <!-- END CAPTCHA -->


                            <div class="form-group row" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <div class="col-md-12 ">
                                    <div class="custom-control custom-checkbox">
                                        <input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="checkbox" class="custom-control-input" id="customCheck1">
                                        <label class="custom-control-label" for="customCheck1"><spring:message code="label.Jailuetjaccepte"/> <a href="#" > <spring:message code="label.lesconditionsgeneralesdutilisation"/></a></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group text-center ">
                                <div class="col-xs-12 pb-3 ">
                                    <button class="btn btn-block btn-lg btn-success " id="inscbtn" onclick="add_inscription(this)"><spring:message code="button.SINSCRIRE"/></button>
                                </div>
                            </div>

                        </div>
                    </form>
        </div>
</div>
            </div>
</div>
</div>
</div>
</div>




<jsp:include page="../../includes/footer1.jsp"/>

<script>
    $.fn.serializeObject = function()
    {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };


    function add_inscription(val){
        event.preventDefault();
    	$(val).prop("disabled",true);
        if ($('#EIE').is(':checked')) {
            var etat=$("#etat").val("1");
        }
        if ($('#AUT').is(':checked')) {
            var etat=$("#etat").val("2");
        }
        if ($('#EIE').is(':checked') && $('#AUT').is(':checked')) {
            var etat=$("#etat").val("3");
        }
        var se = $("#registration").serializeObject();
        var id=$("#compteId").val();

      if(id=="" || !id){
          id=0;
      }
      
        $.ajax({
            type: "POST",
            url :"/addSociete/"+id,
            contentType : 'application/json; charset=utf-8',
            data : JSON.stringify(se),
            success : function(response) {
                swal({
                    title: "Message",
                    text: "Votre identifiant est :"+response,
                    type: "success"
                }, function() {
                    // window.location="/index"
                    var elem="<table><tr><td>Identifiant </td><td>: "+response+"</td></tr><tr><td>Mot de passe </td><td>: "+$("input[name='password']").val()+"</td></tr><tr><td>Numero RC </td><td>: "+$("input[name='NumRc']").val()+"</td></tr><tr><td>Raison Sociale </td><td>: "+$("input[name='raison_fr']").val()+"</td></tr><tr><td>Téléphone </td><td>: "+$("input[name='tel']").val()+"</td></tr><tr><td>Email </td><td>: "+$("input[name='email']").val()+"</td></tr></table><br>";
                    PrintElem(elem);
                    window.location="/index";
                });

            },
            error : function() {
                swal({
                    title: "Erreur",
                    text: "Erreur ajout non effectue",
                    type: "error"
                }, function() {
                    window.location="/index"
                });
            }
        });


    }
    function PrintElem(elem)
    {
        var mywindow = window.open('', 'PRINT', 'height=400,width=440');

        mywindow.document.write('<html><head><title>' + document.title  + '</title>');
        mywindow.document.write('</head><body > ');
        mywindow.document.write('<img alt="" src="/assets/images/logo.png" style="height: 60px; margin-top: -8px;" id="frlogo">');
        mywindow.document.write("<h1>Coordonnée d'identification</h1>");
        mywindow.document.write(elem);
        mywindow.document.write(document.getElementById('EIE_Autorisation1').innerHTML);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/

        mywindow.print();
        //mywindow.close();

        return true;
    }

    $(document).on('click', '.toggle-password', function() {

        $(this).toggleClass("fa-eye fa-eye-slash");

        var input = $("#psw");
        input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
    });
</script>
<script>
   

    function update(){
        var checkbox = $(this);
        var name = checkbox.data('name');
        if( checkbox.is(':checked') ) {
            $( '#' + name ).show();
        } else {
            $( '#' + name ).hide();
        }
    }

    //just setup change and each to use the same function
    $('.custom-control-input').change(update).each(update);


</script>
