package com.catalogonet.produto;

import java.util.List;


public interface ProdutoDAO {

	public void adicionar(Produto produto);
	public void atualizar(Produto produto);
	public void remover(Long id);
	public Produto buscarPorId(Long id);
	public Produto buscarProdutoPeloNomeInteiro(String nome); 
	public List<Produto> listarProdutos();
	
}
