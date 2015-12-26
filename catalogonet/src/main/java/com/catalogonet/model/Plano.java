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
public class Plano {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "usuario_id", nullable = false)
	private Usuario usuario;

	@OneToOne
	@JoinColumn(name = "anuncio_id")
	private Anuncio anuncio;

	@Enumerated(EnumType.STRING)
	@Column(name = "status_plano")
	private StatusPlano status;

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

	@Deprecated
	public Plano() {
	}
	
	public Plano(Usuario  usuario, Produto produto) {
		this.usuario = usuario;
		this.produto = produto;
		this.dataCriacao = LocalDate.now();
		this.status = StatusPlano.AGUARDANDO_CRIACAO_ANUNCIO;
	}

	public boolean isAtivo() {
		if (status == StatusPlano.ATIVO) {
			return true;
		}
		return false;
	}

	public int getDiasRestantes() {

		if ((dataInicio != null) && (dataFinalizacao != null)) {
			int diasRestantes = Period.between(dataInicio, dataFinalizacao).getDays();
			return diasRestantes;
		}

		return 0;
	}

	public void atualizarStatus(StatusPlano status) {
		this.status = status;
	}


//	================== getters and setter

	public StatusPlano getStatus() {
		return this.status;
	}
	
	public int getPrioridadeProduto() {
		return this.produto.getPrioridadeProduto().getPrioridadeProduto();
	}
	
	public String getNomePlano() {
		return this.produto.getNome();
	}

	public String getNomeCompletoPlano() {
		return this.produto.getNomeCompleto();
	}
	
	public int getDuracaoProdutoEmMeses() {
		return this.produto.getDuracaoMeses();
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
	
	public Anuncio getAnuncio() {
		return anuncio;
	}
	
	public void setAnuncio(Anuncio anuncio) {
		this.anuncio = anuncio;
	}
	
	public LocalDate getDataCriacao() {
		return dataCriacao;
	}
	
}
