package com.catalogonet.model;

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

	@Deprecated
	public Pedido() {
	}
	
	public Pedido(MetodoPagamento metodoPagamento, Usuario usuario, Produto produto) {
		
		this.metodoPagamento = metodoPagamento;
		this.usuario = usuario;
		this.produto = produto;
		
		if (metodoPagamento == MetodoPagamento.GRATUITO) 
			this.pedidoStatus = PedidoStatus.PAGO;
		else
			this.pedidoStatus = PedidoStatus.AGUARDANDO_PAGAMENTO;
		
		//valor
		this.valor = produto.getValor();
		
		//data inicio
		this.dataInicio = LocalDate.now();
		//o pedido vai expirar em 10 dias
		this.dataFinalizacao = LocalDate.now().plusDays(10);
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

	public Usuario getUsuario() {
		return usuario;
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

	public LocalDate getDataInicio() {
		return dataInicio;
	}

	public LocalDate getDataFinalizacao() {
		return dataFinalizacao;
	}

	public boolean isPago() {
		if (pedidoStatus == PedidoStatus.PAGO)
			return true;
		
		return false;
	}

	public PedidoStatus getPedidoStatus() {
		return pedidoStatus;
	}

	public void atualizarStatus(PedidoStatus pedidoStatus) {
		this.pedidoStatus = pedidoStatus;
	}


}
