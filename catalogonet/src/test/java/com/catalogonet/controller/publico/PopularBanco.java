package com.catalogonet.controller.publico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catalogonet.banco.PopularCategoriaService;
import com.catalogonet.banco.PopularLocaisService;
import com.catalogonet.banco.PopularPedidoService;
import com.catalogonet.banco.PopularPlanoService;
import com.catalogonet.banco.PopularProdutoService;
import com.catalogonet.banco.PopularUsuarioService;

@Controller
@RequestMapping("/popular-banco")
public class PopularBanco {

	private String paginaRedirect = "redirect:/";

	@Autowired
	private PopularLocaisService locaisService;

	@Autowired
	private PopularCategoriaService categoriaService;

	@Autowired
	private PopularProdutoService popularProdutoService;

	@Autowired
	private PopularUsuarioService popularUsuarioService;

//	@Autowired
//	private PopularAnunciosTesteService popularAnunciosTesteService;

	@Autowired
	private PopularPedidoService popularPedidoService;

	@Autowired
	private PopularPlanoService popularPlanoService;

	@RequestMapping("/tudo")
	public String popularTudo() {
		locaisService.popularLocais();
		categoriaService.popularCategorias();
		popularProdutoService.popularProdutos();
		popularUsuarioService.popularUsuarios();
		// popularAnunciosTesteService.popularAnunciosTeste();
		// popularPedidoService.popular();
		// popularPlanoService.popular();
		return paginaRedirect;
	}

	@RequestMapping("/locais")
	public String popularLocais() {
		locaisService.popularLocais();
		return paginaRedirect;
	}

	@RequestMapping("/categorias")
	public String popularCategorias() {
		categoriaService.popularCategorias();
		return paginaRedirect;
	}

	@RequestMapping("/produtos")
	public String popularProdutos() {
		popularProdutoService.popularProdutos();
		return paginaRedirect;
	}

	@RequestMapping("/usuarios")
	public String popularUsuarios() {
		popularUsuarioService.popularUsuarios();
		return paginaRedirect;
	}

//	@RequestMapping("/anuncios")
//	public String popularAnuncios() {
//		popularAnunciosTesteService.popularAnunciosTeste();
//		return paginaRedirect;
//	}

	@RequestMapping("/pedidos")
	public String popularPedidos() {
		popularPedidoService.popular();
		;
		return paginaRedirect;
	}

	@RequestMapping("/planos")
	public String popularPlanos() {
		popularPlanoService.popular();
		return paginaRedirect;
	}

}
