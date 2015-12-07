package com.catalogonet.controller.publico;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catalogonet.model.Categoria;
import com.catalogonet.model.CategoriaString;
import com.catalogonet.model.SubCategoria;
import com.catalogonet.negocio.CategoriaRN;

@Controller
@RequestMapping("/servicos")
public class CategoriaController {
	
	@Autowired
	private CategoriaRN categoriaRN;

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
