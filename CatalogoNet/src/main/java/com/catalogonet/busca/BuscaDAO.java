package com.catalogonet.busca;

import java.util.List;

import com.catalogonet.anuncio.Anuncio;

public interface BuscaDAO {
	
	public List<Anuncio> buscarPorTituloInteiro(String termo);
	public List<Anuncio> buscarPorTituloPartes(String termo);
	public List<Anuncio> buscarPorAnunciosTags(String termo);
	
	//usado pelo algoritmo de busca
	public List<Anuncio> buscarAnunciosDaCategoria(Long id);
	public List<Anuncio> buscarAnunciosDaSubCategoria(Long id);
}
