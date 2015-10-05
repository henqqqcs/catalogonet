package com.catalogonet.pedido;

public enum MetodoPagamento {

	PAG_SEGURO("PagSeguro"),
	PAYPAL("PayPal"),
	BOLETO("Boleto");
	
	private String metodoPagamento;
	
	MetodoPagamento(String metodoPagamento) {
		this.metodoPagamento = metodoPagamento;
	}

	public String getMetodoPagamento() {
		return metodoPagamento;
	}

	public void setMetodoPagamento(String metodoPagamento) {
		this.metodoPagamento = metodoPagamento;
	}
	
	

	
	
}
