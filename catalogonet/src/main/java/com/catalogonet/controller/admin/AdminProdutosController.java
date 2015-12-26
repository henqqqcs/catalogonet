package com.catalogonet.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.catalogonet.model.PrioridadeProduto;
import com.catalogonet.model.Produto;
import com.catalogonet.negocio.ProdutoRN;

@Controller
@RequestMapping("/adminadmin/produtos")
public class AdminProdutosController {
	
	@Autowired
	private ProdutoRN produtoRN;

	@RequestMapping("/lista-produtos")
	public String listaProdutos(ModelMap map) {
		List<Produto> listaProdutos = produtoRN.listarProdutos();
		map.put("listaProdutos", listaProdutos);
		return "admin/produto/lista-produtos";
	}
	
	@RequestMapping(value = "/editar-produto", method=RequestMethod.GET)
	public String editarProduto(@RequestParam Long id, ModelMap map) {
		Produto produto = produtoRN.buscarPorId(id);
		map.put("produto", produto);
		
		map.put("prioridadeProdutoEnum", PrioridadeProduto.values());
		
		return "admin/produto/atualizar";
	}
	
	@RequestMapping("/atualizar-produto-handle")
	public String atualizarProdutosHandle(@ModelAttribute Produto produto,  ModelMap map) {
		//atualizar produto
		produtoRN.atualizar(produto);
		return "admin/produto/produto-atualizado";
	}
	
	@RequestMapping(value = "/remover-produto", method=RequestMethod.GET)
	public String removerProduto(@RequestParam Long id, ModelMap map) {
		Produto produto = produtoRN.buscarPorId(id);
		map.put("produto", produto);
		return "admin/produto/remover";
	}

	@RequestMapping(value = "/remover-produto-handle", method=RequestMethod.POST)
	public String removerProdutoHandle(@ModelAttribute Produto produto, ModelMap map) {
		produtoRN.remover(produto.getId());
		return "redirect:/adminadmin/produtos/lista-produtos";
	}
	
	@RequestMapping("/cadastrar-produto")
	public String cadastrarProdutos(ModelMap map) {
		Produto produto = new Produto();
		map.put("produto", produto);
		return "admin/produto/cadastrar";
	}
	
	@RequestMapping("/cadastrar-produto-handle")
	public String cadastrarProdutosHandle(@ModelAttribute Produto produto,  ModelMap map) {
		//salvar produto
		produtoRN.adicionar(produto);
		return "admin/produto/produto-cadastrado";
	}
	
	
	
	
}
