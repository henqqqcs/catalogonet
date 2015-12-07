package com.catalogonet.plano;

import java.util.List;


public interface PlanoDAO {

	//plano anuncios guia comercial
	public PlanoAnuncio adicionarPlanoAnuncio(PlanoAnuncio planoAnuncio);
	public void atualizarPlanoAnuncio(PlanoAnuncio planoAnuncio);
	public void removerPlanoAnuncio(Long idPlanoAnuncio);
	public PlanoAnuncio buscarPlanoAnuncioPorId(Long idPlanoAnuncio);
	
	//usuario
	public List<PlanoAnuncio> listarPlanoAnuncioUsuario(Long idUsuario);
	public List<PlanoAnuncio> listarPlanoAnuncioNaoUtilizado(Long idUsuario);
	
	//anuncio
	public PlanoAnuncio buscarPlanoAtivoDoAnuncio(Long idAnuncio);
//	public List<PlanoAnuncio> listarTodosPlanosDoAnuncio(Long idAnuncio);
	
	//plano marketing digital
	//plano sites
	
}
