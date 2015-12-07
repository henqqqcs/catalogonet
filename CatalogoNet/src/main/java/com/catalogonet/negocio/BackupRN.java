package com.catalogonet.negocio;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.dao.interfaces.BackupDAO;
import com.catalogonet.model.Backup;

@Component
@Transactional
public class BackupRN  {
	
	@Autowired
	private BackupDAO dao;

	public void adicionar(Backup backup) {
		dao.adicionar(backup);
	}

	public void remover(Long id) {
		dao.remover(id);
	}

	public Backup buscarPorID(Long id) {
		return dao.buscarPorID(id);
	}

	public List<Backup> listarBackup() {
		return dao.listarBackup();
	}


	public void executarComandoSQL(String comando) {
		dao.executarComandoSQL(comando);
	}

}
