package com.catalogonet.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ResultadoBusca implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;

	//pizzaria-pizzaa-a-bessa+vicente-pires
	private String urlBusca;
	
	// busca orinal com acentos e tudo mais (p�o de queijo)
	private String stringBusca;
	private String stringLocal;

	private List<Anuncio> listaAnuncios;
	private List<String> keywords = new ArrayList<String>();

	public ResultadoBusca(String stringBusca, String stringLocal) {
		this.stringBusca = stringBusca;
		this.stringLocal = stringLocal;

		//gera um id
		String uniqueID = UUID.randomUUID().toString();
		CharSequence c = uniqueID.subSequence(0, 8);
		this.id = c.toString().toUpperCase();
	}

	public List<Anuncio> getListaAnuncios() {
		return listaAnuncios;
	}

	public void setListaAnuncios(List<Anuncio> listaAnuncios) {
		this.listaAnuncios = listaAnuncios;
	}

	public List<String> getKeywords() {
		return keywords;
	}

	public void setKeywords(List<String> keywords) {
		this.keywords = keywords;
	}

	public String getStringDeKeywords() {

		if (keywords.size() > 1) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < keywords.size(); i++) {
				sb.append(keywords.get(i));
				if (i < (keywords.size() - 1)) {
					sb.append(",");
				}
			}
			return sb.toString();
		} else {
			return "";
		}

	}

	public String getStringBusca() {
		return stringBusca;
	}

	public void setStringBusca(String stringBusca) {
		this.stringBusca = stringBusca;
	}

	public String getStringLocal() {
		return stringLocal;
	}

	public void setStringLocal(String stringLocal) {
		this.stringLocal = stringLocal;
	}

	public String getId() {
		return id;
	}

	public String getUrlBusca() {
		return urlBusca;
	}

	public void setUrlBusca(String urlBusca) {
		this.urlBusca = urlBusca;
	}


	

}
