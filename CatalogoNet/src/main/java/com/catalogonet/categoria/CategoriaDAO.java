package com.catalogonet.categoria;

import java.util.List;

public interface CategoriaDAO {

	
	//categoria
	public void adicionarCategoria(Categoria categoria);
	public void atualizarCategoria(Categoria categoria);
	public void removerCategoria(Long id);
	public Categoria buscarCategoriaPorId(Long id);
	//listar
	public List<Categoria> listarCategorias();
	
//	public List<String> listarTagsDaCategoria(Long idCategoria);
		
	//sub categoria
	public void adicionarSubCategoria(SubCategoria subCategoria);
	public void atualizarSubCategoria(SubCategoria subCategoria);
	public void removerSubCategoria(Long id);
	public SubCategoria buscarSubCategoriaPorId(Long id);
	//listar
	public List<SubCategoria> listarSubCategorias(Long idCategoria);
	
//	public List<String> listarTagsDaSubCategoria(Long idSubCategoria);
	
	
	public List<Categoria> listarTodasCategorias();
	
	
}
