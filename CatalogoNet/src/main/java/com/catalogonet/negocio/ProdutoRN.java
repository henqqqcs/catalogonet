package com.catalogonet.produto;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Transactional
public class ProdutoRN {

	@Autowired
	private ProdutoDAO dao;

	public void adicionar(Produto produto) {
		dao.adicionar(produto);
	}

	public void atualizar(Produto produto) {
		dao.atualizar(produto);
	}

	public void remover(Long id) {
		dao.remover(id);
	}

	public Produto buscarPorId(Long id) {
		return dao.buscarPorId(id);
	}

	public Produto buscarProdutoPeloNomeInteiro(String nome) {
		return dao.buscarProdutoPeloNomeInteiro(nome);
	}

	public List<Produto> listarProdutos() {
		return dao.listarProdutos();
	}

	public boolean isProdutoGratuito(Produto produto) {
		// eh um produto gratuito - valor 0
		if (produto.getPrioridadeProduto() == PrioridadeProduto.PRODUTO_GRATUITO) {
			return true;
		}
		return false;
	}

}
