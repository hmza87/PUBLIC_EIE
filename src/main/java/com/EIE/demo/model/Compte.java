package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "compte")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class Compte  implements Serializable {
	
	
	public int getCompteId() {
		return compteId;
	}

	public void setCompteId(int compteId) {
		this.compteId = compteId;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCommission() {
		return commission;
	}

	public void setCommission(String commission) {
		this.commission = commission;
	}

	public String getDepot() {
		return depot;
	}

	public void setDepot(String depot) {
		this.depot = depot;
	}

	public Profil getProfil() {
		return profil;
	}

	public void setProfil(Profil profil) {
		this.profil = profil;
	}

	

	public Compte() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="compteId")
    private int compteId;
	
	@Column(name = "nom", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom;
	
	@Column(name = "emailRecup", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String emailRecup;
	
	public String getEmailRecup() {
		return emailRecup;
	}

	public void setEmailRecup(String emailRecup) {
		this.emailRecup = emailRecup;
	}

	@Column(name = "email", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String email;
	
	
	@Column(name = "tel", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String tel;
	@Column(name = "deleted", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String deleted;
	@Column(name = "password", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String password;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "commission", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String commission;
	
	@Column(name = "depot", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String depot;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "profilId")
	private Profil profil;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "societesId")
	private Societe st;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "regionId")
	private Region region;
	
	
	public Societe getSt() {
		return st;
	}

	public void setSt(Societe st) {
		this.st = st;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	@Column
	private Date deleteDateTime;
	
	
	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}
	

	

	

	
	

	

	
	

	
	
	
	

}
