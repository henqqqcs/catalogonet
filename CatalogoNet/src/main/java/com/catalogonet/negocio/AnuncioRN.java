package com.catalogonet.negocio;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.dao.interfaces.AnuncioDAO;
import com.catalogonet.model.Anuncio;
import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.model.Usuario;

@Component
@Transactional
public class AnuncioRN {

	@Autowired
	private AnuncioDAO dao;

	public void adicionar(Anuncio anuncio) {

		// coloca data de criacao
		if (anuncio.getDataCriacao() == null) {
			anuncio.setDataCriacao(LocalDate.now());
		}
		dao.adicionar(anuncio);
	}

	public void atualizar(Anuncio anuncio) {
		dao.atualizar(anuncio);

		// sempre que um anuncio que foi reprovado, for atualizado, ele sera
		// verificado novamente
		if (anuncio.isAprovado() == false) {
			anuncio.setVerificado(false);
		}
	}
	
	public void ativar(Anuncio anuncio,
			PlanoAnuncio plano) {
		
		//prioridade do anuncio
		anuncio.setPrioridadeProduto(plano.getProduto()
				.getPrioridadeProduto().getPrioridadeProduto());
		
		//ativar
		anuncio.setAtivo(true);
		
		this.atualizar(anuncio);
		
	}
	
	public void desativar(Anuncio anuncio) {
		anuncio.setAtivo(false);
		this.atualizar(anuncio);
	}

	public void remover(Long id) {
		dao.remover(id);
	}

	public Anuncio buscarPorId(Long id) {
		return dao.buscarPorId(id);
	}

	public List<Anuncio> buscarPorTituloInteiro(String titulo) {
		return dao.buscarPorTituloInteiro(titulo);
	}
	public Anuncio buscarAnuncioPorTituloInteiro(String titulo) {
		try {
			List<Anuncio> lista = this.buscarPorTituloInteiro(titulo);
			return lista.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Anuncio> listarAnunciosUsuario(Long idUsuario) {
		return dao.listarAnunciosUsuario(idUsuario);
	}

	public Anuncio buscarAnuncioDoUsuario(Long idUsuario, Long idAnuncio) {
		return dao.buscarAnuncioDoUsuario(idUsuario, idAnuncio);
	}

	public List<Anuncio> listarAnunciosGratuitosNaoAprovados() {
		return dao.listarAnunciosGratuitosNaoAprovados();
	}

	public Usuario buscarUsuarioDoAnuncio(Long idAnuncio) {
		return dao.buscarUsuarioDoAnuncio(idAnuncio);
	}

	public List<Anuncio> buscarPorParteTitulo(String titulo) {
		return dao.buscarPorParteTitulo(titulo);
	}


}
