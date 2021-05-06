package com.EIE.demo.web;

import com.EIE.demo.dao.EntrepriseRepo;
import com.EIE.demo.dao.NotificationRepository;
import com.EIE.demo.dataService.GenerateWordDocuments;
import com.EIE.demo.dataService.RestResponsePage;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.dataService.WebServiceRegion;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.json.JsonParseException;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.*;


@Controller

public class Hatim {

	@Autowired
	private WebService webt;
	@Autowired
	private WebServiceRegion web;

	@Autowired
	private NotificationRepository notificationsRepository;

	@Autowired
	private EntrepriseRepo entrepriseRepo;

	@Value("${url}")
	private String urlRest;


	@RequestMapping(value = "/faq",method = RequestMethod.GET)
	public ModelAndView getlistfaq() throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		List<AutorisationParam> aut = webt.getListParam();
		List<EvaluationParam> eva = webt.getListEvaParam();
		ResponseEntity<RestResponsePage<Questions>> tmp = webt.getListQuestions(new PageRequest(0,100));
		List<Questions> lq = new ArrayList<Questions>();
		if (tmp.getBody() != null) {
			lq = tmp.getBody().getContent();
		}
		map.put("questions",lq);
		map.put("aut",aut);
		map.put("eva",eva);

		return new ModelAndView("faq/listQuestion",map);
	}

	@GetMapping("/api/okPDF/{idNotif}")
	public ResponseEntity<InputStreamResource> generatePDF(@PathVariable int idNotif) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		ByteArrayInputStream bis;
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=testing.pdf");
		Notification ns = webt.getNotiifcationById(idNotif);
		if (ns.getZf_et().equals("ZF")) {
			bis = GeneratePDFDocuments.generateDocumentDeMouvement2(ns);
		}
		else{
			 bis = GeneratePDFDocuments.generateDocumentDeMouvement(ns);
		}
		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}



	@RequestMapping(value = "/addnewquestions",method = RequestMethod.GET)
	public ModelAndView addnewquestions() throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		return new ModelAndView("faq/addNewQuestion",map);
	}

	@RequestMapping(value = "/savenewquestions",method = RequestMethod.POST)
	public String addnewquestions(@RequestBody Questions question) throws Exception {
		Map<String,Object> map = new HashMap<>();
		question.setCompte(webt.getCompteConnected());
		webt.saveQuestion(question);
		Compte ct = webt.getCompteConnected();
		return "redirect:/faq";
	}


	@RequestMapping(value = "/deletequestion/{id}",method = RequestMethod.GET)
	public String deleteQuestion(@PathVariable int id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Questions q = webt.getQuestionById(id);
		q.setDeleteDateTime(new Date());
		webt.saveQuestion(q);
		Compte ct = webt.getCompteConnected();
		return "redirect:/faq";
	}

	@RequestMapping(value = "/updatequestion/{id}",method = RequestMethod.GET)
	public ModelAndView updatequestion(@PathVariable int id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Questions q = webt.getQuestionById(id);
		Compte ct = webt.getCompteConnected();
		map.put("question",q);
		map.put("user",ct);
		return new ModelAndView("/addNewQuestion",map);
	}


	@RequestMapping(value = "/getListReponse/{id}",method = RequestMethod.GET)
	public ModelAndView getListReponse(@PathVariable int id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		ResponseEntity<RestResponsePage<Reponse>> h = webt.getListReponseByIdQuestion(id,new PageRequest(0, 100));
		if (h.getBody() != null) {
			List<Reponse> searchResult = h.getBody().getContent();
			map.put("reponse", searchResult);
			map.put("total", h.getBody().getTotalElements());
			map.put("number", h.getBody().getNumber());
			map.put("page", 0);
			map.put("totalPage", h.getBody().getTotalPages());
			map.put("size", h.getBody().getSize());
		} else {
			map.put("totalPage", 0);
		}
		map.put("q",webt.getQuestionById(id));
		return new ModelAndView("faq/listReponse",map);
	}


	@RequestMapping(value = "/AjouterRponse/{id}",method = RequestMethod.POST)
	public @ResponseBody String AjouterRponse(@PathVariable int id,@RequestBody Reponse r,HttpServletRequest request) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		r.setCompte(ct);
		webt.saveReponse(r,id);

		Questions q = webt.getQuestionById(id);

		return "ok" ;
	}

	@GetMapping(value = "/deletereponse/{id_ques}/{idrep}")
	public String deletereponse(@PathVariable int id_ques,@PathVariable int idrep) throws Exception {
		Map<String,Object> map = new HashMap<>();

		webt.deleteReponse(id_ques,idrep);

		return "redirect:/api/getListReponse/"+id_ques;
	}

	@GetMapping(value = "/getReponseById/{idrep}")
	public @ResponseBody Map getReponseById(@PathVariable int idrep) throws Exception {
		Map<String,Object> map = new HashMap<>();

		webt.getCompteConnected();
		map.put("user",webt.getCompteConnected());
		map.put("reponse",webt.getReponseById(idrep));
		return map;
	}

	@RequestMapping(value = "/contact/{id}",method = RequestMethod.GET)
	public ModelAndView  getContactById(@PathVariable int id) throws Exception {
		Map<String,Object> map = new HashMap<>();

		map.put("user",webt.getCompteConnected());
		map.put("disabled",id==0?"":"disabled");
		return new ModelAndView("contact/contact",map);
	}

	@RequestMapping(value = "addnewmessagecontact",method = RequestMethod.POST)
	public String addnewmessagecontact(@RequestBody ContactMessage msg) throws Exception {
		Map<String,Object> map = new HashMap<>();
		msg.setCompte(webt.getCompteConnected());
		webt.addMsgContact(msg);
		map.put("user",webt.getCompteConnected());
		return "redirect:/contact/0";
	}

	@RequestMapping(value = "/videoList",method = RequestMethod.GET)
	public ModelAndView videoList() throws Exception {
		Map<String,Object> map = new HashMap<>();

		map.put("user",webt.getCompteConnected());
		return new ModelAndView("aide/videolist",map);
	}

	@RequestMapping(value = "/CatalogueDesDechet",method = RequestMethod.GET)
	public ModelAndView CatalogueDesDechet() throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("listF",webt.getListAllTransporteurParam());
		map.put("code",webt.getListCodeTabByClassif(1));
		return new ModelAndView("aide/CatalogueDesDechet",map);
	}
	

	@RequestMapping(value = "/guide",method = RequestMethod.GET)
	public ModelAndView guideList() throws Exception {
		Map<String,Object> map = new HashMap<>();

		map.put("user",webt.getCompteConnected());
		return new ModelAndView("aide/guide",map);
	}

	@RequestMapping(value = "/getQuestionByAutorisation",method = RequestMethod.POST)
	public ModelAndView getQuestionByAutorisation(@RequestParam String autor) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		map.put("type",autor);
		ResponseEntity<RestResponsePage<Questions>> h = webt.getListQuestionsByAuto(autor,new PageRequest(0, 100));

		if (h.getBody()!=null)
			map.put("questions",h.getBody().getContent());

		return new ModelAndView("faq/listQuestion",map);
	}



	/*-----------------------------------------------------------------------------------------------
	-----------------------------------collecte et transport des produits Dangereux------------------
	------------------------------------------------------------------------------------------------*/

	@RequestMapping(value = "/api/getListCollectTrans",method = RequestMethod.GET)
	public ModelAndView getListCollectTrans() throws Exception {
		Compte ct = webt.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();


		ResponseEntity<RestResponsePage<CollecteTransporteur>> h = webt.getListCollectesByCompte(new PageRequest(0, 100),
				ct.getCompteId());

		if (h.getBody() != null) {

			List<CollecteTransporteur> searchResult = h.getBody().getContent();

			model.put("notif", searchResult);
			model.put("total", h.getBody().getTotalElements());
			model.put("type", "CT");

			model.put("number", h.getBody().getNumber());
			model.put("page", 0);
			model.put("url_admin",urlRest);
			model.put("totalPage", h.getBody().getTotalPages());
			model.put("size", h.getBody().getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("user", ct);

		return new ModelAndView("collecte_trans/ListeCollecte",model);
	}


	@RequestMapping(value = "/api/addCollectTrans/{id}/{typeRenouv}",method = RequestMethod.GET)
	public ModelAndView addCollectTrans(@PathVariable int id,@PathVariable String typeRenouv) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user", ct);
		map.put("type","CT");
		List<Code> c = webt.getListcodeTab();
		map.put("code",c);
		map.put("typeRenouv",typeRenouv);
		List<EquipementSecurite> securite = webt.getListEquipementSecurite();
		List<TypeVehicule> typeVehicules = webt.getListAllTypeVehicule();
		List<TypeConteneurs> typeConteneurs = webt.getListAllTypeConteneur();
		map.put("doc", webt.listDocImportByType(1,"CT"));
		CollecteTransporteur collect = webt.getCollecteById(id,ct.getCompteId(),typeRenouv);
		map.put("collect",collect);
		map.put("id",id);
		map.put("typeVehicules",typeVehicules);
		map.put("typeConteneurs",typeConteneurs);
		map.put("securite",securite);
		map.put("url_Admin",urlRest);
		map.put("docNotify",webt.listDocNotif(id,"CT"));
		return new ModelAndView("collecte_trans/addCollecteTransport",map);
	}

	@RequestMapping(value = "/api/getVehiculeById/{id}/{id_coll}",method = RequestMethod.GET)
	public ModelAndView getVehiculeById(@PathVariable int id,@PathVariable int id_coll) throws Exception {
		Map<String,Object> map = new HashMap<>();
		Compte ct = webt.getCompteConnected();
		map.put("user",ct);
		map.put("collect",webt.getCollecteById(id_coll,ct.getCompteId()));
		map.put("vehicules",webt.getVehiculeById(id));
		map.put("securite",webt.getListEquipementSecurite());
		map.put("url_admin",urlRest);
		return new ModelAndView("collecte_trans/tableandFormVehicule",map);
	}


	@RequestMapping(value = "/api/saveVehicule", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView saveVehicule(@RequestParam String v,@RequestParam int id_collect,
									 @RequestParam MultipartFile[] fileToUpload, @RequestParam MultipartFile[] equipementsecurite)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();

		String id = webt.saveVehicule(fileToUpload,equipementsecurite,id_collect,v);
		CollecteTransporteur col = webt.getCollecteById(id_collect,webt.getCompteConnected().getCompteId());
		map.put("collect",col);
		map.put("url_Admin",urlRest);
		return new ModelAndView("collecte_trans/tableVehicule",map);
	}

	@RequestMapping(value = "/api/deleteVehicule/{id}/{id_collect}", method = RequestMethod.GET)
	public ModelAndView deleteVehicule(@PathVariable int id,@PathVariable int id_collect) throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deleteVehiculeById(id,id_collect,webt.getCompteConnected().getCompteId());
		CollecteTransporteur v = webt.getCollecteById(id_collect,webt.getCompteConnected().getCompteId());
		map.put("collect",v);
		map.put("url_Admin",urlRest);
		return new ModelAndView("collecte_trans/tableandFormVehicule",map);
	}

	@RequestMapping(value = "/api/getVehiculeOne", method = RequestMethod.POST)
	public @ResponseBody Vehicules getVehiculeOne(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {
		int idCollect = Integer.parseInt(id);
		Vehicules v = webt.getVehiculeById(idCollect);
		return v;
	}

	@RequestMapping(value = "/api/getvehicule", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getvehicule(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_collect = Integer.parseInt(id);
		CollecteTransporteur v =  webt.getCollecteById(id_collect,webt.getCompteConnected().getCompteId());
		map.put("vehicules",v.getVehicules());
		map.put("url_Admin",urlRest);
		map.put("codes",v.getCode());
		map.put("user",webt.getCompteConnected());
		return map;
	}

	@RequestMapping(value = "/api/getcode", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getcode(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_install = Integer.parseInt(id);
		Installation v =  webt.getInstallationById(id_install,webt.getCompteConnected().getCompteId());
		map.put("url_Admin",urlRest);
		map.put("codes",v.getCode());
		map.put("user",webt.getCompteConnected());
		return map;
	}


	@RequestMapping(value = "/api/getOnedocNotif", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getOnedocNotif(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_collect = Integer.parseInt(id);
		CollecteTransporteur v =  webt.getCollecteById(id_collect,webt.getCompteConnected().getCompteId());
		map.put("collect",v);
		map.put("docNotify",webt.listDocNotif(Integer.parseInt(id),"CT"));
		map.put("url_Admin",urlRest);
		return map;
	}

	@RequestMapping(value = "/api/validateDocCt/{id}", method = RequestMethod.GET)
	public ModelAndView validateDocCt(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("doc", webt.listDocNotif(id,"CT"));
		model.put("url_Admin", urlRest);
		model.put("id", id);

		return new ModelAndView("collecte_trans/validationDocCT", model);
	}


	@RequestMapping(value = "/api/setcode/{id_coll}/{id_code}/{type}", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> setcode(@PathVariable int id_coll,@PathVariable int id_code,@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.setcode(id_coll,id_code,webt.getCompteConnected().getCompteId(),type);
		CollecteTransporteur v =  webt.getCollecteById(id_coll,webt.getCompteConnected().getCompteId());
		map.put("user",webt.getCompteConnected());
		map.put("codes",v.getCode());
		return map;
	}


	@RequestMapping(value = "/api/setcodeInstall/{id_inst}/{id_code}/{type}", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> setcodeinstall(@PathVariable int id_inst,@PathVariable int id_code,@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.setcodeinstall(id_inst,id_code,webt.getCompteConnected().getCompteId(),type);
		Installation v =  webt.getInstallationById(id_inst,webt.getCompteConnected().getCompteId());
		map.put("user",webt.getCompteConnected());
		map.put("codes",v.getCode());
		return map;
	}

	@GetMapping("/api/generate_pdf_installation/{id}")
	public ResponseEntity<InputStreamResource> generate_pdf_installation(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=testing.pdf");
		Installation ns = webt.getIndtallationById(id);
		ByteArrayInputStream bis = GeneratePDFDocuments.generateDocumentDInstallation(ns);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@RequestMapping(value = "/api/getOneCollecte", method = RequestMethod.POST)
	public @ResponseBody String getOneCollecte(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {

		CollecteTransporteur v =  webt.getCollecteByNumDemande2(id,webt.getCompteConnected().getCompteId());
		if(v!=null){
			return String.valueOf(v.getId_collecte());
		}else{
			return "not existe";
		}
	}


	@RequestMapping(value = "/api/getOneInstall", method = RequestMethod.POST)
	public @ResponseBody String getOneInstall(@RequestParam String id)
			throws JsonParseException, IOException, MessagingException {

		Installation v =  webt.getInstallByNumDemande(id,webt.getCompteConnected().getCompteId());
		if(v!=null){
			return String.valueOf(v.getId_installation());
		}else{
			return "not existe";
		}
	}

	@RequestMapping(value = "/api/getOneNotification", method = RequestMethod.POST)
	public @ResponseBody String getOneNotification(@RequestParam String id,@RequestParam String type)
			throws JsonParseException, IOException, MessagingException {

		Notification v =  webt.getNotificationByNumDemande(id,webt.getCompteConnected().getCompteId(),type);
		if(v!=null){
			return String.valueOf(v.getId_notification());
		}else{
			return "not existe";
		}
	}


	@RequestMapping(value = "/api/checkUserHasCollecte/{type}", method = RequestMethod.GET)
	public ModelAndView checkUserHasCollecte(@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> model = new HashMap<>();
		Integer nbr = 0;
		if(type.equals("CT")){
			nbr = webt.getNombreCollecteByUser(webt.getCompteConnected().getCompteId(),"renouv");
		}else if(type.equals("IT")){
			nbr = webt.getNombreInstaByUser(webt.getCompteConnected().getCompteId(),"renouv");
		}

		if(nbr>0){
			model.put("renouv","oui");
		}else{
			model.put("renouv","non");
		}
		model.put("url_admin",urlRest);
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		if(type.equals("CT")){
			CollecteTransporteur v = webt.getCollecteById_v2(webt.getCompteConnected().getCompteId());
			model.put("collect",v);
			ListDocNotif[] l = webt.listDocNotif(v.getId_collecte(),type);
			model.put("doc",l);
			model.put("url_Admin",urlRest);
			return new ModelAndView("user_select/recap_CT",model);
		}else if(type.equals("IT")){
			Installation ins = webt.getInstallById_v2(webt.getCompteConnected().getCompteId());
			ListDocNotif[] l = webt.listDocNotif(ins.getId_installation(),type);
			model.put("doc",l);
			model.put("installation",ins);
			model.put("url_Admin",urlRest);
			return new ModelAndView("user_select/recap_IT",model);
		}
		Notification[] n=null;
		n = webt.getNotificationNotDepo(webt.getCompteConnected().getCompteId(),type);
		model.put("notif",n);

		Notification[] n1=null;
		n1 = webt.getNotificationAll(webt.getCompteConnected().getCompteId(),type);
		model.put("notifall",n1);
		return new ModelAndView("user_select/card_ZF_choix",model);
	}

	@RequestMapping(value = "/api/checkUserDispatch/{type}", method = RequestMethod.GET)
	public  String checkUserDispatch(@PathVariable String type) {
		Map<String,Object> model = new HashMap<>();
		int nbr = 0;
		if(type.equals("CT")){
			nbr = webt.getNombreCollecteByUser(webt.getCompteConnected().getCompteId(),"all");
			if(nbr==0){
				return "redirect:/api/addCollectTrans/0/N";
			}
		}

		if(type.equals("IT")){
			nbr = webt.getNombreInstaByUser(webt.getCompteConnected().getCompteId(),"all");
			if(nbr==0){
				return "redirect:/api/addInstallation/0/N";
			}
		}

		if(type.equals("ZF") || type.equals("ET") || type.equals("XD") || type.equals("TR")){
			nbr = webt.getNombreNotifUser(webt.getCompteConnected().getCompteId(),"all",type);
			RestResponsePage<Notification> i = webt.getListNotiifcationByCompte(new PageRequest(0, 100),webt.getCompteConnected().getCompteId(), "n", type).getBody();
			nbr += (i==null)?0:i.getSize();
			if((nbr==0 && type.equals("ZF")) ||(nbr==0 && type.equals("XD"))){
				return "redirect:/api/addNumNotification/"+type+"/0";
			}else if(nbr==0 && (!type.equals("ZF") || !type.equals("XD"))){
				return "redirect:/api/addDemandNotification/0/"+type+"/N";
			}
		}
		return "redirect:/api/checkUserHasCollecte/"+type;

	}

	@RequestMapping(value = "/api/ListToChoixRenouv/{type}", method = RequestMethod.POST)
	public ModelAndView ListToChoixRenouv(@PathVariable String type){
		List<CollecteTransporteur> collectes = new ArrayList<CollecteTransporteur>();
		List<Installation> inst = new ArrayList<Installation>();
		Map<String,Object> model = new HashMap<>();
		model.put("renouv","oui");
		model.put("type",type);
		model.put("user",webt.getCompteConnected());

		if(type.equals("CT")){
			collectes = webt.getListCollectesRenouvByCompte(webt.getCompteConnected().getCompteId());
		}else if(type.equals("IT")){
			inst = webt.getListInstallRenouvByCompte(webt.getCompteConnected().getCompteId());
		}

		model.put("installation",inst);
		model.put("collects",collectes);

		return new ModelAndView("user_select/ListeAutorisation_renouv",model);
	}


	@RequestMapping(value = "/api/newCollecteRenouv/{id}", method = RequestMethod.GET)
	public String newCollecteRenouv(@PathVariable String id) {
		CollecteTransporteur v =  webt.getCollecteByNumDemande2(id,webt.getCompteConnected().getCompteId());
		return "redirect:/api/addCollectTrans/"+v.getId_collecte()+"/R";
	}

	@RequestMapping(value = "/api/getCollectById/{id}/{type}", method = RequestMethod.POST)
	public ModelAndView getCollectById(@PathVariable String id,@PathVariable String type) {

		Map<String,Object> map = new HashMap<>();
		ListDocNotif[] l =null;
		CollecteTransporteur v = null;
		Installation ins = null;
		Notification notif = null;

		if(type.equals("CT"))
			v =  webt.getCollecteByNumDemande(id,webt.getCompteConnected().getCompteId());
		if(type.equals("IT"))
			ins = webt.getInstallByNumAndUser(id,webt.getCompteConnected().getCompteId());
		if(type.equals("ZF") || type.equals("ET") || type.equals("TR") || type.equals("XD"))
			notif = webt.getNotiifcationByNumZFET(id,type);

		if(v!=null && !type.isEmpty())
			l = webt.listDocNotif(v.getId_collecte(),type);
		if(ins!=null && !type.isEmpty())
			l = webt.listDocNotif(ins.getId_installation(),type);
		if(notif!=null && !type.isEmpty())
			l = webt.listDocNotif(notif.getId_notification(),type);

		map.put("doc",l);
		map.put("collect",v);
		map.put("installation",ins);
		map.put("notification",notif);
		map.put("type",type);
		map.put("url_Admin",urlRest);

		return new ModelAndView("user_select/ListeAutorisation_recap_CT",map);

	}


	@RequestMapping(value = "/api/getCollectById_collecte", method = RequestMethod.POST)
	public ModelAndView getCollectById_collecte() {

		Map<String,Object> map = new HashMap<>();
		ListDocNotif[] l=null;

		CollecteTransporteur v =  webt.getCollecteById_v2(webt.getCompteConnected().getCompteId());

		if(v!=null )
			l = webt.listDocNotif(v.getId_collecte(),"CT");

		map.put("doc",l);
		map.put("collect",v);

		map.put("url_Admin",urlRest);

		return new ModelAndView("user_select/ListeAutorisation_recap_CT",map);
	}

	@RequestMapping(value = "/api/newInstallRenouv/{id}", method = RequestMethod.GET)
	public String newInstallRenouv(@PathVariable String id) {
		Installation v =  webt.getInstallByNumDemande(id,webt.getCompteConnected().getCompteId());
		return "redirect:/api/addInstallation/"+v.getId_installation()+"/R";
	}


	@RequestMapping(value = "/api/checkEIESelect/{type}", method = RequestMethod.GET)
	public  ModelAndView checkEIESelect(@PathVariable String type) {
		Map<String,Object> model = new HashMap<>();
		model.put("user",webt.getCompteConnected());
		//model.put("type","EIE");
		model.put("type",type);
		if(type.equals("RS")){
			model.put("titre_dyn","Renseignements préalables ");
			model.put("RS",webt.getcountEIEByType("RS",webt.getCompteConnected().getCompteId()));
		}else if(type.equals("EE")){
			model.put("titre_dyn","Etude d’Impact sur l’Environnement");
			model.put("EE",webt.getcountEIEByType("EE",webt.getCompteConnected().getCompteId()));
		}else if(type.equals("NT")){
			model.put("titre_dyn","Notice d'Impact sur l'Environnement");
			model.put("NT",webt.getcountEIEByType("NT",webt.getCompteConnected().getCompteId()));
		}


		return new ModelAndView("user_select/ListeEtudeEnv_card",model);

	}



	@RequestMapping(value = "/connexion", method = RequestMethod.GET)
	public  ModelAndView connexion_login() {
		Map<String,Object> model = new HashMap<>();
		model.put("user",webt.getCompteConnected());
		return new ModelAndView("connexion",model);
	}



	@RequestMapping(value = "/api/CheckEIE/{id}", method = RequestMethod.POST)
	public @ResponseBody String CheckEIE(@PathVariable String id) {
		String res = "Aucun résultat";
		DemandeInformation d = webt.getDemandeInfoByNumByUser(id,webt.getCompteConnected().getCompteId());
		if(d!=null){
			res = d.getId_demande_information()+"";
		}
		return res;
	}

	@RequestMapping(value = "/api/getPrefectureByRegion/{ids}/{id_dmd}", method = RequestMethod.POST)
	public ModelAndView getPrefectureByRegion(@PathVariable String ids,@PathVariable int id_dmd) {
		String res = "Aucun résultat";

		List<Prefecture> prefecture = webt.getAllPrefectureByRegion2(ids,id_dmd,webt.getCompteConnected().getCompteId());
		DemandeInformation d = webt.getDemandeInfoById(id_dmd);
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("prefecture",prefecture);
		model.put("demande",d);
		return new ModelAndView("user_select/auto_load_selects",model);
	}

	@RequestMapping(value = "/api/savecommuneDetailregion/{id}/{id_dmd}", method = RequestMethod.POST)
	public @ResponseBody String savecommuneDetailregion(@PathVariable String id,@PathVariable int id_dmd) {
		String res = "Aucun résultat";
		List<Commune> lc = webt.savecommuneDetailRegion(id,id_dmd,webt.getCompteConnected().getCompteId());
		if(lc!=null){
			res = "oui";
		}
		return res;
	}

	@RequestMapping(value = "/api/getCommuneByPref/{id}/{id_dmd}", method = RequestMethod.POST)
	public ModelAndView getCommuneByPref(@PathVariable String id,@PathVariable int id_dmd) {
		List<Commune> lc = webt.getAllCommuneByPrefecture2(id,id_dmd,webt.getCompteConnected().getCompteId());
		DemandeInformation d = webt.getDemandeInfoById(id_dmd);
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("commune",lc);
		model.put("demande",d);
		return new ModelAndView("user_select/auto_load_selects",model);
	}

	@RequestMapping(value = "/api/getCollectById1", method = RequestMethod.GET)
	public ModelAndView getCollectById1() {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",webt.getCompteConnected());
		model.put("type","CT");
		model.put("collect",webt.getCollecteById_v2(webt.getCompteConnected().getCompteId()));
		return new ModelAndView("user_select/recap_CT",model);
	}

	@RequestMapping(value = "/api/verifQuestion/{type}/{rep}", method = RequestMethod.GET)
	public ModelAndView verifQuestion(@PathVariable String type, @PathVariable String rep) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		model.put("solution",rep);
		Notification[] n=null;
		if(rep.equals("affiche"))
			n = webt.getNotificationAll(webt.getCompteConnected().getCompteId(),type);
		else
			n = webt.getNotificationNotDepo(webt.getCompteConnected().getCompteId(),type);

		model.put("notif",n);
		return new ModelAndView("user_select/card_ZF_choix",model);
	}

	@RequestMapping(value = "/api/getnotifById1/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView getnotifById1(@PathVariable String type,@PathVariable int id) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",webt.getCompteConnected());
		model.put("type",type);
		Notification n = webt.getNotiifcationById(id);
		model.put("notification",n);
		ListDocNotif[] l = webt.listDocNotif(n.getId_notification(),type);
		model.put("doc",l);
		model.put("url_Admin",urlRest);

		return new ModelAndView("user_select/recap_ZF",model);
	}




	@GetMapping("/api/generateDocInstallFavorable/{idInstall}")
	public ResponseEntity<InputStreamResource> generateDocInstallFavorable(@PathVariable int idInstall) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=Arrêté.docx");
		Installation is = webt.getIndtallationById(idInstall);
		ByteArrayInputStream bis = GenerateWordDocuments.generateInstallation(is);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}


	@RequestMapping(value = "/api/setFilQualifToInstall/{id}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setFilQualifToInstall(@PathVariable int id,@RequestParam MultipartFile[] fileToUpload) {
		String res  = webt.setFilQualifToInstall(id,fileToUpload);
		return res;
	}

	@RequestMapping(value = "/api/setFilImpactToDemandeInfo/{id}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setFilImpactToDemandeInfo(@PathVariable int id,@RequestParam MultipartFile[] fileToUpload) {
		String res  = webt.setFilImpactToDemandeInfo(id,fileToUpload);
		return res;
	}

	@RequestMapping(value = "/api/setAvisProjet/{id}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setAvisProjet(@PathVariable int id,@RequestParam MultipartFile[] fileToUpload) {
		String res  = webt.setAvisProjetDemandeInformation(id,fileToUpload);
		return res;
	}



	@GetMapping("/api/generate_recap_imp/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_imp(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=ZoneFrancheRecap.pdf");
		Notification ns = webt.getNotificationByIdComptId(id,webt.getCompteConnected().getCompteId());
		ListDocNotif[] l = webt.listDocNotif(ns.getId_notification(),"ZF");
		DocImport[] d =webt.listDocImportByType(ns.getClassification().getId_classification(),ns.getZf_et());
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapNotification(ns,l,d);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_recap_collecte/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_collecte(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=CollecteRecap.pdf");
		CollecteTransporteur ns = webt.getCollecteById(id,webt.getCompteConnected().getCompteId());
		ListDocNotif[] l = webt.listDocNotif(ns.getId_collecte(),"CT");
		DocImport[] d =webt.getDocImportByType("CT");
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapCollecte(ns,l,d);


		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_recap_Eie/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_Eie(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=EieRecap.pdf");
		DemandeInformation d = webt.getDemandeInfoById(id);
		ListDocNotif[] l = webt.listDocNotif(d.getId_demande_information(),"EIE");
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapEie(d,l);
		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_recap_instalation/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_instalation(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=InstalationRecap.pdf");
		Installation ins = webt.getInstallById_v2(webt.getCompteConnected().getCompteId());
		ListDocNotif[] l = webt.listDocNotif(ins.getId_installation(),"IT");
		DocImport[] d =webt.getDocImportByType("IT");
		ByteArrayInputStream bis = GeneratePDFDocuments.generateRecapInstalation(ins,l,d);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}


	@RequestMapping(value = "/api/addTransporteuretranger/{id_notif}/{id_trans}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView addTransporteuretranger(@PathVariable int id_trans,@PathVariable int id_notif,@RequestParam String raison,@RequestParam String matricule,@RequestParam String type_vehicule,@RequestParam String adresse,@RequestParam String port[],@RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		String id = webt.saveTransporeuretranger(fileToUpload,raison,matricule,type_vehicule,adresse,port,id_notif,id_trans);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("url_Admin",urlRest);
		return new ModelAndView("user_select/auto_load_Transporteur_etranger",map);
	}

	@RequestMapping(value = "/api/addTransporteuretrangerNational/{id_notif}/{id_trans}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView addTransporteuretranger2(@PathVariable int id_trans,@PathVariable int id_notif,@RequestParam String raison,@RequestParam String matricule,@RequestParam String type_vehicule,@RequestParam String adresse,@RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		String id = webt.saveTransporeuretrangerNational(fileToUpload,raison,matricule,type_vehicule,adresse,id_notif,id_trans);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		TransporteurEtranger t = webt.getTransporteurEtrangerById(Integer.parseInt(id));
		if(id_trans!=0)
			map.put("one",t);
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("url_Admin",urlRest);
		return new ModelAndView("user_select/auto_load_Transporteur_etrangerNational",map);
	}

	@RequestMapping(value = "/api/deleteTransporteuretranger/{id_notif}/{id_trans}/{type}", method = RequestMethod.POST)
	public ModelAndView deleteTransporteuretranger(@PathVariable int id_trans,@PathVariable int id_notif,@PathVariable String type)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		webt.deleteTransporteuretranger(id_notif,id_trans);
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("url_Admin",urlRest);
		if(type.equals("nationale")){
			return new ModelAndView("user_select/auto_load_Transporteur_etrangerNational",map);
		}
		return new ModelAndView("user_select/auto_load_Transporteur_etranger",map);
	}


@RequestMapping(value = "/api/getoneTransporteuretranger/{id_trans}/{id_notif}/{type}", method = RequestMethod.POST)
	public ModelAndView getoneTransporteuretranger(@PathVariable int id_trans,@PathVariable int id_notif,@PathVariable String type)
			throws JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		Notification notif = webt.getNotificationByIdComptId(id_notif,webt.getCompteConnected().getCompteId());
		map.put("transporteur_etranger",notif.getTransporteur_etranger());
		map.put("one",webt.getTransporteurEtrangerById(id_trans));
		map.put("url_Admin",urlRest);
		if(type.equals("nationale")){
			return new ModelAndView("user_select/auto_load_Transporteur_etrangerNational",map);
		}
		return new ModelAndView("user_select/auto_load_Transporteur_etranger",map);
	}



	@RequestMapping(value = "/api/changerStatus", method = RequestMethod.POST)
	public @ResponseBody String changerStatus(@RequestParam String type,@RequestParam int id_notif,@RequestParam int id_statut)
			throws JsonParseException, IOException, MessagingException {
		return webt.setStatutNotification(id_notif,id_statut,webt.getCompteConnected().getCompteId(),type);
	}


	@RequestMapping(value = "/api/updateDemandeInfomration/{id}/{id_unit}/{id_caracter_physique}/{id_poplation}", method = RequestMethod.GET)
	public @ResponseBody String updateDemandeInfomration(@PathVariable int id, @RequestParam String intitule_projet,@RequestParam int montant_investissement,@RequestParam String tronsfrontalier,@RequestParam String nature_foncier, @RequestParam String caracteristiques_projet, @RequestParam String ressource, @RequestParam String source, @RequestParam String nature_projet, @RequestParam String qualitative, @RequestParam String quantite_projet,@PathVariable int id_unit,@PathVariable int id_caracter_physique,@PathVariable int id_poplation )
			throws JsonParseException {
		String xd= webt.updateDemandeInformation(id, intitule_projet, montant_investissement, tronsfrontalier, nature_foncier, caracteristiques_projet, ressource, source, nature_projet, qualitative, quantite_projet, id_unit, id_caracter_physique, id_poplation);
		return xd;
	}

	@RequestMapping(value = "/api/updateDemandeInfomrationEE/{id}", method = RequestMethod.GET)
	public @ResponseBody String updateDemandeInfomrationEE(@PathVariable int id, @RequestParam String intitule_projet,@RequestParam int montant_investissement,@RequestParam String tronsfrontalier)
			throws JsonParseException {
		String xd= webt.updateDemandeInformationEE(id, intitule_projet, montant_investissement, tronsfrontalier);
		return xd;
	}


	@RequestMapping(value = "/api/getfileByIdDemande/{id}/{type}", method = RequestMethod.POST)
	public ModelAndView getfileByIdDemande(@PathVariable int id,@PathVariable String type){
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation d = webt.getDemandeInfoById(id);
		ListDocNotif[] l = webt.listDocNotif(d.getId_demande_information(),"EIE");
		Reunion r = null;
		if(d.getReunions().size()>0)
			r = d.getReunions().get(d.getReunions().size()-1);

		map.put("doc",l);
		map.put("demande",d);
		map.put("reunion",r);
		map.put("url_Admin",urlRest);
		map.put("type",type);
		if(type.equals("sendfile")){
			return new ModelAndView("user_select/auto_load_filesModal",map);
		}

		return new ModelAndView("user_select/auto_load_filesModal",map);
	}

	@RequestMapping(value = "/getTabtransporteur/{code}", method = RequestMethod.POST)
	public ModelAndView getTabtransporteur(@PathVariable int code) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("trans",webt.getTransporteurParamByCode(code));
		return new ModelAndView("user_select/auto_load_TabtransporteurDechets",model);
	}

	@RequestMapping(value = "/api/setFileReunionToDemande/{id}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String setFileReunionToDemande(@PathVariable int id, @RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, IOException, MessagingException {
		return webt.setFileToDemande(id,fileToUpload);
	}

	@RequestMapping(value = "/getAccordionDoc/{type}", method = RequestMethod.POST)
	public ModelAndView getAccordionDoc(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("doc",webt.getDocImportByType(type));
		model.put("Admin_url",urlRest);
		model.put("show","accordion");
		return new ModelAndView("user_select/auto_load_accordion",model);
	}

	@RequestMapping(value = "/getProcedureAuto/{type}", method = RequestMethod.POST)
	public ModelAndView getProcedureAuto(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("doc",webt.getDocImportByType(type));
		model.put("type",type);
		model.put("codes",webt.getListCodeTabByClassif(1));
		model.put("show","procedure");
		return new ModelAndView("user_select/auto_load_accordion",model);
	}





}
	








