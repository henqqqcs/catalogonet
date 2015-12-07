package com.catalogonet.dao.interfaces;

import java.util.List;

import com.catalogonet.model.Backup;

public interface BackupDAO {

	
	public void adicionar(Backup backup);
	public void remover(Long id);
	public Backup buscarPorID(Long id);
	
	public List<Backup> listarBackup();
	
	
	public void executarComandoSQL(String comando);
	
}
