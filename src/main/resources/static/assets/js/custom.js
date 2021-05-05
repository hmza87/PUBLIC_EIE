function show_sing_sele(val) {
    show_etape_perso()
    $(".single_check").prop("checked", false);
    $(val).prop("checked", true);
}

function fun_setqulaif() {
    event.preventDefault();
    var id_install = $("#id_installation").val();

    if ($.trim(id_install) == "" || id_install == 0 || id_install == null) {
        return false;
    }
    var data = new FormData();
    var ins = document.getElementById("qualif").files.length;
    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById("qualif").files[x]);
    }


    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setFilQualifToInstall/" + id_install,
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

function affiche_eie_zone(id_show, id_btn_to_active) {
    if (event != null)
        event.preventDefault();
    $(".cls_step").removeClass("active");
    $(id_btn_to_active).addClass('active');

    $(".z_collecteur").hide();
    $(id_show).show();

}

function affiche_nume_zone(val) {
    $(".zone_tab").slideUp();

    $("#" + val).slideDown({
        "duration": "5000",
        "start": function () {
            $('#' + val).css('display', 'flex')
        },
        "done": function () {
            window.scrollTo(0, document.body.scrollHeight)
        },
    });


}

function show_etape_perso(id) {

    if (id == null || id == "") {
        swal("Merci de choisir un type d'autorisation");
        return false;
    }

    $("#zone_rech").addClass("d-none");
    $("#dev_step").removeClass("d-none");
    $("#dev_list_slc").addClass("d-none");

    $.ajax({
        url: '/getProcedureAuto/'+id,
        type: 'POST',
        data: {},
    })
        .done(function(response) {
            $("#procedure_content").html(response);
            $("#zone_rech").addClass("d-none");
            $("#dev_step").removeClass("d-none");
            $("#dev_list_slc").addClass("d-none");
            $(".select2").select2();
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });

}

function show_etape_normal() {

    $("#zone_rech").removeClass("d-none");
    $("#dev_step").addClass("d-none");
    $("#dev_list_slc").addClass("d-none");
    $("#EIE_groupe").removeClass("d-none");
    $("#autorisation_groupe").removeClass("d-none");

}

