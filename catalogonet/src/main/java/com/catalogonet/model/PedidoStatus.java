package com.catalogonet.model;

public enum PedidoStatus {

	PAGO("PAGO"),
	AGUARDANDO_PAGAMENTO("AGUARDANDO_PAGAMENTO"),
	CANCELADO("CANCELADO"),
	EM_ANALISE("EM_ANALISE"),
	DEVOLVIDO("DEVOLVIDO");
	
	private String pedidoStatus;

	private PedidoStatus(String pedidoStatus) {
		this.pedidoStatus = pedidoStatus;
	}
	
	public String getPedidoStatus() {
		return pedidoStatus;
	}

	public void setPedidoStatus(String pedidoStatus) {
		this.pedidoStatus = pedidoStatus;
	}
	
}
