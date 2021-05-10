package com.EIE.demo.web;

import com.EIE.demo.model.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.UnderlinePatterns;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.springframework.batch.item.file.transform.Alignment;
import org.springframework.beans.factory.annotation.Value;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class GeneratePDFDocuments {


    @Value("${url}")
    private static String urlRest;
    private final static String url=urlRest;

    public static ByteArrayInputStream generateDocumentDeNotification(Notification ns) throws DocumentException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 30, 0);
        PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,9.0f,Font.BOLD);
        Font fontBox = new Font(base, 10f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Document de notification pour les mouvements des dechets ..... vers l'installation de traitement ou d'elimination ");
        headerPar.setFont(font);
        headerPar.setSpacingAfter(2);


        //Declaring Table
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);

        //Paragraph ==========================
        Paragraph par1=new Paragraph(16);

        par1.setFont(font);
        par1.add(new Phrase("1.Importateur- Notifiant : ",fontbold));
        par1.add(Chunk.NEWLINE);
        //========

        String nom_importateur ="nom importateur";
        String adresse_importateur ="adresse importateur";
        String persone_a_contacte_importateur = "PERSONNE A CONTACTER Importateur";
        String tele_importateur ="tel importateur";
        String fax_importateur ="fex importateur";
        String email_importateur ="email importateur";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant ww = ns.getImportateur();
            nom_importateur = ww.getNom_fr();
            adresse_importateur =ww.getAdresse_fr();
            tele_importateur =ww.getTel();
            fax_importateur =ww.getFax();
            email_importateur =ww.getMail();
        }

        par1.add("Nom : ");
//        par1.add("NOM");
        par1.add(nom_importateur);
        par1.add(Chunk.NEWLINE);

        par1.add("Adresse : ");
        par1.add(adresse_importateur);
//        par1.add("ADRESSE");
        par1.add(Chunk.NEWLINE);

        par1.add("Personne a contacter : ");
        par1.add(persone_a_contacte_importateur);
        par1.add(Chunk.NEWLINE);

        par1.add("Tel : ");
        par1.add(tele_importateur);
//        par1.add("TELEPHONE");
        par1.add(Chunk.NEWLINE);

        par1.add("Fax : ");
        par1.add(fax_importateur);
//        par1.add("FAX");
        par1.add(Chunk.NEWLINE);

        par1.add("Mail : ");
        par1.add(email_importateur);
