package com.catalogonet.produto;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

@Repository
public class JpaProdutoDAO implements ProdutoDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void adicionar(Produto produto) {
		em.persist(produto);
	}

	@Override
	public void atualizar(Produto produto) {
		em.merge(produto);
	}

	@Override
	public void remover(Long id) {
		Produto produto = em.find(Produto.class, id);
		em.remove(produto);
	}

	@Override
	public Produto buscarPorId(Long id) {
		return em.find(Produto.class, id);
	}

	@Override
	public Produto buscarProdutoPeloNomeInteiro(String nome) {

		try {
			String consulta = "SELECT p FROM Produto p WHERE p.nome = :nome";
			TypedQuery<Produto> query = em.createQuery(consulta, Produto.class);
			query.setParameter("nome", nome);
			return query.getResultList().get(0);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Produto> listarProdutos() {
		try {
			String consulta = "SELECT p FROM Produto p";
			TypedQuery<Produto> query = em.createQuery(consulta, Produto.class);
			return query.getResultList();
		} catch (Exception e) {
			return Collections.emptyList();
		}
	}
	
	
	
}
