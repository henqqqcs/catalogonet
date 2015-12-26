package com.catalogonet.dao.interfaces;

import java.util.List;

import com.catalogonet.model.Plano;


public interface PlanoDAO {

	//plano s guia comercial
	public Plano adicionarPlano(Plano plano);
	public void atualizarPlano(Plano plano);
	public void removerPlano(Long idPlano);
	public Plano buscarPlanoPorId(Long idPlano);
	
	//usuario
	public List<Plano> listarPlanosDoUsuario(Long idUsuario);
	public List<Plano> listarPlanosNaoUtilizados(Long idUsuario);
	
	//public Plano buscarPlanoAtivoDoAnuncio(Long id);
	//public Plano buscarPlanoDoAnuncio(Long idAnuncio);
//	public List<Plano> listarTodosPlanosDo(Long id);
	
	//public List<Plano> listarPlanosComAnuncioDoUsuario(Long idUsuario);
	
	//plano marketing digital
	//plano sites
	
}
