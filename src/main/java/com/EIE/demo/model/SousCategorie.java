package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "souscategorie")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class SousCategorie implements Serializable {

    public SousCategorie() {
    }

    @Id
    @GeneratedValue(strategy= GenerationType. IDENTITY)
    @Column (name="id_souscategorie")
    private int id_souscategorie;

    @Column(name = "deleteDateTime", nullable = true)
    private Date deleteDateTime;


    @Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom_fr;

    @Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
    private String nom_ar;
}
