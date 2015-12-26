package com.catalogonet.negocio;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.dao.interfaces.AnuncioDAO;
import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Usuario;

@Component
@Transactional
public class AnuncioRN {

	@Autowired
	private AnuncioDAO dao;

	public void salvar(Anuncio anuncio) {
		dao.salvar(anuncio);
	}

	public void atualizar(Anuncio anuncio) {
		dao.atualizar(anuncio);
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

	public List<Anuncio> listarAnunciosDoUsuario(Long idUsuario) {
		return dao.listarAnunciosDoUsuario(idUsuario);
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
