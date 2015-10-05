package com.catalogonet.local;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.catalogonet.util.StringFormat;

@Entity
@Table(name = "estado")
public class Estado {

	@Id
	@Column(name = "id_estado")
	private String id;
	@Column(name = "estado_nome")
	private String nome;
	@Column(name = "estado_nome_url")
	private String nomeNaUrl;

	@OneToMany(mappedBy = "estado")
	private List<Cidade> listaCidades;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.setNomeNaUrl(nome);
		this.nome = nome;
	}

	public String getNomeNaUrl() {
		return nomeNaUrl;
	}

	public void setNomeNaUrl(String nomeNaUrl) {
		this.nomeNaUrl = StringFormat.formatarStringParaUrl(nomeNaUrl);
	}

	public List<Cidade> getListaCidades() {
		return listaCidades;
	}

	public void setListaCidades(List<Cidade> listaCidades) {
		this.listaCidades = listaCidades;
	}

}
