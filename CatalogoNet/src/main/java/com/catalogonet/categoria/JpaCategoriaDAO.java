package com.catalogonet.categoria;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

@Repository
public class JpaCategoriaDAO implements CategoriaDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void adicionarCategoria(Categoria categoria) {
		em.persist(categoria);
	}

	@Override
	public void atualizarCategoria(Categoria categoria) {
		em.merge(categoria);
	}

	@Override
	public void removerCategoria(Long id) {
		Categoria categoria = em.find(Categoria.class, id);
		em.remove(categoria);
	}

	@Override
	public Categoria buscarCategoriaPorId(Long id) {
		return em.find(Categoria.class, id);
	}

	@Override
	public List<Categoria> listarCategorias() {
		TypedQuery<Categoria> query = em.createQuery(
				"SELECT c FROM Categoria c", Categoria.class);
		return query.getResultList();
	}

	@Override
	public void adicionarSubCategoria(SubCategoria subCategoria) {
		em.persist(subCategoria);
	}

	@Override
	public void atualizarSubCategoria(SubCategoria subCategoria) {
		em.merge(subCategoria);
	}

	@Override
	public void removerSubCategoria(Long id) {
		SubCategoria subCategoria = em.find(SubCategoria.class, id);
		em.remove(subCategoria);
	}

	@Override
	public SubCategoria buscarSubCategoriaPorId(Long id) {
		return em.find(SubCategoria.class, id);
	}

	@Override
	public List<SubCategoria> listarSubCategorias(Long idCategoria) {
		TypedQuery<SubCategoria> query = em
				.createQuery(
						"SELECT s FROM SubCategoria s WHERE s.categoria.id = :idCategoria",
						SubCategoria.class);
		query.setParameter("idCategoria", idCategoria);
		List<SubCategoria> lista = query.getResultList();
		return lista;
	}

	@Override
	@Cacheable(value = "cacheCategorias")
	public List<Categoria> listarTodasCategorias() {
		
		System.out.println("|-- Construindo lista de categorias");
		List<Categoria> listaCategorias = this.listarCategorias();
		
		for (Categoria categoria : listaCategorias) {
			List<SubCategoria> listaSubCategorias = this.listarSubCategorias(categoria.getId());
			categoria.setListaSubCategorias(listaSubCategorias);
		}
		
		return listaCategorias;
	}
	
	
	

}