//        par1.add("MAIL");
        par1.add(Chunk.NEWLINE);

        PdfPCell cellMerged = new PdfPCell();
        cellMerged.addElement(par1);
        cellMerged.setRowspan(3);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par2=new Paragraph(13);
        par2.setFont(font);
        //========
        String numero_notification=ns.getNum_notification()==null?"":ns.getNum_notification();
        String elimination="";
        if (ns.getEliminateur()!=null){
            elimination=ns.getEliminateur().getAdresse_fr()==null?"":ns.getEliminateur().getAdresse_fr();
        }

        boolean isElimination=elimination.equalsIgnoreCase("traitement");

        //========

        par2.add(new Phrase("2.No. de notification : ",fontbold));
        par2.add(numero_notification);
        par2.add(Chunk.NEWLINE);

        //Add Here Condition for checking the boxes

        par2.add("Notification consernant :  ");
        par2.add(Chunk.NEWLINE);

        par2.add("A.i) Expedition unique  :");
        par2.add(checkedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Expedition multiples:");
        par2.add(uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        par2.add("B.i) Elimination             :");
        par2.add(isElimination?checkedChunk:uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Valorisation              :");
        par2.add(isElimination?uncheckedChunk:checkedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        PdfPCell cell = new PdfPCell();
        cell.addElement(par2);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par3=new Paragraph(13);
        //========
        String nombre_expedition_prevu="66";
        //========

        par3.add(new Phrase("3.Nombre total d'éxpeditions prévues : ",fontbold));
        par3.add(nombre_expedition_prevu);

        par3.setSpacingAfter(7);

        cell = new PdfPCell();
        cell.addElement(par3);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par4=new Paragraph(13);
        par4.setFont(font);
        par4.setSpacingAfter(7);
        //========
        String quantite_en_tonne="1500";
        String quantite_en_m2="5900";
        //========

        par4.add(new Phrase("4.Quantité total prévue : ",fontbold));
        par4.add(Chunk.NEWLINE);
        par4.add("Mg/Tonnes : ");
        par4.add(quantite_en_tonne);
        par4.add(Chunk.NEWLINE);
        par4.add("m3 : ");
        par4.add(quantite_en_m2);

        cell = new PdfPCell();
        cell.addElement(par4);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par5=new Paragraph(13);
        par5.setFont(font);
        par5.setSpacingAfter(7);
        //========
        String premier_depart=ns.getPremier()==null?"":ns.getPremier();
        String dernier_depart=ns.getDernier()==null?"":ns.getDernier();
        //========

        par5.add(new Phrase("5.Période prévue des expéditions",fontbold));
        par5.add(Chunk.NEWLINE);
        par5.add("premier départ : ");
        par5.add(premier_depart);
        par5.add("    ");
        par5.add("Dernier départ : ");
        par5.add(dernier_depart);

        cell = new PdfPCell();
        cell.addElement(par5);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par6=new Paragraph(13);
        par6.setFont(font);
        par6.setSpacingAfter(7);
        //========
        String type_conditionnement ="type conditionnement";

        if(ns.getTypeconditionnement()!=null){
            TypeConditionnement t = ns.getTypeconditionnement();
            type_conditionnement = t.getNom_fr();
        }
        String prescription="prescription";
        boolean isPrescription=prescription.equalsIgnoreCase("oui");

        //========

        par6.add(new Phrase("6.Type(s) de conditionnnement(3) : ",fontbold));
        par6.add(type_conditionnement);
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase("Prescriptions spéciales de manutention : ",fontbold));
        par6.add(oui);
        par6.add(isPrescription?checkedChunk:uncheckedChunk);
        par6.add("      ");
        par6.add(non);
        par6.add(isPrescription?uncheckedChunk:checkedChunk);

        cell = new PdfPCell();
        cell.addElement(par6);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par7=new Paragraph(13);
        par7.setFont(font);
        par7.setSpacingAfter(7);
        //========

        String nom_transporteur ="nom transporteur";
        String adresse_transporteur ="adresse transporteur";
        String persone_a_contacte_transporteur = "PERSONNE A CONTACTER transporteur";
        String tele_transporteur ="tel transporteur";
        String fax_transporteur ="fex transporteur";
        String email_transporteur ="email transporteur";
        String moyen_de_transporteur = "moyen de transporteur";

        if(ns.getTransporteur()!=null){
            List<TransporteurParam> i = ns.getTransporteur();
            if(i.size()>0){
                nom_transporteur = i.get(0).getNom();
//            adresse_transporteur =i.get(0).get();
                tele_transporteur =i.get(0).getTel();
                fax_transporteur =i.get(0).getFax();
                email_transporteur =i.get(0).getEmail();
                //            moyen_de_transporteur =ns.getTransporteur().get(0).getMoyenTransport().getNom_fr();

            }


        }

        //========

        par7.add(new Phrase("7.Transporteur(s) prévu :",fontbold));
        par7.add(Chunk.NEWLINE);

        par7.add("Nom : ");
        par7.add(nom_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(adresse_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Personne a contacter : ");
        par7.add(persone_a_contacte_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Tel : ");
        par7.add(tele_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Fax : ");
        par7.add(fax_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Mail : ");
        par7.add(email_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Moyen de transport (5) : ");
        par7.add(moyen_de_transporteur);
        par7.add(Chunk.NEWLINE);

        cellMerged =new PdfPCell();
        cellMerged.setRowspan(2);
        cellMerged.addElement(par7);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par8=new Paragraph(13);
        par8.setFont(font);
        par8.setSpacingAfter(7);
        //========


        //========

        par8.add(new Phrase("10.Opérations d'élimination / Valorisation",fontbold));
        par8.add(Chunk.NEWLINE);
        par8.add("Code D (1)/Code R (2) : ");
        par8.add(" ---------------------- ");

        cell = new PdfPCell();
        cell.addElement(par8);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par9=new Paragraph(13);
        par9.setFont(font);
        par9.setSpacingAfter(7);
        //========


        //========


        par9.add(new Phrase("11.Dénomination et composition des déchets",fontbold));

        cell = new PdfPCell();
        cell.addElement(par9);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(7);
        //========

        String nom_producteur ="NOM producteur";
        String adresse_producteur ="ADRESSE producteur";
        String persone_a_contacte_producteur ="PERSONNE A CONTACTER Producteur";
        String tele_producteur ="TELE producteur";
        String fax_producteur ="FAX producteur";
        String mail_producteur ="EMAIL producteur";
        String lieu_procede_producteur ="Lieu procede producteur";

        if(ns.getProducteur()!=null){
            Producteur p = ns.getProducteur();
            nom_producteur = p.getNom_fr();
            adresse_producteur =p.getAdresse_fr();
            tele_producteur =p.getTel();
            fax_producteur =p.getFax();
            mail_producteur =p.getMail();
            lieu_procede_producteur =p.getLieu_fr();
        }

        //========


        par10.add(new Phrase("8.Producteur(s) des déchets",fontbold));
        par10.add(Chunk.NEWLINE);

        par10.add("Nom : ");
        par10.add(nom_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Adresse : ");
        par10.add(adresse_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Personne a contacter : ");
        par10.add(persone_a_contacte_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Tel : ");
        par10.add(tele_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Fax : ");
        par10.add(fax_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Mail : ");
        par10.add(mail_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Lieu et procede de production : ");
        par10.add(lieu_procede_producteur);
        par10.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par10);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(7);
        //========
        String carateristiques_physique = "carateristiques physique";
        if(ns.getCaracteristquePhysique() != null){
            CaracteristquePhysique c = ns.getCaracteristquePhysique();
            carateristiques_physique = c.getNom_fr();
        }
        //========

        par11.add(new Phrase("12.Caractéristiques physique (6) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add(carateristiques_physique);

        cell = new PdfPCell();
        cell.addElement(par11);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par12=new Paragraph(13);
        par12.setFont(font);
        par12.setSpacingAfter(7);

        String nom_entreprise ="nom entreprise";
        String address_entreprise ="adresse entreprise";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant i = ns.getImportateur();
            nom_entreprise = i.getNom_fr();
            address_entreprise =i.getAdresse_fr();

        }

        if(isElimination){
            par12.add(new Phrase("9. Installation d'élimination ",fontbold));
            //AddCondition to check or no
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation  ",fontbold));
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
        }else{
            par12.add(new Phrase("9. Installation d'élimination ",fontbold));
            //AddCondition to check or no
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation  ",fontbold));
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
        }


        par12.add("Nom : ");
        par12.add(nom_entreprise);
        par12.add(Chunk.NEWLINE);

        par12.add("Adresse : ");
        par12.add(address_entreprise);
        par12.add(Chunk.NEWLINE);

        par12.add("Personne a contacter : ");
        par12.add("PERSONNE A CONTACTER Entreprise Val Ou trait");
        par12.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par12);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par13=new Paragraph(13);
        par13.setFont(font);
        par13.setSpacingAfter(7);
        //========
        String code_National=ns.getCode().getId_code()==0?"":String.valueOf(ns.getCode().getId_code());
        //========

        par13.add(new Phrase("13.Identifications des déchets",fontbold));
        par13.add(Chunk.NEWLINE);
        par13.add("Convention de Bale.Annex 8(ou 9 s'il y a lieu) : ");
        par13.add("CONV. BALE");
        par13.add(Chunk.NEWLINE);
        par13.add("Code National(Catalogue Marocain des déchets) : ");
        par13.add(code_National);
        par13.add(Chunk.NEWLINE);
        par13.add("Code H : ");
        par13.add("CODE H");
        par13.add(Chunk.NEWLINE);
        par13.add("Code(s) des douanes (SH) : ");
        par13.add("CODE DES DOUANES");
        par13.add(Chunk.NEWLINE);
        par13.add("Autre (preciser) : ");
        par13.add("AUTRE");

        cell = new PdfPCell();
        cell.addElement(par13);
        table.addCell(cell);

        Paragraph par14=new Paragraph(13);
        par14.setFont(font);
        par14.setSpacingAfter(7);

        par14.add(new Phrase("Nom de la zone franche d'expédition",fontbold));

        cell = new PdfPCell();
        cell.addElement(par14);
        table.addCell(cell);

        Paragraph par15=new Paragraph(13);
        par15.setFont(font);
        par15.setSpacingAfter(7);
        //========

        String nom_zone_franche="Nom zone franche";

        if(ns.getZonneFranche() != null){
            ZonneFranche z = ns.getZonneFranche();
            nom_zone_franche = z.getNom_fr();
        }
        String nom_destination=ns.getDestination_final()==null?"":ns.getDestination_final();
        //========

        par15.add(new Phrase("Nom de la destination finale",fontbold));

        cell = new PdfPCell();
        cell.addElement(par15);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase( nom_zone_franche ) );
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(nom_destination));
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(7);
        //========
        String bureau_douane="";
        //========



        par18.add(new Phrase("14.Bureau de douane d'entrée :",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par18);
        table.addCell(cellMerged);

        cellMerged = new PdfPCell(new Phrase(bureau_douane));
        cellMerged.setColspan(2);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par20=new Paragraph(11);
        par20.setFont(font);
        par20.setSpacingAfter(7);
        par20.add(new Phrase("15.Declaration de l'importateur/producteur : ",fontbold));
        par20.add(Chunk.NEWLINE);
        par20.add("    Je soussigné certifie que les renseignements  indiques sont exacts et établis de bonne foi." +
                " Je certifie également que le mouvement des déchets sera couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises notamment l'assurance de transport des déchets dangereuses.");
        par20.add(Chunk.NEWLINE);

        par20.add("Nom : ");
        par20.add(nom_importateur);
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(dateFormat.format(new Date()));
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add("SIGNATURE");
        par20.add(new Chunk(glue));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par20);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par21=new Paragraph(13);
        par21.setFont(font);
        par21.setSpacingAfter(7);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("RESERVE AUX AUTORITES COMPETANTES",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par21);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par22=new Paragraph(13);
        par22.setFont(font);
        par22.setSpacingAfter(7);
        //========
        String notification_recu=ns.getDate_reel()==null?"":dateFormat.format(ns.getDate_reel());


        //========


        par22.add(new Phrase("16.Accusé de réception delivré par le Département de l'Environement",fontbold));
        par22.add(Chunk.NEWLINE);

        par22.add("Notification reçue le : ");
        par22.add(notification_recu);
        par22.add(Chunk.NEWLINE);

        par22.add("Accusé de réception transmis le : ");
        par22.add(" ------------- ");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom de l'autorité compétente  : ");
        par22.add(" ------------- ");
        par22.add(Chunk.NEWLINE);
        par22.add("cachet et/ou signature  : ");
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);
//        par23.setSpacingAfter(7);

        par23.add(new Phrase("17.Consentement écrit au mouvement accorde par le departement de l'environement",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement accordé le : ");
        par23.add("DATE ------");
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement valable du : ");
        par23.add("DATE1 ");
        par23.add("au : ");
        par23.add("DATE2 ");
        par23.add(Chunk.NEWLINE);

        par23.add("Conditions particulières : ");
        par23.add(oui);
        //Add Condition to check to uncheck
        par23.add(checkedChunk);
        par23.add("      ");
        par23.add(non);
        //Here Also
        par23.add(uncheckedChunk);
        par23.add(Chunk.NEWLINE);
        par23.add("Nom de l'autorité compétente  : ");
        par23.add(" ------------- ");
        par23.add(Chunk.NEWLINE);
        par23.add("cachet et/ou signature  : ");
        par23.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par23);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par24=new Paragraph(13);
        par24.setSpacingAfter(7);
        par24.add(new Phrase("18.Conditions particulieresau consentement ou raisons de l'objection :",fontbold));

//Testing before adding to the document
//        Chunk oui = new Chunk("Oui : ",font);
//        par24.add(oui);
//        par24.add(checkedChunk);
//
//        Chunk non = new Chunk("Non : ",font);
//        par24.add(non);
//        par24.add(uncheckedChunk);


        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par24);
        table.addCell(cellMerged);

        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentDeNotification2(Notification ns) throws DocumentException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 30, 0);
        PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,9.0f,Font.BOLD);
        Font fontBox = new Font(base, 10f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Document de notification - Mouvement/transfers transfrontières de déchets ");
        headerPar.setFont(font);
        headerPar.setSpacingAfter(2);


        //Declaring Table
        PdfPTable table = new PdfPTable(10);
        table.setWidthPercentage(100);

        //Paragraph ==========================
        Paragraph par1=new Paragraph(16);

        par1.setFont(font);
        par1.add(new Phrase("1.Exportateur- Notifiant   ",fontbold));
        par1.add("N° d'enregistrement :");
        par1.add(Chunk.NEWLINE);
        //========

        par1.add("Nom : ");
//        par1.add("NOM");
        par1.add(ns.getNom());
        par1.add(Chunk.NEWLINE);

        par1.add("Adresse : ");
        par1.add(ns.getAdresse());
//        par1.add("ADRESSE");
        par1.add(Chunk.NEWLINE);

        par1.add("Personne a contacter : ");
        par1.add(ns.getPersonne());
        par1.add(Chunk.NEWLINE);

        par1.add("Tél : ");
        par1.add(ns.getTel());
//        par1.add("TELEPHONE");
        par1.add(Chunk.NEWLINE);

        par1.add("Télécopie : ");
        par1.add(ns.getTelecopie());
//        par1.add("FAX");
        par1.add(Chunk.NEWLINE);

        par1.add("Courier éléctronique : ");
        par1.add(ns.getCourrier());
//        par1.add("MAIL");
        par1.add(Chunk.NEWLINE);

        PdfPCell cellMerged = new PdfPCell();
        cellMerged.addElement(par1);
        cellMerged.setRowspan(3);
        cellMerged.setColspan(5);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par2=new Paragraph(13);
        par2.setFont(font);
        //========
        String numero_notification=ns.getNum_notification()==null?"":ns.getNum_notification();
        String elimination="";
        if (ns.getEliminateur()!=null){
            elimination=ns.getEliminateur().getAdresse_fr()==null?"":ns.getEliminateur().getAdresse_fr();
        }

        boolean isElimination=elimination.equalsIgnoreCase("traitement");

        //========

        par2.add(new Phrase("3.No. de notification : ",fontbold));
        par2.add(numero_notification);
        par2.add(Chunk.NEWLINE);

        //Add Here Condition for checking the boxes

        par2.add("Notification consernant :  ");
        par2.add(Chunk.NEWLINE);

        par2.add("A.i) Transfert unique  :");
        par2.add(checkedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Transfer multiples:");
        par2.add(uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        par2.add("B.i) Elimination             :");
        par2.add(isElimination?checkedChunk:uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Valorisation              :");
        par2.add(isElimination?uncheckedChunk:checkedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        par2.add("C. Instalation de valorisation bénéficiant du consentement préable (2) (3) :");
        par2.add(new Chunk(glue));
        par2.add("Oui");
        par2.add(uncheckedChunk);
        par2.add(new Chunk(glue));
        par2.add("Non");
        par2.add(uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        PdfPCell cell = new PdfPCell();
        cell.addElement(par2);
        cell.setColspan(5);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par3=new Paragraph(13);
        //========
        String nombre_expedition_prevu="66";
        //========

        par3.add(new Phrase("4.Nombre total de transfert prévues : ",fontbold));
        par3.add(nombre_expedition_prevu);

        par3.setSpacingAfter(7);

        cell = new PdfPCell();
        cell.addElement(par3);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par4=new Paragraph(13);
        par4.setFont(font);
        par4.setSpacingAfter(7);
        //========
        String qte = ns.getQuantite()!=null?ns.getQuantite():"";
        String unite = ns.getUnite().getNom_fr()!=null?ns.getUnite().getNom_fr():"";

        par4.add(new Phrase("5.Quantité total prévue (4) : "+qte+" "+unite,fontbold));
        par4.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par4);
        cell.setColspan(5);
        table.addCell(cell);

        Paragraph par01=new Paragraph(16);
        par01.setFont(font);
        par01.add(new Phrase("2.Importateur- Notifiant   ",fontbold));
        par01.add("N° d'enregistrement :");
        par01.add(Chunk.NEWLINE);
        //========

        String nom_importateur ="";
        String adresse_importateur ="";
        String persone_a_contacte_importateur = "";
        String tele_importateur ="";
        String fax_importateur ="";
        String email_importateur ="";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant ww = ns.getImportateur();
            nom_importateur = ww.getNom_fr();
            adresse_importateur =ww.getAdresse_fr();
            tele_importateur =ww.getTel();
            fax_importateur =ww.getFax();
            email_importateur =ww.getMail();
        }

        par01.add("Nom : ");
//        par1.add("NOM");
        par01.add(nom_importateur);
        par01.add(Chunk.NEWLINE);

        par01.add("Adresse : ");
        par01.add(adresse_importateur);
//        par1.add("ADRESSE");
        par01.add(Chunk.NEWLINE);

        par01.add("Personne a contacter : ");
        par01.add(persone_a_contacte_importateur);
        par01.add(Chunk.NEWLINE);

        par01.add("Tél : ");
        par01.add(tele_importateur);
//        par1.add("TELEPHONE");
        par01.add(Chunk.NEWLINE);

        par01.add("Télécopie : ");
        par01.add(fax_importateur);
//        par1.add("FAX");
        par01.add(Chunk.NEWLINE);

        par01.add("Courier éléctronique : ");
        par01.add(email_importateur);
//        par1.add("MAIL");
        par01.add(Chunk.NEWLINE);

        cellMerged = new PdfPCell();
        cellMerged.addElement(par01);
        cellMerged.setRowspan(2);
        cellMerged.setColspan(5);
        table.addCell(cellMerged);






        //Paragraph ==========================
        Paragraph par5=new Paragraph(13);
        par5.setFont(font);
        par5.setSpacingAfter(7);
        //========
        String premier_depart=ns.getPremier()==null?"":ns.getPremier();
        String dernier_depart=ns.getDernier()==null?"":ns.getDernier();
        //========

        par5.add(new Phrase("6.Période prévue pour le(s) transfert(s)",fontbold));
        par5.add(Chunk.NEWLINE);
        par5.add("premier départ : ");
        par5.add(premier_depart);
        par5.add("    ");
        par5.add("Dernier départ : ");
        par5.add(dernier_depart);

        cell = new PdfPCell();
        cell.addElement(par5);
        cell.setColspan(5);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par6=new Paragraph(13);
        par6.setFont(font);
        par6.setSpacingAfter(7);
        //========
        String type_conditionnement ="type conditionnement";

        if(ns.getTypeconditionnement()!=null){
            TypeConditionnement t = ns.getTypeconditionnement();
            type_conditionnement = t.getNom_fr();
        }
        String prescription="";
        boolean isPrescription=prescription.equalsIgnoreCase("oui");

        //========

        par6.add(new Phrase("7.Type(s) de conditionnnement(3) : ",fontbold));
        par6.add(type_conditionnement);
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase("Prescriptions spéciales de manutention(6) : ",fontbold));
        par6.add(oui);
        par6.add(isPrescription?checkedChunk:uncheckedChunk);
        par6.add("      ");
        par6.add(non);
        par6.add(isPrescription?uncheckedChunk:checkedChunk);

        cell = new PdfPCell();
        cell.addElement(par6);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par7=new Paragraph(13);
        par7.setFont(font);
        par7.setSpacingAfter(7);
        //========

        String nom_transporteur ="";
        String adresse_transporteur ="";
        String persone_a_contacte_transporteur = "";
        String tele_transporteur ="";
        String fax_transporteur ="";
        String email_transporteur ="";
        String moyen_de_transporteur = "";

        if(ns.getTransporteur()!=null){
            List<TransporteurParam> i = ns.getTransporteur();
            if(i.size()>0){
                nom_transporteur = i.get(0).getNom();
//            adresse_transporteur =i.get(0).get();
                tele_transporteur =i.get(0).getTel();
                fax_transporteur =i.get(0).getFax();
                email_transporteur =i.get(0).getEmail();
                //            moyen_de_transporteur =ns.getTransporteur().get(0).getMoyenTransport().getNom_fr();

            }


        }

        //========

        par7.add(new Phrase("8.Transporteur(s) prévu(s)  ",fontbold));
        par7.add("N° d'enregistrement :");
        par7.add(Chunk.NEWLINE);

        par7.add("Nom : ");
        par7.add(nom_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(adresse_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Personne a contacter : ");
        par7.add(persone_a_contacte_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Tél : ");
        par7.add(tele_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Télécopie : ");
        par7.add(fax_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Courier éléctroniques : ");
        par7.add(email_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Moyen de transport (5) : ");
        par7.add(moyen_de_transporteur);
        par7.add(Chunk.NEWLINE);

        cellMerged =new PdfPCell();
        cellMerged.setRowspan(2);
        cellMerged.setColspan(5);
        cellMerged.addElement(par7);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par8=new Paragraph(13);
        par8.setFont(font);
        par8.setSpacingAfter(7);
        //========


        //========

        par8.add(new Phrase("11.Opérations d'élimination / Valorisation (2)",fontbold));
        par8.add(Chunk.NEWLINE);
        par8.add("Code D /Code R (5) : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Technique utilisé (6) : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Motif de l'exportation (1) (6) : ");
        par8.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par8);
        cell.setColspan(5);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par9=new Paragraph(13);
        par9.setFont(font);
        par9.setSpacingAfter(7);
        //========


        //========


        par9.add(new Phrase("12.Dénomination et composition des déchets (6)",fontbold));

        cell = new PdfPCell();
        cell.setColspan(5);
        cell.addElement(par9);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(7);
        //========

        String nom_producteur ="";
        String adresse_producteur ="";
        String persone_a_contacte_producteur ="";
        String tele_producteur ="";
        String fax_producteur ="";
        String mail_producteur ="";
        String lieu_procede_producteur ="";

        if(ns.getProducteur()!=null){
            Producteur p = ns.getProducteur();
            nom_producteur = p.getNom_fr();
            adresse_producteur =p.getAdresse_fr();
            tele_producteur =p.getTel();
            fax_producteur =p.getFax();
            mail_producteur =p.getMail();
            lieu_procede_producteur =p.getLieu_fr();
        }

        //========


        par10.add(new Phrase("9.Producteur(s) des déchets (1) (7) (8) ",fontbold));
        par10.add("N° d'enregistrement:");
        par10.add(Chunk.NEWLINE);

        par10.add("Nom : ");
        par10.add(nom_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Adresse : ");
        par10.add(adresse_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Personne a contacter : ");
        par10.add(persone_a_contacte_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Tél : ");
        par10.add(tele_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Télécopie : ");
        par10.add(fax_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Courrier éléctronique : ");
        par10.add(mail_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Lieu et procede de production : ");
        par10.add(lieu_procede_producteur);
        par10.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par10);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(7);
        //========
        String carateristiques_physique = "carateristiques physique";
        if(ns.getCaracteristquePhysique() != null){
            CaracteristquePhysique c = ns.getCaracteristquePhysique();
            carateristiques_physique = c.getNom_fr();
        }
        //========

        par11.add(new Phrase("13.Caractéristiques physique (5) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add(carateristiques_physique);

        cell = new PdfPCell();
        cell.addElement(par11);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par12=new Paragraph(13);
        par12.setFont(font);
        par12.setSpacingAfter(7);

        String nom_entreprise ="";
        String address_entreprise ="";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant i = ns.getImportateur();
            nom_entreprise = i.getNom_fr();
            address_entreprise =i.getAdresse_fr();

        }

        if(isElimination){
            par12.add(new Phrase("10. Installation d'élimination ",fontbold));
            //AddCondition to check or no
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation  (2) ",fontbold));
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
        }else{
            par12.add(new Phrase("10. Installation d'élimination ",fontbold));
            //AddCondition to check or no
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation (2)  ",fontbold));
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
        }


        par12.add("Nom : ");
        par12.add(nom_entreprise);
        par12.add(Chunk.NEWLINE);

        par12.add("Adresse : ");
        par12.add(address_entreprise);
        par12.add(Chunk.NEWLINE);

        par12.add("Personne a contacter : ");
        par12.add(Chunk.NEWLINE);

        par12.add("Tél : ");
        par12.add(tele_importateur);
        par12.add(Chunk.TABBING);

        par12.add("Télécopie : ");
        par12.add(fax_importateur);
        par12.add(Chunk.NEWLINE);

        par12.add("Courrier éléctronique : ");
        par12.add(email_importateur);
        par12.add(Chunk.NEWLINE);

        par12.add("Lieu effectif de l'élimination/de la valorisation : ");
        par12.add(lieu_procede_producteur);
        par12.add(Chunk.NEWLINE);




        cell = new PdfPCell();
        cell.addElement(par12);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par13=new Paragraph(13);
        par13.setFont(font);
        par13.setSpacingAfter(7);
        //========
        String code_National=ns.getCode().getId_code()==0?"":String.valueOf(ns.getCode().getId_code());
        //========
        par13.add(new Phrase("14. Identification des déchets (indiquer les codes correspondants)",fontbold));
        par13.add(Chunk.NEWLINE);
        par13.add("i) Convention de Bale.Annex 8(ou 9 s'il y a lieu) : B3140");
        par13.add(Chunk.NEWLINE);
        par13.add("ii) CODE. OCDE [si différent fe i)]");
        par13.add(Chunk.NEWLINE);
        par13.add("iii) Liste des déchets de la CE : 16 01 03");
        par13.add(Chunk.NEWLINE);
        par13.add("iv) Code national dans le pays d'éxportation : 16 01 03");
        par13.add(Chunk.NEWLINE);
        par13.add("iv) Code national dans le pays d'importation : 16 01 03");
        par13.add(Chunk.NEWLINE);
        par13.add("v) Code National(Catalogue Marocain des déchets) : ");
        par13.add(code_National);
        par13.add(Chunk.NEWLINE);
        par13.add("vi) Autres(préciser) : ");
        par13.add(Chunk.NEWLINE);
        par13.add("vii) CODE Y : -");
        par13.add(Chunk.NEWLINE);
        par13.add("viii) CODE H(1) : -");
        par13.add(Chunk.NEWLINE);
        par13.add("ix) Classe ONU (1) : ");
        par13.add(Chunk.NEWLINE);
        par13.add("x) N° d'identification : ");
        par13.add(Chunk.NEWLINE);
        par13.add("xi) Dénomination ONU : ");
        par13.add(Chunk.NEWLINE);
        par13.add("xii) Code(s) des douane(s) (SH) : 40004 00 00");

        cell = new PdfPCell();
        cell.addElement(par13);
        cell.setColspan(5);
        table.addCell(cell);


        Paragraph par14=new Paragraph(13);
        par14.setFont(font);
        par14.setSpacingAfter(7);

        par14.add(new Phrase("15.a) Pays/Etats concernés,b) numero de codes des autorisés compétences d'il y a lieu,c) points d'entrée ou de sortie(point de passage frontalier ou port )",font));

        cell = new PdfPCell();
        cell.addElement(par14);
        cell.setColspan(10);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("Etat d'exportation/d'éxpédition",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("Etat(s) de transit (entrée et sortie )",font));
        cell.setColspan(6);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("Etat d'importation/ de destination",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("a)",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("b)",font));
        cell.setColspan(2);;
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);;
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);;
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("c)",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(7);
        //========
        String bureau_douane="";
        //========



        par18.add(new Phrase("16.Bureau de douane d'entrée et/ou de sortie et/ou d'exportation (Communauté européenne) :",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        cellMerged.addElement(par18);
        table.addCell(cellMerged);

        Paragraph par018=new Paragraph(13);
        par018.setFont(font);
        par018.setSpacingAfter(7);
        //========
        par018.add("Entrée :");
        par018.add(Chunk.TABBING);
        par018.add(Chunk.TABBING);
        par018.add("Sortie :");
        par018.add(Chunk.TABBING);
        par018.add(Chunk.TABBING);
        par018.add("Exportation :");
        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par20=new Paragraph(11);
        par20.setFont(font);
        par20.setSpacingAfter(7);
        par20.add(new Phrase("15.Declaration de l'exportateur/du notifiant/du producteur (1) : ",fontbold));
        par20.add(Chunk.NEWLINE);
        par20.add("    Je soussigné certifie que les renseignements  indiques sont exacts et établis de bonne foi." +
                " Je certifie également que le mouvement transfrontière est ou  sera couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises .");
        par20.add(Chunk.NEWLINE);

        par20.add("Nom de l'exportateur/ du notifiant : ");
        par20.add(nom_importateur);
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(dateFormat.format(new Date()));
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add("SIGNATURE");
        par20.add(new Chunk(glue));
        par20.add(Chunk.NEWLINE);

        par20.add("Nom du producteur : ");
        par20.add(nom_importateur);
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(dateFormat.format(new Date()));
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add("SIGNATURE");
        par20.add(new Chunk(glue));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        cellMerged.addElement(par20);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par21=new Paragraph(13);
        par21.setFont(font);
        par21.setSpacingAfter(7);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("RESERVE AUX AUTORITES COMPETANTES",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        cellMerged.addElement(par21);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par22=new Paragraph(13);
        par22.setFont(font);
        par22.setSpacingAfter(7);
        //========
        String notification_recu=ns.getDate_reel()==null?"":dateFormat.format(ns.getDate_reel());


        //========


        par22.add(new Phrase("19.Accusé de réception delivré par l'autorité compétente des pays d'importation - de destination / de transit (1) / d'exportation - d'expédition (9) : ",fontbold));
        par22.add(Chunk.NEWLINE);

        par22.add("Pays : ");
        par22.add("");
        par22.add(Chunk.NEWLINE);

        par22.add("Notification reçue le : ");
        par22.add(notification_recu);
        par22.add(Chunk.NEWLINE);

        par22.add("Accusé de réception transmis le : ");
        par22.add(" ------------- ");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom de l'autorité compétente  : ");
        par22.add(" ------------- ");
        par22.add(Chunk.NEWLINE);
        par22.add("cachet et/ou signature  : ");
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);
//        par23.setSpacingAfter(7);

        par23.add(new Phrase("20.Consentement écrit (1) (8) au mouvement accordé par l'autorité compétente de (pays)",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement accordé le : ");
        par23.add("DATE ------");
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement valable du : ");
        par23.add("DATE1 ");
        par23.add("au : ");
        par23.add("DATE2 ");
        par23.add(Chunk.NEWLINE);

        par23.add("Conditions particulières : ");
        par23.add(oui);
        //Add Condition to check to uncheck
        par23.add(checkedChunk);
        par23.add("      ");
        par23.add(non);
        //Here Also
        par23.add(uncheckedChunk);
        par23.add(Chunk.NEWLINE);
        par23.add("Nom de l'autorité compétente  : ");
        par23.add(" ------------- ");
        par23.add(Chunk.NEWLINE);
        par23.add("cachet et/ou signature  : ");
        par23.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par23);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par024=new Paragraph(13);
        par024.setSpacingAfter(7);
        par024.add(new Phrase("21.Conditions particulieresau consentement ou raisons de l'objection :",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        cellMerged.addElement(par024);
        table.addCell(cellMerged);
        //Paragraph ====
        Paragraph par24=new Paragraph(12);
        par24.setFont(font);
        par24.setSpacingAfter(4);

        par24.add("(1) Requis par la convention de Bale .");
        par24.add(Chunk.NEWLINE);
        par24.add("(2) En cas d'operation R12/R13 ou D13-D15, joindre aussi s'il y a lieu les renseignement correspondants sur les installation R12/R13 ou D13-D15 concernés et les installation R1-R11 ou D1-D12 concernés ");
        par24.add(Chunk.NEWLINE);
        par24.add("(3) A remplir pour les mouvement dans la zone de l'OCDE et seulement dans les cas visés par B ii). ");
        par24.add(Chunk.NEWLINE);
        par24.add("(4) Joindre une liste détaillée en cas de transferts multiples . ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par24);
        cell.setColspan(5);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par25=new Paragraph(12);
        par25.setFont(font);
        par25.setSpacingAfter(4);

        par25.add("(5) Voir les codes dans la liste des abréviation et codes ci-jointe .");
        par25.add(Chunk.NEWLINE);
        par25.add("(6) Joindre des renseignements plus détaillés s'il y a lieu . ");
        par25.add(Chunk.NEWLINE);
        par25.add("(7) Joindre des liste s'il y a plusieurs producteurs . ");
        par25.add(Chunk.NEWLINE);
        par25.add("(8) Si la légalisation nationale l'exige ");
        par25.add(Chunk.NEWLINE);
        par25.add("(9) Le Cas échéant dans le cadre de la décision de l'OCDE . ");
        par25.add(Chunk.NEWLINE);
        par25.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par25);
        cell.setColspan(5);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        table.addCell(cell);

        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generateDocumentDeMouvement2(Notification ns) throws DocumentException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();
        DateFormat df = new SimpleDateFormat("dd-mm-yyyy");
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(Font.FontFamily.TIMES_ROMAN,14.0f);
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,9.0f,Font.BOLD);
        Font fontBox = new Font(base, 10f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph();
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add(new Phrase("Document de mouvements des déchets . . . . . . . vers L’installation de traitement ou d’élimination.",fontH1));
        headerPar.setSpacingAfter(7);
        headerPar.setExtraParagraphSpace(12);

        //Declaring Table
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);

        //Paragraph ====

        Paragraph par1= new Paragraph();
        par1.setFont(font);
        par1.setSpacingAfter(5);
        //=========
        String numero_notification=ns.getNum_notification().equals("")?"......":ns.getNum_notification();
        String numero_serie=(ns.getSerie()==null||ns.getSerie().equals(""))?".......":ns.getSerie();
        //=========
        par1.add(new Phrase("1. Correspondant à la notification No. : ",fontbold));
        par1.add(numero_notification);
        par1.add(Chunk.TABBING);
        par1.add(Chunk.TABBING);
        par1.add(new Phrase("2. No. De série de l'expédition/nombre total d'expéditions : ",fontbold));
        par1.add(numero_serie);

        PdfPCell cell=new PdfPCell();
        cell.addElement(par1);
        cell.setPaddingTop(-2);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par2=new Paragraph(12);
        par2.setFont(font);
        par2.setSpacingAfter(3);
        //========
        String nom_importateur = "";
        String adresse_importateur = "";
        String persone_a_contacte_importateur ="";
        String tele_importateur = "";
        String fax_importateur = "";
        String email_importateur = "";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant np = ns.getImportateur();
            nom_importateur =np.getNom_fr();
            adresse_importateur = np.getAdresse_fr();
            persone_a_contacte_importateur = np.getContact_fr();
            tele_importateur = np.getTel();
            fax_importateur = np.getFax();
            email_importateur = np.getMail();
        }
        //========

        par2.add(new Phrase("3. Importateur – Notifiant :  ",fontbold));
        par2.add(Chunk.NEWLINE);

        par2.add("Nom : ");
        par2.add(nom_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Adresse : ");
        par2.add(adresse_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Personne a contacter : ");
        par2.add(persone_a_contacte_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Tel : ");
        par2.add(tele_importateur);
        par2.add(new Chunk(glue));

        par2.add("Fax : ");
        par2.add(fax_importateur);
        par2.add(new Chunk(glue));

        par2.add("Mail : ");
        par2.add(email_importateur);
        par2.add(new Chunk(glue));

        cell=new PdfPCell();
        cell.addElement(par2);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par3=new Paragraph(12);
        par3.setFont(font);
        par3.setSpacingAfter(5);
        //========

        par3.add(new Phrase("4. Quantité réelle : ",fontbold));
        par3.add(Chunk.TABBING);
        par3.add("Mg (tonnes) : ");
        par3.add(Chunk.TABBING);
        par3.add(Chunk.TABBING);
        par3.add("m3 : ");

        cell = new PdfPCell();
        cell.addElement(par3);
        cell.setPaddingTop(-2);
        cell.setColspan(4);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par4=new Paragraph(12);
        par4.setFont(font);
        par4.setSpacingAfter(5);

        par4.add(new Phrase("5. Date réelle de l'expédition : ",fontbold));
        cell = new PdfPCell();
        cell.addElement(par4);
        cell.setPaddingTop(-2);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par5=new Paragraph(12);
        par5.setFont(font);
        par5.setSpacingAfter(3);
        //========
        boolean isprescription=true;//ns.getPrescription().equalsIgnoreCase("oui");

        //========
        par5.add(new Phrase("6. Conditionnement",fontbold));
        par5.add(Chunk.TABBING);
        par5.add("Type(s)  (3) : ");
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add("Nombre de colis :");
        par5.add(Chunk.NEWLINE);
        par5.add(new Phrase("Prescriptions particulières de manutention (2) :",fontbold));
        par5.add(Chunk.TABBING);
        par5.add(oui);
        par5.add(isprescription?checkedChunk:uncheckedChunk);
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add(non);
        par5.add(isprescription?uncheckedChunk:checkedChunk);

        cell = new PdfPCell();
        cell.addElement(par5);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par6=new Paragraph(12);
        par6.setFont(font);
        par6.setSpacingAfter(3);

        par6.add(new Phrase("7. a) 1er transporteur  : ",fontbold));
        par6.add(Chunk.NEWLINE);

        par6.add("Nom : ");
        par6.add(Chunk.NEWLINE);

        par6.add("Adresse : ");
        par6.add(Chunk.NEWLINE);

        par6.add("Personne a contacter : ");
        par6.add(Chunk.NEWLINE);

        par6.add("Tel : ");
        par6.add(Chunk.NEWLINE);

        par6.add("Fax : ");
        par6.add(Chunk.NEWLINE);

        par6.add("Mail : ");
        par6.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par6);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par7=new Paragraph(12);
        par7.setFont(font);
        par7.setSpacingAfter(3);
        par7.add(new Phrase("7. b) 2ème transporteur : ",fontbold));
        par7.add(Chunk.NEWLINE);

        par7.add("Nom : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Personne a contacter : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Tel : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Fax : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Mail : ");
        par7.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par7);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par8=new Paragraph(12);
        par8.setFont(font);
        par8.setSpacingAfter(3);
        par8.add(new Phrase("7. c) Dernier transporteur : ",fontbold));
        par8.add(Chunk.NEWLINE);

        par8.add("Nom : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Adresse : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Personne a contacter : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Tel : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Fax : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Mail : ");
        par8.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par8);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par9=new Paragraph();
        par9.setSpacingAfter(4);
        par9.add(new Phrase(" - - - - - - A remplir par le représentant du transporteur - - - - - -",fontbold));
        par9.setAlignment(Element.ALIGN_CENTER);
        cell=new PdfPCell();
        cell.setPaddingTop(-6);
        cell.addElement(par9);
//      cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(4);

        par10.add(new Phrase("Moyen de transport (5) : ",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add("Date de la prise en charge : ");
        par10.add(Chunk.NEWLINE);
        par10.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par10);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(4);

        par11.add(new Phrase("Moyen de transport (5) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add("Date de la prise en charge : ");
        par11.add(Chunk.NEWLINE);
        par11.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par11);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par12=new Paragraph(12);
        par12.setFont(font);
        par12.setSpacingAfter(4);

        par12.add(new Phrase("Moyen de transport (5) : ",fontbold));
        par12.add(Chunk.NEWLINE);
        par12.add("Date de la prise en charge : ");
        par12.add(Chunk.NEWLINE);
        par12.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par12);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par13=new Paragraph(12);
        par13.setFont(font);
        par13.setSpacingAfter(4);


        par13.add(new Phrase("8. Producteur(s) des déchets : ",fontbold));
        par13.add(Chunk.NEWLINE);

        par13.add("Nom : ");
        par13.add(Chunk.NEWLINE);

        par13.add("Adresse : ");
        par13.add(Chunk.NEWLINE);

        par13.add("Personne a contacter : ");
        par13.add(Chunk.NEWLINE);

        par13.add("Tel : ");
        par13.add(Chunk.TABBING);

        par13.add("Fax : ");
        par13.add(Chunk.TABBING);
        par13.add(Chunk.NEWLINE);

        par13.add("Mail : ");
        par13.add(Chunk.NEWLINE);

        par13.add("Lieu de production (2) : ");
        par13.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par13);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====

        Paragraph par14=new Paragraph(12);
        par14.setFont(font);
        par14.setSpacingAfter(4);

        par14.add(new Phrase("11. Dénomination et composition des déchets  : ",fontbold));
        par14.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par14);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par15=new Paragraph(12);
        par15.setFont(font);
        par15.setSpacingAfter(4);

        par15.add(new Phrase("12. Caractéristiques physiques (6) :",fontbold));
        par15.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par15);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);
//Paragraph ====
        Paragraph par16=new Paragraph(12);
        par16.setFont(font);
        par16.setSpacingAfter(5);

        par16.add(new Phrase("9. Installation d'élimination :  ",fontbold));
        par16.add(ns.getEliminateur()!=null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("ou",fontbold));
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("de valorisation (2):   ",fontbold));
        par16.add(ns.getEliminateur()==null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.NEWLINE);

        par16.add("Nom : ");
        par16.add(Chunk.NEWLINE);

        par16.add("Adresse : ");
        par16.add(Chunk.NEWLINE);

        par16.add("Personne a contacter : ");
        par16.add(Chunk.NEWLINE);

        par16.add("Tél : ");
        par16.add(Chunk.TABBING);

        par16.add("Fax : ");
        par16.add(Chunk.TABBING);
        par16.add(Chunk.NEWLINE);

        par16.add("Mail : ");
        par16.add(Chunk.NEWLINE);

        par16.add("Lieu effectif de l'élimination/valorisation : ");
        par16.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par16);
        cell.setPaddingTop(-2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par17=new Paragraph(15);
        par17.setFont(font);
        par17.setSpacingAfter(4);

        par17.add(new Phrase("13. Identification des déchets (indiquer les codes correspondants)",fontbold));
        par17.add(Chunk.NEWLINE);
        par17.add("Convention de Bale.Annex 8(ou 9 s'il y a lieu) : ");
        par17.add("CONV. BALE");
        par17.add(Chunk.NEWLINE);
        par17.add("Code National(Catalogue Marocain des déchets) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("Code H : ");
        par17.add("CODE H");
        par17.add(Chunk.NEWLINE);
        par17.add("Code(s) des douanes (SH) : ");
        par17.add("CODE DES DOUANES");
        par17.add(Chunk.NEWLINE);
        par17.add("Autre (preciser) : ");
        par17.add("AUTRE");

        cell = new PdfPCell();
        cell.addElement(par17);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(4);

        par18.add(new Phrase("10. Opération d'élimination/valorisation",fontbold));
        par18.add(Chunk.NEWLINE);
        par18.add("Code D (1)  / R (2) : ");

        cell = new PdfPCell();
        cell.addElement(par18);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par19=new Paragraph(13);
        par19.setFont(font);
        par19.setSpacingAfter(4);

        par19.add(new Phrase("14. Déclaration de l'importateur / producteur  : ",fontbold));

        par19.add(Chunk.NEWLINE);
        par19.add("    Je soussigné certifie que les renseignements  indiques sont exacts et établis de bonne foi." +
                " Je certifie également que le mouvement des déchets sera couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises notamment l'assurance de transport des déchets dangereuses.");
        par19.add(Chunk.NEWLINE);

        par19.add("Nom : ");
        par19.add(new Chunk(glue));
        par19.add("Date : ");
        par19.add(new Chunk(glue));
        par19.add("Signature : ");
        par19.add(new Chunk(glue));

        cell = new PdfPCell();
        cell.addElement(par19);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par20=new Paragraph(12);
        par20.setFont(font);
        par20.setSpacingAfter(4);

        par20.add(new Phrase("15. Expédition reçue l’installation de valorisation/élimination : ",fontbold));
        par20.add(Chunk.NEWLINE);

        par20.add("Nom : ");
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add(new Chunk(glue));

        cell = new PdfPCell();
        cell.addElement(par20);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par21=new Paragraph(12);
        par21.setSpacingAfter(4);
        cell.setPaddingTop(-10.0f);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("A REMPLIR PAR L'INSTALLATION D'ELIMINATION / VALORISATION",fontbold));

        cell = new PdfPCell();
        cell.addElement(par21);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par22=new Paragraph(12);
        par22.setFont(font);
        par22.setSpacingAfter(4);

        par22.add(new Phrase("16. Expédition reçue à l'installation d'élimination ",fontbold));
        par22.add(checkedChunk);
        par22.add(Chunk.TABBING);
        par22.add(new Phrase("ou",fontbold));
        par22.add(Chunk.TABBING);
        par22.add(new Phrase("de valorisation (2):   ",fontbold));
        par22.add(checkedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Date de reception : ");
        par22.add(Chunk.TABBING);
        par22.add("Acceptée : ");
        par22.add(checkedChunk);
        par22.add(Chunk.TABBING);
        par22.add("Rejetée* : ");
        par22.add(checkedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Quantité reçue : ");
        par22.add("Tonnes : ");
        par22.add(Chunk.TABBING);
        par22.add("m3 : ");
        par22.add(Chunk.NEWLINE);
        par22.add("* contacter immédiatement les autorités compétentes");
        par22.add(Chunk.NEWLINE);

        par22.add("Date approximative d'élimination/valorisation :");
        par22.add(Chunk.NEWLINE);

        par22.add("Opération d'élimination/valorisation (1 et 2) :");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom : ");
        par22.add(Chunk.NEWLINE);

        par22.add("Date : ");
        par22.add(Chunk.NEWLINE);

        par22.add("Signature : ");
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        cell.setPaddingTop(-2);
        cell.setColspan(4);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);

        par23.add(new Phrase("17. Je soussigné certifie que l'élimination/la valorisation des déchets décrits ci-dessus a été effectuée.",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Nom : ");
        par23.add(Chunk.NEWLINE);

        par23.add("Date : ");
        par23.add(Chunk.NEWLINE);

        par23.add("Signature et cachet : ");
        par23.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par23);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //empty Cell

        cell = new PdfPCell(new Phrase("\n"));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(6);
        table.addCell(cell);



        //Paragraph ====
        Paragraph par24=new Paragraph(12);
        par24.setFont(font);
        par24.setSpacingAfter(4);

        par24.add(new Phrase("18. Zone Franche d’importation ou Bureau de douane d’entrée",fontbold));
        par24.add(Chunk.NEWLINE);
        par24.add("Les déchets décrits dans ce document de mouvement ont quitté la Zone Franche le : ");
        par24.add(Chunk.NEWLINE);
        par24.add("Signature : ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);
        par24.add("Cachet : ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par24);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);


        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generateDocumentDeMouvement(Notification ns) throws DocumentException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();
        DateFormat df = new SimpleDateFormat("dd-mm-yyyy");
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(Font.FontFamily.TIMES_ROMAN,14.0f);
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,9.0f,Font.BOLD);
        Font fontBox = new Font(base, 10f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph();
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add(new Phrase("Document de mouvements des déchets pour mouvement /transferts transfrontières de déchets.",fontH1));
        headerPar.setSpacingAfter(7);
        headerPar.setExtraParagraphSpace(12);

        //Declaring Table
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);

        //Paragraph ====

        Paragraph par1= new Paragraph();
        par1.setFont(font);
        par1.setSpacingAfter(5);
        //=========
        String numero_notification=ns.getNum_notification().equals("")?"......":ns.getNum_notification();
        String numero_serie=(ns.getSerie()==null||ns.getSerie().equals(""))?".......":ns.getSerie();
        //=========
        PdfPCell cell=new PdfPCell();
        cell.addElement(new Phrase("1. Correspondant à la notification No. : "+numero_notification,fontbold));
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        cell=new PdfPCell();
        cell.addElement(new Phrase("2. Numéro de série du transfert/nombre total /"+numero_serie+" transfert: ",fontbold));
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par02=new Paragraph();
        par02.setFont(font);
        par02.setSpacingAfter(3);
        //========
        String nom_importateur = "";
        String adresse_importateur = "";
        String persone_a_contacte_importateur ="";
        String tele_importateur = "";
        String fax_importateur = "";
        String email_importateur = " ";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant np = ns.getImportateur();
            nom_importateur =np.getNom_fr();
            adresse_importateur = np.getAdresse_fr();
            persone_a_contacte_importateur = np.getContact_fr();
            tele_importateur = np.getTel();
            fax_importateur = np.getFax();
            email_importateur = np.getMail();
        }
        //========

        par02.add(new Phrase("3. Exportateur – Notifiant ",fontbold));
        par02.add("N° d'enregistrement :  ");
        par02.add(Chunk.NEWLINE);

        par02.add("Nom : ");
        par02.add(ns.getNom());
        par02.add(Chunk.NEWLINE);

        par02.add("Adresse : ");
        par02.add(ns.getAdresse());
        par02.add(Chunk.NEWLINE);

        par02.add("Personne a contacter : ");
        par02.add(ns.getPersonne());
        par02.add(Chunk.NEWLINE);

        par02.add("Tél : ");
        par02.add(ns.getTel());
        par02.add(Chunk.NEWLINE);

        par02.add("Télécopie : ");
        par02.add(ns.getTelecopie());
        par02.add(Chunk.NEWLINE);

        par02.add("Courier éléctronique : ");
        par02.add(ns.getCourrier());
        par02.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par02);
        cell.setPadding(3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par2=new Paragraph();
        par2.setFont(font);
        par2.setSpacingAfter(3);
        //========

        par2.add(new Phrase("4. Importateur – destinataire ",fontbold));
        par2.add("N° d'enregistrement :  ");
        par2.add(Chunk.NEWLINE);

        par2.add("Nom : ");
        par2.add(nom_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Adresse : ");
        par2.add(adresse_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Personne à contacter : ");
        par2.add(persone_a_contacte_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Tél : ");
        par2.add(tele_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Télécopie : ");
        par2.add(fax_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Courrier électronique : ");
        par2.add(email_importateur);
        par2.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par2);
        cell.setPadding(3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par3=new Paragraph();
        par3.setFont(font);
        par3.setSpacingAfter(5);
        //========

        par3.add(new Phrase("5. Quantité réelle : ",fontbold));
        par3.add(Chunk.TABBING);

        cell = new PdfPCell();
        cell.addElement(par3);
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par4=new Paragraph();
        par4.setFont(font);
        par4.setSpacingAfter(5);
        //========


        par4.add(new Phrase("6. Date réelle du transfert : ",fontbold));
        cell = new PdfPCell();
        cell.addElement(par4);
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par5=new Paragraph(12);
        par5.setFont(font);
        par5.setSpacingAfter(3);
        //========
        boolean isprescription=true;//ns.getPrescription().equalsIgnoreCase("oui");

        //========
        par5.add(new Phrase("7. Conditionnement",fontbold));
        par5.add(Chunk.TABBING);
        par5.add("Type(s)  (1) : ");
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add("Nombre de colis :");
        par5.add(Chunk.NEWLINE);
        par5.add(new Phrase("Prescriptions particulières de manutention (2) :",fontbold));
        par5.add(Chunk.TABBING);
        par5.add(oui);
        par5.add(isprescription?checkedChunk:uncheckedChunk);
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add(non);
        par5.add(isprescription?uncheckedChunk:checkedChunk);

        cell = new PdfPCell();
        cell.addElement(par5);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par6=new Paragraph(12);
        par6.setFont(font);
        par6.setSpacingAfter(3);

        par6.add(new Phrase("8. a) 1er transporteur  : ",fontbold));
        par6.add(Chunk.NEWLINE);

        par6.add("N° d'enregistrement : ");
        par6.add("");
        par6.add(Chunk.NEWLINE);

        par6.add("Nom : ");
        par6.add(Chunk.NEWLINE);

        par6.add("Adresse : ");
        par6.add(Chunk.NEWLINE);

        par6.add("Tél : ");
        par6.add(Chunk.NEWLINE);

        par6.add("Télecopie : ");
        par6.add(Chunk.NEWLINE);

        par6.add("Courrier électronique : ");
        par6.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par6);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par7=new Paragraph(12);
        par7.setFont(font);
        par7.setSpacingAfter(3);

        par7.add(new Phrase("8. b) 2ème transporteur : ",fontbold));
        par7.add(Chunk.NEWLINE);

        par7.add("N° d'enregistrement : ");
        par7.add("");
        par7.add(Chunk.NEWLINE);

        par7.add("Nom : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Personne a contacter : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Tél : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Télécopie : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Courrier électronique : ");
        par7.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par7);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par8=new Paragraph(12);
        par8.setFont(font);
        par8.setSpacingAfter(3);


        par8.add(new Phrase("7. c) Dernier transporteur : ",fontbold));
        par8.add(Chunk.NEWLINE);

        par8.add("N° d'enregistrement : ");
        par8.add("");
        par8.add(Chunk.NEWLINE);

        par8.add("Nom : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Adresse : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Personne a contacter : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Tél : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Télécopie : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Courrier électronique : ");
        par8.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par8);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par9=new Paragraph();
        par9.setSpacingAfter(4);
        par9.add(new Phrase(" - - - - - - A remplir par le représentant du transporteur - - - - - -",fontbold));
        par9.setAlignment(Element.ALIGN_CENTER);
        par9.add(Chunk.TABBING);
        par9.add(Chunk.TABBING);
        par9.add(new Phrase("Plus de trois transporteurs(2) ",font));
        par9.add(isprescription?uncheckedChunk:checkedChunk);


        cell=new PdfPCell();
        cell.setPaddingTop(-6);
        cell.addElement(par9);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(4);
        par10.add(new Phrase("Moyen de transport (1) : ",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add("Date de la prise en charge : ");
        par10.add(Chunk.NEWLINE);
        par10.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par10);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(4);
        par11.add(new Phrase("Moyen de transport (1) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add("Date de la prise en charge : ");
        par11.add(Chunk.NEWLINE);
        par11.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par11);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par12=new Paragraph(12);
        par12.setFont(font);
        par12.setSpacingAfter(4);
        par12.add(new Phrase("Moyen de transport (1) : ",fontbold));
        par12.add(Chunk.NEWLINE);
        par12.add("Date de la prise en charge : ");
        par12.add(Chunk.NEWLINE);
        par12.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par12);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par13=new Paragraph(12);
        par13.setFont(font);
        par13.setSpacingAfter(4);
        par13.add(new Phrase("9. Producteur(s) des déchets (4) (5) (6) ",fontbold));
        par13.add("N° d'enregistrement : ");
        par13.add("");
        par13.add(Chunk.NEWLINE);

        par13.add("Nom : ");
        par13.add(Chunk.NEWLINE);

        par13.add("Adresse : ");
        par13.add(Chunk.NEWLINE);

        par13.add("Personne a contacter : ");
        par13.add(Chunk.NEWLINE);

        par13.add("Tél : ");
        par13.add(Chunk.TABBING);

        par13.add("Télécopie : ");
        par13.add(Chunk.TABBING);
        par13.add(Chunk.NEWLINE);

        par13.add("Courier éléctronique : ");
        par13.add(Chunk.NEWLINE);


        par13.add("Lieu de production (2) : ");
        par13.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par13);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====

        Paragraph par14=new Paragraph(12);
        par14.setFont(font);
        par14.setSpacingAfter(4);
        par14.add(new Phrase("12. Dénomination et composition des déchets  : ",fontbold));
        par14.add(Chunk.NEWLINE);
        par14.add("Composition :");
        par14.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par14);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par15=new Paragraph(12);
        par15.setFont(font);
        par15.setSpacingAfter(4);
        par15.add(new Phrase("13. Caractéristiques physiques (1) :",fontbold));
        par15.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par15);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);
//Paragraph ====
        Paragraph par16=new Paragraph(12);
        par16.setFont(font);
        par16.setSpacingAfter(5);

        par16.add(new Phrase("10. Installation d'élimination :  ",fontbold));
        par16.add(ns.getEliminateur()!=null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("ou",fontbold));
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("de valorisation (2):   ",fontbold));
        par16.add(ns.getEliminateur()==null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.NEWLINE);

        par16.add("N° d'enregistrement : ");
        par16.add("");
        par16.add(Chunk.NEWLINE);

        par16.add("Nom : ");
        par16.add(Chunk.NEWLINE);

        par16.add("Adresse : ");
        par16.add(Chunk.NEWLINE);

        par16.add("Personne a contacter : ");
        par16.add(Chunk.NEWLINE);

        par16.add("Tél : ");
        par16.add(Chunk.TABBING);

        par16.add("Télécopie : ");
        par16.add(Chunk.TABBING);
        par16.add(Chunk.NEWLINE);

        par16.add("Courier électronique : ");
        par16.add(Chunk.NEWLINE);

        par16.add("Lieu effectif de l'élimination/valorisation : ");
        par16.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par16);
        cell.setPaddingTop(-2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par17=new Paragraph(15);
        par17.setFont(font);
        par17.setSpacingAfter(4);

        par17.add(new Phrase("14. Identification des déchets (indiquer les codes correspondants)",fontbold));
        par17.add(Chunk.NEWLINE);
        par17.add("i) Convention de Bale.Annex 8(ou 9 s'il y a lieu) : B3140");
        par17.add(Chunk.NEWLINE);
        par17.add("ii) CODE. OCDE [si différent fe i)]");
        par17.add(Chunk.NEWLINE);
        par17.add("iii) Liste des déchets de la CE : 16 01 03");
        par17.add(Chunk.NEWLINE);
        par17.add("iv) Code national dans le pays d'éxportation : 16 01 03");
        par17.add(Chunk.NEWLINE);
        par17.add("iv) Code national dans le pays d'importation : 16 01 03");
        par17.add(Chunk.NEWLINE);
        par17.add("v) Code National(Catalogue Marocain des déchets) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("vi) Autres(préciser) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("vii) CODE Y : -");
        par17.add(Chunk.NEWLINE);
        par17.add("viii) CODE H(1) : -");
        par17.add(Chunk.NEWLINE);
        par17.add("ix) Classe ONU (1) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("x) N° d'identification : ");
        par17.add(Chunk.NEWLINE);
        par17.add("xi) Dénomination ONU : ");
        par17.add(Chunk.NEWLINE);
        par17.add("xii) Code(s) des douane(s) (SH) : 40004 00 00");

        cell = new PdfPCell();
        cell.addElement(par17);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(4);
        par18.add(new Phrase("11. Opération d'élimination/valorisation",fontbold));
        par18.add(Chunk.NEWLINE);
        par18.add("Code D/ R (1) : R1");
        cell = new PdfPCell();
        cell.addElement(par18);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par19=new Paragraph(13);
        par19.setFont(font);
        par19.setSpacingAfter(4);
        par19.add(new Phrase("15. Déclaration de l'importateur / producteur  : ",fontbold));

        par19.add(Chunk.NEWLINE);
        par19.add("    Je soussigné certifie que les renseignements  portés dans les cases ci-dessus sont exacts et établis de bonne foi." +
                " Je certifie également que le obligation contactuelles écrites prévues pour la réglementation ont été remplis, que le mouvement transfrontière est couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises et que toutes les autorisation requises ont été recues des autorités compétentes des pays concernés.");
        par19.add(Chunk.NEWLINE);

        par19.add("Nom : ");
        par19.add(new Chunk(glue));
        par19.add("Date : ");
        par19.add(new Chunk(glue));
        par19.add("Signature : ");
        par19.add(new Chunk(glue));
        par19.add(Chunk.NEWLINE);

        par19.add(new Phrase("A remplir par toute personne impliqué dans le mouvement transfrontière s'il y a lieu de fournir d'autres renseignement :",fontbold));
        cell = new PdfPCell();
        cell.addElement(par19);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par20=new Paragraph(12);
        par20.setFont(font);
        par20.setSpacingAfter(4);
        par20.add(new Phrase("16. Transfet reçu par l'importateur - le destinataire (autre qu'une installation): ",fontbold));
        par20.add(Chunk.NEWLINE);

        par20.add("Nom : ");
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add(new Chunk(glue));

        cell = new PdfPCell();
        cell.addElement(par20);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par21=new Paragraph(12);
        par21.setSpacingAfter(4);
        cell.setPaddingTop(-10.0f);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("A REMPLIR PAR L'INSTALLATION D'ELIMINATION / VALORISATION",fontbold));

        cell = new PdfPCell();
        cell.addElement(par21);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par22=new Paragraph(12);
        par22.setFont(font);
        par22.setSpacingAfter(4);
        par22.add(new Phrase("17. Transfert reçu à l'installation d'élimination ",fontbold));
        par22.add(checkedChunk);
        par22.add(Chunk.TABBING);
        par22.add(new Phrase("ou de valorisation :   ",fontbold));
        par22.add(checkedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Date de reception : ");
        par22.add(Chunk.TABBING);
        par22.add("Acceptée : ");
        par22.add(checkedChunk);
        par22.add(Chunk.TABBING);
        par22.add("Rejetée* : ");
        par22.add(checkedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Quantité reçue : ");
        par22.add("Tonnes : ");
        par22.add(Chunk.TABBING);
        par22.add("m3 : ");
        par22.add(Chunk.NEWLINE);
        par22.add("* contacter immédiatement les autorités compétentes");
        par22.add(Chunk.NEWLINE);

        par22.add("Date approximative d'élimination/valorisation :");
        par22.add(Chunk.NEWLINE);

        par22.add("Opération d'élimination - valorisation (1) :");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom : ");
        par22.add(Chunk.NEWLINE);

        par22.add("Date : ");
        par22.add(Chunk.NEWLINE);

        par22.add("Signature : ");
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        cell.setPaddingTop(-2);
        cell.setColspan(4);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);
        par23.add(new Phrase("18. Je soussigné certifie que l'élimination/la valorisation des déchets décrits ci-dessus a été effectuée.",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Nom : ");
        par23.add(Chunk.NEWLINE);

        par23.add("Date : ");
        par23.add(Chunk.NEWLINE);

        par23.add("Signature et cachet : ");
        par23.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par23);
        cell.setPaddingTop(-3);
        cell.setColspan(2);
        table.addCell(cell);

        //empty Cell

        cell = new PdfPCell(new Phrase("\n"));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(6);
        table.addCell(cell);



        //Paragraph ====
        Paragraph par24=new Paragraph(12);
        par24.setFont(font);
        par24.setSpacingAfter(4);

        par24.add("(1) Voir les codes dans la liste des abréviations et codes ci-jointes .");
        par24.add(Chunk.NEWLINE);
        par24.add("(2) Joindre des renseignement plus détaillés s'il a lieu . ");
        par24.add(Chunk.NEWLINE);
        par24.add("(3) S'il y a plus de trois transporteurs , joindre renseignements prévus aux cases 8 a,b,c ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par24);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par25=new Paragraph(12);
        par25.setFont(font);
        par25.setSpacingAfter(4);

        par25.add("(4) Requis par la convention de Bale .");
        par25.add(Chunk.NEWLINE);
        par25.add("(5) Joindre une liste s'il y a plusieurs producteurs . ");
        par25.add(Chunk.NEWLINE);
        par25.add("(6) Si la légalisation nationale l'exige ");
        par25.add(Chunk.NEWLINE);
        par25.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par25);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);


        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generate9arar() throws DocumentException {

        String IMAGE = "resources/images/berlin2013.jpg";
        String DEST = "results/images/background_transparent.pdf";

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(Font.FontFamily.TIMES_ROMAN,14.0f);
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,9.0f,Font.BOLD);
        Font fontBox = new Font(base, 10f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());


        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generateDocumentDInstallation(Installation is) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 10, 10, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,9.0f,Font.BOLD);
        Font fontBox = new Font(base, 10f);

        String logo = "word_header.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getClassLoader().getResource(logo));
        image.scaleToFit(610,800);
        document.add(image);

        Paragraph headerPar=new Paragraph(16);
        headerPar.setSpacingBefore(15);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Formulaire de la demande d’autorisation d'installation spécialisée \n" +
                "de traitement des déchets dangereux\n\n");
        headerPar.setFont(fontbold);
        headerPar.setSpacingAfter(5);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_LEFT);
        par1.add(new Phrase("1. Référence de la demande : "));
        par1.setSpacingAfter(5);
        par1.add(Chunk.NEWLINE);

        float[] columnWidths = {5, 8};
        PdfPTable table = new PdfPTable(columnWidths);
        table.setWidthPercentage(100);

        PdfPCell cell = new PdfPCell();

        cell.setBackgroundColor(GrayColor.GRAYBLACK);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);

        cell.setRowspan(2);
        table.addCell(cell);
        table.addCell(cell);

        table.addCell("Date de dépôt");
        table.addCell(is.getDateDepot()==null?"":dateFormat.format(is.getDateDepot()));

        table.addCell("Lieu de dépôt");
        table.addCell(is.getSite());

        table.addCell("N° de la demande");
        table.addCell(is.getNum_demande());
        document.add(headerPar);
        document.add(par1);
        document.add(table);

        document.add(Chunk.NEWLINE);


        Paragraph par2= new Paragraph();
        par2.setAlignment(Element.ALIGN_LEFT);
        par2.add(new Phrase("2. Identification du demandeur : "));
        par2.setSpacingAfter(5);
        par2.add(Chunk.NEWLINE);

        document.add(par2);


        float[] columnWidths5 = {5, 8};
        PdfPTable table5 = new PdfPTable(columnWidths5);
        table5.setWidthPercentage(100);


        PdfPCell cell5 = new PdfPCell();

        cell5.setBackgroundColor(GrayColor.GRAYBLACK);
        cell5.setHorizontalAlignment(Element.ALIGN_CENTER);

        cell5.setRowspan(2);
        table5.addCell(cell5);
        table5.addCell(cell5);

        table5.addCell("Raison sociale / Forme de la société");
        table5.addCell(is.getRaison());

        table5.addCell("IF");
        table5.addCell(is.getIfe());

        table5.addCell("Adresse");
        table5.addCell(is.getAdresse());

        table5.addCell("Tel");
        table5.addCell(is.getTel());

        table5.addCell("Fax/Courriel");
        table5.addCell(is.getFax());

        table5.addCell("Nom et prénom du représentant responsable");
        table5.addCell("");

        table5.addCell("N° de CIN / Carte de résident du représentant responsable");
        table5.addCell("");

        document.add(table5);
        document.add(Chunk.NEWLINE);

        Paragraph par3= new Paragraph();
        par3.setAlignment(Element.ALIGN_RIGHT);
        par3.add(new Phrase("Signature du demandeur"));
        par3.setSpacingAfter(5);

        document.add(par3);

        Paragraph par4=new Paragraph(12);
        par4.setFont(font);
        par4.setSpacingAfter(5);
        par4.setAlignment(Element.ALIGN_CENTER);

        par4.add(new Phrase("RECEPISSE DE DEPOT\n" +
                "de la demande d’autorisation d'installation spécialisée de traitement des déchets dangereux :\n",fontbold));
        par4.setSpacingAfter(5);
        document.add(par4);

        Paragraph par5=new Paragraph(12);
        par5.setFont(font);
        par5.setSpacingAfter(5);
        par5.setAlignment(Element.ALIGN_LEFT);
        par5.add(Chunk.NEWLINE);
        par5.add("Identification du demandeur : ");
        par5.add("");
        par5.add(Chunk.NEWLINE);
        par5.add("Lieu de dépôt de la demande: ");
        par5.add(is.getSite());
        par5.add(Chunk.NEWLINE);
        String date2 = "";
        if(is.getDateDepot()!=null){
            date2 = dateFormat.format(is.getDateDepot());
        }
        par5.add("Date de dépôt: ");
        par5.add(date2);
        par5.add(Chunk.NEWLINE);
        par5.add("N° de la demande: ");
        par5.add(is.getNum_demande());
        par5.add(Chunk.NEWLINE);
        par5.add("Cachet et signature du service réceptionnaire : ");
        par5.add("......................................................................................;.........................................................");
        par5.add(Chunk.NEWLINE);

        document.add(par5);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generateRecapNotification(Notification ns,ListDocNotif[] l,DocImport[] d) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 10, 10);
        PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,10.0f);
        Font fontTitre = new Font(Font.FontFamily.TIMES_ROMAN,16.0f,Font.BOLD);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,10.0f,Font.BOLD);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(612,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        String title_type = "...";
        if(ns.getZf_et().equals("ZF")){
            title_type = "d'importation des déchets d'une zone franche";
        }else if(ns.getZf_et().equals("ET")){
            title_type = "d'importation des déchets non dangereux d'un pays étranger";
        }else if(ns.getZf_et().equals("XD")){
            title_type = "d'exportation des déchets ";
        }else if(ns.getZf_et().equals("TR")){
            title_type = "Transit des déchets";
        }
        headerPar.add("Récapitulation de la demande d'autorisation "+title_type);
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de notification ---------------------
        PdfPTable table0 = new PdfPTable(new float[]{2,3,1,2});
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre("numero de notification",4));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( saisir_cellule("numero de notification : ",font,fontbold,ns.getNum_notification(),1));
        table0.addCell( saisir_cellule("Classification des déchets : ",font,fontbold,ns.getClassification()!=null?ns.getClassification().getNom_fr():"-",1));
        table0.addCell( saisir_cellule("Code : ",font,fontbold,ns.getCode()!=null?ns.getCode().getNom_fr():"-",1));
        if(ns.getZf_et().equals("ZF"))
            table0.addCell( saisir_cellule("Zone Franche : ",font,fontbold,ns.getZonneFranche()!=null?ns.getZonneFranche().getNom_fr():"-",1));
        else
            table0.addCell( saisir_cellule("Pays Etranger : ",font,fontbold,ns.getPays()!=null?ns.getPays().getNom_fr():"-",1));
        table0.completeRow();

        table0.addCell( saisir_cellule("Quantité totale prévue : ",font,fontbold,ns.getQuantite()!=null?ns.getQuantite():"",1));
        table0.addCell( saisir_cellule("Opération : ",font,fontbold,ns.getOperation()!=null?ns.getOperation():"",1));
        table0.addCell( saisir_cellule("Unité : ",font,fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",1));
        table0.addCell( saisir_cellule("Producteur : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getNom_fr():"-",1));
        table0.completeRow();

        table0.addCell( saisir_cellule("Type de déchet : ",font,fontbold,ns.getCode()!=null?ns.getCode().getNom_ar():"-",4));
        table0.completeRow();

        //--------------------- Tableau Importateur - Notifiant ---------------------
        PdfPTable table1 = new PdfPTable(new float[]{2,2,2});
        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table1.addCell(saisir_cellule_titre("Importateur - Notifiant",3));
        table1.completeRow();
        //--------------------- completeRow ---------------------

        table1.addCell( saisir_cellule("Nom : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getNom_fr():"-",1));
        table1.addCell( saisir_cellule("Email : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getMail():"-",1));
        table1.addCell( saisir_cellule("Tél : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getTel():"-",1));
        table1.completeRow();
        table1.addCell( saisir_cellule("Fax : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getFax():"-",1));
        table1.addCell( saisir_cellule("Personne à contacter : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getContact_fr():"-",1));
        table1.addCell( saisir_cellule("Identifiant fiscale : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getIdf():"-",1));
        table1.addCell( saisir_cellule("Adresse : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getAdresse_fr():"-",3));
        table1.completeRow();


        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table2 = new PdfPTable(new float[]{1.5f,2f,2.2f});
        table2.setWidthPercentage(100);
        table2.setSpacingBefore(12);
        table2.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table2.addCell(saisir_cellule_titre("Document de notification",4));
        table2.completeRow();
        //--------------------- completeRow ---------------------
        table2.addCell( saisir_cellule("Quantité totale prévue : ",font,fontbold,ns.getQuantite()!=null?ns.getQuantite():"",1));
        table2.addCell( saisir_cellule("Opération : ",font,fontbold,ns.getOperation()!=null?ns.getOperation():"",1));
        table2.addCell( saisir_cellule("Nombre total d'expéditions prévues : ",font,fontbold,ns.getExpedition()!=null?ns.getExpedition():"",1));
        table2.completeRow();
        table2.addCell( saisir_cellule("Caractéristiques physiques : ",font,fontbold,ns.getCaracteristquePhysique()!=null?ns.getCaracteristquePhysique().getNom_fr():"-",1));
        table2.addCell( saisir_cellule("Notification Concernant : ",font,fontbold,ns.getUniques()!=null?ns.getUniques():"",1));
        table2.addCell( saisir_cellule("Prescriptions spéciales de manutention : ",font,fontbold,ns.getManutention()!=null?ns.getManutention():"",1));
        table2.completeRow();
        table2.addCell( saisir_cellule("Premier départ : ",font,fontbold,ns.getPremier()!=null?ns.getPremier():"",1));
        table2.addCell( saisir_cellule("Dernier  départ : ",font,fontbold,ns.getDernier()!=null?ns.getDernier():"",1));
        table2.addCell( saisir_cellule("Destination finale : ",font,fontbold,ns.getDestination_final()!=null?ns.getDestination_final():"",1));
        table2.completeRow();
        table2.addCell( saisir_cellule("Type(s) de conditionnement : ",font,fontbold,ns.getTypeconditionnement()!=null?ns.getTypeconditionnement().getNom_fr():"-",3));
        table2.setSpacingAfter(12);


        //--------------------- Tableau Transporteur(s) prévu ---------------------
        PdfPTable table3 = new PdfPTable(new float[]{2,2,2,2,2});
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1 || ns.getZf_et().equals("XD")){
            table3.addCell(saisir_cellule_titre("Transporteur(s) prévu", 5));
            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(saisir_cellule_transporteur_titre("Nom", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Identifiant fiscale ", 1));
            table3.addCell(saisir_cellule_transporteur_titre("teléphone", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Fax", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Email", 1));
            table3.completeRow();
            if (ns.getTransporteur() != null && ns.getTransporteur().size() > 0) {
                for (TransporteurParam tp : ns.getTransporteur()) {
                    table3.addCell(saisir_cellule(tp.getNom(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getIdentifiant(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getTel(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getFax(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getEmail(), font, font, "", 1));
                    table3.completeRow();
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 5);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }
        else{
            table3.addCell(saisir_cellule_titre("Transporteur Etranger", 5));
            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(saisir_cellule_transporteur_titre("Raison Social", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Matricule ", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Type véhicule", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Assurance", 1));
            table3.completeRow();
            if (ns.getTransporteur_etranger() != null && ns.getTransporteur_etranger().size() > 0) {
                for (TransporteurEtranger tp : ns.getTransporteur_etranger()) {
                    table3.addCell(saisir_cellule(tp.getRaison_social(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getNum_matricule(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getTypeVehicule(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getUrl_assurance(), font, font, "", 1));
                    table3.completeRow();
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur Etranger.", fontbold, fontbold, "", 5);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }


        //--------------------- Tableau Producteur(s) ---------------------
        PdfPTable table4 = new PdfPTable(new float[]{2,2,2});
        table4.setWidthPercentage(100);
        table4.setSpacingBefore(12);
        table4.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table4.addCell(saisir_cellule_titre("Producteur(s)",4));
        table4.completeRow();
        //--------------------- completeRow ---------------------
        table4.addCell( saisir_cellule("Nom : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getNom_fr():"-",1));
        table4.addCell( saisir_cellule("teléphone : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getTel():"-",1));
        table4.addCell( saisir_cellule("Email : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getMail():"-",1));
        table4.completeRow();
        table4.addCell( saisir_cellule("Fax : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getFax():"-",1));
        table4.addCell( saisir_cellule("Identifiant fiscale : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getIdf():"-",1));
        table4.addCell( saisir_cellule("Personne à contacter : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getContact_fr():"-",1));
        table4.completeRow();
        table4.addCell( saisir_cellule("Adresse: ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getAdresse_fr():"-",3));
        table4.completeRow();
        table4.setSpacingAfter(12);



        //--------------------- Tableau Installation d’élimination(s) ---------------------
        PdfPTable table5 = new PdfPTable(new float[]{2,2,2});
        table5.setWidthPercentage(100);
        table5.setSpacingBefore(12);
        table5.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table5.addCell(saisir_cellule_titre("Installation d’élimination",4));
        table5.completeRow();
        //--------------------- completeRow ---------------------
        table5.addCell( saisir_cellule("Nom : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getNom_fr():"-",1));
        table5.addCell( saisir_cellule("teléphone : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getTel():"-",1));
        table5.addCell( saisir_cellule("Email : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getMail():"-",1));
        table5.completeRow();
        table5.addCell( saisir_cellule("Fax : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getFax():"-",1));
        table5.addCell( saisir_cellule("Identifiant fiscale : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getIdf():"-",1));
        table5.addCell( saisir_cellule("Personne à contacter : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getContact_fr():"-",1));
        table5.completeRow();
        table5.addCell( saisir_cellule("Adresse: ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getAdresse_fr():"-",3));
        table5.completeRow();
        table5.setSpacingAfter(12);

        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(3);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre("Pièces Jointe",3));
        table7.completeRow();
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?String.valueOf(i)+". "+ld.getDocImport().getNom_fr():"-",3));
            i++;
            table7.completeRow();
        }

        //--------------------- Tableau Document de mouvements des déchets ---------------------
        PdfPTable table6 = new PdfPTable(new float[]{2,1.5f,2,2.5f});
        table6.setWidthPercentage(100);
        table6.setSpacingBefore(12);
        table6.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table6.addCell(saisir_cellule_titre("Document de mouvements des déchets",4));
        table6.completeRow();
        //--------------------- completeRow ---------------------
        table6.addCell( saisir_cellule("Quantité réelle : ",font,fontbold,ns.getQuantite_reel()!=null ? ns.getQuantite_reel() :"",1));
        table6.addCell( saisir_cellule("Unité : ",font,fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",1));
        table6.addCell( saisir_cellule("Nombre de colis : ",font,fontbold,ns.getNbr_colis()!=null?ns.getNbr_colis():"",1));
        table6.addCell( saisir_cellule("Date réelle de l'expédition : ",font,fontbold,ns.getDate_reel()!=null ? dateFormat.format(ns.getDate_reel()):"",1));
        table6.completeRow();
        table6.addCell( saisir_cellule("Lieu effectif de l'élimination/valorisation: ",font,fontbold,ns.getLieux_elimination()!=null?ns.getLieux_elimination().getNom_fr():ns.getLieu(),4));
        table6.completeRow();
        table6.setSpacingAfter(12);


        document.add(headerPar);
        document.add(table0);
        document.add(table1);
        document.add(table2);
        document.add(table3);
        document.add(table4);
        document.add(table5);
        document.add(table6);
        document.add(table7);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generateRecapInstalation(Installation ns,ListDocNotif[] l, DocImport[] d) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 10, 10);
        PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,10.0f);
        Font fontTitre = new Font(Font.FontFamily.TIMES_ROMAN,16.0f,Font.BOLD);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,10.0f,Font.BOLD);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(612,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Récapitulation de la demande d'autorisation d'installation");
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Instalation ---------------------
        PdfPTable table0 = new PdfPTable(new float[]{2,3,1,2});
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre("N° de la demande",4));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( saisir_cellule("N° de la demande : ",font,fontbold,ns.getNum_demande(),1));
        table0.addCell( saisir_cellule("Site: ",font,fontbold,ns.getSite(),1));
        table0.addCell( saisir_cellule("Operation : ",font,fontbold,ns.getOperation(),1));
        table0.addCell( saisir_cellule("Description d'installation : ",font,fontbold,ns.getDescription(),1));
        table0.completeRow();

        table0.addCell( saisir_cellule("structure d'installation : ",font,fontbold,ns.getStructure(),1));
        table0.addCell( saisir_cellule("Type d'appareil : ",font,fontbold,ns.getType_appareil(),1));
        table0.addCell( saisir_cellule("Unité : ",font,fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",1));
        table0.addCell( saisir_cellule("Quantité : ",font,fontbold,ns.getQuantite(),1));
        table0.completeRow();
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_transporteur_titre("Code",2));
        table0.addCell(saisir_cellule_transporteur_titre("Type",2));
        table0.completeRow();
        table0.setSpacingAfter(5);

        //--------------------- completeRow ---------------------
        for (Code c:ns.getCode()){
            table0.addCell(saisir_cellule("",font,font,c.getNom_fr()!=null?c.getNom_fr():"-",2));
            table0.addCell(saisir_cellule("",font,font,c.getNom_ar()!=null?c.getNom_ar():"-",2));
            table0.completeRow();
        }


        //--------------------- Tableau Importateur - Notifiant ---------------------
        PdfPTable table1 = new PdfPTable(new float[]{2,2,2});
        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table1.addCell(saisir_cellule_titre("Information Demandeur",3));
        table1.completeRow();
        //--------------------- completeRow ---------------------

        table1.addCell( saisir_cellule("Raison Social : ",font,fontbold,ns.getRaison()!=null?ns.getRaison():"-",1));
        table1.addCell( saisir_cellule("Identifiant : ",font,fontbold,ns.getEmail()!=null?ns.getEmail():"-",1));
        table1.addCell( saisir_cellule("Télephone : ",font,fontbold,ns.getTel()!=null?ns.getTel():"-",1));
        table1.completeRow();
        table1.addCell( saisir_cellule("Fax : ",font,fontbold,ns.getFax()!=null?ns.getFax():"-",1));
        table1.addCell( saisir_cellule("Identifiant fiscale : ",font,fontbold,ns.getIfe()!=null?ns.getIfe():"-",1));
        table1.addCell( saisir_cellule("Adresse : ",font,fontbold,ns.getAdresse()!=null?ns.getAdresse():"-",1));
        table1.completeRow();


        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table2 = new PdfPTable(new float[]{1.5f,2f,2.2f});
        table2.setWidthPercentage(100);
        table2.setSpacingBefore(12);
        table2.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table2.addCell(saisir_cellule_titre("Equipe De Travail",3));
        table2.completeRow();
        //--------------------- completeRow ---------------------
        table2.addCell( saisir_cellule("Nombre d'equipe : ",font,fontbold,ns.getNbr_equipe_travail(),1));
        table2.addCell( saisir_cellule("Horaire Début d'exploitation : ",font,fontbold,ns.getHoraire_exploitation(),1));
        table2.addCell( saisir_cellule("Nombre d'effectif : ",font,fontbold,"",1));
        table2.completeRow();
        table2.setSpacingAfter(12);


        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(3);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre("Pièces Jointe",3));
        table7.completeRow();
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?String.valueOf(i)+". "+ld.getDocImport().getNom_fr():"-",3));
            i++;
            table7.completeRow();
        }
        document.add(headerPar);
        document.add(table0);
        document.add(table1);
        document.add(table2);
        document.add(table7);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generateRecapCollecte(CollecteTransporteur ns,ListDocNotif[] l, DocImport[] d) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 10, 10);
        PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,10.0f);
        Font fontTitre = new Font(Font.FontFamily.TIMES_ROMAN,16.0f,Font.BOLD);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,10.0f,Font.BOLD);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(612,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Récapitulation de la demande d'autorisation Collecte Transport");
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Collecte  ---------------------
        PdfPTable table0 = new PdfPTable(new float[]{1,1,1,1});
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre("N° de la demande",4));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( saisir_cellule("N° de la demande : ",font,fontbold,ns.getNum_demande(),1));
        table0.addCell( saisir_cellule("Raison Sociale: ",font,fontbold,ns.getRaison(),1));
        table0.addCell( saisir_cellule("Identifiant Fiscale : ",font,fontbold,ns.getIdfiscale(),1));
        table0.addCell( saisir_cellule("Represantant : ",font,fontbold,ns.getDemandeur_Nom(),1));
        table0.completeRow();

        table0.addCell( saisir_cellule("Télephone : ",font,fontbold,ns.getDemandeurTel(),1));
        table0.addCell( saisir_cellule("Fax : ",font,fontbold,ns.getDemandeurFax(),1));
        table0.addCell( saisir_cellule("Email : ",font,fontbold,ns.getDemandeurEmail(),1));
        table0.addCell( saisir_cellule("Adresse : ",font,fontbold,ns.getDemandeurAdresse(),1));
        table0.completeRow();

        PdfPTable table01 = new PdfPTable(new float[]{2,2});
        table01.setWidthPercentage(100);
        table01.setSpacingBefore(12);
        table01.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table01.addCell(saisir_cellule_titre("Catalogue",2));
        table01.completeRow();
        table01.addCell(saisir_cellule("",fontBox,font,"",4));

        //--------------------- completeRow ---------------------
        table01.addCell(saisir_cellule_transporteur_titre("Code ",1));
        table01.addCell(saisir_cellule_transporteur_titre("Type ",1));
        table01.completeRow();
        for (Code c:ns.getCode()){
            table01.addCell(saisir_cellule("",font,font,c.getNom_fr()!=null?c.getNom_fr():"-",1));
            table01.addCell(saisir_cellule("",font,font,c.getNom_ar()!=null?c.getNom_ar():"-",1));
            table01.completeRow();
        }


        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table3 = new PdfPTable(new float[]{4,4,4,4});
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table3.addCell(saisir_cellule_titre(" Donnée sur les véhicules ",4));
        table3.completeRow();
        //--------------------- completeRow ---------------------
        table3.addCell( saisir_cellule("Type de véhicules: : ",font,fontbold,ns.getTypevehicule(),1));
        table3.addCell( saisir_cellule("type de conteneurs: : ",font,fontbold,ns.getTypeConteneurs().getNom_fr(),1));
        table3.addCell( saisir_cellule("Nombre de Véhicule: : ",font,fontbold,ns.getNombre_vehicule(),1));
        table3.addCell( saisir_cellule("Nombre de conteneurs: : ",font,fontbold,ns.getNombre_conteneur(),1));
        table3.completeRow();
        table3.addCell(saisir_cellule("",fontBox,font,"",4));
        table3.addCell(saisir_cellule_transporteur_titre("N° d'immatriculation\t",1));
        table3.addCell(saisir_cellule_transporteur_titre("N° Châssis\t ",1));
        table3.addCell(saisir_cellule_transporteur_titre("Poids total en charge\t",1));
        table3.addCell(saisir_cellule_transporteur_titre("Poids net du véhicule\t",1));
        table3.completeRow();
        if(ns.getVehicules()!=null && ns.getVehicules().size()>0){
            for (Vehicules tp:ns.getVehicules()) {
                table3.addCell( saisir_cellule(tp.getNum_mat_id_prefect()+"-"+tp.getNum_mat_enrg_voit()+"-"+tp.getNum_mat_enrg_auto(),font,font,"",1));
                table3.addCell( saisir_cellule(tp.getNum_chassis(),font,font,"",1));
                table3.addCell( saisir_cellule(tp.getPoit_totale_charge(),font,font,"",1));
                table3.addCell( saisir_cellule(tp.getPoint_net(),font,font,"",1));
                table3.completeRow();
            }
        }else{
            PdfPCell tmp =  saisir_cellule("Aucun Transporteur.",fontbold,fontbold,"",4);
            tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
            table3.addCell(tmp);
        }
        table3.completeRow();
        table3.setSpacingAfter(12);


        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(3);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre("Pièces Jointe",3));
        table7.completeRow();
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?String.valueOf(i)+". "+ld.getDocImport().getNom_fr():"-",3));
            i++;
            table7.completeRow();
        }

        PdfPCell cell2 = new PdfPCell();
        cell2.setBorder(Rectangle.NO_BORDER);
        cell2.setColspan(1);
        cell2.addElement(new Phrase(""));
        table7.addCell(cell2);
        table7.completeRow();



        document.add(headerPar);
        document.add(table0);
        document.add(table01);
        document.add(table3);
        document.add(table7);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generateRecapEie(DemandeInformation ns,ListDocNotif[] l) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 10, 10);
        PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,10.0f);
        Font fontTitre = new Font(Font.FontFamily.TIMES_ROMAN,16.0f,Font.BOLD);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,10.0f,Font.BOLD);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(612,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Récapitulation de la demande Etude d’Impact sur l’Environnement");
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Collecte  ---------------------
        PdfPTable table0 = new PdfPTable(new float[]{1,1,1,1});
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre("1. informations sur le pétitionnaire ",4));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( saisir_cellule("N° de la demande : ",font,fontbold,ns.getNum_demande(),2));
        table0.addCell( saisir_cellule("Raison Sociale: ",font,fontbold,ns.getRaison_social(),1));
        table0.addCell( saisir_cellule("Represantant : ",font,fontbold,ns.getRepresantant(),1));
        table0.completeRow();

        table0.addCell( saisir_cellule("Télephone : ",font,fontbold,ns.getTel(),1));
        table0.addCell( saisir_cellule("Fax : ",font,fontbold,ns.getFax(),1));
        table0.addCell( saisir_cellule("Email : ",font,fontbold,ns.getEmail(),1));
        table0.addCell( saisir_cellule("Adresse : ",font,fontbold,ns.getAdresse(),1));
        table0.completeRow();

        PdfPTable table01 = new PdfPTable(3);
        table01.setWidthPercentage(100);
        table01.setSpacingBefore(12);
        table01.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table01.addCell(saisir_cellule_titre("2. informations sur le projet ",3));
        table01.completeRow();
        //--------------------- completeRow ---------------------
        table01.addCell(saisir_cellule("Intitulé du projet :",font,fontbold,ns.getIntitule_projet(),1));
        table01.addCell(saisir_cellule("Montant d'investissement en MDH :",font,fontbold,String.valueOf(ns.getMontant_investissement()),1));
        table01.addCell(saisir_cellule("Transfrontalier :",font,fontbold,ns.getTronsfrontalier(),1));
        table01.completeRow();
        if(ns.getType().equals("AE")){
            table01.addCell(saisir_cellule("Date Démarage :",font,fontbold,ns.getDateDemarage(),1));
            table01.addCell(saisir_cellule("Date Résiliation :",font,fontbold,ns.getDateResiliation(),2));
            table01.completeRow();
        }
        if(ns.getType().equals("NT")){
            table01.addCell(saisir_cellule("Nature foncier :",font,fontbold,ns.getNature_foncier(),1));
            table01.addCell(saisir_cellule("Caractéristiques du projet :",font,fontbold,ns.getCaracteristiques_projet(),1));
            table01.addCell(saisir_cellule("Nature du projet :",font,fontbold,ns.getNature_projet(),1));
            table01.completeRow();
            table01.addCell(saisir_cellule("Ressources :",font,fontbold,ns.getRessource(),1));
            table01.addCell(saisir_cellule("Source :",font,fontbold,ns.getStatut_RC(),1));
            table01.addCell(saisir_cellule("Qualitative :",font,fontbold,ns.getQualitative(),1));
            table01.completeRow();
            table01.addCell(saisir_cellule("Quantité estimée :",font,fontbold,String.valueOf(ns.getQuantite_projet()),1));
            table01.addCell(saisir_cellule("Unité :",font,fontbold,ns.getUnite().getNom_fr(),1));
            table01.addCell(saisir_cellule("Caractéristique physique :",font,fontbold,ns.getCaracter_physique(),1));
            table01.completeRow();
            table01.addCell(saisir_cellule("Population :",font,fontbold,ns.getPopulation().getNom_fr(),3));
            table01.completeRow();
        }

        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table3 = new PdfPTable(new float[]{4,4,4,4});
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table3.addCell(saisir_cellule_titre(" 3. Localisation du projet  ",4));
        table3.completeRow();
        //--------------------- completeRow ---------------------
        table3.addCell(saisir_cellule_transporteur_titre("Région",2));
        table3.addCell(saisir_cellule_transporteur_titre("Prefectures",1));
        table3.addCell(saisir_cellule_transporteur_titre("Communes",1));
        table3.completeRow();
        PdfPCell cell8 = new PdfPCell();
        PdfPCell cell9 = new PdfPCell();
        PdfPCell cell10 = new PdfPCell();
        Paragraph p5 = new Paragraph();
        Paragraph p6 = new Paragraph();
        Paragraph p7 = new Paragraph();
        if(ns.getDetailRegion()!=null) {
                    for (Region r : ns.getDetailRegion().getRegion()) {
                        p5.setAlignment(Element.ALIGN_LEFT);
                        cell8.setPadding(5);
                        cell8.setColspan(2);
                        p5.add(new Phrase("- "+r.getNom_fr()+" \n \n" ,font));
                       // table3.addCell(saisir_cellule(r.getNom_fr(), font, font, "", 2));
                    }
                        cell8.addElement(p5);
                        table3.addCell(cell8);
                    for (Prefecture p : ns.getDetailRegion().getPrefectures()) {
                        p6.setAlignment(Element.ALIGN_LEFT);
                        cell9.setPadding(5);
                        p6.add(new Phrase("- "+p.getNom_fr()+" \n \n" ,font));
                        //table3.addCell(saisir_cellule(p.getNom_fr(), font, font, "", 1));
                    }
                        cell9.addElement(p5);
                        table3.addCell(cell9);
                    for (Commune c : ns.getDetailRegion().getCommunes()) {
                        p7.setAlignment(Element.ALIGN_LEFT);
                        cell10.setPadding(5);
                        p7.add(new Phrase("- "+c.getNom_fr()+" \n \n" ,font));
                        //table3.addCell(saisir_cellule(c.getNom_fr(), font, font, "", 1));
                    }
                        cell10.addElement(p7);
                        table3.addCell(cell10);
                    table3.completeRow();
                }

        table3.setSpacingAfter(12);
        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(3);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre("4. Pièces Jointe",3));
        table7.completeRow();
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?String.valueOf(i)+". "+ld.getDocImport().getNom_fr():"-",3));
            i++;
            table7.completeRow();
        }


        document.add(headerPar);
        document.add(table0);
        document.add(table01);
        document.add(table3);
        document.add(table7);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static PdfPCell saisir_cellule(String label,Font font_label,Font font_var,String var, int collspan){

        Phrase ph1 = new Phrase(label,font_label);
        Phrase ph2 = new Phrase(var,font_var);
        Paragraph ppp = new Paragraph();
        ppp.add(ph1);
        ppp.add(ph2);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setBorderWidthLeft(0.5f);
        cell1.setBorderWidthRight(0.5f);
        cell1.setBorderWidthTop(0.5f);
        cell1.setBorderWidthBottom(0.5f);
        cell1.setPaddingTop(10);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setPaddingBottom(10);

        return cell1;
    }

    public static PdfPCell saisir_cellule_titre(String label,int collspan){
        Font whiteText = new Font(Font.FontFamily.TIMES_ROMAN,16.0f,Font.BOLD,BaseColor.WHITE);
        Paragraph para = new Paragraph(label,whiteText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell0.setPaddingBottom(10f);
        cell0.setPaddingTop(3f);
        cell0.setBackgroundColor(new BaseColor(125, 199, 189));
        return cell0;
    }

    public static PdfPCell saisir_cellule_transporteur_titre(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.BOLD,BaseColor.BLACK);
        Paragraph para = new Paragraph(label,BlackText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        cell0.setBackgroundColor(new BaseColor(222, 226, 230));
        return cell0;
    }
    public static PdfPCell saisir_cellule_2(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.NORMAL,BaseColor.BLACK);
        Paragraph para = new Paragraph(label,BlackText);
        para.setAlignment(Element.ALIGN_LEFT);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        return cell0;
    }

    public static ByteArrayInputStream generateDocumentGeneraleDemandeNum(Notification ns) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 10, 10, 10, 10);
        PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,10.0f);
        Font fontTitre = new Font(Font.FontFamily.TIMES_ROMAN,16.0f,Font.BOLD);
        Font fontbold=new Font(Font.FontFamily.TIMES_ROMAN,10.0f,Font.BOLD);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(612,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        String title_type = "...";
        if(ns.getZf_et().equals("ZF")){
            title_type = "d'importation des déchets d'une zone franche";
        }else if(ns.getZf_et().equals("ET")){
            title_type = "d'importation des déchets non dangereux d'un pays étranger";
        }else if(ns.getZf_et().equals("XD")){
            title_type = "d'exportation des déchets ";
        }else if(ns.getZf_et().equals("TR")){
            title_type = "Transit des déchets";
        }
        headerPar.add("Reçu de Dépôt d'une demande d'autorisation "+title_type);
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table Numéro de notification ---------------------
        PdfPTable table0 = new PdfPTable(new float[]{2.3f,2.7f,1,2});
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre("Numéro de notification",4));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( saisir_cellule("Numéro de notification : ",font,fontbold,ns.getNum_notification(),1));
        table0.addCell( saisir_cellule("Classification des déchets : ",font,fontbold,ns.getClassification()!=null?ns.getClassification().getNom_fr():"-",1));
        table0.addCell( saisir_cellule("Code : ",font,fontbold,ns.getCode()!=null?ns.getCode().getNom_fr():"-",1));
        if(ns.getZf_et().equals("ZF"))
            table0.addCell( saisir_cellule("Zone Franche : ",font,fontbold,ns.getZonneFranche()!=null?ns.getZonneFranche().getNom_fr():"-",1));
        else
            table0.addCell( saisir_cellule("Pays Etranger : ",font,fontbold,ns.getPays()!=null?ns.getPays().getNom_fr():"-",1));
        table0.completeRow();

        table0.addCell( saisir_cellule("Quantité totale prévue : ",font,fontbold,ns.getQuantite()!=null?(ns.getQuantite()+" "+(ns.getUnite()!=null?ns.getUnite().getNom_fr():"")):"",1));
        table0.addCell( saisir_cellule("Opération : ",font,fontbold,ns.getOperation()!=null?ns.getOperation():"",1));
        table0.addCell( saisir_cellule("Producteur : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getNom_fr():"-",2));
        table0.completeRow();

        table0.addCell( saisir_cellule("Type de déchet : ",font,fontbold,ns.getCode()!=null?ns.getCode().getNom_ar():"-",4));
        table0.completeRow();

        //--------------------- Tableau Importateur - Notifiant ---------------------
        PdfPTable table1 = new PdfPTable(new float[]{2,2,2});
        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table1.addCell(saisir_cellule_titre("Importateur - Notifiant",3));
        table1.completeRow();
        //--------------------- completeRow ---------------------

        table1.addCell( saisir_cellule("Nom : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getNom_fr():"-",1));
        table1.addCell( saisir_cellule("Email : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getMail():"-",1));
        table1.addCell( saisir_cellule("Tél : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getTel():"-",1));
        table1.completeRow();
        table1.addCell( saisir_cellule("Fax : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getFax():"-",1));
        table1.addCell( saisir_cellule("Personne à contacter : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getContact_fr():"-",1));
        table1.addCell( saisir_cellule("Identifiant fiscale : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getIdf():"-",1));
        table1.addCell( saisir_cellule("Adresse : ",font,fontbold,ns.getImportateur()!=null?ns.getImportateur().getAdresse_fr():"-",3));
        table1.completeRow();


        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table2 = new PdfPTable(new float[]{1.5f,2f,2.2f});
        table2.setWidthPercentage(100);
        table2.setSpacingBefore(12);
        table2.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table2.addCell(saisir_cellule_titre("Document de notification",4));
        table2.completeRow();
        //--------------------- completeRow ---------------------
        table2.addCell( saisir_cellule("Quantité totale prévue : ",font,fontbold,ns.getQuantite()!=null?ns.getQuantite():"",1));
        table2.addCell( saisir_cellule("Opération : ",font,fontbold,ns.getOperation()!=null?ns.getOperation():"",1));
        table2.addCell( saisir_cellule("Nombre total d'expéditions prévues : ",font,fontbold,ns.getExpedition()!=null?ns.getExpedition():"",1));
        table2.completeRow();
        table2.addCell( saisir_cellule("Caractéristiques physiques : ",font,fontbold,ns.getCaracteristquePhysique()!=null?ns.getCaracteristquePhysique().getNom_fr():"-",1));
        table2.addCell( saisir_cellule("Notification Concernant : ",font,fontbold,ns.getUniques()!=null?ns.getUniques():"",1));
        table2.addCell( saisir_cellule("Prescriptions spéciales de manutention : ",font,fontbold,ns.getManutention()!=null?ns.getManutention():"",1));
        table2.completeRow();
        table2.addCell( saisir_cellule("Premier départ : ",font,fontbold,ns.getPremier()!=null?ns.getPremier():"",1));
        table2.addCell( saisir_cellule("Dernier  départ : ",font,fontbold,ns.getDernier()!=null?ns.getDernier():"",1));
        table2.addCell( saisir_cellule("Destination finale : ",font,fontbold,ns.getDestination_final()!=null?ns.getDestination_final():"",1));
        table2.completeRow();
        table2.addCell( saisir_cellule("Type(s) de conditionnement : ",font,fontbold,ns.getTypeconditionnement()!=null?ns.getTypeconditionnement().getNom_fr():"-",3));
        table2.setSpacingAfter(12);


        //--------------------- Tableau Transporteur(s) prévu ---------------------
        PdfPTable table3 = new PdfPTable(new float[]{2,2,2,2,2});
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1 || ns.getZf_et().equals("XD")){
            table3.addCell(saisir_cellule_titre("Transporteur(s) prévu", 5));
            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(saisir_cellule_transporteur_titre("Nom", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Identifiant fiscale ", 1));
            table3.addCell(saisir_cellule_transporteur_titre("teléphone", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Fax", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Email", 1));
            table3.completeRow();
            if (ns.getTransporteur() != null && ns.getTransporteur().size() > 0) {
                for (TransporteurParam tp : ns.getTransporteur()) {
                    table3.addCell(saisir_cellule(tp.getNom(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getIdentifiant(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getTel(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getFax(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getEmail(), font, font, "", 1));
                    table3.completeRow();
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 5);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }
        else{
            table3.addCell(saisir_cellule_titre("Transporteur Etranger", 5));
            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(saisir_cellule_transporteur_titre("Raison Social", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Matricule ", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Type véhicule", 1));
            table3.addCell(saisir_cellule_transporteur_titre("Assurance", 2));
            table3.completeRow();
            if (ns.getTransporteur_etranger() != null && ns.getTransporteur_etranger().size() > 0) {
                for (TransporteurEtranger tp : ns.getTransporteur_etranger()) {
                    table3.addCell(saisir_cellule(tp.getRaison_social(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getNum_matricule(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getTypeVehicule(), font, font, "", 1));
                    table3.addCell(saisir_cellule(tp.getUrl_assurance(), font, font, "", 2));
                    table3.completeRow();
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur Etranger.", fontbold, fontbold, "", 5);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }


        //--------------------- Tableau Producteur(s) ---------------------
        PdfPTable table4 = new PdfPTable(new float[]{2,2,2});
        table4.setWidthPercentage(100);
        table4.setSpacingBefore(12);
        table4.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table4.addCell(saisir_cellule_titre("Producteur(s)",4));
        table4.completeRow();
        //--------------------- completeRow ---------------------
        table4.addCell( saisir_cellule("Nom : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getNom_fr():"-",1));
        table4.addCell( saisir_cellule("teléphone : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getTel():"-",1));
        table4.addCell( saisir_cellule("Email : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getMail():"-",1));
        table4.completeRow();
        table4.addCell( saisir_cellule("Fax : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getFax():"-",1));
        table4.addCell( saisir_cellule("Identifiant fiscale : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getIdf():"-",1));
        table4.addCell( saisir_cellule("Personne à contacter : ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getContact_fr():"-",1));
        table4.completeRow();
        table4.addCell( saisir_cellule("Adresse: ",font,fontbold,ns.getProducteur()!=null?ns.getProducteur().getAdresse_fr():"-",3));
        table4.completeRow();
        table4.setSpacingAfter(12);



        //--------------------- Tableau Installation d’élimination(s) ---------------------
        PdfPTable table5 = new PdfPTable(new float[]{2,2,2});
        table5.setWidthPercentage(100);
        table5.setSpacingBefore(12);
        table5.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table5.addCell(saisir_cellule_titre("Installation d’élimination",4));
        table5.completeRow();
        //--------------------- completeRow ---------------------
        table5.addCell( saisir_cellule("Nom : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getNom_fr():"-",1));
        table5.addCell( saisir_cellule("teléphone : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getTel():"-",1));
        table5.addCell( saisir_cellule("Email : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getMail():"-",1));
        table5.completeRow();
        table5.addCell( saisir_cellule("Fax : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getFax():"-",1));
        table5.addCell( saisir_cellule("Identifiant fiscale : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getIdf():"-",1));
        table5.addCell( saisir_cellule("Personne à contacter : ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getContact_fr():"-",1));
        table5.completeRow();
        table5.addCell( saisir_cellule("Adresse: ",font,fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getAdresse_fr():"-",3));
        table5.completeRow();
        table5.setSpacingAfter(12);


        //--------------------- Tableau Document de mouvements des déchets ---------------------
        PdfPTable table6 = new PdfPTable(new float[]{2,1.5f,2,2.5f});
        table6.setWidthPercentage(100);
        table6.setSpacingBefore(12);
        table6.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table6.addCell(saisir_cellule_titre("Document de mouvements des déchets",4));
        table6.completeRow();
        //--------------------- completeRow ---------------------
        table6.addCell( saisir_cellule("Quantité réelle : ",font,fontbold,ns.getQuantite_reel()!=null ? ns.getQuantite_reel() +" "+(ns.getUnite()!=null?ns.getUnite().getNom_fr():" ") :"",1));
        table6.addCell( saisir_cellule("Nombre de colis : ",font,fontbold,ns.getNbr_colis()!=null?ns.getNbr_colis():"",1));
        table6.addCell( saisir_cellule("Date réelle de l'expédition : ",font,fontbold,ns.getDate_reel()!=null ? dateFormat.format(ns.getDate_reel()):"",2));
        table6.completeRow();
        table6.addCell( saisir_cellule("Lieu effectif de l'élimination/valorisation: ",font,fontbold,ns.getLieux_elimination()!=null?ns.getLieux_elimination().getNom_fr():ns.getLieu(),4));
        table6.completeRow();
        table6.setSpacingAfter(12);

        //--------------------- Tableau Document de mouvements des déchets ---------------------
        PdfPTable table8 = new PdfPTable(new float[]{2,1.5f,2,2.5f});
        table8.setWidthPercentage(100);
        table8.setSpacingBefore(12);
        table8.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table8.addCell(saisir_cellule_titre("Reçu de dépos" ,4));
        table8.completeRow();
        //--------------------- completeRow ---------------------
        //--------------------- completeRow ---------------------
        String username = "";
        String contact = "";
        if(ns.getImportateur()!=null){
            username = ns.getImportateur().getNom_fr();
            contact = ns.getImportateur().getContact_fr();
        }

        String dateTest=convertDate("dd/MM/yyyy",ns.getDateDepot());
        table8.addCell( saisir_cellule("Date de dépôt de la demande :",font,fontbold,dateTest,4));
        table8.completeRow();
        table8.setSpacingAfter(12);



        PdfPTable table9 = new PdfPTable(4);
        table9.setWidthPercentage(100);
        table9.setSpacingBefore(12);
        table9.setSpacingAfter(12);
        String num_notification = ns.getNum_notification()!=null?ns.getNum_notification():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode("check this link : http://localhost:85/downloadRecuDepo/"
                + ns.getId_notification() + "\n Numero de notification : " + num_notification, 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);
        PdfPCell cell13 = new PdfPCell();
        cell13.addElement(codeQrImage);
        cell13.setBorder(Rectangle.NO_BORDER);
        cell13.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell13.setPadding(5);



        PdfPCell cell7 = new PdfPCell();
        Paragraph par15= new Paragraph();
        par15.setAlignment(Element.ALIGN_LEFT);
        cell7.setBorder(Rectangle.NO_BORDER);
        par15.setSpacingAfter(5);
        Font blue = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLUE);
        Chunk chunk1 = new Chunk(url+"/downloadRecuDepo/"+ns.getId_notification(),blue);
        chunk1.setUnderline(1.f, -1);
        par15.add("");
        cell7.addElement(par15);
        cell7.setPadding(5);
        cell7.setColspan(2);

        PdfPCell cell10 = new PdfPCell();
        cell10.setBorder(Rectangle.NO_BORDER);
        cell10.addElement(new Phrase(""));


        table9.addCell(cell10);
        table9.addCell(cell7);
        table9.addCell(cell13);




        table9.completeRow();


        document.add(headerPar);
        document.add(table0);
        document.add(table1);
        document.add(table2);
        document.add(table3);
        document.add(table4);
        document.add(table5);
        document.add(table6);
        document.add(table8);
        document.add(table9);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static String convertDate(String type, Date date) {
        String strDate = "";
        if (date == null) {

        } else {

            SimpleDateFormat formatter = new SimpleDateFormat(type);
            strDate = formatter.format(date);

        }
        return strDate;
    }


}


