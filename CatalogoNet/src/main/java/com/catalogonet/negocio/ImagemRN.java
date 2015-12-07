package com.catalogonet.imagem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Transactional
public class ImagemRN  {
	
	@Autowired
	private ImagemDAO dao;

	public void adicionar(FileMeta fileMeta) {
		dao.adicionar(fileMeta);
	}

	public void atualizar(FileMeta fileMeta) {
		dao.atualizar(fileMeta);
	}

	public void remover(Long id) {
		dao.remover(id);
	}
	
	public FileMeta buscarPorId(Long id) {
		return dao.buscarPorId(id);
	}

	public void adicionarListaImagens(List<FileMeta> listaImagens) {
		for (FileMeta file : listaImagens) {
			this.adicionar(file);
		}
	}
	
	

	public byte[] buscarThumbnail(Long id) {
		return dao.buscarThumbnail(id);
	}

	public byte[] buscarImagem(Long id) {
		return dao.buscarImagem(id);
	}

	public byte[] buscarLogotipo(Long idAnuncio) {
		return dao.buscarLogotipo(idAnuncio);
	}

	public List<FileMeta> listarImagensDoAnuncio(Long idAnuncio) {
		return dao.listarImagensDoAnuncio(idAnuncio);
	}

}
