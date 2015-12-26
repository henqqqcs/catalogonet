package com.catalogonet.banco;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.model.Categoria;
import com.catalogonet.model.SubCategoria;
import com.catalogonet.negocio.CategoriaRN;
import com.catalogonet.xml.CategoriaXmlReader;

@Component
public class PopularCategoriaService {

	@Autowired
	private CategoriaRN categoriaRN;

	public void popularCategorias() {

		System.out.println("|-- Populando banco de dados: categorias");
		CategoriaXmlReader categoriaXmlReader = new CategoriaXmlReader();
		List<Categoria> listaCategorias = categoriaXmlReader.listarCategorias();

		salvarCategorias(listaCategorias);
	}

//	private void salvarCategorias(List<Categoria> listaCategorias) {
//		for (Categoria c : listaCategorias) {
//			categoriaRN.adicionarCategoria(c);
//		}
//
//		for (int i = 0; i < listaCategorias.size(); i++) {
//			// salvar categorias
//			categoriaRN.adicionarCategoria(listaCategorias.get(i));
//			Categoria categoria = categoriaRN.buscarCategoriaPorId(Long
//					.valueOf(i + 1));
//			List<SubCategoria> listaSubCategorias = listaCategorias.get(i)
//					.getListaSubCategorias();
//
//			System.out.println("Salvou a categoria: " + categoria.getNome()
//					+ " ID: " + categoria.getId());
//
//			if (listaSubCategorias == null) {
//				System.out.println("Lista de sub eh null: "
//						+ categoria.getNome());
//			}
//
//			for (int j = 0; j < listaSubCategorias.size(); j++) {
//				// salvar sub categoerias
//				SubCategoria subCategoria = listaSubCategorias.get(j);
//				subCategoria.setCategoria(categoria);
//				categoriaRN.adicionarSubCategoria(subCategoria);
//			}
//
//		}
//
//	}

	private void salvarCategorias(List<Categoria> listaCategorias) {

		for (Categoria c : listaCategorias) {

			// salvar categoria
			categoriaRN.adicionarCategoria(c);

			// busca categoria do banco
			int index = listaCategorias.indexOf(c);
			Categoria categoriaDoBanco = categoriaRN.buscarCategoriaPorId(Long
					.valueOf(index + 1));

			// busca lista de subcategorias
			List<SubCategoria> listaSubCategorias = c.getListaSubCategorias();

			for (SubCategoria s : listaSubCategorias) {

				// setar categoria
				s.setCategoria(categoriaDoBanco);

				// salvar sub categoria
				categoriaRN.adicionarSubCategoria(s);

			}

		}

	}

	// private void salvarSubCategorias(List<Categoria> listaCategorias) {
	// for (Categoria c : listaCategorias) {
	// List<SubCategoria> listaSubCategorias = c.getListaSubCategorias();
	// for (SubCategoria s : listaSubCategorias) {
	// Long idCategoria = new Long(listaCategorias.indexOf(c) + 1);
	// Categoria categoria = categoriaRN.buscarCategoriaPorId(idCategoria);
	// s.setCategoria(categoria);
	// categoriaRN.adicionarSubCategoria(s);
	// }
	// }
	// }

}
