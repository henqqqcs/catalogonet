package com.catalogonet.backup;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;


@Repository
public class JpaBackupDAO implements BackupDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public void adicionar(Backup backup) {
		em.persist(backup);
	}

	@Override
	public void remover(Long id) {
		em.remove(em.find(Backup.class, id));
	}

	@Override
	public Backup buscarPorID(Long id) {
		return em.find(Backup.class, id);
	}

	@Override
	public List<Backup> listarBackup() {
		String s = "SELECT b FROM Backup b";
		TypedQuery<Backup> q = em.createQuery(s, Backup.class);
		return q.getResultList();
	}

	@Override
	public void executarComandoSQL(String comando) {
		StoredProcedureQuery q = em.createStoredProcedureQuery(comando);
		q.execute();
	}

}
