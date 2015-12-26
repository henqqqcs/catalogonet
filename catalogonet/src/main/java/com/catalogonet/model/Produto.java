package com.catalogonet.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "produto")
public class Produto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Enumerated(EnumType.STRING)
	@Column(name ="prioridade_produto")
	private PrioridadeProduto prioridadeProduto;
	
	private String nome;
	private String nomeCompleto;
	
	private BigDecimal valor;
	private int duracaoMeses;

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
		this.nome = nome;
	}
	
	public String getNomeCompleto() {
		return nomeCompleto;
	}

	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public int getDuracaoMeses() {
		return duracaoMeses;
	}

	public void setDuracaoMeses(int duracaoMeses) {
		this.duracaoMeses = duracaoMeses;
	}

	public PrioridadeProduto getPrioridadeProduto() {
		return prioridadeProduto;
	}

	public void setPrioridadeProduto(PrioridadeProduto prioridadeProduto) {
		this.prioridadeProduto = prioridadeProduto;
	}
	
	
	
}
