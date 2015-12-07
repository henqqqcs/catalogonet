package com.catalogonet.model;

import java.time.LocalDate;
import java.time.Period;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.catalogonet.converter.LocalDatePersistenceConverter;

@Entity
@Table(name = "plano_anuncio")
public class PlanoAnuncio {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private boolean ativo;

	@ManyToOne
	@JoinColumn(name = "usuario_id", nullable = false)
	private Usuario usuario;

	@OneToOne
	@JoinColumn(name = "anuncio_id")
	private Anuncio anuncio;
	
	@Enumerated(EnumType.STRING)
	@Column(name ="status_plano_anuncio")
	private StatusPlanoAnuncio statusPlanoAnuncio;

	@OneToOne
	@JoinColumn(name = "produto_id", nullable = false)
	private Produto produto;
	
	@Transient
	private int diasRestantes;

	@Convert(converter = LocalDatePersistenceConverter.class)
	@Column(name = "data_criacao")
	private LocalDate dataCriacao;
	
	@Convert(converter = LocalDatePersistenceConverter.class)
	@Column(name = "data_inicio")
	private LocalDate dataInicio;
	
	@Convert(converter = LocalDatePersistenceConverter.class)
	@Column(name = "data_finalizacao")
	private LocalDate dataFinalizacao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Produto getProduto() {
		return produto;
	}


	public LocalDate getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(LocalDate dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public LocalDate getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(LocalDate dataInicio) {
		this.dataInicio = dataInicio;
	}

	public LocalDate getDataFinalizacao() {
		return dataFinalizacao;
	}

	public void setDataFinalizacao(LocalDate dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public int getDiasRestantes() {
		
		if ((dataInicio != null) && (dataFinalizacao != null )) {
			int diasRestantes = Period.between(dataInicio, dataFinalizacao).getDays();
			return diasRestantes;
		}

		return 0;
	}

	public Anuncio getAnuncio() {
		return anuncio;
	}

	public void setAnuncio(Anuncio anuncio) {
		this.anuncio = anuncio;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public StatusPlanoAnuncio getStatusPlanoAnuncio() {
		return statusPlanoAnuncio;
	}

	public void setStatusPlanoAnuncio(StatusPlanoAnuncio statusPlanoAnuncio) {
		this.statusPlanoAnuncio = statusPlanoAnuncio;
	}
	

}
