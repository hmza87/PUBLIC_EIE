package com.EIE.demo.web;

import com.EIE.demo.dao.DocumentRepository;
import com.EIE.demo.dao.EntrepriseRepo;
import com.EIE.demo.dao.ImportateurNotifiantRepo;
import com.EIE.demo.dao.NotificationRepository;
import com.EIE.demo.dataService.GenerateWordDocuments;
import com.EIE.demo.dataService.RestResponsePage;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class Notification_Controler {
	@Value("${url}")
	private String urlRest;

	@Autowired
	private WebService web;
	@Autowired
	private SecurityService web2;

	@Autowired
	private NotificationRepository notificationRepository;

	@Autowired
	private EntrepriseRepo entrepriseRepo;

	@Autowired
	private ImportateurNotifiantRepo importateurNotifiantRepo;

	@Autowired
	private DocumentRepository documentRepository;


	@RequestMapping(value = "/api/addNumNotification/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView addNotification(@PathVariable String type,@PathVariable int id) {
		Compte ct = web.getCompteConnected();
		

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("id",id);
		if(id!=0) {
			model.put("notif",web.getNotiifcationById(id));
		}
		model.put("user", ct);
		model.put("type", type);
		Object[] zonnefranche = web.tronsaction("select", " id_zonnefranche,nom_fr,nom_ar from zonnefranche ",
				" delete_date_time is null ");
		Object[] pays = web.tronsaction("select", " pays_id,nom_fr,nom_ar from pays ", " delete_date_time is null ");
		if (type.equals("ZF")) {
			model.put("zonnefranche", zonnefranche);
			model.put("champsZf_ET", "Zone franche");
		} else {
			model.put("zonnefranche", pays);
			model.put("champsZf_ET", "Pays");
		}

		Object[] unite_id = web.tronsaction("select", " unite_id,nom_fr,nom_ar from unite ",
				" delete_date_time is null ");
		model.put("unite_id", unite_id);
		Object[] classification = web.tronsaction("select", " id_classification,nom_fr,nom_ar  from classification ",
				" delete_date_time is null ");
		model.put("classification", classification);

		return new ModelAndView("autorisationPublic/addNumNotification", model);
	}

//    add nouvelle Installation

	@RequestMapping(value = "/api/addInstallation/{id}/{typeRenv}", method = RequestMethod.GET)
	public ModelAndView addInstallation(@PathVariable int id,@PathVariable String typeRenv) {
		Compte ct = web.getCompteConnected();
		Map<String, Object> model = new HashMap<String, Object>();
		List<CategorieDechet> categories = web.getListCategorieDechet();
		model.put("doc", web.listDocImportByType(1,"IT"));
		model.put("typeRenv",typeRenv);
		if(id!=0) {
			Installation is=web.getInstalById2(id,web.getCompteConnected().getCompteId(),typeRenv);
			model.put("notif", is);
			model.put("id", id);
		}
		else {
			model.put("id", id);
		}
		model.put("categories", categories);
		model.put("user", ct);
		model.put("url_admin",urlRest);
		Object[] activite = web.tronsaction("select", "  id_nature_activite, nom_fr, nom_ar FROM nature_activite",
				" delete_date_time is null ");
		//Object[] code = web.tronsaction("select", " id_code,nom_fr,nom_ar from code ",
		//		" delete_date_time is null and id_classification='1' ");

		Object[] unite_id = web.tronsaction("select", " unite_id,nom_fr,nom_ar from unite ",
				" delete_date_time is null ");
		model.put("unite_id", unite_id);
		model.put("activite", activite);
		List<Code> code = web.getListcodeTab();
		model.put("code", code);
		ListDocNotif[] cc = web.listDocNotif(id,"IT");
		model.put("docNotify",cc);
		return new ModelAndView("installation/addInstallation", model);
	}

	@RequestMapping(value = "/api/addDemandNotification/{id}/{type}/{typeRenouv}", method = RequestMethod.GET)
	public ModelAndView addDemandNotification(@PathVariable int id, @PathVariable String type,@PathVariable String typeRenouv) {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("type", type);
		model.put("typeRenouv",typeRenouv);
		model.put("user", ct);
		Object[] zonnefranche = web.tronsaction("select", " id_zonnefranche,nom_fr,nom_ar from zonnefranche ",
				" delete_date_time is null ");
		LieuElimination[] lieuArr = web.getLieuEliminationArr();
		model.put("lieuElimination",lieuArr);
		Object[] pays = web.tronsaction("select", " pays_id,nom_fr,nom_ar from pays ", " delete_date_time is null ");
		if (type.equals("ZF")) {
			model.put("zonnefranche", zonnefranche);
			model.put("champ_zf_et", "Zone franche");
		} else {
			model.put("zonnefranche", pays);
			model.put("champ_zf_et", "Pays Etranger");
		}

		Object[] type_conditionement = web.tronsaction("select",
				" type_conditionement_id,nom_fr,nom_ar from type_conditionement ", " delete_date_time is null ");
		model.put("type_conditionement", type_conditionement);
		Object[] caracteristiquephysique = web.tronsaction("select",
				" id_classification,nom_fr,nom_ar from caracteristiquephysique ", " delete_date_time is null ");
		model.put("caracteristiquephysique", caracteristiquephysique);
		Object[] unite_id = web.tronsaction("select", " unite_id,nom_fr,nom_ar from unite ",
				" delete_date_time is null ");
		model.put("unite_id", unite_id);
		Object[] classification = web.tronsaction("select", " id_classification,nom_fr,nom_ar  from classification ",
				" delete_date_time is null ");
		
		Object[] prefectures = web.tronsaction("select", " id_prefecture,nom_fr,nom_ar  from prefecture ",
				" delete_date_time is null ");
		
		Object[] region = web.tronsaction("select", " region_id,nom_fr,nom_ar  from region ",
				" delete_date_time is null ");
		model.put("classification", classification);
		model.put("region", region);
		model.put("prefectures", prefectures);

		Object[] eliminateur = web.tronsaction("select", "  * from eliminateur  ", " delete_date_time is null ");
		model.put("eliminateur", eliminateur);
		Object[] moyen_transport = web.tronsaction("select",
				"  id_moyen_transport, nom_fr, nom_ar FROM moyen_transport  ", " delete_date_time is null ");
		model.put("moyen_transport", moyen_transport);
		Object[] operation_el = web.tronsaction("select", "  id_operation, nom_fr, nom_ar FROM operation  ",
				" delete_date_time is null and type ='ELIMINATION' ");
		model.put("operation_el", operation_el);
		Object[] operation_va = web.tronsaction("select", "  id_operation, nom_fr, nom_ar FROM operation  ",
				" delete_date_time is null and type ='VALORISATION' ");
		model.put("operation_va", operation_va);
		Object[] operation_codeh = web.tronsaction("select", "  id_operation, nom_fr, nom_ar FROM operation  ",
				" delete_date_time is null and type ='Code_H' ");
        /*Object[] doc = web.tronsaction("select", "  id_doc_import, nom_fr, nom_ar from  DocImport    ", " delete_date_time is null  ");*/



		model.put("operation_codeh", operation_codeh);
		model.put("url_Admin", urlRest);
		Notification notif =null;
		if (id == 0) {
			model.put("disabled", "");
			model.put("disabledBtnTab", "disabled");
			model.put("doc",web.getDocImportByType(type));
		} else {
			int idCode = web.getNotiifcationById(id).getCode().getId_code();

			Object[] Transporteur_liste = web.tronsaction("select",
					" transporteurparam.id_transporteur_param, transporteurparam.nom,transporteur_param_code.id_code, transporteurparam.tel FROM transporteurparam INNER JOIN transporteur_param_code ON transporteurparam.id_transporteur_param = transporteur_param_code.id_transporteur_param ",
					" transporteurparam.delete_date_time is null and id_code =" + idCode
							+ " and transporteurparam.id_transporteur_param not in(select id_transporteur from notif_tranport where id_notification = "
							+ id + ") ");
			model.put("Transporteur_liste", Transporteur_liste);

			model.put("disabledBtnTab", "");
			notif = web.getNotiifcationById(id);
			model.put("disabled", notif.getStatut().getId_statut_projet()!=48?"disabled":"");
			model.put("docExiste", web.listDocNotif(id,type));
			model.put("doc", web
					.listDocImportByType(web.getNotiifcationById(id).getClassification().getId_classification(), type));
		}

		model.put("notification", notif);

		return new ModelAndView("autorisationPublic/addDemandNotification", model);
	}

	@RequestMapping(value = "/api/getNotificationById/{id}", method = RequestMethod.GET)
	public @ResponseBody Notification getNotificationById(@PathVariable int id) {
		return web.getNotiifcationById(id);
	}

	@RequestMapping(value = "/api/select_Import", method = RequestMethod.GET)
	public ModelAndView select_Import() {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", ct);
		return new ModelAndView("notification/notification", model);
	}

	@RequestMapping(value = "/demandez_compte", method = RequestMethod.GET)
	public ModelAndView demandez_compte() {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		if(ct!=null){

				Compte ctr = web.oneCompte(ct.getCompteId());
				model.put("societe", ctr);
				model.put("id", ct.getCompteId());

		}
		 else {
			model.put("id", null);
		}
		Object[] secteur = web.tronsaction("select", "  id_secteur,nom_fr,nom_ar from secteur ",
				" delete_date_time is null ");
		model.put("secteur", secteur);
		model.put("user", ct);
		return new ModelAndView("demandez_compte/demandez_compte", model);
	}

	@RequestMapping(value = "/api/getMenu", method = RequestMethod.GET)
	public ModelAndView getMenu() {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", ct);
		return new ModelAndView("espace_client/espace_client", model);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "login";
	}

	@RequestMapping(value = "/verification", method = RequestMethod.GET)
	public ModelAndView verification() {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", ct);
		return new ModelAndView("demandez_compte/verification", model);
	}

	@RequestMapping(value = "/api/ListeAutorisation/{type}/{me}", method = RequestMethod.GET)
	public ModelAndView stockage_affich(@PathVariable String type, @PathVariable String me) {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();

		model.put("type", type);
		ResponseEntity<RestResponsePage<Notification>> h = web.getListNotiifcationByCompte(new PageRequest(0, 100),
				ct.getCompteId(), me, type);

		if (h.getBody() != null) {

			List<Notification> searchResult = h.getBody().getContent();

			model.put("notif", searchResult);
			model.put("total", h.getBody().getTotalElements());

			model.put("number", h.getBody().getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getBody().getTotalPages());
			model.put("size", h.getBody().getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("user", ct);
		return new ModelAndView("autorisationPublic/ListeAutorisation", model);
	}

	@RequestMapping(value = "/api/ListeAutorisationDemande/{type}/{types}", method = RequestMethod.GET)
	public ModelAndView ListeAutorisationDemande(@PathVariable String type, @PathVariable String types) {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("type", type);

		ResponseEntity<RestResponsePage<Notification>> h = web.getListNotiifcationByCompte(new PageRequest(0, 100),
				ct.getCompteId(), types, type);

		if (h.getBody() != null) {

			List<Notification> searchResult = h.getBody().getContent();

			model.put("notif", searchResult);
			model.put("total", h.getBody().getTotalElements());

			model.put("number", h.getBody().getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getBody().getTotalPages());
			model.put("size", h.getBody().getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("user", ct);
		return new ModelAndView("autorisationPublic/ListeAutorisationDemande", model);
	}

	@RequestMapping(value = "/api/ListeAutorisation_card/{type}/{types}", method = RequestMethod.GET)
	public ModelAndView ListeAutorisation_card(@PathVariable String type, @PathVariable String types) {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("type", type);

//		ResponseEntity<RestResponsePage<Notification>> h = web.getListNotiifcationByCompte(new PageRequest(0, 100),
//				ct.getCompteId(), type, types);
//
//		if (h.getBody() != null) {
//
//			List<Notification> searchResult = h.getBody().getContent();
//
//			model.put("notif", searchResult);
//			model.put("total", h.getBody().getTotalElements());
//
//			model.put("number", h.getBody().getNumber());
//			model.put("page", 0);
//			model.put("totalPage", h.getBody().getTotalPages());
//			model.put("size", h.getBody().getSize());
//
//		} else {
//			model.put("totalPage", 0);
//		}

		model.put("user", ct);
		return new ModelAndView("autorisationPublic/ListeAutorisation_card", model);
	}
	
	@RequestMapping(value = "/api/ListeEIE_card", method = RequestMethod.GET)
	public ModelAndView ListeEIE_card() {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		

		model.put("user", ct);
		return new ModelAndView("demande_eie/ListeEIE_card", model);
	}




// list des insallations 

	@RequestMapping(value = "/api/ListInstallation", method = RequestMethod.GET)
	public ModelAndView ListInstallation() {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();

		ResponseEntity<RestResponsePage<Installation>> h = web.getListInstallationByCompte(new PageRequest(0, 100),
				ct.getCompteId());

		if (h.getBody() != null) {
			List<Installation> searchResult = h.getBody().getContent();
			model.put("notif", searchResult);
			model.put("url", urlRest);
			model.put("total", h.getBody().getTotalElements());
			model.put("number", h.getBody().getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getBody().getTotalPages());
			model.put("size", h.getBody().getSize());
		} else {
			model.put("totalPage", 0);
		}

		model.put("user", ct);
		return new ModelAndView("installation/listInstallation", model);
	}

	
	@RequestMapping(value = "/api/infoInstallation/{id}", method = RequestMethod.GET)
	public ModelAndView infoInstallation(@PathVariable int id) {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		ListDocNotif[] doc=web.listDocNotif(id,"IT");
		Installation i = web.getInstalById(id,web.getCompteConnected().getCompteId());
		model.put("url_Admin", urlRest);
		model.put("intalation", i);
		model.put("user", ct);
		model.put("doc", doc);
		return new ModelAndView("installation/infodocInstalation", model);
	}
	
	@RequestMapping(value = "/addSociete/{id}", method = RequestMethod.POST)
	public @ResponseBody String addSociete(@RequestBody Societe se,@PathVariable int id) {
		String identifiant=web.addSociete(se, id);


		return identifiant;
	}

	@RequestMapping(value = "/validate/{id}", method = RequestMethod.GET)
	public @ResponseBody String addSociete(@PathVariable int id) {
		web.verifierCompte(id);

		Map<String, Object> model = new HashMap<String, Object>();

		// return new ModelAndView("notification/notification", model);
		return "";
	}

	@RequestMapping(value = "chackmail/{email}", method = RequestMethod.GET)
	public @ResponseBody String chackmail(@PathVariable String email) {
		Compte ct = web.chackmail(email);
		String r = "1";
		if (ct == null) {
			r = "0";
		} else {
			r = "1";
		}

		return r;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginMe(Model model, @RequestParam(required = false) String j_name,
			@RequestParam(required = false) String j_pass) {

		if (j_name != null) {
			String s = web2.autologin(j_name, j_pass);

			

//            String email = cc.getEmail();
			if (s.equals("oui")) {
				Compte ct=web.getCompteConnected();
				if(ct.getSt()==null){
					return "redirect:/connexion";
				}
				else {
					if(ct.getSt().getEtat().equals("1")){
						return "redirect:/api/ListeEIE_card";
					}
					else if(ct.getSt().getEtat().equals("2")){
						return "redirect:/api/ListeAutorisation_card/ZF/d";
					}
					else {
						return "redirect:/api/getMenu?lang=fr";
					}
					
				}
				
			} else {
				return "redirect:/connexion";
			}

		} else {
			return "redirect:/connexion";
		}
	}

	// exécution des requêtes standard
	@RequestMapping(value = "/api/tronsactionCO/{opiration}/{table}/{filter}", method = RequestMethod.GET)
	public @ResponseBody Object[] tronsactionCO(@PathVariable String opiration, @PathVariable String table,
			@PathVariable String filter) {
		Object[] ct = web.tronsaction(opiration, table, filter);
		return ct;
	}

	@RequestMapping(value = "/api/add_notification/{table}/{id_notif}", method = RequestMethod.POST)
	public @ResponseBody String add_notification(@RequestBody Object se, @PathVariable String table,
			@PathVariable String id_notif) {
		String id = id_notif+"";
		id = web.addObject(se, table);
		if (!id_notif.equals("0")) {
			Object notif = new Object();
			HashMap<String, String> o = new HashMap<String, String>();
			if (!table.equals("importateurnotifiant")){
				o.put("id" + table, id + "");
			}else{
				o.put("idimportateur_notifiant", id + "");
			}
			notif = o;
			String idd = web.updateObject(notif, "notification", "id_notification = " + id_notif + "  ");
		}
		// return new ModelAndView("notification/notification", model);
		return id;
	}

	@RequestMapping(value = "/api/updateInstal/{table}/{id_notif}/{nameId}", method = RequestMethod.POST)
	public @ResponseBody String updateInstal(@RequestBody Object se, @PathVariable String table,
			@PathVariable String id_notif,@PathVariable String nameId) {

//		String id = web.addObject(se, table);

		if (!id_notif.equals("0")) {
			Object notif = new Object();
			HashMap<String, String> o = new HashMap<String, String>();
			o.put("id" + table, id_notif + "");
			notif = o;

			String idd = web.updateObject(se, table, nameId+" = " + id_notif + "  ");
		}

		// return new ModelAndView("notification/notification", model);
		return id_notif;
	}

	@RequestMapping(value = "/api/add_object_page/{table}/{page}/{id_t}", method = RequestMethod.POST)
	public @ResponseBody ModelAndView add_object_page(@RequestBody Object se, @PathVariable String table,
			@PathVariable String page, @PathVariable int id_t) {

		String id = web.addObject(se, table);

		Map<String, Object> model = new HashMap<String, Object>();
		Notification n = web.getNotiifcationById(id_t);
		model.put("notification", n);
		List<TransporteurParam> lp = web.getListTransporteurParamByCodeNotInNotif(n.getId_notification());
		/*Object[] Transporteur_liste = web.tronsaction("select",
				" transporteurparam.id_transporteur_param, transporteurparam.nom,transporteur_param_code.id_code, transporteurparam.tel FROM transporteurparam INNER JOIN transporteur_param_code ON transporteurparam.id_transporteur_param = transporteur_param_code.id_transporteur_param ",
				" transporteurparam.delete_date_time is null and id_code ="
						+ web.getNotiifcationById(id_t).getCode().getId_code()
						+ " and transporteurparam.id_transporteur_param not in(select id_transporteur from notif_tranport where id_notification = "
						+ id + ") ");
		model.put("Transporteur_liste", Transporteur_liste);*/
		model.put("Transporteur_liste", lp);
		page = page.replace('-', '/');

		return new ModelAndView(page, model);

	}

	@RequestMapping(value = "/api/updateObject/{table}/{id}", method = RequestMethod.POST)
	public @ResponseBody String updateObject(@RequestBody Object se, @PathVariable String table,
			@PathVariable String id) {

		String idd = web.updateObject(se, table, "  " +   id + "  ");

		
		return id;
	}

	@RequestMapping(value = "/api/add_notificationA", method = RequestMethod.POST)
	public @ResponseBody void add_notificationA(@RequestBody Notification se) {

		web.addNumNotification(se, "ha");

	}

	@RequestMapping(value = "/api/checknotif/{val}/{type}", method = RequestMethod.GET)
	public @ResponseBody String checknotif(@PathVariable String val, @PathVariable String type) {
		String rdrct;
		Map<String, Object> mdl = new HashMap<String, Object>();

		Notification notif = web.getNotiifcationByNumZFET(val, type);
//        EntrepriseValOuTrait entrprs = entrepriseValOuTraitRepo.findbynotif(val);
		if (notif == null) {
			rdrct = "0";
		} else {
			rdrct = notif.getId_notification() + "";
		}

		return rdrct;
	}

	@RequestMapping(value = "/api/checknotif2/{val}", method = RequestMethod.GET)
	public @ResponseBody String checknotif2(@PathVariable String val) {
		String rdrct;
		Map<String, Object> mdl = new HashMap<String, Object>();

		Notification notif = web.getNotiifcationByNum(val);
//        EntrepriseValOuTrait entrprs = entrepriseValOuTraitRepo.findbynotif(val);
		if (notif == null) {
			rdrct = "0";
		} else {
			rdrct = notif.getId_notification() + "";
		}

		return rdrct;
	}

	@RequestMapping(value = "/api/getNotificationByNum/{Num}", method = RequestMethod.GET)
	public ModelAndView getNotificationByNum(@PathVariable String num) {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", ct);

		model.put("nutif", web.getNotiifcationByNum(num));

		return new ModelAndView("autorisationPublic/addDemandNotification", model);
	}

	@RequestMapping(value = "/api/downloadRecuDepo/{id}", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> generateRecuDepoDossier(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "inline; filename=recu_" + id + ".pdf");

		ByteArrayInputStream bis;

		Notification n = web.getNotiifcationById(id);
		if (n != null) {
			bis = GeneratePDFDocuments.generateDocumentGeneraleDemandeNum(n);

			return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
					.body(new InputStreamResource(bis));

		}

		return null;

	}

	@RequestMapping(value = "/api/validateDoc/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView validateDoc(@PathVariable int id,@PathVariable String type) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("doc", web.listDocNotif(id,type));
		model.put("type", type);
		model.put("url_Admin", urlRest);
		model.put("id", id);

		return new ModelAndView("autorisationPublic/validationDoc", model);
	}
	
	@RequestMapping(value = "/api/validateDocInstall/{id}", method = RequestMethod.GET)
	public ModelAndView validateDocInstall(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("doc", web.listDocNotif(id,"IT"));
		model.put("url_Admin", urlRest);
		model.put("id", id);

		return new ModelAndView("installation/validationDoc", model);
	}
	@RequestMapping(value = "/checknotif_statu/{val}", method = RequestMethod.GET)
	public @ResponseBody String checknotifstatut(@PathVariable String val) {
		Boolean existe=val.contains("-");
		String rdrct;
		if(existe==false){
			rdrct="Aucune";
		}else{
			String t[] = val.split("\\-");
			String ct = t[0];
			Map<String, Object> mdl = new HashMap<String, Object>();

			if(ct.equals("CT")){
				rdrct = web.getCollecteByNum(val).getStatut().getNom_fr();
			}
			else if(ct.equals("IT")){
				rdrct = web.getInstallByNum(val).getStatut().getNom_fr();
			}
			else {
				rdrct = web.getNotiifcationByNum(val).getStatut().getNom_fr();
				if(rdrct==null){
					rdrct = "Aucune";
				}

			}}

		return rdrct;
	}


	@RequestMapping(value = "/index2", method = RequestMethod.GET)
	public String getPages(@RequestParam(value = "error", required = false) String error, Principal principal) {

		return "login2";
	}
	@RequestMapping(value = "/index3", method = RequestMethod.GET)
	public String getPages3(@RequestParam(value = "error", required = false) String error, Principal principal) {

		return "login3";
	}
	@RequestMapping(value = "/api/getImportDoc/{type}",method = RequestMethod.GET)
	public @ResponseBody DocImport[] getImport(@PathVariable String type) {
		DocImport[] D=web.getDocImportByType(type);
		return D;
		
	}

	@RequestMapping(value = "/index4", method = RequestMethod.GET)
	public String getPages4(@RequestParam(value = "error", required = false) String error, Principal principal) {
		return "login4";
	}


	@RequestMapping(value = { "/index6" }, method = RequestMethod.GET)
	public ModelAndView getPages6(HttpServletRequest request, HttpSession session, Principal principal) {
		Compte ct=web.getCompteConnected();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user",ct);
		return new ModelAndView("login6", model);
	}


	@RequestMapping(value = "/Mon_profil", method = RequestMethod.GET)
	public ModelAndView Mon_profil() {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();
		if(ct!=null){

			Compte ctr = web.oneCompte(ct.getCompteId());
			model.put("societe", ctr);
			model.put("id", ct.getCompteId());

		}
		else {
			model.put("id", null);
		}
		Object[] secteur = web.tronsaction("select", "  id_secteur,nom_fr,nom_ar from secteur ",
				" delete_date_time is null ");
		model.put("secteur", secteur);
		model.put("user", ct);
		return new ModelAndView("demandez_compte/Mon_profil", model);
	}

	@RequestMapping(value = "/api/addDocmouvement/{id}", method = RequestMethod.GET)
	public ModelAndView addDocmouvement(@PathVariable int id) {
		Map<String,Object> model = new HashMap<String,Object>();
		Notification n = web.getNotificationByIdComptId(id,web.getCompteConnected().getCompteId());
		model.put("type",n.getZf_et());
		model.put("notification",n);
		model.put("Admin_url",urlRest);
		return new ModelAndView("autorisationPublic/addDocMouvement",model);
	}

	@RequestMapping(value = "/api/setDocMouvementDetail/{id_notif}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView setDocMouvementDetail(@PathVariable int id_notif,@RequestParam MultipartFile file,@RequestParam int qte,@RequestParam int id_detail) {
		Map<String,Object> model = new HashMap<String,Object>();
		Notification n = web.saveDocumentMouvement(id_notif,id_detail,qte,file);
		model.put("notification",n);
		model.put("Admin_url",urlRest);
		return new ModelAndView("user_select/auto_load_TabDocMouv",model);
	}


	@RequestMapping(value = "/api/deleteDocMouv/{id}/{id_notif}", method = RequestMethod.POST)
	public ModelAndView deleteDocMouv(@PathVariable int id,@PathVariable int id_notif) {
		Map<String,Object> model = new HashMap<String,Object>();
		Notification n = web.deleteDocMouvbyId(id,id_notif);
		model.put("Admin_url",urlRest);
		model.put("notification",n);
		return new ModelAndView("user_select/auto_load_TabDocMouv",model);
	}

	@RequestMapping(value = "/api/setNbrColie/{id_notif}/{nbr}", method = RequestMethod.POST)
	public @ResponseBody String setNbrColie(@PathVariable int id_notif,@PathVariable int nbr) {
		String s = web.setNbrColies(id_notif,nbr);
		return s;
	}

	@RequestMapping(value = "/api/setDocumentDocMouvement/{id_notif}/{type}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setDocumentDocMouvement(@PathVariable int id_notif,@PathVariable int type,@RequestParam MultipartFile file) {
		String s = web.setdocMouvement(file,id_notif,type);
		return s;
	}

	@RequestMapping(value = "/api/addTransporteurFinal/{id}", method = RequestMethod.POST)
	public ModelAndView addTransporteurFinal(@PathVariable int id) {
		Map<String,Object> model = new HashMap<String,Object>();

		Notification n = web.getNotificationByIdComptId(id,web.getCompteConnected().getCompteId());
		List<TransporteurParam> tr = web.getListTransporteurParamByCodeNotInNotif(n.getId_notification());
		model.put("type",n.getZf_et());
		model.put("notification",n);
		model.put("transporteur",tr);
		model.put("selectTrans","on");
		DeclarationTransporteur d = web.getdeclarationbyNotification(n.getId_notification());
		model.put("declaration",d);
		model.put("Admin_url",urlRest);
		return new ModelAndView("user_select/auto_load_selects",model);
	}

	@RequestMapping(value = "/api/saveDeclarationTransporteur/{id_trans}/{id_notif}/{id_decl}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView saveDeclarationTransporteur(@PathVariable int id_trans,@PathVariable int id_notif,@PathVariable int id_decl, @RequestParam MultipartFile[] fileToUpload) {
		Map<String,Object> model = new HashMap<String,Object>();
		web.createDeclarationTransporteur(id_trans,id_notif,id_decl,fileToUpload);

		return new ModelAndView("user_select/auto_load_selects",model);
	}







}
