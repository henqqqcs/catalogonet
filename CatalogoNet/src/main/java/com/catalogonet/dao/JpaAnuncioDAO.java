package com.catalogonet.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.catalogonet.dao.interfaces.AnuncioDAO;
import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Usuario;

@Repository
public class JpaAnuncioDAO implements AnuncioDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void salvar(Anuncio anuncio) {
		em.persist(anuncio);
		em.flush();
	}

	@Override
	public void atualizar(Anuncio anuncio) {
		em.merge(anuncio);
	}

	@Override
	public void remover(Long id) {
		Anuncio anuncio = em.find(Anuncio.class, id);
		em.remove(anuncio);
	}

	@Override
	public Anuncio buscarPorId(Long id) {
		return em.find(Anuncio.class, id);
	}

	@Override
	public List<Anuncio> buscarPorTituloInteiro(String titulo) {
		try {
			titulo = titulo.toUpperCase();
			String consulta = "select a from Anuncio a JOIN FETCH a.plano where a.titulo = :titulo";
			TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
			query.setParameter("titulo", titulo);
			return query.getResultList();
		} catch (Exception e) {
			return Collections.emptyList();
		}
	}

	@Override
	public Anuncio buscarAnuncioDoUsuario(Long idUsuario, Long idAnuncio) {
		try {
			String consulta = "SELECT a FROM Anuncio a JOIN FETCH a.plano WHERE a.usuario.id = :idUsuario AND a.id = :idAnuncio";
			TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
			query.setParameter("idUsuario", idUsuario);
			query.setParameter("idAnuncio", idAnuncio);
			return query.getResultList().get(0);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Anuncio> listarAnunciosDoUsuario(Long idUsuario) {

		try {
			//String consulta = "select a from Anuncio a join fetch a.categoria ca where a.usuario.id = :idUsuario";
			String consulta = "select a from Anuncio a JOIN FETCH a.plano where a.usuario.id = :idUsuario";
			TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
			query.setParameter("idUsuario", idUsuario);
			return query.getResultList();
		} catch (Exception e) {
			return Collections.emptyList();
		}

	}

	@Override
	public List<Anuncio> listarAnunciosGratuitosNaoAprovados() {
		String consulta = "SELECT a FROM Anuncio a JOIN FETCH a.plano WHERE a.prioridadeProduto = com.catalogonet.produto.PrioridadeProduto.PRODUTO_GRATUITO and a.verificado = false";
		TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
		return query.getResultList();
	}

	@Override
	public Usuario buscarUsuarioDoAnuncio(Long idAnuncio) {
		try {
			String consulta = "SELECT a.usuario FROM Anuncio a WHERE a.id = :idAnuncio";
			TypedQuery<Usuario> query = em.createQuery(consulta, Usuario.class);
			query.setParameter("idAnuncio", idAnuncio);
			return query.getResultList().get(0);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Anuncio> buscarPorParteTitulo(String titulo) {
		String consulta = "select a from Anuncio a JOIN FETCH a.plano where a.titulo like :titulo";
		TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
		query.setParameter("titulo", "%" + titulo + "%");
		return query.getResultList();
	}


}
