package com.catalogonet.dao.interfaces;

import java.util.List;

import com.catalogonet.model.FileMeta;


public interface ImagemDAO {

	public void adicionar(FileMeta fileMeta);
	public void atualizar(FileMeta fileMeta);
	public void remover(Long id);
	
	public FileMeta buscarPorId(Long id);
	
	public List<FileMeta> listarImagensDoAnuncio(Long idAnuncio);
	
	//byte[]
	public byte[] buscarThumbnail(Long id);
	public byte[] buscarImagem(Long id);
	public byte[] buscarLogotipo(Long idAnuncio);
	
}
