package com.catalogonet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.catalogonet.dao.interfaces.PlanoDAO;
import com.catalogonet.model.PlanoAnuncio;

@Repository
public class JpaPlanoDAO implements PlanoDAO {

	@PersistenceContext
	EntityManager em;

	@Override
	public PlanoAnuncio adicionarPlanoAnuncio(PlanoAnuncio planoAnuncio) {
		em.persist(planoAnuncio);
		em.flush();
		return planoAnuncio;
	}

	@Override
	public void atualizarPlanoAnuncio(PlanoAnuncio planoAnuncio) {
		em.merge(planoAnuncio);
	}

	@Override
	public void removerPlanoAnuncio(Long idPlanoAnuncio) {
		PlanoAnuncio plano = em.find(PlanoAnuncio.class, idPlanoAnuncio);
		em.remove(plano);
	}

	@Override
	public PlanoAnuncio buscarPlanoAnuncioPorId(Long idPlanoAnuncio) {
		return em.find(PlanoAnuncio.class, idPlanoAnuncio);
	}

	@Override
	public List<PlanoAnuncio> listarPlanoAnuncioUsuario(Long idUsuario) {
		String consulta = "select p from PlanoAnuncio p where p.usuario.id = :idUsuario";
		TypedQuery<PlanoAnuncio> query = em.createQuery(consulta, PlanoAnuncio.class);
		query.setParameter("idUsuario", idUsuario);
		return query.getResultList();
	}

	@Override
	public List<PlanoAnuncio> listarPlanoAnuncioNaoUtilizado(Long idUsuario) {
		String consulta = "select p from PlanoAnuncio p where p.usuario.id = :idUsuario AND p.anuncio IS NULL";
		TypedQuery<PlanoAnuncio> query = em.createQuery(consulta, PlanoAnuncio.class);
		query.setParameter("idUsuario", idUsuario);
		return query.getResultList();
	}
	
//	@Override
//	public List<Anuncio> listarAnunciosGratuitosNaoAprovados() {
//		String consulta = "SELECT a FROM Anuncio a WHERE a.prioridadeProduto = com.catalogonet.produto.PrioridadeProduto.PRODUTO_GRATUITO and a.verificado = false";
//		TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
//		return query.getResultList();
//	}
	
	@Override
	public PlanoAnuncio buscarPlanoAtivoDoAnuncio(Long idAnuncio) {

		try {
			
			String consulta = "select p from PlanoAnuncio p where p.anuncio.id = :idAnuncio AND p.ativo = true";
			TypedQuery<PlanoAnuncio> query = em.createQuery(consulta, PlanoAnuncio.class);
			query.setParameter("idAnuncio", idAnuncio);
			return query.getSingleResult();
		} catch (Exception e) {
			System.out.println("O metodo buscarPlanoAtivoDoAnuncio da classe JpaPlanoDAO lancou uma exception: " + e.getMessage());
			return null;
		}

	}

	@Override
	public PlanoAnuncio buscarPlanoDoAnuncio(Long idAnuncio) {
		try {
			String consulta = "select p from PlanoAnuncio p where p.anuncio.id = :idAnuncio";
			TypedQuery<PlanoAnuncio> query = em.createQuery(consulta, PlanoAnuncio.class);
			query.setParameter("idAnuncio", idAnuncio);
			return query.getResultList().get(0);
		} catch (Exception e) {
			System.out.println("O metodo buscarPlanoDoAnuncio da classe JpaPlanoDAO lnacou uma exception: " + e.getMessage());
			return null;
		}
	}

//	/**
//	 * Lista todos os plano que este anuncio ja teve, inclusive os desativados
//	 */
//	@Override
//	public List<PlanoAnuncio> listarTodosPlanosDoAnuncio(Long idAnuncio) {
//
//		try {
//			String consulta = "select p from PlanoAnuncio p where p.anuncio.id = :idAnuncio";
//			TypedQuery<PlanoAnuncio> query = em.createQuery(consulta, PlanoAnuncio.class);
//			query.setParameter("idAnuncio", idAnuncio);
//			return query.getResultList();
//		} catch (Exception e) {
//			return null;
//		}
//		
//	}

}
