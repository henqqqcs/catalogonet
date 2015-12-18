package com.catalogonet.negocio;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.dao.interfaces.PlanoDAO;
import com.catalogonet.model.Plano;

@Component
@Transactional
public class PlanoRN {

	@Autowired
	private PlanoDAO dao;
	
	public Plano adicionar(Plano plano) {
		return dao.adicionarPlano(plano);
	}
	
	public void atualizar(Plano plano) {
		dao.atualizarPlano(plano);
	}

	public void remover(Long idPlano) {
		dao.removerPlano(idPlano);
	}

	public Plano buscarPorId(Long idPlano) {
		return dao.buscarPlanoPorId(idPlano);
	}

	public List<Plano> listarPlanosDoUsuario(Long idUsuario) {
		return dao.listarPlanosDoUsuario(idUsuario);
	}

}
