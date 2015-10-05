package com.catalogonet.busca;

import java.util.ArrayList;
import java.util.List;

import com.catalogonet.anuncio.Anuncio;

public class ResultadoBuscaCategoria {

	//lista anuncios achados pelas categoria
	private List<Anuncio> listaAnunciosCategoria =  new ArrayList<Anuncio>();
	
	//lista de achados pelas subcategorias
	private List<Anuncio> listaAnunciosSubCategoria =  new ArrayList<Anuncio>();
	
	//lista tags da busca
	private List<String> listaTagsEncontradas = new ArrayList<String>();
	
	//avisa ao buscador para remover a keyword da buscaSemCategoria
	private boolean achouKeyword = false;
	
	//metodo que adiciona as tags
	
	public void adicionaListaTags(List<String> tags) {
		for (String str : tags) {
			if (!listaTagsEncontradas.contains(str)) {
				listaTagsEncontradas.add(str);
			}
		}
	}

	public List<Anuncio> getListaAnunciosCategoria() {
		return listaAnunciosCategoria;
	}

	public void setListaAnunciosCategoria(List<Anuncio> listaAnunciosCategoria) {
		this.listaAnunciosCategoria = listaAnunciosCategoria;
	}

	public List<Anuncio> getListaAnunciosSubCategoria() {
		return listaAnunciosSubCategoria;
	}

	public void setListaAnunciosSubCategoria(List<Anuncio> listaAnunciosSubCategoria) {
		this.listaAnunciosSubCategoria = listaAnunciosSubCategoria;
	}

	public List<String> getListaTagsEncontradas() {
		return listaTagsEncontradas;
	}

	public boolean isAchouKeyword() {
		return achouKeyword;
	}

	public void setAchouKeyword(boolean achouKeyword) {
		this.achouKeyword = achouKeyword;
	}
	
	
	
	
	
	
	
}
