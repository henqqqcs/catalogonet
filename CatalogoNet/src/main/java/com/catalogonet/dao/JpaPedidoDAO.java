package com.catalogonet.pedido;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

@Repository
public class JpaPedidoDAO implements PedidoDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Pedido adicionar(Pedido pedido) {
		em.persist(pedido);
		em.flush();
		return pedido;
	}

	@Override
	public void atualizar(Pedido pedido) {
		em.merge(pedido);
	}

	@Override
	public void remover(Long id) {
		Pedido pedido = em.find(Pedido.class, id);
		em.remove(pedido);
	}

	@Override
	public Pedido buscarPorId(Long id) {
		return em.find(Pedido.class, id);
	}

	@Override
	public List<Pedido> listarPedidoUsuario(Long idUsuario) {
		String s = "SELECT p FROM Pedido p WHERE p.usuario.id = :idUsuario";
		TypedQuery<Pedido> query = em.createQuery(s, Pedido.class);
		query.setParameter("idUsuario", idUsuario);
		return query.getResultList();
	}

}
