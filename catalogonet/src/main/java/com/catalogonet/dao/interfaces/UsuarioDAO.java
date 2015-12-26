package com.catalogonet.dao.interfaces;

import java.util.List;

import com.catalogonet.model.Usuario;



public interface UsuarioDAO {

	
	public void adicionar(Usuario usuario);
	public void atualizar(Usuario usuario);
	public void remover(Long id);
	
	public boolean existeComEmail(String email);
	
	public Usuario buscarPorId(Long id); 
	public Usuario buscarPorEmail(String email); 
	public Usuario buscarPorEmailESenha(String email, String senha); 
	
	public List<Usuario> buscarPorParteEmail(String email);
	public List<Usuario> buscarPorParteCPF(String cpf);
	public List<Usuario> buscarPorNome(String nome); 

}
