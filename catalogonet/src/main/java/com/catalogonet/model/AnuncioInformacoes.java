package com.catalogonet.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.validation.constraints.Size;

import com.catalogonet.util.StringFormat;

@Embeddable
public class AnuncioInformacoes {

	@Size(min = 5, max = 50)
	private String titulo;

	@Size(min = 5, max = 55)
	private String tituloNaUrl;

	@Basic(fetch = FetchType.EAGER)
	@Lob
	@Size(max = 2048)
	private String descricao;

	@Basic(fetch = FetchType.EAGER)
	@Lob
	@Column(length = 1024)
	private String descricaoHtml;

	/** Contato **/
	@Size(min = 10, max = 16)
	private String telefone1;
	private String telefone2;
	private String email;

	private String site;
	private String facebook;
	private String twitter;
	private String instagram;
	private String googleplus;

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.tituloNaUrl = StringFormat.formatarStringParaUrl(titulo);
		this.titulo = titulo.toUpperCase();
	}

	public String getTituloNaUrl() {
		return tituloNaUrl;
	}

	public String getDescricao() {
		return descricao;
	}

	public String getDescricaoHtml() {
		return descricaoHtml;
	}

	public void setDescricaoHtml(String descricaoHtml) {
		this.descricaoHtml = descricaoHtml.replace("\n", "<br />\n");
	}

	public String getTelefone1() {
		return telefone1;
	}

	public void setTelefone1(String telefone1) {
		this.telefone1 = telefone1;
	}

	public String getTelefone2() {
		return telefone2;
	}

	public String getEmail() {
		return email;
	}

	public String getSite() {
		return site;
	}

	public String getFacebook() {
		return facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public String getInstagram() {
		return instagram;
	}

	public String getGoogleplus() {
		return googleplus;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	public void setGoogleplus(String googleplus) {
		this.googleplus = googleplus;
	}

}
