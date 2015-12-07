package com.catalogonet.categoria;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.anuncio.Anuncio;
import com.catalogonet.busca.BuscaDAO;
import com.catalogonet.busca.ResultadoBuscaCategoria;

@Component
@Transactional
public class CategoriaRN {

	@Autowired
	private CategoriaDAO dao;

	@Autowired
	private BuscaDAO daoBusca;

	public void adicionarCategoria(Categoria categoria) {
		dao.adicionarCategoria(categoria);
	}

	public void atualizarCategoria(Categoria categoria) {
		dao.atualizarCategoria(categoria);
	}

	public void removerCategoria(Long id) {
		dao.removerCategoria(id);
	}

	public Categoria buscarCategoriaPorId(Long id) {
		return dao.buscarCategoriaPorId(id);
	}

	public List<Categoria> listarCategorias() {
		// return dao.listarCategorias();
		return this.listarTodasCategorias();
	}

	// /subcategorias ===============================================

	public void adicionarSubCategoria(SubCategoria subCategoria) {
		dao.adicionarSubCategoria(subCategoria);
	}

	public void atualizarSubCategoria(SubCategoria subCategoria) {
		dao.atualizarSubCategoria(subCategoria);
	}

	public void removerSubCategoria(Long id) {
		dao.removerSubCategoria(id);
	}

	public SubCategoria buscarSubCategoriaPorId(Long id) {
		return dao.buscarSubCategoriaPorId(id);
	}

	public List<SubCategoria> listarSubCategorias(Long idCategoria) {
		// return dao.listarSubCategorias(idCategoria);
		List<Categoria> listaCategorias = this.listarTodasCategorias();

		for (Categoria c : listaCategorias) {
			if (c.getId() == idCategoria) {
				return c.getListaSubCategorias();
			}
		}

		return dao.listarSubCategorias(idCategoria);
	}

	public List<Categoria> listarTodasCategorias() {
		return dao.listarTodasCategorias();
	}

	public ResultadoBuscaCategoria buscarAnunciosPorCategoria(String termo) {

		ResultadoBuscaCategoria resultadoBuscaCategoria = new ResultadoBuscaCategoria();
		List<Anuncio> listaAnunciosCategoria = resultadoBuscaCategoria
				.getListaAnunciosCategoria();
		List<Anuncio> listaAnunciosSubCategoria = resultadoBuscaCategoria
				.getListaAnunciosSubCategoria();

		boolean achouKeyword = false;

		// loop sob a lista de categorias
		List<Categoria> listaCategorias = this.listarTodasCategorias();
		for (Categoria categoria : listaCategorias) {

			// loop sob as tags da categoria
			List<String> categoriaListaTags = categoria.getTags();
			for (String tag : categoriaListaTags) {
				if (StringUtils.getLevenshteinDistance(tag, termo) <= 1) {
					// adiciona a lista de anuncios achados pela categoria
					listaAnunciosCategoria.addAll(daoBusca
							.buscarAnunciosDaCategoria(categoria.getId()));
					resultadoBuscaCategoria
							.adicionaListaTags(categoriaListaTags);
					achouKeyword = true;
				}
			}

			// loop pelas subcategorias dessa categoria
			List<SubCategoria> listaSubCategorias = categoria
					.getListaSubCategorias();
			for (SubCategoria subCategoria : listaSubCategorias) {

				// loop pelas tags da subcategoria
				List<String> listaTagsSubCategoria = subCategoria.getTags();
				for (String tagSubCategoria : subCategoria.getTags()) {
					if (StringUtils.getLevenshteinDistance(tagSubCategoria,
							termo) <= 1) {
						// adiciona a lista de anuncios achados pela
						// subcategorias
						listaAnunciosSubCategoria.addAll(daoBusca
								.buscarAnunciosDaSubCategoria(subCategoria
										.getId()));
						resultadoBuscaCategoria
								.adicionaListaTags(listaTagsSubCategoria);
						achouKeyword = true;
					}
				}

			}

		}

		System.out
				.println("Tamnaho da lista de anuncios achados pela categoria: "
						+ listaAnunciosCategoria.size());
		System.out
				.println("Tamanho da lista de anuncios achados pela SUBcategoria: "
						+ listaAnunciosSubCategoria.size());

		resultadoBuscaCategoria.setAchouKeyword(achouKeyword);
		resultadoBuscaCategoria
				.setListaAnunciosCategoria(listaAnunciosCategoria);
		resultadoBuscaCategoria
				.setListaAnunciosSubCategoria(listaAnunciosSubCategoria);
		return resultadoBuscaCategoria;
	}

	// public List<SubCategoria> listaSubCategorias(Long idCategoria) {
	//
	// for (Categoria categoria : listaCategoriasCompleta) {
	// if (categoria.getId() == idCategoria) {
	// return categoria.getListaSubCategorias();
	// }
	// }
	//
	// return new ArrayList<SubCategoria>();
	// }
	//
	/*
	 * Usado pela pagina novo_anuncio_form para dar load nas categorias
	 */
	public Map<Categoria, List<SubCategoria>> pegaMapCategoriaSubCategoria() {

		LinkedHashMap<Categoria, List<SubCategoria>> map = new LinkedHashMap<Categoria, List<SubCategoria>>();

		List<Categoria> listarTodasCategorias = listarTodasCategorias();
		for (Categoria categoria : listarTodasCategorias) {
			List<SubCategoria> listaSubCategorias = categoria
					.getListaSubCategorias();
			map.put(categoria, listaSubCategorias);
		}

		return map;
	}

}
