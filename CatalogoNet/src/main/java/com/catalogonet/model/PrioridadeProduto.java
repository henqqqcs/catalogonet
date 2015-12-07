package com.catalogonet.model;

public enum PrioridadeProduto {
	
	PRODUTO_GRATUITO(1),
	PRODUTO_PROFISSIONAL(3),
	PRODUTO_ULTIMATE(4);
	
	private PrioridadeProduto(int prioridadeProduto) {
		this.prioridadeProduto = prioridadeProduto;
	}

	private int prioridadeProduto;

	public int getPrioridadeProduto() {
		return prioridadeProduto;
	}

	public void setPrioridadeProduto(int prioridadeProduto) {
		this.prioridadeProduto = prioridadeProduto;
	}


}
