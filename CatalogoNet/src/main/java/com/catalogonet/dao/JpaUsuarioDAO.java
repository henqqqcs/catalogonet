package com.catalogonet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.catalogonet.dao.interfaces.UsuarioDAO;
import com.catalogonet.model.Usuario;

@Repository
public class JpaUsuarioDAO implements UsuarioDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void adicionar(Usuario usuario) {
		em.persist(usuario);
	}

	@Override
	public void atualizar(Usuario usuario) {
		em.merge(usuario);
	}

	@Override
	public void remover(Long id) {
		Usuario usuario = em.find(Usuario.class, id);
		em.remove(usuario);
	}

	public Usuario buscarPorId(Long id) {
		return em.find(Usuario.class, id);
	}

	@Override
	public Usuario buscarPorEmail(String email) {
		try {
			String consulta = "select u from Usuario u where u.email = :email";
			Query query = em.createQuery(consulta, Usuario.class);
			query.setParameter("email", email);
			return (Usuario) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Usuario> buscarPorNome(String nome) {
		String consulta = "select u from Usuario u where u.nome like :nome";
		TypedQuery<Usuario> query = em.createQuery(consulta, Usuario.class);
		query.setParameter("nome", "%" + nome + "%");
		return query.getResultList();
	}

	@Override
	public List<Usuario> buscarPorParteEmail(String email) {
		String consulta = "select u from Usuario u where u.email like :email";
		TypedQuery<Usuario> query = em.createQuery(consulta, Usuario.class);
		query.setParameter("email", "%" + email + "%");
		return query.getResultList();
	}

	@Override
	public List<Usuario> buscarPorParteCPF(String cpf) {
		String consulta = "select u from Usuario u where u.cpf like :cpf";
		TypedQuery<Usuario> query = em.createQuery(consulta, Usuario.class);
		query.setParameter("cpf", "%" + cpf + "%");
		return query.getResultList();
	}

}
