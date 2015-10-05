package com.catalogonet.xml;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.catalogonet.categoria.Categoria;
import com.catalogonet.categoria.SubCategoria;
import com.catalogonet.util.FileUtils;

public class CategoriaXmlReader {

	
	public List<Categoria> listarCategorias() {
		
		
		List<Categoria> listaCategoriaObj = new ArrayList<Categoria>();
		
		try {
			InputStream is = FileUtils.getInputStream("/lista-categorias.xml");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(is);

			NodeList listaCategorias = doc.getElementsByTagName("categoria");

			listaCategoriaObj = iterarCategorias(listaCategorias, listaCategoriaObj);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return listaCategoriaObj;
	}
	
	
	private List<Categoria> iterarCategorias(NodeList listaCategorias,
			List<Categoria> listaCatObj) {

		for (int i = 0; i < listaCategorias.getLength(); i++) {
			Node nNode = listaCategorias.item(i);
			Element categoria = (Element) nNode;
//			imprimirTextoTag("titulo", categoria);

			// seta titulos
			Categoria catObj = popularObjCategoria(categoria, new Categoria());

			// pegar lista de keywords
			List<String> listaKeys = pegarListaDeKeywords(categoria, catObj);

			// adiciona lista de keywords
			catObj.getTags().addAll(listaKeys);

			// iterar subcategorias epgar lista de subcategorias
			List<SubCategoria> listaSubCategorias = iterarSubCategoria(
					categoria.getElementsByTagName("subcategorias"), catObj);

			// adiconar lista de subcategorias
			catObj.getListaSubCategorias().addAll(listaSubCategorias);

			// adiconar a categoria na lista
			listaCatObj.add(catObj);

		}

		return listaCatObj;

	}

	private List<String> pegarListaDeKeywords(Element categoria,
			Categoria catObj) {

		NodeList listaKeywords = categoria.getElementsByTagName("keywords");
		List<String> listaKeys = new ArrayList<String>();

		for (int i = 0; i < listaKeywords.getLength(); i++) {
			Node nNode = listaKeywords.item(i);
			Element keywords = (Element) nNode;

			// pula as keywords das subcategorias
			if (!keywords.getParentNode().getNodeName().equals("categoria")) {
				continue;
			}

			NodeList lista = keywords.getElementsByTagName("keyword");
			for (int j = 0; j < lista.getLength(); j++) {
				Node nNodeChild = lista.item(j);
				Element keyword = (Element) nNodeChild;

				if (keyword.getParentNode().isEqualNode(keywords)) {
					listaKeys.add(keyword.getTextContent());
				}

			}
		}

		return listaKeys;

	}

	private Categoria popularObjCategoria(Element categoria,
			Categoria catObj) {

		// set nome
		catObj.setNome(categoria.getElementsByTagName("titulo").item(0)
				.getTextContent());

		// set nome na url
		catObj.setNomeNaUrl(categoria.getElementsByTagName("titulo-na-url")
				.item(0).getTextContent());

		return catObj;
	}

	private List<SubCategoria> iterarSubCategoria(NodeList lista,
			Categoria catObj) {
		
		Node node = lista.item(0);
		Element subcategorias = (Element) node;

		NodeList listaSubCategorias = subcategorias
				.getElementsByTagName("subcategoria");

		// pega lista de subcategorias do catObj
		List<SubCategoria> listaSubCategoriasObj = iterarSubCategorias(
				listaSubCategorias);
		return listaSubCategoriasObj;

	}

	private List<SubCategoria> iterarSubCategorias(
			NodeList listaSubCategorias) {
		
		// criar lista de subcategorias
		List<SubCategoria> listaSubCatOBj = new ArrayList<SubCategoria>();

		for (int i = 0; i < listaSubCategorias.getLength(); i++) {
			Node nNode = listaSubCategorias.item(i);
			Element subCategoria = (Element) nNode;
			
			SubCategoria subCatObj = new SubCategoria();

			// popular titulo e titulo-na-url
			subCatObj = popularObjSubCategoria(subCategoria, subCatObj);

			// pegar keywords da subcategoria
			List<String> listaKeySub = pegarKeywordsSubCategoria(subCategoria,
					subCatObj);
			subCatObj.getTags().addAll(listaKeySub);

			// adicionar na lista de subcategorias
			listaSubCatOBj.add(subCatObj);
		}
		
		return listaSubCatOBj;

	}

	private SubCategoria popularObjSubCategoria(Element subCategoria,
			SubCategoria subCatObj) {

		// set nome
		subCatObj.setNome(subCategoria.getElementsByTagName("titulo").item(0)
				.getTextContent());

		// set nome na url
		subCatObj
				.setNomeNaUrl(subCategoria
						.getElementsByTagName("titulo-na-url").item(0)
						.getTextContent());

		return subCatObj;
	}

	private List<String> pegarKeywordsSubCategoria(Element subCategoria,
			SubCategoria subCatObj) {

		// pegar keywords da subcategoria
		NodeList listaKeywords = subCategoria.getElementsByTagName("keywords");

		List<String> listaKey = new ArrayList<String>();

		for (int i = 0; i < listaKeywords.getLength(); i++) {
			Node nNode = listaKeywords.item(i);
			Element keywords = (Element) nNode;

			NodeList lista = keywords.getElementsByTagName("keyword");
			for (int j = 0; j < lista.getLength(); j++) {
				Node nNodeChild = lista.item(j);
				Element keyword = (Element) nNodeChild;
				
				if (keyword.getParentNode().getParentNode().isEqualNode(subCategoria)) {
					listaKey.add(keyword.getTextContent());
				}

			}
		}

		return listaKey;
	}

}
