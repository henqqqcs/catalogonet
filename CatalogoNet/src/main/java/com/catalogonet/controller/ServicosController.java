package com.catalogonet.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catalogonet.categoria.Categoria;
import com.catalogonet.categoria.CategoriaRN;
import com.catalogonet.categoria.CategoriaString;
import com.catalogonet.categoria.SubCategoria;
import com.catalogonet.imagem.ImagemRN;
import com.catalogonet.local.Bairro;
import com.catalogonet.local.BairroString;
import com.catalogonet.local.Cidade;
import com.catalogonet.local.CidadeString;
import com.catalogonet.local.Estado;
import com.catalogonet.local.LocalRN;

@Controller
@RequestMapping("/servicos")
public class ServicosController {

//teste
	@Autowired
	private LocalRN localRN;

	@Autowired
	private CategoriaRN categoriaRN;

	@Autowired
	private ImagemRN imagemRN;

	@RequestMapping(value = "/imagens/{imageId}")
	@ResponseBody
	public byte[] buscarImagensImagem(@PathVariable Long imageId)  {
		return imagemRN.buscarImagem(imageId);
	}
	
	@RequestMapping(value = "/imagens/thumbnail/{imageId}")
	@ResponseBody
	public byte[] buscarImagens(@PathVariable Long imageId)  {
		return imagemRN.buscarThumbnail(imageId);
	}
	
	@RequestMapping(value = "/imagens/logotipo/{idAnuncio}")
	@ResponseBody
	public byte[] buscarLogotipo(@PathVariable Long idAnuncio)  {
		return imagemRN.buscarLogotipo(idAnuncio);
	}

	// @RequestMapping("/pegaCategorias")
	// @ResponseBody
	// public List<CategoriaString> pegaCategorias() {
	// List<Categoria> listaCategorias = categoriaRN.listarCategorias();
	// ArrayList<CategoriaString> categoriasString = new
	// ArrayList<CategoriaString>();
	// for (Categoria c : listaCategorias) {
	// categoriasString.add(new CategoriaString(c.getId().toString(),
	// c.getNome()));
	// }
	// return categoriasString;
	// }

	@RequestMapping("/lista-estados")
	@ResponseBody
	public List<Estado> pegaEstados() {
		List<Estado> lista = localRN.listarEstados();
		return lista;
	}

	@RequestMapping(value = "/lista-cidades", method = RequestMethod.GET)
	public @ResponseBody List<CidadeString> pegaCidades(
			@RequestParam(value = "idEstado", required = true) String idEstado) {
		List<Cidade> cidades = localRN.listarCidades(idEstado);

		ArrayList<CidadeString> lista = new ArrayList<CidadeString>();
		for (Cidade c : cidades) {
			lista.add(new CidadeString(c.getId().toString(), c.getNome()));
		}
		return lista;
	}

	// @RequestMapping(value = "/lista-bairros", method = RequestMethod.GET)
	// public @ResponseBody List<BairroString> pegaBairros(@RequestParam(value =
	// "idCidade", required = true) String idCidade) {
	//
	// List<Bairro> bairros = localRN.listarBairros(Long.valueOf(idCidade));
	// ArrayList<BairroString> lista = new ArrayList<BairroString>();
	// for (Bairro b : bairros) {
	// lista.add(new BairroString(b.getId().toString(), b.getNome()));
	// }
	// return lista;
	// }

	/**
	 * Nao recebe um id da cidade
	 * 
	 * @return
	 */
	@RequestMapping(value = "/lista-bairros")
	public @ResponseBody List<BairroString> pegaBairros() {

		List<Bairro> bairros = localRN.listarBairros(1l);
		ArrayList<BairroString> lista = new ArrayList<BairroString>();
		for (Bairro b : bairros) {
			lista.add(new BairroString(b.getId().toString(), b.getNome()));
		}
		return lista;
	}

	@RequestMapping(value = "/lista-categorias")
	public @ResponseBody List<CategoriaString> pegaCategorias() {
		List<Categoria> listaCategorias = categoriaRN.listarCategorias();
		List<CategoriaString> lista = new ArrayList<CategoriaString>();
		for (Categoria c : listaCategorias) {
			lista.add(new CategoriaString(c.getId().toString(), c.getNome()));
		}
		return lista;
	}

	@RequestMapping(value = "/lista-sub-categorias")
	public @ResponseBody List<CategoriaString> pegaSubCategorias(
			@RequestParam(value = "idCategoria", required = true) String idCategoria) {

		List<SubCategoria> listaCategorias = categoriaRN
				.listarSubCategorias(Long.valueOf(idCategoria));
		List<CategoriaString> lista = new ArrayList<CategoriaString>();
		for (SubCategoria s : listaCategorias) {
			lista.add(new CategoriaString(s.getId().toString(), s.getNome()));
		}
		return lista;
	}

}
