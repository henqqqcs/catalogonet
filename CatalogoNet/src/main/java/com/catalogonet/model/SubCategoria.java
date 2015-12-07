package com.catalogonet.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.catalogonet.util.StringFormat;

@Entity
@Table(name = "sub_categoria")
public class SubCategoria implements Serializable {

	
	private static final long serialVersionUID = -9146984124301460591L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_sub_categoria")
	private Long id;
	private String nome;
	@Column(name = "nome_na_url")
	private String nomeNaUrl;

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "sub_categoria_tags")
	private List<String> tags = new ArrayList<String>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "categoria_id")
	private Categoria categoria;

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

	public List<String> getTags() {
		return tags;
	}

	public void setTags(List<String> tags) {
		this.tags = tags;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public String getNomeNaUrl() {
		return nomeNaUrl;
	}

	public void setNomeNaUrl(String nomeNaUrl) {
		this.nomeNaUrl = StringFormat.formatarStringParaUrl(nomeNaUrl);
	}
	
	
	
}
