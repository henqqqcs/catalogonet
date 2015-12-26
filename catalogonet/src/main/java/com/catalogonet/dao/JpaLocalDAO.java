package com.catalogonet.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.catalogonet.dao.interfaces.LocalDAO;
import com.catalogonet.model.Bairro;
import com.catalogonet.model.Cidade;
import com.catalogonet.model.Estado;

@Repository
public class JpaLocalDAO implements LocalDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void adicionarEstado(Estado estado) {
		em.persist(estado);
	}

	@Override
	public void adicionarCidade(Cidade cidade) {
		em.persist(cidade);
	}

	@Override
	public void adicionarBairro(Bairro bairro) {
		em.persist(bairro);
	}

	@Override
	public void atualizarCidade(Cidade cidade) {
		em.merge(cidade);
	}

	@Override
	public void atualizarBairro(Bairro bairro) {
		em.merge(bairro);
	}

	@Override
	public void atualizarEstado(Estado estado) {
		em.merge(estado);
	}

	@Override
	public List<Estado> listarEstados() {
		String consulta = "select e from Estado e";
		TypedQuery<Estado> query = em.createQuery(consulta, Estado.class);
		return query.getResultList();
	}

	@Override
	public List<Cidade> listarCidades(String idEstado) {
		String consulta = "select c from Cidade c where c.estado.id = :idEstado";
		TypedQuery<Cidade> query = em.createQuery(consulta, Cidade.class);
		query.setParameter("idEstado", idEstado);
		return query.getResultList();
	}

	@Override
	public List<Bairro> listarBairros(Long idCidade) {
		String consulta = "select b from Bairro b where b.cidade.id = :idCidade";
		TypedQuery<Bairro> query = em.createQuery(consulta, Bairro.class);
		query.setParameter("idCidade", idCidade);
		return query.getResultList();
	}

	@Override
	public Estado buscarEstadoPorId(String idEstado) {
		System.out.println("JPALocalDAO: buscarEstadoPorId. Usar cache?");
		return em.find(Estado.class, idEstado);
	}

	@Override
	public Cidade buscarCidadePorId(Long idCidade) {
		System.out.println("JPALocalDAO: buscarCidadePorId. Usar cache?");
		return em.find(Cidade.class, idCidade);
	}

	@Override
	public Bairro buscarBairroPorId(Long idBairro) {
		System.out.println("JPALocalDAO: buscarBairroPorId. Usar cache?");
		return em.find(Bairro.class, idBairro);
	}

	@Override
	public Estado buscarEstadoPorNomeInteiro(String nome) {
		try {
			String consulta = "select e from Estado e where e.nome = :nome";
			TypedQuery<Estado> query = em.createQuery(consulta, Estado.class);
			query.setParameter("nome", nome);
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Cidade buscarCidadePorNomeInteiro(String nome) {
		try {
			String consulta = "select c from Cidade c where c.nome = :nome";
			TypedQuery<Cidade> query = em.createQuery(consulta, Cidade.class);
			query.setParameter("nome", nome);
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Bairro buscarBairroPorNomeInteiro(String nome) {
		try {
			String consulta = "select b from Bairro b where b.nome = :nome";
			TypedQuery<Bairro> query = em.createQuery(consulta, Bairro.class);
			query.setParameter("nome", nome);
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public String buscarNomeEstado(String idEstado) {
		String consulta = "select e.nome from Estado e where e.id = :idEstado";
		TypedQuery<String> query = em.createQuery(consulta, String.class);
		query.setParameter("idEstado", idEstado);
		return query.getSingleResult();
	}

	@Override
	public void removerEstado(String idEstado) {
		Estado estado = em.find(Estado.class, idEstado);
		em.remove(estado);
	}

	@Override
	public void removerCidade(Long idCidade) {
		Cidade cidade = em.find(Cidade.class, idCidade);
		em.remove(cidade);
	}

	@Override
	public void removerBairro(Long idBairro) {
		Bairro bairro = em.find(Bairro.class, idBairro);
		em.remove(bairro);
	}

	@Override
	@Cacheable(value = "cacheLocais")
	public List<Estado> listarLocais() {
		
		List<Estado> listaEstados = this.listarEstados();

		for (Estado estado : listaEstados) {

			List<Cidade> listaCidades = this.listarCidades(estado.getId());

			// colocar a lista de bairros
			for (Cidade cidade : listaCidades) {
				List<Bairro> listaBairros = this.listarBairros(cidade.getId());
				//ordem alfabetica
				Collections.sort(listaBairros);
				cidade.setListaBairros(listaBairros);
			}

			// seta a lista de cidades
			estado.setListaCidades(listaCidades);

		}

		return listaEstados;
	}

}
