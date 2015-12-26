package com.catalogonet.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.catalogonet.util.StringFormat;

@Entity
@Table(name = "cidade")
public class Cidade {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_cidade")
	private Long id;
	@Column(name = "cidade_nome")
	private String nome;

	@Column(name = "cidade_nome_url")
	private String nomeNaUrl;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_estado", nullable = false)
	private Estado estado;
	
	@OneToMany(mappedBy = "cidade")
	private List<Bairro> listaBairros;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.setNomeNaUrl(nome);
		this.nome = nome;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public String getNomeNaUrl() {
		return nomeNaUrl;
	}

	public void setNomeNaUrl(String nomeNaUrl) {
		this.nomeNaUrl = StringFormat.formatarStringParaUrl(nomeNaUrl);
	}

	public List<Bairro> getListaBairros() {
		return listaBairros;
	}

	public void setListaBairros(List<Bairro> listaBairros) {
		this.listaBairros = listaBairros;
	}
	
}
