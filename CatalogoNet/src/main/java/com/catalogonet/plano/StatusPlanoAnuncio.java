package com.catalogonet.plano;

public enum StatusPlanoAnuncio {

	
	PLANO_TEMPORARIO("PLANO_TEMPORARIO"),
	PLANO_SUSPENSO("PLANO_SUSPENSO"),
	PLANO_ATIVO("PLANO_ATIVO"),
	PLANO_PAGO_AGUARDANDO_APLICACAO("PLANO_PAGO_AGUARDANDO_APLICACAO");
	
	private StatusPlanoAnuncio(String statusPlanoAnuncio) {
		this.statusPlanoAnuncio = statusPlanoAnuncio;
	}

	private String statusPlanoAnuncio;

	public String getStatusPlanoAnuncio() {
		return statusPlanoAnuncio;
	}

	public void setStatusPlanoAnuncio(String statusPlanoAnuncio) {
		this.statusPlanoAnuncio = statusPlanoAnuncio;
	}
	
}
