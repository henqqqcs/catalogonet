package com.catalogonet.imagem;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

@Repository
public class JpaImagemDAO implements ImagemDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void adicionar(FileMeta fileMeta) {
		em.persist(fileMeta);
	}

	@Override
	public void atualizar(FileMeta fileMeta) {
		em.merge(fileMeta);
	}

	@Override
	public void remover(Long id) {
		FileMeta file = this.buscarPorId(id);
		em.remove(file);
	}

	@Override
	public FileMeta buscarPorId(Long id) {
		try {
			String consulta = "select f from FileMeta f where f.id = :id";
			TypedQuery<FileMeta> query = em.createQuery(consulta,
					FileMeta.class);
			query.setParameter("id", id);
			return query.getResultList().get(0);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public byte[] buscarThumbnail(Long id) {
		try {
			// colocar join fecth
			String consulta = "select t.thumbnail from FileMeta t where t.id = :id";
			TypedQuery<byte[]> query = em.createQuery(consulta, byte[].class);
			query.setParameter("id", id);
			return query.getResultList().get(0);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public byte[] buscarImagem(Long id) {
		try {
			// colocar join fecth
			String consulta = "select i.imagem from FileMeta i where i.id = :id";
			TypedQuery<byte[]> query = em.createQuery(consulta, byte[].class);
			query.setParameter("id", id);
			return query.getResultList().get(0);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public byte[] buscarLogotipo(Long idAnuncio) {
		try {

			String consulta = "select a.logotipo from Anuncio a where a.id = :idAnuncio";
			TypedQuery<byte[]> query = em.createQuery(consulta, byte[].class);
			query.setParameter("idAnuncio", idAnuncio);
			return query.getResultList().get(0);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<FileMeta> listarImagensDoAnuncio(Long idAnuncio) {
		try {
//			String consulta = "select a.listaImagens from Anuncio a where a.id = :idAnuncio";
			String consulta = "select lista from Anuncio a inner join a.listaImagens lista where a.id = :idAnuncio";
			TypedQuery<FileMeta> query = em.createQuery(consulta, FileMeta.class);
			query.setParameter("idAnuncio", idAnuncio);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

}
