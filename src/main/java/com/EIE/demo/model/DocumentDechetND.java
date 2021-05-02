package com.EIE.demo.model;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "DocumentDechetND")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class DocumentDechetND implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy= GenerationType. IDENTITY)
    @Column (name="dnd")
    private int dnd;

    @Column (name="titre", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String titre;

    @Column (name="p1", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p1;

    @Column (name="nomSociete", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nomSociete;

    @Column (name="Adresse", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String Adresse;

    @Column (name="tel", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String tel;

    @Column (name="email", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String email;

    @Column (name="p3", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p3;

    @Column (name="numero", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String numero;

    @Column (name="type", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String type;

    @Column (name="source", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String source;

    @Column (name="code", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String code;

    @Column (name="quantite", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String quantite;

    @Column (name="p6", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p6;

    @Column (name="nomtr", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nomtr;

    @Column (name="pattente", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String pattente;

    @Column (name="p8", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p8;

    @Column (name="nom", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom;

    @Column (name="p10", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String p10;

    @Column (name="comment", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String comment;

    @Column (name="temps", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String temps;

    @Column (name="ila", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String ila;

    public DocumentDechetND(int dnd, String titre, String p1, String nomSociete, String adresse, String tel, String email, String p3, String numero, String type, String source, String code, String quantite, String p6, String nomtr, String pattente, String p8, String nom, String p10, String comment, String temps, String ila) {
        this.dnd = dnd;
        this.titre = titre;
        this.p1 = p1;
        this.nomSociete = nomSociete;
        Adresse = adresse;
        this.tel = tel;
        this.email = email;
        this.p3 = p3;
        this.numero = numero;
        this.type = type;
        this.source = source;
        this.code = code;
        this.quantite = quantite;
        this.p6 = p6;
        this.nomtr = nomtr;
        this.pattente = pattente;
        this.p8 = p8;
        this.nom = nom;
        this.p10 = p10;
        this.comment = comment;
        this.temps = temps;
        this.ila = ila;
    }

    public DocumentDechetND() {
    }

    public int getDid() {
        return dnd;
    }

    public void setDid(int did) {
        this.dnd = did;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getP1() {
        return p1;
    }

    public void setP1(String p1) {
        this.p1 = p1;
    }

    public String getNomSociete() {
        return nomSociete;
    }

    public void setNomSociete(String nomSociete) {
        this.nomSociete = nomSociete;
    }

    public String getAdresse() {
        return Adresse;
    }

    public void setAdresse(String adresse) {
        Adresse = adresse;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getP3() {
        return p3;
    }

    public void setP3(String p3) {
        this.p3 = p3;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getQuantite() {
        return quantite;
    }

    public void setQuantite(String quantite) {
        this.quantite = quantite;
    }

    public String getP6() {
        return p6;
    }

    public void setP6(String p6) {
        this.p6 = p6;
    }

    public String getNomtr() {
        return nomtr;
    }

    public void setNomtr(String nomtr) {
        this.nomtr = nomtr;
    }

    public String getPattente() {
        return pattente;
    }

    public void setPattente(String pattente) {
        this.pattente = pattente;
    }


    public String getP8() {
        return p8;
    }

    public void setP8(String p8) {
        this.p8 = p8;
    }

    public String getTemps() {
        return temps;
    }

    public void setTemps(String temps) {
        this.temps = temps;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getP10() {
        return p10;
    }

    public void setP10(String p10) {
        this.p10 = p10;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }


    public String getIla() {
        return ila;
    }

    public void setIla(String ila) {
        this.ila = ila;
    }
}
