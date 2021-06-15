package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "autorite")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class Autorite {
    @Id
    @GeneratedValue(strategy= GenerationType. IDENTITY)
    @Column (name="id_autorite")
    private int id_autorite;
    @Column(name = "nom_fr", nullable = true)
    private String nom_fr;
    @Column(name = "nom_ar", nullable = true)
    private String nom_ar;
    @Column(name = "email", nullable = true)
    private String email;
    @Column(name = "adresse", nullable = true)
    private String adresse;
    @Column(name = "tel", nullable = true)
    private String tel;
    @Column(name = "fax", nullable = true)
    private String fax;

    @Column(name = "deleteDateTime", nullable = true)
    private Date deleteDateTime;


    public int getId_autorite() {
        return id_autorite;
    }

    public void setId_autorite(int id_autorite) {
        this.id_autorite = id_autorite;
    }

    public String getNom_fr() {
        return nom_fr;
    }

    public void setNom_fr(String nom_fr) {
        this.nom_fr = nom_fr;
    }

    public String getNom_ar() {
        return nom_ar;
    }

    public void setNom_ar(String nom_ar) {
        this.nom_ar = nom_ar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public Date getDeleteDateTime() {
        return deleteDateTime;
    }

    public void setDeleteDateTime(Date deleteDateTime) {
        this.deleteDateTime = deleteDateTime;
    }
}
