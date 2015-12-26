package com.catalogonet.model;

public enum StatusPlano {

	ATIVO("ATIVO"),
	SUSPENSO("SUSPENSO"),
	FINALIZADO("FINALIZADO"),
	AGUARDANDO_CRIACAO_ANUNCIO("AGUARDANDO_CRIACAO_ANUNCIO"),
	AGUARDANDO_PUBLICACAO("AGUARDANDO_PUBLICACAO"),
	AGREGADO("AGREGADO");

	private StatusPlano(String statusPlano) {
		this.statusPlano = statusPlano;
	}

	private String statusPlano;

	public String getStatusPlano() {
		return statusPlano;
	}



}
