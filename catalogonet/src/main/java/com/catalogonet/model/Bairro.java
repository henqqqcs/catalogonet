package com.catalogonet.model;

import java.text.Collator;
import java.util.Locale;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
@Table(name = "bairro")
public class Bairro implements Comparable<Bairro>{

	private static final Collator collator = Collator.getInstance(Locale.FRENCH);
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_bairro")
	private Long id;
	@Column(name = "bairro_nome", unique = true)
	private String nome;

	@Column(name = "bairro_nome_url")
	private String nomeNaUrl;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_estado", nullable = false)
	private Estado estado;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_cidade", nullable = false)
	private Cidade cidade;

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

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	public String getNomeNaUrl() {
		return nomeNaUrl;
	}

	public void setNomeNaUrl(String nomeNaUrl) {
		this.nomeNaUrl = StringFormat.formatarStringParaUrl(nomeNaUrl);
	}

	@Override
	public int compareTo(Bairro o) {
		return collator.compare(nome, o.nome);
	}

	
}