function show_zone(hideClass, val) {
    $(".clss_hide").hide();
    $("." + hideClass).show();
    $(".btn_step_perso").removeClass("btn-success");
    $(".btn_step_perso").addClass("btn_gris");
    $(val).removeClass("btn_gris");
    $(val).addClass("btn-success");
    if(hideClass==="attache"){
        var type = $(val).attr("data_type");
        if (type===""){
            return false;
        }
        $.ajax({
            url: '/getAccordionDoc/'+type,
            type: 'POST',
            data: {},
        })
            .done(function(response) {
                $(val).attr("data_type","");
                $("#accordion").html(response);
                $("#accordion").accordion({
                    collapsible: true,
                    heightStyle: "content",
                });
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
}

function go_to(url) {
    window.location.href = url;
}

function sectautoris_table_select(nbr) {
    $("#zone_rech").addClass("d-none");
    $("#dev_list_slc").removeClass("d-none");
    if(nbr==1){
        $("#autorisation_groupe").removeClass("d-none");
        $("#EIE_groupe").addClass("d-none");
    }else if(nbr==2){
        $("#EIE_groupe").removeClass("d-none");
        $("#autorisation_groupe").addClass("d-none");
    }

}

function secteie_table_select() {
    $("#zone_rech").addClass("d-none");
    $("#dev_list_slc").removeClass("d-none");
}

function openCity2(id_active, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    $(id_active).addClass("active");
}


function getOptionByFilter(val, table, select_id) {
    $.get('/api/tronsactionCO/select/' + table + '/delete_date_time is null and ' + val, function (data) {

        $("#" + select_id)
            .empty()
            .append('<option selected="selected" value="">Choisir...</option>');

        $.each(data, function (i, v) {
            console.log("data : ", $(data));
            console.log("v : ", $(v));
            $("#" + select_id).prepend(new Option(v[1], v[0]));
        })

        if ($(data).length == 1) {
            $("#" + select_id + " option").eq(0).prop("selected", true);
        }


    })
    ;
}

$(function () {
    $("#accordion").accordion({
        collapsible: true,
        heightStyle: "content",
    });
});

function addDoc_eie(id_name, type, idInput) {
    var data = new FormData();

    var ins = document.getElementById(idInput).files.length;

    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById(idInput).files[x]);
    }
    var id = $("#" + id_name).val();
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

function updateRegionDemandeInfomration(type, id_name, next_step, id_btn) {
    event.preventDefault();
    var region = ""
    var prefecture = "";
    var commune = "";

    var trans = $("#tron").val();
    if (trans == "oui") {
        if (next_step != "end") {
            $(".cls_step").removeClass('active')
            $(id_btn).addClass('active');
            $(".z_collecteur").hide();
            $(next_step).show();
            return false;
        } else if (next_step == "end") {
            window.location.href = "/api/ListeEie";
            return false;
        }
    }

    var region = $("#id_region").val().join();
    var prefecture = $("#id_prefecture").val().join();
    var commune = $("#id_commune").val().join();

    /*$(".id_region:visible").each(function (ind,el){
        var region_tmp = $(el).val();
        region += region_tmp!=null?region_tmp:0

        var prefecture_tmp = $(el).closest(".row").find(".id_prefecture").val();
        prefecture += prefecture_tmp!=null?prefecture_tmp:0;
        var commune_tmp = $(el).closest(".row").find(".id_commune").val();
        commune += commune_tmp!=null?commune_tmp:0;

        if(ind!=($(".id_region:visible").length-1)){
            region+=',';
            prefecture+=',';
            commune+=',';
        }
    })*/

    var formdata = new FormData();
    formdata.append('region', region);
    formdata.append("prefecture", prefecture);
    formdata.append('commune', commune);

    var id = $("#id_demande_information").val();

    $.ajax({
        type: "POST",
        url: "/api/updateRegionDemandeInformation/" + id + "/" + type,
        contentType: false,
        processData: false,
        data: formdata,
        success: function (response) {
            if (next_step != "end") {
                $(".cls_step").removeClass('active')
                $(id_btn).addClass('active');
                $(".z_collecteur").hide();
                $(next_step).show();
            } else if (next_step == "end") {
                Swal.fire({
                    title: '<strong>Votre demande est déposée avec succès</strong>',
                    icon: 'success',
                    html: '<a href="/api/ListeEie" class="btn btn-success mt-2 ">Retour</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                })
            }
        },
        error: function (response) {

            alert('Erreur ajout non effectue');

        }
    });

}

function changer_statut(id_name, code_statut, msg_alert) {
    if(event!=null)
        event.preventDefault();
    var id = $("#" + id_name).val();
    var link_recap = "/api/recapEie/" + id;
    if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
        swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
        return false;
    }

    $.ajax({
        url: "/api/changerStatuts/" + id + "/" + code_statut,
        type: 'GET',
        data: {},
    })
        .done(function (data) {
            Swal.fire({
                title: '<strong>' + msg_alert + '</strong>',
                icon: 'success',
                html:'<a href="' + link_recap + '" class="btn btn-success ml-2 ">Recapitulation</a>',
                showCloseButton: false,
                showCancelButton: false,
                showConfirmButton: false,
                focusConfirm: false,
            })
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

function set_avis_projet(val_id, id_dmd) {
    event.preventDefault();
    var id_demande = $(id_dmd).val();
    if ($.trim(id_demande) == "" || id_demande == 0 || id_demande == null) {
        return false;
    }

    var data = new FormData();
    var file = $(val_id);
    if ($(file)[0].files.length == 0)
        return false;

    data.append("fileToUpload", $(file)[0].files[0]);


    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setAvisProjet/" + id_demande,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {
            swal({
                    title: "Document enregistrer",
                    text: "L'avis du projet à été Enregistré avec succès",
                    type: "success",
                    showCancelButton: false,
                    confirmButtonText: "Retour",
                    closeOnConfirm: false,
                },
                function (isConfirm) {
                    if (isConfirm) {
                        window.location.href = "/api/checkEIESelect";
                    }
                });
        },
        error: function () {

        }
    });

}

function ajouterTranporteur_Etranger(id_name) {
    event.preventDefault();
    var id = $("#" + id_name).val();
    var raison = $("#raison_social").val();
    var matricule = $("#num_matriule").val();
    var type_vehicule = $("#type_vehicule").val();
    var adresse = $("#adresseTr").val();

    var port = $('input[name^=port]').map(function (idx, elem) {
        return $(elem).val();
    }).get();


    var id_trans = $("#id_trans").val();
    var data = new FormData();
    data.append("raison", raison);
    data.append("matricule", matricule);
    data.append("type_vehicule", type_vehicule);
    data.append("adresse", adresse);
    data.append("port", port);

    var ins = document.getElementById("doc_assurance").files.length;
    if (ins == 0) {
        swal("Avertissement ! ", "Le fichier est obligatoire", 'error');
        return false;
    }

    for (var x = 0; x < ins; x++) {
        var file = document.getElementById("doc_assurance").files[x];
        if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
            swal("Alert", "Type de ficier non pris en charge", "error");
            return false;
        }
        data.append("fileToUpload", file);
    }


    $.ajax({
        url: '/api/addTransporteuretranger/' + id + "/" + id_trans,
        type: 'POST',
        processData: false,
        contentType: false,
        cache: false,
        data: data,
    })
        .done(function (data) {
            $("#row_from_groupe_port").html(data);
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function ajouterTranporteur_EtrangerNational(id_name) {

    event.preventDefault();
    var id = $("#" + id_name).val();
    var raison = $("#raison_social_n").val();
    var matricule = $("#num_matriule_n").val();
    var type_vehicule = $("#type_vehicule_n").val();
    var adresse = $("#adresseTr_n").val();

    var id_trans = $("#id_trans_n").val();
    if ($.trim(id_trans) === "" || id_trans == null || !$.isNumeric(id_trans)) {
        id_trans = 0;
    }
    var data = new FormData();
    data.append("raison", raison);
    data.append("matricule", matricule);
    data.append("type_vehicule", type_vehicule);
    data.append("adresse", adresse);


    var ins = document.getElementById("doc_assurance_n").files.length;
    if (ins == 0 && !$("#btn_downolad").is(":visible")) {
        swal("Avertissement ! ", "Le fichier est obligatoire", 'error');
        return false;
    }

    for (var x = 0; x < ins; x++) {
        var file = document.getElementById("doc_assurance_n").files[x];
        if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
            swal("Alert", "Type de ficier non pris en charge", "error");
            return false;
        }
        data.append("fileToUpload", file);
    }


    $.ajax({
        url: '/api/addTransporteuretrangerNational/' + id + "/" + id_trans,
        type: 'POST',
        processData: false,
        contentType: false,
        cache: false,
        data: data,
    })
        .done(function (data) {
            $("#row_from_groupe").html(data);
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function delete_transp_etrang(id, id_name, type) {
    var id_notif = $("#" + id_name).val();
    $.ajax({
        url: '/api/deleteTransporteuretranger/' + id_notif + '/' + id + "/" + type,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            swal({
                    title: "Suppression ",
                    text: "Le transporteurs à été supprimer avec succès",
                    type: "success",
                },
                function () {
                    $("#row_from_groupe").html(data);
                });

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function edit_transp_trang(id, id_name, type) {
    var id_notif = $("#" + id_name).val();
    $.ajax({
        url: '/api/getoneTransporteuretranger/' + id + '/' + id_notif + "/" + type,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            if (type === "nationale")
                $("#row_from_groupe").html(data);
            else if (type === "etranger")
                $("#row_from_groupe_port").html(data);
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

function changer_quantite(val) {
    var qte = $(val).val();
    $(".quantiteTotalPrevu").val(qte);
}

function changer_zoneFranche(val) {
    var id = $(val).val();
    $(".changerZonneFranche").val(id);
    $(".changerZonneFranche").trigger("change");
}

function changer_unite(val) {
    var id = $(val).val();
    $(".changerUnite").val(id);
    $(".changerUnite").trigger("change");
}

function affche_message(form) {
    event.preventDefault();
    var se = $("#" + form).serializeObject();

    $.ajax({
        type: "POST",
        url: "/api/addDemandeInformation/" + region + "/" + categorie,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(se),
        success: function (response) {
            console.log(response);
            Swal.fire({
                title: '<strong>Votre demande a été déposée avec succès</strong>',
                icon: 'success',
                html: '<a href="/api/checkEIESelect" class="btn btn-success ml-2 ">Retour</a>',
                showCloseButton: false,
                showCancelButton: false,
                showConfirmButton: false,
                focusConfirm: false,
            })
        },
        error: function (response) {

            alert('Erreur ajout non effectue');

        }
    });


}

function fun_disabled_region(val) {
    var id = $(val).val();
    if (id === "") {
        return false;
    }
    if (id == "oui") {
        $(".id_region").attr("disabled", true);
        $(".id_commune").attr("disabled", true);
        $(".id_prefecture").attr("disabled", true);
    } else if (id == "non") {
        $(".id_region").attr("disabled", false);
        $(".id_commune").attr("disabled", false);
        $(".id_prefecture").attr("disabled", false);
    }
}

function load_commune_by_pref(val) {
    if (event != null)
        event.preventDefault();
    var id = $(val).val();
    id = ($.trim(id) == "" || id == null) ? 0 : id;

    var id_obj = $("#id_demande_information").val();
    if (id_obj === "" || id_obj == null) {
        return false;
    }

    $.ajax({
        url: '/api/getCommuneByPref/' + id + "/" + id_obj,
        type: 'post',
        dataType: "html",
        data: {},
    })
        .done(function (data) {
            var row = $(val).closest('.row');
            $(row).find(".id_commune option").remove();
            $(row).find(".id_commune").append(data);
            $(row).find("#id_commune select").trigger("change");
        })
        .fail(function () {
            alert("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function load_pref_by_region(val) {
    if (event != null)
        event.preventDefault();

    var id = $(val).val();
    id = ($.trim(id) == "" || id == null) ? 0 : id;

    var id_obj = $("#id_demande_information").val();
    if (id_obj === "" || id_obj == null) {
        return false;
    }

    $.ajax({
        url: '/api/getPrefectureByRegion/' + id + "/" + id_obj,
        type: 'post',
        data: {},
    })
        .done(function (data) {
            var row = $(val).closest('.row');
            $(row).find(".id_prefecture option").remove();
            $(row).find(".id_prefecture").append(data);
            $(row).find(".id_prefecture").trigger("change");
            var el = document.getElementById("id_prefecture");
            load_commune_by_pref(el);
        })
        .fail(function () {
            alert("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function saveCommuneDetailregion(val) {
    if (event != null)
        event.preventDefault();

    var id = $(val).val();
    if (id === "" || id == null) {
        return false;
    }

    var id_obj = $("#id_demande_information").val();
    if (id_obj === "" || id_obj == null) {
        return false;
    }

    $.ajax({
        url: '/api/savecommuneDetailregion/' + id + "/" + id_obj,
        type: 'post',
        dataType: "html",
        data: {},
    })
        .done(function (data) {

        })
        .fail(function () {
            alert("error");
        })
        .always(function () {
            console.log("complete");
        });
}

function updateDemandeInfomration(form, id_name, step, id_btn_step) {
    if (event != null)
        event.preventDefault();
    var id = $("#" + id_name).val();
    if ($.trim(id) === "" || id == null) {
        return false;
    }

    var montant = $("input[name=montant_investissement]").val();
    if ($.trim(montant) == "" || montant == null || !$.isNumeric(montant)) {
        swal("Avertissement ! ", 'Le champs Montant d\'investissement est incorrecte', 'error');
        return false;
    }
    var se = $("#"+form).serialize();

    $.ajax({
        type: "POST",
        url: "/api/updateDemandeInfomration/" + id,
        contentType: 'application/json; charset=utf-8',
        data: se,
        success: function (response) {
            console.log("success : " + response);
            affiche_eie_zone(step, id_btn_step);
        },
        error: function (response) {

            alert('Erreur ajout non effectue');

        }
    });
}

function affiche_files(id) {
    $.ajax({
        url: '/api/getfileByIdDemande/' + id + "/getfile",
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            $("#zone_tab_fichier").html(data);
            $("#modal_fichiers").modal("show");
            console.log("success");

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}


function affiche_msg_file(id_dmd) {
    if ($.trim(id_dmd) === "") {
        return false;
    }

    $.ajax({
        url: '/api/getfileByIdDemande/' + id_dmd + "/sendfile",
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            $("#complementDocument").modal("show");
            $("#completerlesdocuments").html(data);
            console.log("success");

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function setfileReunionToDemande(id_dmd) {

    var data = new FormData();
    var ins = document.getElementById("file_to_complete").files.length;
    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById("file_to_complete").files[x]);
    }

    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setFileReunionToDemande/" + id_dmd,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {

            swal({
                    title: "Document envoyé ! ",
                    text: "les documents ont été envoyé avec succès",
                    type: "success",
                },
                function () {
                    window.location.href = '/api/ListeEie';
                });

        },
        error: function () {

        }
    });
}

function fun_prescription_hide() {
    $("#azertyui").hide();
}

function fun_prescription_show() {
    $("#azertyui").show();
}

function rech_transporteur(val){
    var code = $(val).val();
    if($.trim(code)==="" || code==null || !$.isNumeric(code))
        return false;

    $.ajax({
        url: '/getTabtransporteur/'+code,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            $("#tab_transporteur").html(data);
            console.log("success");
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

function verifier_champ_vide(form,table,url,nameId,btn){

    alert_error("Select[name=classification_id]");
    alert_error("Select[name=code_id]");
    alert_error("#Zone_Franche");
    alert_error("#id_type");
    alert_error("#unite_id");

    /*if($.trim(qte)==="" || qte==null || $.isNumeric(qte)){
        $("#quantite").addClass("bg_error");
        swal("Avertissement !","le champs quantité est incorrecte","error");
        return false;
    }else{
        $("#quantite").removeClass("bg_error");
    }*/

    addObjectGeneral(form,table,url,nameId,btn);
}

function alert_error(select){
    var val = $(select).val();
    if($.trim(val)==="" || val==null){
        $(select).closest(".form-group").addClass("bg_errorSlecte");
        swal("Avertissement !","un ou plusieurs champs sont vides","error");
        return false;
    }else{
        $(select).closest(".form-group").removeClass("bg_errorSlecte");
    }
    return 0;
}

function add_detail_mouvement(id_notif){
    if(event!=null)
        event.preventDefault();

    var id = $("#id_detail_unit").val();
    var qte = $("#qte_unit").val();
    var files = $("#file_unit")[0].files.length;
    var nbr_colis = $("#nbr_colis").val();
    var tr = $("#detail_mouvement table tbody tr").length;
    var qteTotal = parseInt($("#qte_prevue").val()) - (parseInt($("#qteTotale").val()) +parseInt(qte));

    if(qteTotal<0){
        swal("Avertissement !","La quantité saisie est supérieure à la somme totale prévue","error");
        return false;
    }

    if($.trim(id)==="" || id==null || !$.isNumeric(id)){
        id=0;
    }
    if($.trim(qte)==="" || qte==null || !$.isNumeric(qte)){
        swal("Avertissement !","La quantité est invalide","error");
        return false;
    }
    if(files==0){
        swal("Avertissement !","Le fichier est obligatoire","error");
        return false;
    }
    if($.trim(nbr_colis)==="" || nbr_colis==null || !$.isNumeric(nbr_colis) || nbr_colis===0 || nbr_colis<=tr){
        swal("Avertissement !","Nombre de colis maximum atteind\nMerci de Changer le nombre de colis","error");
        return false;
    }
    var data = new FormData();
    data.append("qte", parseInt(qte));
    data.append("id_detail", parseInt(id));
    data.append("file",$("#file_unit")[0].files[0]);
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setDocMouvementDetail/" + id_notif,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {
            $("#detail_mouvement").html(response);
        },
        error: function () {

        }
    });
}

function delete_docMouv(id,id_notif){
    if(event!=null)
        event.preventDefault();
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/deleteDocMouv/" + id+"/"+id_notif,
        data: {},
        success: function (response) {
            $("#detail_mouvement").html(response);
        },
        error: function () {

        }
    });
}

function setnbrColis(val,id_notif){
    if(event!=null)
        event.preventDefault();
    var nbr = $(val).val();
    var tr = $("#detail_mouvement tbody tr").length;
    if($.trim(nbr)==="" || nbr==null || !$.isNumeric(nbr) || nbr<tr){
        swal("Avertissement ! ","La valeur saisie est incorecte","error");
        return false
    }
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setNbrColie/" + id_notif+"/"+nbr,
        data: {},
        success: function (response) {
            if(nbr==tr)
                $("#btn_add_detail").prop("disabled",true);
            else
                $("#btn_add_detail").prop("disabled",false);
        },
        error: function () {

        }
    });
}

function updateFile(id_notif,val,type){
    if(event!=null)
        event.preventDefault();
    var data = new FormData();
    var files = $(val)[0].files.length;
    if(files==0){
        swal("Avertissement !","Le fichier est obligatoire","error");
        return false;
    }

    data.append("file",$(val)[0].files[0]);

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setDocumentDocMouvement/" + id_notif+"/"+type,
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

function changer_Statut_zf_auth(id_notif, id_statut, type) {
    if(event!=null)
        event.preventDefault();
    var link_recap = "/api/getnotifById1/" + type + "/" + id_notif;
    $.ajax({
        url: '/api/changerStatus',
        type: 'POST',
        data: {"id_notif": parseInt(id_notif), "id_statut": parseInt(id_statut), "type": type},
    })
        .done(function () {
            Swal.fire({
                title: '<strong>votre demande a été effectué avec succès</strong>',
                icon: 'success',
                html:
                    '<a href="' + link_recap + '" class="btn btn-success ml-2 ">Recapitulation</a>',
                showCloseButton: false,
                showCancelButton: false,
                showConfirmButton: false,
                focusConfirm: false,
                allowOutsideClick: false
            });
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });


}

function changer_Statut_zf_auth_test(id_notif, id_statut, type){
    if(event!=null)
        event.preventDefault();
    var tr = $("#detail_mouvement tbody tr").length;
    var nbr = $("#nbr_colis").val();
    if(tr!=nbr){
        swal("Avertissement ! ","Le nombre de colis est superieur au nombre des quantité\nMerci de modifier le nombre de colis","error");
        return false;
    }
    changer_Statut_zf_auth(id_notif, id_statut, type);
}

function go_link(url){
    window.location.href=url;
}


