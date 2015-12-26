package com.catalogonet.controller.admin;

import java.util.List;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.catalogonet.model.Categoria;
import com.catalogonet.model.SubCategoria;
import com.catalogonet.negocio.CategoriaRN;

@Controller
@RequestMapping("/adminadmin/categorias")
public class AdminCategoriasController {

	@Autowired
	private CategoriaRN categoriaRN;

	@RequestMapping("/lista-categorias")
	public String listaCategorias(ModelMap map) {
		List<Categoria> listaCategorias = categoriaRN.listarCategorias();

		map.put("listaCategorias", listaCategorias);
		return "admin/categoria/lista-categorias";
	}

	@RequestMapping(value = "/editar-categoria", method = RequestMethod.GET)
	public String editarCategoria(@RequestParam Long id, ModelMap map) {
		Categoria categoria = categoriaRN.buscarCategoriaPorId(id);
		map.put("categoria", categoria);
		return "admin/categoria/atualizar-categoria";
	}

	@RequestMapping("/atualizar-categoria-handle")
	public String atualizarCategoriasHandle(
			@ModelAttribute Categoria categoria, ModelMap map) {
		// atualizar categoria
		categoriaRN.atualizarCategoria(categoria);
		return "admin/categoria/categoria-atualizada";
	}

	@RequestMapping(value = "/cadastrar-categoria", method = RequestMethod.GET)
	public String cadastrarCategoria(ModelMap map) {
		Categoria categoria = new Categoria();
		map.put("categoria", categoria);
		return "admin/categoria/cadastrar-categoria";
	}

	@RequestMapping("/cadastrar-categoria-handle")
	public String cadastrarCategoriaHandle(@ModelAttribute Categoria categoria,
			ModelMap map) {
		categoriaRN.adicionarCategoria(categoria);
		return "admin/categoria/categoria-cadastrada";
	}

	@RequestMapping(value = "/remover-categoria", method = RequestMethod.GET)
	public String removerCategoria(@RequestParam Long id, ModelMap map) {
		Categoria categoria = categoriaRN.buscarCategoriaPorId(id);
		map.put("categoria", categoria);
		return "admin/categoria/categoria-remover";
	}

	@RequestMapping(value = "/remover-categoria-handle", method = RequestMethod.POST)
	public String removerCategoriaHandle(@ModelAttribute Categoria categoria,
			ModelMap map) {

		try {
			categoriaRN.removerCategoria(categoria.getId());
			return "redirect:/adminadmin/categorias/lista-categorias";
		} catch (Exception e) {
			String mensagemErro = "<br/><br/> stack trace: <br/>"
					+ ExceptionUtils.getStackTrace(e);
			map.put("mensagemErro", mensagemErro);
			return "admin/categoria/categoria-remover-erro";
		}

	}

	/**
	 * Subcategorias
	 */
	@RequestMapping(value = "/lista-sub-categorias", method = RequestMethod.GET)
	public String listaSubCategorias(@RequestParam Long id, ModelMap map) {

		Categoria categoria = categoriaRN.buscarCategoriaPorId(id);
		map.put("categoria", categoria);
		List<SubCategoria> listaSubCategorias = categoriaRN
				.listarSubCategorias(id);
		map.put("listaSubCategorias", listaSubCategorias);
		return "admin/categoria/lista-sub-categorias";
	}
	
	@RequestMapping(value = "/editar-sub-categoria", method = RequestMethod.GET)
	public String editarSubCategoria(@RequestParam Long id, ModelMap map) {
		SubCategoria subCategoria = categoriaRN.buscarSubCategoriaPorId(id);
		map.put("subCategoria", subCategoria);
		return "admin/categoria/atualizar-sub-categoria";
	}

	@RequestMapping("/atualizar-sub-categoria-handle")
	public String atualizarSubCategoriasHandle(
			@ModelAttribute SubCategoria subCategoria, ModelMap map) {

		categoriaRN.atualizarSubCategoria(subCategoria);
		return "admin/categoria/categoria-atualizada";
	}

	@RequestMapping(value = "/cadastrar-sub-categoria", method = RequestMethod.GET)
	public String cadastrarSubCategoria(ModelMap map) {
		SubCategoria subCategoria = new SubCategoria();
		map.put("subCategoria", subCategoria);
		return "admin/categoria/cadastrar-sub-categoria";
	}

	@RequestMapping("/cadastrar-sub-categoria-handle")
	public String cadastrarSubCategoriaHandle(
			@ModelAttribute SubCategoria subCategoria, ModelMap map) {
		categoriaRN.adicionarSubCategoria(subCategoria);
		return "admin/categoria/categoria-cadastrada";
	}
	
	@RequestMapping(value = "/remover-sub-categoria", method = RequestMethod.GET)
	public String removerSubCategoria(@RequestParam Long id, ModelMap map) {
		SubCategoria subCategoria = categoriaRN.buscarSubCategoriaPorId(id);
		map.put("subCategoria", subCategoria);
		return "admin/categoria/sub-categoria-remover";
	}

	@RequestMapping(value = "/remover-sub-categoria-handle", method = RequestMethod.POST)
	public String removerSubCategoriaHandle(@ModelAttribute SubCategoria subCategoria,
			ModelMap map) {

		try {
			categoriaRN.removerSubCategoria(subCategoria.getId());
			return "redirect:/adminadmin/categorias/lista-categorias";
		} catch (Exception e) {
			String mensagemErro = "<br/><br/> stack trace: <br/>"
					+ ExceptionUtils.getStackTrace(e);
			e.printStackTrace();
			map.put("mensagemErro", mensagemErro);
			return "admin/categoria/categoria-remover-erro";
		}

	}
	
	
}
