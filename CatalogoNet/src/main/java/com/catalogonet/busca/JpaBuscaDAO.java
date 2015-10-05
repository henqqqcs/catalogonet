package com.catalogonet.busca;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.catalogonet.anuncio.Anuncio;

@Repository
public class JpaBuscaDAO implements BuscaDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Anuncio> buscarPorTituloInteiro(String titulo) {
		try {
			titulo = titulo.toUpperCase();
			//String consulta = "select a from Anuncio a where a.titulo = :titulo and a.ativo = true";
			String consulta = "select a from Anuncio a where a.titulo = :titulo";
			TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
			query.setParameter("titulo", titulo);
			return query.getResultList();
		} catch (Exception e) {
			return Collections.emptyList();
		}
	}

	@Override
	public List<Anuncio> buscarPorTituloPartes(String titulo) {
		try {
			//String consulta = "select a from Anuncio a where a.titulo like :titulo and a.ativo = true";
			String consulta = "select a from Anuncio a where a.titulo like :titulo";
			TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
			query.setParameter("titulo", "%" + titulo + "%");
			return query.getResultList();
		} catch (Exception e) {
			return Collections.emptyList();
		}
	}

	@Override
	public List<Anuncio> buscarPorAnunciosTags(String tags) {
		try {
			//String consulta = "SELECT a FROM Anuncio a JOIN a.tags t WHERE t like :tags";
			String consulta = "SELECT a FROM Anuncio a JOIN a.tags t WHERE t = :tags";
			TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
			query.setParameter("tags", "%" + tags + "%");
			return query.getResultList();
		} catch (Exception e) {
			return Collections.emptyList();
		}
	}
	
	@Override
	public List<Anuncio> buscarAnunciosDaCategoria(Long idCategoria) {
		//String consulta = "select a from Anuncio a where a.categoria.id = :idCategoria and a.ativo = true";
		String consulta = "select a from Anuncio a where a.categoria.id = :idCategoria";
		TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
		query.setParameter("idCategoria", idCategoria);
		return query.getResultList();
	}

	@Override
	public List<Anuncio> buscarAnunciosDaSubCategoria(Long idSubCategoria) {
		//String consulta = "select a from Anuncio a where a.subCategoria.id = :idSubCategoria and a.ativo = true";
		String consulta = "select a from Anuncio a where a.subCategoria.id = :idSubCategoria";
		TypedQuery<Anuncio> query = em.createQuery(consulta, Anuncio.class);
		query.setParameter("idSubCategoria", idSubCategoria);
		return query.getResultList();
	}


}
