package com.catalogonet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.catalogonet.dao.interfaces.PlanoDAO;
import com.catalogonet.model.Plano;

@Repository
public class JpaPlanoDAO implements PlanoDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Plano adicionarPlano(Plano plano) {
		em.persist(plano);
		em.flush();
		return plano;
	}

	@Override
	public void atualizarPlano(Plano plano) {
		em.merge(plano);
	}

	@Override
	public void removerPlano(Long idPlano) {
		Plano plano = em.find(Plano.class, idPlano);
		em.remove(plano);
	}

	@Override
	public Plano buscarPlanoPorId(Long idPlano) {
		return em.find(Plano.class, idPlano);
	}

	@Override
	public List<Plano> listarPlanosDoUsuario(Long idUsuario) {
		String consulta = "select p from Plano p where p.usuario.id = :idUsuario";
		TypedQuery<Plano> query = em.createQuery(consulta, Plano.class);
		query.setParameter("idUsuario", idUsuario);
		return query.getResultList();
	}

	@Override
	public List<Plano> listarPlanosNaoUtilizados(Long idUsuario) {
		String consulta = "select p from Plano p where p.usuario.id = :idUsuario AND p.anuncio IS NULL";
		TypedQuery<Plano> query = em.createQuery(consulta, Plano.class);
		query.setParameter("idUsuario", idUsuario);
		return query.getResultList();
	}
	
//	@Override
//	public Plano buscarPlanoAtivoDoAnuncio(Long idAnuncio) {
//
//		try {
//			
//			String consulta = "select p from Plano p where p.anuncio.id = :idAnuncio AND p.status = :statusAtivo";
//			TypedQuery<Plano> query = em.createQuery(consulta, Plano.class);
//			query.setParameter("idAnuncio", idAnuncio);
//			query.setParameter("statusAtivo", StatusPlano.ATIVO);
//			return query.getSingleResult();
//		} catch (Exception e) {
//			System.out.println("O metodo buscarPlanoAtivoDoAnuncio da classe JpaPlanoDAO lancou uma exception: " + e.getMessage());
//			return null;
//		}
//
//	}
//
//	@Override
//	public Plano buscarPlanoDoAnuncio(Long idAnuncio) {
//		try {
//			String consulta = "select p from Plano p where p.anuncio.id = :idAnuncio";
//			TypedQuery<Plano> query = em.createQuery(consulta, Plano.class);
//			query.setParameter("idAnuncio", idAnuncio);
//			return query.getResultList().get(0);
//		} catch (Exception e) {
//			System.out.println("O metodo buscarPlanoDoAnuncio da classe JpaPlanoDAO lancou uma exception: " + e.getMessage());
//			return null;
//		}
//	}
//
//	@Override
//	public List<Plano> listarPlanosComAnuncioDoUsuario(Long idUsuario) {
//		
//		try {
//			String consulta = "select p from Plano p where p.usuario.id = :idUsuario AND p.anuncio != NULL";
//			//String consulta = "select p from Plano p where p.anuncio.id = :idUsuario";
//			TypedQuery<Plano> query = em.createQuery(consulta, Plano.class);
//			query.setParameter("idUsuario", idUsuario);
//			return query.getResultList();
//		} catch (Exception e) {
//			System.out.println("O metodo listarPlanosComAnuncio da classe JpaPlanoDAO lancou uma exception: " + e.getMessage());
//			return Collections.emptyList();
//		}
//		
//	}


}
