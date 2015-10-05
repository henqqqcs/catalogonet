package com.catalogonet.teste.xml;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.catalogonet.categoria.Categoria;
import com.catalogonet.categoria.SubCategoria;

public class CategoriasXMLParser {
	

	
	public List<Categoria> criarListaDeCategoriasAPartirDoArquivoDeTexto() {
		return criarLista();
	}
	
	
	private List<Categoria> criarLista() {
	// ler arquivo
			String string = com.catalogonet.util.FileUtils.pegarStringArquivo("/categorias_sub_apontador_keywords.txt");

			String[] split = string.split(System.getProperty("line.separator"));


			List<Categoria> listaCategorias = new ArrayList<Categoria>();
			Categoria categoria = null;
			for (String s : split) {
				if (!s.isEmpty()) {

					String linha = s;
					// verifica se eh categoria
					if ((!StringUtils.startsWith(s, "<!--"))
							&& (!StringUtils.startsWith(s, "SubCategoria:"))) {

						// adiciona a categoria anterior
						if (categoria != null) {
							listaCategorias.add(categoria);
						}

						// cria nova categoria
						categoria = new Categoria();

						// pega o nome da categoria
						String catNome = StringUtils.substringBefore(linha, "=");
						categoria.setNome(catNome.trim());

						// pega as keywords
						String[] categoriaKeywords = pegaKeysWords(linha);
						List<String> listaCategoriaKeywords = pegaListaKeyWords(categoriaKeywords);

						// seta a lista
						categoria.setTags(listaCategoriaKeywords);

					} else if (StringUtils.startsWith(s, "SubCategoria:")) {
						// verifica se eh subcategoria

						// cria uma subcategoria
						SubCategoria subCategoria = new SubCategoria();

						// pega o nome da subcategoria
						String nomeSubCategoria = StringUtils.remove(linha,
								"SubCategoria:");
						nomeSubCategoria = StringUtils.substringBefore(
								nomeSubCategoria, "=");
						nomeSubCategoria = nomeSubCategoria.trim();
						subCategoria.setNome(nomeSubCategoria);

						// pega keywords da subcategoria
						String[] subCategoriaKeys = pegaKeysWords(linha);
						List<String> listaSubCategoriaKeywords = pegaListaKeyWords(subCategoriaKeys);

						// seta a lista
						subCategoria.setTags(listaSubCategoriaKeywords);

						// seta a subcategoria na lista de categorias
						categoria.getListaSubCategorias().add(subCategoria);
						//subCategoria.setCategoria(categoria);

					} else {
						// System.out.println(linha);
					}

				}
			}
			
			return listaCategorias;

		}


		private String[] pegaKeysWords(String linha) {
			// pega array de keywords
			String keywords = StringUtils.substringAfter(linha, "keywords:");
			keywords = keywords.trim();
			return keywords.split(",");

		}

		private List<String> pegaListaKeyWords(String[] keys) {

			List<String> lista = new ArrayList<String>();
			for (String k : keys) {
				k = k.trim();
				if (!k.isEmpty()) {
					if (k.contains(" ")) {
						throw new IllegalArgumentException(k);
					}
					lista.add(k);
				}
			}
			return lista;
		}


}
