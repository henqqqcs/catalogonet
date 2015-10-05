package com.catalogonet.anuncio;

import java.util.List;

import com.catalogonet.usuario.Usuario;




public interface AnuncioDAO {
	
	public void adicionar(Anuncio anuncio);
	public void atualizar(Anuncio anuncio);
	public void remover(Long id);
	public Anuncio buscarPorId(Long id); 
	public List<Anuncio> buscarPorParteTitulo(String titulo);
	public List<Anuncio> buscarPorTituloInteiro(String titulo);
	
	//usuario
	public List<Anuncio> listarAnunciosUsuario(Long idUsuario);
	public Anuncio buscarAnuncioDoUsuario(Long idUsuario, Long idAnuncio);
	public Usuario buscarUsuarioDoAnuncio(Long idAnuncio);
	
	public List<Anuncio> listarAnunciosGratuitosNaoAprovados();
	
}