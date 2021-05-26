<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>


<c:choose>
    <c:when test="${show=='accordion'}">
        <c:if test="${type=='ZF' || type=='XD'}">
            <c:forEach items="${doc}" var="d">
                <h3 class="${d.classification.id_classification==1?'Grp_dang':'Grp_simpl d-none'}">${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</h3>
                <div class="${d.classification.id_classification==1?'Grp_dang':'Grp_simpl d-none'}">
                    <c:if test="${d.nom_fr=='Garantie financière'}">
                        <p style="padding-left: 1%;border: 2px solid black;">
                            <strong style="color: green">CTR</strong><spring:message code="label.CTR"/>
                        </p>

                        <p style="padding-left: 1%;border: 2px solid black;">
                            <strong style="color: green">CS</strong><spring:message code="label.CS"/> : <spring:message code="label.coutdestockage"/>
                        </p>
                        <p style="padding-left: 1%;border: 2px solid black;">
                            <strong style="color: green">Q</strong> : <spring:message code="label.Quantitededechetstransferes"/>
                            <spring:message code="label.quantitededechetalaquantitetotale"/>
                        </p>
                        <br>
                        <div style="background-color:#eee;color: black;padding-left: 1%;border: 1px solid black;">

                            <div class="row-fluid justify-content-center mb-1 mt-3" >
                                <div class="col-sm-12 pl-0 ct_calcule ">
                                    <strong style="color: black">CT</strong> = <input value="0" min="0" class="frm_cal inp_cu_ct" type="number" placeholder="Cu" >
                                    * <input class="frm_cal inp_q2_ct" value="0" min="0" type="number" placeholder="Q" >
                                    * <input value="0" min="0" class="frm_cal inp_d_ct" type="number" placeholder="D" >
                                    &nbsp; <button class="btn btn-sm btn-success" onclick="calculer2()" ><spring:message code="button.Calculer"/></button>
                                    <br>
                                    <div class="zone_resul">
                                        <span class="disp_none resultat_calcul2_ct"><strong style="color: black;">CT</strong> = <p class="res2_ct d-inline" id="res2">  </p></span>
                                    </div>
                                </div>
                            </div>

                            <div class="row-fluid justify-content-center mb-5 mt-3">
                                <div class="col-sm-12 pl-0 gf_calcule">
                                    <strong style="color: black">GF</strong> = <input value="0" min="0" class="frm_cal inp_ct_gf" width="20%" type="number" placeholder="CT" >
                                    + <input class="frm_cal inp_ctr_gf" value="0" min="0" type="number" placeholder="CTR" > + <input value="0" min="0" class="frm_cal inp_cs_gf" type="number" placeholder="Cs" >
                                    * <input class="frm_cal inp_q_gf" value="0" min="0" type="number" placeholder="Q" > * 1,2 &nbsp; <button class="btn btn-sm btn-success" onclick="calculer()" style="margin-top: 10px"><spring:message code="button.Calculer"/></button>
                                    <br>
                                    <div class="zone_resul_2">
                                        <span id="resultat_calcul" class="disp_none"><strong style="color: black">GF</strong> = <p class="res2_gf d-inline">  </p></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                        ${(not empty d.description)?d.description:"Aucune Descritpion"}
                    <c:if test="${not empty d.uri}">
                        <p>Liens pour télécharger le modèle: <a href="${Admin_url}${fn:replace(d.uri,"/assets/myFile/","/dowload_uploaded/")}">cliquer ici</a></p>
                    </c:if>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${type!='ZF' && type!='XD'}">
            <c:forEach items="${doc}" var="d">
                <h3 >${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</h3>
                <div>
                    <c:if test="${d.nom_fr=='Garantie financière'}">
                        <p style="padding-left: 1%;border: 2px solid black;">
                            <strong style="color: green">CTR</strong><spring:message code="label.CTR"/>
                        </p>

                        <p style="padding-left: 1%;border: 2px solid black;">
                            <strong style="color: green">CS</strong><spring:message code="label.CS"/> : <spring:message code="label.coutdestockage"/>
                        </p>
                        <p style="padding-left: 1%;border: 2px solid black;">
                            <strong style="color: green">Q</strong> : <spring:message code="label.Quantitededechetstransferes"/>
                            <spring:message code="label.quantitededechetalaquantitetotale"/>
                        </p>
                        <br>
                        <div style="background-color: #eee;color: black;padding-left: 1%;border: 1px solid black;">

                            <div class="row-fluid justify-content-center mb-1 mt-3" >
                                <div class="col-sm-12 pl-0 ct_calcule">
                                    <strong style="color: black">CT</strong> = <input value="0" min="0" class="frm_cal inp_cu_ct" type="number" placeholder="Cu" >
                                    * <input class="frm_cal inp_q2_ct" value="0" min="0" type="number" placeholder="Q" >
                                    * <input value="0" min="0" class="frm_cal inp_d_ct" type="number" placeholder="D" >
                                    &nbsp; <button class="btn btn-sm btn-success" onclick="calculer2()" ><spring:message code="button.Calculer"/></button>
                                    <br>
                                    <div class="zone_resul">
                                        <span class="disp_none resultat_calcul2_ct"><strong style="color: black;">CT</strong> = <p class="res2_ct d-inline" id="res2_ct">  </p></span>
                                    </div>

                                </div>
                            </div>

                            <div class="row-fluid justify-content-center mb-5 mt-3">
                                <div class="col-sm-12 pl-0 gf_calcule">
                                    <strong style="color: black">GF</strong> = <input value="0" min="0" class="frm_cal inp_ct_gf" width="20%" type="number" placeholder="CT" >
                                    + <input class="frm_cal inp_ctr_gf" value="0" min="0" type="number" placeholder="CTR" > + <input value="0" min="0" class="frm_cal inp_cs_gf" type="number" placeholder="Cs">
                                    * <input class="frm_cal inp_q_gf" value="0" min="0" type="number" placeholder="Q" > * 1,2 &nbsp; <button class="btn btn-sm btn-success" onclick="calculer()" style="margin-top: 10px"><spring:message code="button.Calculer"/></button>
                                    <br>
                                    <div class="zone_resul_2">
                                        <span class="disp_none"><strong style="color: black">GF</strong> = <p class="res2_gf d-inline">  </p></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                        ${(not empty d.description)?d.description:"Aucune Descritpion"}
                    <c:if test="${not empty d.uri}">
                        <p>Liens de l'exemplaire: <a href="${Admin_url}${fn:replace(d.uri,"/assets/myFile/","/dowload_uploaded/")}">cliquer ici</a></p>
                    </c:if>
                </div>
            </c:forEach>
        </c:if>

    </c:when>
    <c:when test="${show=='procedure'}">
        <style>
            .select2-results__option{
                text-align: left;
            }
        </style>
        <div class="row-fluid d-none border p-2 bg-white" id="dev_step">
            <p class="text-center h4 w-100 font_bold">
                    <%--<spring:message code="option.Procedureasuivrepourobtenir"/>--%>
                <c:choose>
                    <c:when test="${type=='ZF'}">
                        <c:set var="l_ph1" value=" d'importation des déchets d'une zone franche "/>
                    </c:when>
                    <c:when test="${type=='ET'}">
                        <c:set var="l_ph1" value=" d'importation des déchets non dangereux d'un pays étranger "/>
                    </c:when>
                    <c:when test="${type=='CT'}">
                        <c:set var="l_ph1" value=" de collecte - transport des déchets dangereux "/>
                    </c:when>
                    <c:when test="${type=='IT'}">
                        <c:set var="l_ph1" value=" d'installation de traitement des déchets "/>
                    </c:when>
                    <c:when test="${type=='XD'}">
                        <c:set var="l_ph1" value=" d'exportation des déchets "/>
                    </c:when>
                    <c:when test="${type=='TR'}">
                        <c:set var="l_ph1" value=" de transit des déchets "/>
                    </c:when>
                    <c:when test="${type=='EIE'}">
                        <c:set var="l_ph1" value=" d'étude d'Impact sur l’Environnement "/>
                    </c:when>
                    <c:when test="${type=='EIE1'}">
                        <c:set var="l_ph1" value=" de transit des déchets "/>
                        <spring:message code="option.Noticedimpact" var="l_ph1"/>
                    </c:when>
                    <c:when test="${type=='EIE2'}">
                        <c:set var="l_ph1" value=" de transit des déchets "/>
                        <spring:message code="option.Auditenvironnementale" var="l_ph1"/>
                    </c:when>
                </c:choose>
                Procédure à suivre pour obtenir votre demande d'autorisation ${l_ph1}

            </p>
            <div class="col-2 p-0">
                <button class="btn btn-success btn-block" onclick="show_etape_normal()"><span
                        class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/></button>
            </div>
            <div class="col-sm-12 p-4 mt-4">
                <div class="row p-0 justify-content-center">

                    <div class="col-12">
                        <hr class="p_absolute_top">
                        <div class="row p-0 justify-content-center">
                            <div class="col-2 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="Créer votre Compte"
                                        class="p-3 rounded-circle btn btn-success btn_step_perso btn_step_perso1"
                                        onclick="show_zone2('z_compt',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/cadnat.png">
                                </button>
                            </div>

                            <div class="col-2 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="Saisir votre demande"
                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso2"
                                        onclick="show_zone2('saisie',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                </button>
                            </div>

                            <div class="col-2 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="Attacher vos Fichier"
                                        data_type="${type}"
                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                        onclick="show_zone2('attache',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/attache_file.png">
                                </button>
                            </div>
                            <div class="col-2 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="Traitement de ma demande"
                                        class=" rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                        onclick="show_zone2('suivre',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                                </button>
                            </div>
                            <div class="col-2 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="Recevoir votre document E-signé"
                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                        onclick="show_zone2('recevoir',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/img_doc_ok.png">
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row clss_hide mt-5 z_compt">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold"><spring:message
                                        code="label.jecreemoncompte"/></p>
                                <c:choose>
                                    <c:when test="${type=='EIE'}">
                                       <p>Pour déposer votre demande d’obtention de l’acceptabilité environnementale de votre projet, vous êtes invités à créer un compte en remplissant le formulaire <a
                                               href="/demandez_compte" class="h5 text-primary font_bold">
                                           <spring:message code="label.SuivantA"/></a></p>
                                        <p>Votre identifiant et votre mot de passe seront générés automatiquement par le système et vous seront communiqués via l’email que vous avez fourni dans le formulaire d'inscription.</p>
                                        <p>Votre compte va vous permettre, en plus de déposer vos demandes, de bénéficier le leur suivi en temps réel.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p><spring:message code="label.IlvousfautauprealableCreerun"/> <a
                                                href="/demandez_compte" class="h5 text-primary font_bold">
                                            <spring:message code="label.SuivantA"/></a></p>
                                        <p><spring:message code="label.passeserontgeneres"/></p>
                                        <p><spring:message code="label.Votrecomptevavouspermettre"/></p>
                                    </c:otherwise>
                                </c:choose>





                            </div>
                        </div>

                        <div class="row clss_hide mt-5 saisie collapse">
                            <div class="col-12">

                                <p class="text-success h-4 font_bold">
                                    <c:choose>
                                        <c:when test="${type=='EIE'}">
                                            Je dépose ma demande d’obtention de l’acceptabilité environnementale
                                        </c:when>
                                        <c:otherwise>
                                            Je dépose ma demande d'autorisation ${l_ph1}
                                        </c:otherwise>
                                    </c:choose>

                                </p>
                                <c:if test="${type=='ZF' || type=='XD'}">
                                    <p>
                                        <img src="${pageContext.request.contextPath}/assets/images/warning.png"
                                             style="width: 40px;margin-left: 10px">
                                        Pour déposer une demande d'autorisation ${l_ph1},
                                        il faut disposer au préalable d'un numéro de notification
                                    </p>
                                    <p>
                                        Après la création de votre compte, vous pouvez faire la demande d'un numéro
                                        de notification en replissant le formulaire cette demande en veillant à renseigner tous les champs du formulaire
                                    </p>
                                    <p>
                                        A la fin vous avez la possibilité soit de déposer votre demande en cliquant sur le
                                        bouton "Continuer !" du message de confirmation de la création de votre demande,
                                        qui vas vous rediriger vers un nouveau formulaire de dépos des demandes d'autorisation ${l_ph1},
                                        ou bien vous avez la possibilité de terminer l'enregistrement de votre demande de numeros de notification
                                        pour ainsi déposé votre demande de d'autorisation ${l_ph1} dans une date ultérieure.
                                    </p>
                                </c:if>
                                <c:if test="${type=='EIE'}">
                                    <p>Vous pouvez déposer votre demande d’obtention de l’acceptabilité environnementale :</p>

                                    <ul class="mt-3">
                                        <li class="pl-2"> - Soit en remplissant le formulaire de renseignement préalable. Ce formulaire une fois validé, vous permettra de déposer votre demande d’obtention de l’acceptabilité environnementale ;</li>
                                        <li class="pl-2"> - Ou en déposant directement votre demande sans remplir le formulaire de renseignement préalable *. </li>
                                    </ul>
                                    <p class="mb-3">Le formulaire de renseignement préalable vous permettra de vérifier si votre projet est assujetti ou non à la procédure des EIE. Il vous permettra également de prendre connaissance du niveau d’examen de ladite EIE (Comité National des Etudes d’Impacts ou Commission Régionale Unifiée d’Investissement). </p>
                                    <p><i>*La demande de renseignement préalable est facultative dans le cas d'une nouvelle demande d’obtention de l’acceptabilité environnementale. </i></p>
                                    <p>Le formulaire de renseignement préalable vous permettra de vérifier si votre projet est assujetti ou non à la procédure des EIE. Il vous permettra également de prendre connaissance du niveau d’examen de ladite EIE (Comité National des Etudes d’Impacts ou Commission Régionale Unifiée d’Investissement). </p>
                                </c:if>
                                <c:if test="${type!='EIE'}">
                                    <p>
                                        <c:if test="${type=='ZF' || type=='XD'}">
                                            après l'obtention du numéro de notification
                                        </c:if>
                                        Ainsi vous pouvez déposer une nouvelle demande d'autorisation ${l_ph1}, en replissant le formulaire de dépôt de la demande en veillant
                                        à renseigner tous les champs du formulaire, et aussi les pièces à scanner et à les envoyer au niveau du système:
                                    </p>
                                </c:if>


                                <c:if test="${type=='ZF'|| type=='XD'}">
                                    <p class="text-underline text-success font_bold mt-3">
                                        Le choix du transporteur :
                                    </p>
                                    <p>
                                        Dans le cas des déchets Dangereux, vous pouvez Déclarer votre transporteurs
                                        depuis une liste mise a votre disposition.
                                    </p>
                                    <p>
                                        Si vous disposez d'un code de déchets ou du type de déchets, vous pouvez vérifier les transporteurs qui prennent en charge le type de déchets voulu.
                                    </p>
                                    <div class="row justify-content-start">
                                        <div class="col-md-3 col-sm-12">
                                            <p>Rechercher le déchets par :</p>
                                        </div>
                                        <div class="col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <input type="radio" value="code" name="code" checked> Code de déchets
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <input type="radio" value="type" name="code" > Type de déchets
                                            </div>
                                        </div>

                                        <div class="col-4 text-left" id="dechet_code">
                                            <label>Code de déchets </label>
                                            <select dir="ltr" class="select2 form-control" onchange="rech_transporteur(this)">
                                                <option> Choisir...</option>
                                                <c:forEach items="${codes}" var="c">
                                                    <option value="${c.id_code}"> ${c.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-12 text-left d-none" id="dechet_type">
                                            <label>Type de déchets </label>
                                            <select class="select2 form-control " onchange="rech_transporteur(this)">
                                                <option> Choisir...</option>
                                                <c:forEach items="${codes}" var="c">
                                                    <option value="${c.id_code}"> ${c.nom_ar}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-12 mt-2" id="tab_transporteur">
                                            <table class="table table-striped table-bordered d-none">
                                                <thead class="bg_stat_01">
                                                <tr>
                                                    <th>Nom</th>
                                                    <th>téléphone</th>
                                                    <th>Email</th>
                                                    <th>Fax</th>
                                                </tr>
                                                </thead>
                                                <tbody>


                                                <tr class="text-center">
                                                    <td colspan="4">Aucun transporteur</td>
                                                </tr>


                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <p>
                                        Et si vous n'avez pas un code de déchets, vous pouvez vérifier les transporteurs qui prennent en charge le type de déchets dans la liste suivante <a href="/CatalogueDesDechet" class="btn btn-primary rounded-circle btn-sm"> <span class="fa fa-arrow-right"></span></a>.
                                    </p>


                                </c:if>
                            </div>
                        </div>

                        <div class="row clss_hide mt-5 attache collapse">
                            <div class="col-12">

                                <p class="text-underline text-success font_bold">
                                    Les pièce à scanner :
                                </p>

                                <p>
                                    <img src="${pageContext.request.contextPath}/assets/images/warning.png"
                                         style="width: 40px;margin-left: 10px">
                                    les Documents à scanner et envoyer au niveau du système doivents être obligatoirement au format d'un fichier Word ou PDF
                                </p>
                                <c:if test="${type=='ZF' || type=='XD'}">
                                    <div class="row mb-3">
                                        <div class="col-auto pt-1 pr-0">
                                            List des pièces a fournir pour les de déchets
                                        </div>
                                        <div class="col-3">
                                            <select class="form-control" onchange="afficher_accord(this)">
                                                <option selected value="1">Dangereux</option>
                                                <option value="2">Non Dangereux</option>
                                            </select>
                                        </div>
                                    </div>
                                </c:if>


                                <div id="accordion">
                                    <h3>Test</h3>
                                    <div>
                                        desciption
                                    </div>
                                </div>
                                <c:if test="${type=='CT' || type=='IT'}">
                                    <p class="text-underline text-success font_bold mt-3">
                                        Nombre de Demande Déposé :
                                    </p>
                                    <p>
                                        Chaque compte peux déposé une seule demande d'autorisation ${l_ph1} renouvlable
                                        uniquement si la date de validation de la demande est proche de la date de péremption
                                    </p>
                                    <c:if test="${type=='CT'}">
                                        <p>Dans le cas demande d'autorisation ${l_ph1} vous avez la possibilité d'ajouter ou de modifer un ou plusieurs déchets/Vehicules</p>
                                    </c:if>
                                </c:if>



                            </div>
                        </div>

                        <div class="row clss_hide mt-5 recevoir collapse">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold">
                                    <c:choose>
                                        <c:when test="${type=='EIE'}">
                                            Je récupère ma demande d’obtention de l’acceptabilité environnementale
                                        </c:when>
                                        <c:otherwise>
                                            Je récupère mon autorisation ${l_ph1}
                                        </c:otherwise>
                                    </c:choose>
                                </p>

                                <c:choose>
                                    <c:when test="${type=='EIE'}">
                                        <p>A la fin du processus de traitement de votre demande d’obtention de l’acceptabilité environnementale, une notification vous sera envoyé, vous invitant à retirer l’acceptabilité environnementale de votre projet.</p>
                                        <p style="font-size: 11px"><b>L’acceptabilité environnementale doit être retirée par son demandeur.</b></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>
                                            A la fin du processus de traitement de votre demande ${l_ph1},
                                            vous seriez notifié par email de la date
                                            à partir de laquelle vous pouvez récupérer votre demande d'autorisation
                                        </p>
                                        <p>
                                            La récupération de l’autorisation signée est tributaire de dépôt de la caution signée
                                        </p>
                                        <p>
                                            L'autorisation ${l_ph1} doit être retiré personnellement par son titulaire
                                        </p>
                                        <p>
                                            Les autorisations ${l_ph1} non retirées par
                                            leurs propriétaires dans un délai de deux mois à compter de leur date de notification
                                            sont annulées et détruites.
                                        </p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="row clss_hide mt-5 suivre collapse">
                            <div class="col-12">

                                <p class="text-underline text-success font_bold mt-3">
                                    Les etapes et les acteurs impliqués dans le traitement de mon dossier
                                </p>

                                <c:choose>
                                    <c:when test="${type=='EIE'}">
                                        <div class="mb-3">
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/images/EIE_organigrame.png.png" >
                                            <img src="${pageContext.request.contextPath}/assets/images/EIE_organigrame.png" width="100%"></a>
                                        </div>
                                        <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif">Statuts du dossie</th>
                                                <th class="text-underline bold text-center font_time_serif">Détails</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En attente de vérification </td>
                                                <td class="font_time_serif size_12">Le Secrétariat du Comité National des Etudes d’Impact (CNEI) vérifie les informations fournies dans le formulaire du « renseignement préalable ».</td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> En attente du dépôt de l’EIE et du PSSE </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à déposer l’EIE et le CC de son projet pour examen par le CNEI. </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> En attente des conclusions de l’EP  </td>
                                                <td class="font_time_serif size_12">Le Secrétariat du CNEI ne programme la réunion d’examen de l’EIE qu’après réception des fichiers demandés au pétionnaire et les conclusions de l’enquête publique transmises par les autorités locales des régions concernées par le projet. </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> Réunion programmée </td>
                                                <td class="font_time_serif size_12">Le Secrétariat du CNEI informe les membres du CNEI et le pétitionaire et/ou son bureau d’études de la date, de l’heure et de l’objet de la réunion d’examen de l’EIE.</td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> En attente du complément d’étude de l’EIE</td>
                                                <td class="font_time_serif size_12">Le pétitionnaire est invité à déposer le complément de l’EIE et le CC pour réexamen par le CNEI , en se basant sur les remarques soulevées lors de la réunion d’examen de son projet.</td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> En attente des versions définitives de l’EIE  </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à déposer la version définitive de l’EIE et du PSSE de son projet acceptable de point de vue environnementale. </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> Arrêt d’examen </td>
                                                <td class="font_time_serif size_12"> Les conditions d’examen de l’EIE par le CNEI ne sont pas réunies. </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> Délivranfce de l’Acceptabilité ou de la Non Acceptabilité Environnementale  </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à retirer la Décision d’Acceptabilité ou de la Non Acceptabilité Environnementale de son projet. </td>
                                            </tr>



                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:when test="${type=='ZF'}">
                                        <a target="_blank" href="${pageContext.request.contextPath}/assets/images/ETAP.PNG">
                                            <img src="${pageContext.request.contextPath}/assets/images/etape10.png"></a>
                                    </c:when>



                                    <c:otherwise>
                                        <table id="table_acteur" class="table table-striped table-bordered table-hover my_table">
                                            <thead class="bg_stat_01">
                                            <tr>
                                                <th><spring:message code="label.Acteur"/></th>
                                                <th><spring:message code="label.Delais"/></th>
                                                <th><spring:message code="label.Statut"/></th>
                                                <th><spring:message code="label.Detail"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><spring:message code="label.Ministere"/></td>
                                                <td><spring:message code="label.jours"/></td>
                                                <td><spring:message code="label.EnAttente"/></td>
                                                <td>
                                                    <spring:message code="label.Danscetteetapevotredossierestredirige"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><spring:message code="label.Demandeur"/></td>
                                                <td> -</td>
                                                <td><spring:message code="label.demandedecomplement"/></td>
                                                <td>
                                                    <spring:message code="label.Danscetteetapevotredossierestincomplet"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><spring:message code="label.Commission"/></td>
                                                <td><spring:message code="label.jours"/></td>
                                                <td><spring:message code="label.AvisCommission"/></td>
                                                <td><spring:message code="label.leservicedecommission"/></td>
                                            </tr>
                                            <tr>
                                                <td><spring:message code="label.Ministere"/></td>
                                                <td><spring:message code="label.jours"/></td>
                                                <td><spring:message code="label.Favorable"/></td>
                                                <td><spring:message code="label.servicespecialise"/></td>
                                            </tr>
                                            </tbody>

                                        </table>
                                    </c:otherwise>
                                </c:choose>

                                <p class="text-success h-4 font_bold mt-3">
                                    Suivre mon dossier
                                        <%-- <spring:message code="label.Jefaislesuividemademandeenligne"/>--%>
                                </p>
                                <c:choose>
                                    <c:when test="${type=='EIE'}">
                                        <p>Vous pouvez suivre l’état d’avancement de votre demande à partir de la rubrique « Statut du Dossier». Pour cela, vous devez saisir le numéro de votre dossier de demande d’obtention de l’acceptabilité environnementale. Vous recevrez également un email sur l’état d’avancement de votre demande.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>
                                            Vous pouvez suivre l’évolution du traitement de votre ${l_ph1} à partir de la rubrique «Statut
                                            du Dossier». Pour cela, vous devez saisir le numéro de votre dossier de demande d'autorisation ${l_ph1}
                                        </p>
                                        <p>
                                            Aussi vous recevrez également un email lors d'évolution d'état de votre
                                            dossier de demande d'autorisation ${l_ph1}
                                        </p>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>

                        <div class="row clss_hide mt-3 suivre collapse">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold">
                                    Base juridique
                                </p>
                                <ul class="list_disque ml-5">
                                    <c:if test="${type=='XD' || type=='ZF'}">
                                        <li>
                                            Décret n° 2-14-85 du 20 janvier 2015 relatif à la gestion des déchets dangereux
                                            <a target="_blank" download="Décret.docx" href="${pageContext.request.contextPath}/assets/file/decret.docx">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_word.png" width="40px">
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${type=='EIE'}">
                                        <li>
                                            Loi n° 12-03 relative aux études d'impact sur l'environnement
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Lois_N12_03.pdf.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Loi n°47-18 portant réforme des Centres Régionaux d'Investissement
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Lois_N47_18.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Loi n°49-17 relative à l’Evaluation Environnementale
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Lois_N49_17.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEI et des CREI
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Decret_n_2_04_563.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Décret n°2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Decret_n_2_04_564.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Référentiel des études d’impact sur l’environnement
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Referentiel_EIE.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Directives
                                        </li>
                                        <div class="ml-4 size_12">
                                            1.	Projet de création des unités industrielles
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Unites_Industrielles.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            2.	Projet d’aménagement des zones industrielles
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Zones_Industrielles.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            3.	Projet de décharge contrôlée
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_Decharges_controlees.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            4.	Projet aquacole
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Projets_aquacoles.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            5.	Projet d’une Station d’Epuration des Eaux Usées
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_epuration_eau_usees.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            6.	Projet d’extraction de matériaux de construction
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Extraction_materiaux_construction.pdf">
                                            <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>

                                        </div>
                                    </c:if>
                                </ul>

                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <div class="row-fluid border d-none bg-white" id="dev_list_slc">
            <div class="col-12">
                <p class="h3 font_bold w-100 text-center p-4"><spring:message
                        code="label.Preparezvotredemarche"/></p>
            </div>
            <div class="col-12 p-0 m-0  bg-light border">
                <div class="row p-0 m-0">
                    <div class="col-12 ">
                        <p class="font_bold p-3 mb-0"><spring:message code="label.Jesouhaitefaireunedemandedautorisation"/> : </p>
                    </div>

                </div>
            </div>


            <div class="col-12 border" id="autorisation_groupe">
                <div class="row p-0 m-0 mt-3">
                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message code="label.Importationdechetszonefranche"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('ZF')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message
                                            code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('ET')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center ">
                                    <spring:message
                                            code="label.Collectetransportdesdechetsdangereux"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('CT')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row p-0 m-0 mt-3 mb-3">
                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message
                                            code="label.Installationdetraitementdesdechets"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('IT')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message code="label.Exportationdesdechetsdangereux"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('XD')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center ">
                                    <spring:message code="label.Transitdesdechets"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('TR')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 border" id="EIE_groupe">
                <div class="row p-0 m-0 mt-3">
                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center ">
                                    <spring:message code="option.Etudedimpactenvironnementale"/>
                                </h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('EIE')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message code="option.Auditenvironnementale"/>
                                </h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('EIE2')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message code="option.Noticedimpact"/>
                                </h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('EIE1')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $("input[name=code]").off().on("change",function(){
                var id = $(this).val();
                if(id=='type'){
                    $("#dechet_code").addClass("d-none");
                    $("#dechet_type").removeClass("d-none");
                }else{
                    $("#dechet_type").addClass("d-none");
                    $("#dechet_code").removeClass("d-none");
                }
            });
        </script>
    </c:when>
</c:choose>




