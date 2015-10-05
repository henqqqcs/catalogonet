package com.catalogonet.backup;

import java.util.List;

public interface BackupDAO {

	
	public void adicionar(Backup backup);
	public void remover(Long id);
	public Backup buscarPorID(Long id);
	
	public List<Backup> listarBackup();
	
	
	public void executarComandoSQL(String comando);
	
}
