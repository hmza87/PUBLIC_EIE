package com.EIE.demo.dataService;

import com.EIE.demo.model.*;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface WebService {

	public Compte getCompteConnected();
	public void addNumNotification(Notification nt,String text);
	public String addSociete(Societe nt, int secteur);
	public void changertatutDemande(DemandeInformation nt, int statut);
	public String addDemandeInformation(DemandeInformation nt,String type);
	public void addDocInfo( MultipartFile[] fileToUpload , int id,int check);
	public void addDocAut( MultipartFile[] fileToUpload , int id,int check,String typeauto);
	//	public void addDemandeInformationDoc(DemandeInformation nt);
	public void verifierCompte(int nt);
	public Compte chackmail(String email);
	public String autologin2(String j_name, String j_pass);
	public Object[] tronsaction(String opiration, String table,String filter);
	//	public Object[] addObject(Object obje);
	public String addObject(Object nt, String table);
	public String updateObject(Object nt, String table,String id);
	public ResponseEntity<RestResponsePage<Notification>> getListNotiifcationByCompte(Pageable page, int compteId,String type,String zfet);
	public ResponseEntity<RestResponsePage<Installation>> getListInstallationByCompte(Pageable page, int compteId);
	public ResponseEntity<RestResponsePage<CollecteTransporteur>> getListCollectesByCompte(Pageable page, int compteId);

	public Compte oneCompte(int id) ;

	public Notification getNotiifcationByNum(String Num);
	public CollecteTransporteur getCollecteByNum(String Num);
	public Installation getInstallByNum(String Num);
	public Installation getInstalById(int id,int comp_id);
	public Notification getNotiifcationByNumZFET(String Num,String type);
	public DemandeInformation getDemandeInfoByNum(String Num);
	public Notification getNotiifcationById(int id);
	public Installation getIndtallationById(int id);
	public Region getRegion(int id);
	public DemandeInformation getDemandeInfoById(int id);
	public DemandeInformation getDemandeInfoByIdType(int id, String type);
	public ResponseEntity<RestResponsePage<DemandeInformation>> getListDemandeInformationByCompte(Pageable page, int compteId, String type);
	public ResponseEntity<RestResponsePage<DemandeInformation>> getListDemandeInformationByCompteStatut(Pageable page, int compteId,int statut);
	public DocImport[] listDocImport();
	public DocImport[] listDocImportByType(int id,String type);
	public ListDocNotif[] listDocNotif(int id,String type);
	public ResponseEntity<RestResponsePage<Questions>> getListQuestions(Pageable page);

	public void saveQuestion(Questions question);
	public Questions getQuestionById(int id);
	Notification findByIdnotif(int idNotif);


	ResponseEntity<RestResponsePage<Reponse>> getListReponseByIdQuestion(int id, PageRequest pageRequest);

	public void saveReponse(Reponse r,int id);
	public void deleteReponse(int id_ques, int idrep);
	public Reponse getReponseById(int id);

	ResponseEntity<RestResponsePage<ContactMessage>> getListContactMessage(PageRequest pageRequest,int iduser);
	ContactMessage getContactMessageById(int id,int iduser);

	void addMsgContact(ContactMessage msg);
	public List<AutorisationParam> getListParam();
	List<EvaluationParam> getListEvaParam();

	List<TransporteurParam> getListAllTransporteurParam();
	List<Code> getListAllCode();
	List<Code> getListAllCode1(int id);
	ResponseEntity<RestResponsePage<Questions>> getListQuestionsByAuto(String type, PageRequest pageRequest);

	List<Code> getListcodeTab();
	List<CategorieDechet> getListCategorieDechet();


	List<Code> getListCodeTabByClassif(int classification);

	CollecteTransporteur getCollecteById(int id, int compteId);
	CollecteTransporteur getCollecteById(int id, int compteId,String typeRenouv);

	DemandeInformation getDemandeInformationByCompteId(int id, int compteId);


	Installation getInstallationById(int id, int compteId);

	List<EquipementSecurite> getListEquipementSecurite();

	List<TypeVehicule> getListAllTypeVehicule();

	List<TypeConteneurs> getListAllTypeConteneur();
	public String saveVehicule(MultipartFile[] fileToUpload,MultipartFile[] equipementsecurite, int id_collecte, String v);
	public void savePaysAutorite(int p);
	public String savePaysAutoriteXD(MultipartFile fileToUpload, int id_notif, int p);
	Vehicules getVehiculeById(int parseInt);
	PaysAutorite getPaysAutoriteById(int parseInt);
	void deleteVehiculeById(int id,int id_coll,int id_user);

	void deletePaysautoriteById(int id,int id_notif,int id_user);

	void setcode(int id_coll, int id_code, int id_user, String type);

	List<Prefecture> updateRegion(int id, int regionId);
	void updatePrefecture(int id, int prefectureId);



	void setcodeinstall(int id_inst, int id_code, int id_user, String type);

	void deleteAllCodeByInstall(int id_inst,int id_user);


	CollecteTransporteur getCollecteByNumDemande(String id, int compteId);

	CollecteTransporteur getCollecteByNumDemande2(String id, int compteId);

	Installation getInstalById2(int id, int compteId, String typeRenv);

	Installation getInstallByNumDemande(String id, int compteId);

	Notification getNotificationByNumDemande(String id, int compteId,String type);

	int getNombreCollecteByUser(int compteId,String type);

	List<CollecteTransporteur> getListCollectesRenouvByCompte( int compteId);

	int getNombreInstaByUser(int compteId, String all);

	List<Installation> getListInstallRenouvByCompte(int compteId);
	Installation getInstallByNumAndUser(String num, int compteId);

	public DocImport[] getDocImportByType(String type);
	int getNombreNotifUser(int compteId, String all,String type);

	DemandeInformation getDemandeInfoByNumByUser(String id, int compteId);

	public List<Prefecture> getAllPrefectureByRegion2(String id,int id_dmd,int id_compt);
	public List<Prefecture> getAllPrefectureByRegion(String id);
	public List<Commune> getAllCommuneByPrefecture(String id);
	public List<Commune> getAllCommuneByPrefecture2(String id,int id_dmd,int id_compt);

	Region[] getArrRegion();

	Categorie[] getArrCategorie();

	CollecteTransporteur getCollecteById_v2(int compteId);

	DemandeInformation getDemandeByUser(int compteId);

	Installation getInstallById_v2(int compteId);

	Notification[] getNotificationNotDepo(int compteId, String type);


	Notification[] getNotificationAll(int compteId, String type);

	Installation[] getInstallationAll(int compteId);

	LieuElimination[] getLieuEliminationArr();

	String setFilQualifToInstall(int id, MultipartFile[] fileToUpload);

	String setFilImpactToDemandeInfo(int id, MultipartFile[] fileToUpload);

	String updateDetailRegionInstall(int id, String region, String prefecture, String commune,String type);

	Integer getcountEIEByType(String type,int id_compt);

	Notification getNotificationByIdComptId(int id, int compteId);

	Notification getNotificationById(int id);

	String setAvisProjetDemandeInformation(int id, MultipartFile[] fileToUpload);

	String saveProducteurNotification(String nom_fr, String nom_ar, String contact_fr,String idf,String adresse_fr, String tel, String fax, String mail, int id_notif,int id_prod);

	String saveTransporeuretranger(MultipartFile[] fileToUpload, String raison, String matricule, String type_vehicule,String adresse,String port[], int id_notif,int id_trans);

	String saveTransporeuretrangerNational(MultipartFile[] fileToUpload, String raison, String matricule, String type_vehicule,String adresse, int id_notif,int id_trans);

	void deleteTransporteuretranger(int id_notif, int id_trans);

	void deleteProducteurNotification(int id_notif, int id_prod);

	void deleteAutoriteNotif(int id_notif, int id_aut);

	TransporteurEtranger getTransporteurEtrangerById(int id_trans);

	Producteur getProducteurById(int id_prod);

	String setStatutNotification(int id_notif, int id_statut, int compteId,String type);

	DocumentDechetND getDocumentDechetND();

	List<Commune> savecommuneDetailRegion(String id, int id_dmd, int compteId);

	 public void updateDemandeInformation(int id, DemandeInformation d );

	String updateDemandeInformationEE(int id, String intitule_projet, int montant_investissement, String tronsfrontalier, String interregion );

	String setFileToDemande(int id, MultipartFile[] fileToUpload);
	List<TransporteurParam> getTransporteurParamByCode(int code);

    Notification saveDocumentMouvement(int id_notif, int id_detail, int qte, MultipartFile file);

    Notification deleteDocMouvbyId(int id,int id_notif);

	String setNbrColies(int id_notif, int nbr);

	String setdocMouvement(MultipartFile file, int id_notif, int type);

	public int getNombreEIEByUser(int compteId, String type);

	DeclarationTransporteur getdeclarationbyNotification(int id_notification);
	public void changertatutDemande2(DemandeInformation drt, int statut);

	String updateDemandeInformationAE(int id, String intitule_projet, int montant_investissement, String nature_projet);
void createDeclarationTransporteur(int id_trans, int id_notif, int id_decl,MultipartFile[] file);

	DeclarationTransporteur getDeclaravionValideByNotificationId(int id_notification);

    List<TransporteurParam> getListTransporteurParamByCodeNotInNotif(int id_notification);

	List<TransporteurParam> search(String txt);

	Notification changerEtat(int id_notification,String Type);
    String saveDemandeAE(String id, MultipartFile[] fileToUpload, int compteId);
	void deletePort(int id, int id_trans);
    String saveFile_complementaire(int id_dmd, int id_ae, MultipartFile file, int compteId);

    String saveFile_Rapport_ae(int id_dmd,int id_rapport, MultipartFile file, int compteId);

	void  addCategorieDechet(int id_notif);

	void deleteCodeTmp(int id_coll, int id_code, int id_user, String type);
	void deleteCodeTmp_inst(int id_inst, int id_code, int id_user, String type);


	String changerStatutCT(int id);

	String changerStatutIT(int id);

	String changerTypeIT(int id);
}
