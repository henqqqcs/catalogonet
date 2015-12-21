package com.catalogonet.validators;

import java.util.Map;

public class ResultadoValidacaoAnuncio {

	Map<String, String> mapaInformacoes;
	Map<String, String> mapaLocalizacao;
	Map<String, String> mapaCategoria;
	Map<String, String> mapaTags;

	public ResultadoValidacaoAnuncio(Map<String, String> mapaInformacoes, Map<String, String> mapaLocalizacao,
			Map<String, String> mapaCategoria, Map<String, String> mapaTags) {
		this.mapaInformacoes = mapaInformacoes;
		this.mapaLocalizacao = mapaLocalizacao;
		this.mapaCategoria = mapaCategoria;
		this.mapaTags = mapaTags;
	}

	public boolean isAprovado() {
		if (mapaInformacoes.isEmpty() && mapaLocalizacao.isEmpty() && mapaCategoria.isEmpty() && mapaTags.isEmpty()) {
			return true;
		}
		return false;
	}

	public Map<String, String> getMapaInformacoes() {
		return mapaInformacoes;
	}

	public Map<String, String> getMapaLocalizacao() {
		return mapaLocalizacao;
	}

	public Map<String, String> getMapaCategoria() {
		return mapaCategoria;
	}

	public Map<String, String> getMapaTags() {
		return mapaTags;
	}

}
