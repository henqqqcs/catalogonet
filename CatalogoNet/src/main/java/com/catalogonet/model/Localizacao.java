package com.catalogonet.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

@Embeddable
public class Localizacao {

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "estado_id")
	private Estado estado;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "cidade_id")
	private Cidade cidade;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bairro_id")
	private Bairro bairro;

	@Column(name = "end_endereco")
	@Size(max = 50)
	private String endereco;

	@Size(max = 30)
	@Column(name = "end_complemento")
	private String complemento;

	@Column(name = "end_cep")
	@Size(max = 10)
	private String cep;

	private String mapLatitude;
	private String mapLongitude;

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	public Bairro getBairro() {
		return bairro;
	}

	public void setBairro(Bairro bairro) {
		this.bairro = bairro;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getMapLatitude() {
		return mapLatitude;
	}

	public void setMapLatitude(String mapLatitude) {
		this.mapLatitude = mapLatitude;
	}

	public String getMapLongitude() {
		return mapLongitude;
	}

	public void setMapLongitude(String mapLongitude) {
		this.mapLongitude = mapLongitude;
	}

}
