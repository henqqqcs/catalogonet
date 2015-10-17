package com.catalogonet.pedido;

import java.math.BigDecimal;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.catalogonet.converter.LocalDatePersistenceConverter;
import com.catalogonet.produto.Produto;
import com.catalogonet.usuario.Usuario;

@Entity
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private BigDecimal valor;

	@Enumerated(EnumType.STRING)
	@Column(name = "metodo_pagamento")
	private MetodoPagamento metodoPagamento;

	@Enumerated(EnumType.STRING)
	private PedidoStatus pedidoStatus;

	private boolean pago;

	/**
	 * Para identificar se eh uma renovacao de plano
	 */
	private boolean renovacao;

	@Convert(converter = LocalDatePersistenceConverter.class)
	@Column(name = "data_inicio")
	private LocalDate dataInicio;

	@Convert(converter = LocalDatePersistenceConverter.class)
	@Column(name = "data_finalizacao")
	private LocalDate dataFinalizacao;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuario_id", nullable = false)
	private Usuario usuario;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "produto_id", nullable = false)
	private Produto produto;

	public Pedido() {
	}
	
	public Pedido(MetodoPagamento metodoPagamento, PedidoStatus status,
			boolean renovacao, Usuario usuario, Produto produto) {
		this.metodoPagamento = metodoPagamento;
		this.pedidoStatus = status;
		this.renovacao = renovacao;
		this.usuario = usuario;
		this.produto = produto;
		
		//valor
		this.valor = produto.getValor();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public MetodoPagamento getMetodoPagamento() {
		return metodoPagamento;
	}

	public void setMetodoPagamento(MetodoPagamento metodoPagamento) {
		this.metodoPagamento = metodoPagamento;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public LocalDate getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(LocalDate dataInicio) {
		this.dataInicio = dataInicio;
	}

	public boolean isRenovacao() {
		return renovacao;
	}

	public void setRenovacao(boolean renovacao) {
		this.renovacao = renovacao;
	}

	public LocalDate getDataFinalizacao() {
		return dataFinalizacao;
	}

	public void setDataFinalizacao(LocalDate dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}

	public boolean isPago() {
		return pago;
	}

	public void setPago(boolean pago) {
		this.pago = pago;
	}

	public PedidoStatus getPedidoStatus() {
		return pedidoStatus;
	}

	public void setPedidoStatus(PedidoStatus pedidoStatus) {
		this.pedidoStatus = pedidoStatus;
	}


}
