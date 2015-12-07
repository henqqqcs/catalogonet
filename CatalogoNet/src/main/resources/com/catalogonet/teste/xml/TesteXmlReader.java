package com.catalogonet.teste.xml;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.catalogonet.model.Categoria;
import com.catalogonet.model.SubCategoria;
import com.catalogonet.util.FileUtils;

public class TesteXmlReader {

	public static void main(String[] args) {

		try {
			InputStream is = FileUtils.getInputStream("/file.xml");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(is);

			System.out.println("Root element :"
					+ doc.getDocumentElement().getNodeName());
			NodeList listaCategorias = doc.getElementsByTagName("categoria");

			List<Categoria> listaCatObj = new ArrayList<Categoria>();
			listaCatObj = iterarCategorias(listaCategorias, listaCatObj);

			for (Categoria c : listaCatObj) {

				System.out.println("Categoria: " + c.getNome());
				List<SubCategoria> listaSubCategorias = c
						.getListaSubCategorias();
				
//				List<String> t1 = c.getTags();
//				for(String t2 : t1) {
//					System.out.println("Categoria keyword: " + t2);
//				}
				
				for (SubCategoria s : listaSubCategorias) {
					System.out.println("SubCategoria: " + s.getNome());
					List<String> tags = s.getTags();
					for (String t : tags) {
						System.out.println("Keyword: " + t);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static List<Categoria> iterarCategorias(NodeList listaCategorias,
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

	private static List<String> pegarListaDeKeywords(Element categoria,
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

	private static Categoria popularObjCategoria(Element categoria,
			Categoria catObj) {

		// set nome
		catObj.setNome(categoria.getElementsByTagName("titulo").item(0)
				.getTextContent());

		// set nome na url
		catObj.setNomeNaUrl(categoria.getElementsByTagName("titulo-na-url")
				.item(0).getTextContent());

		return catObj;
	}

	private static List<SubCategoria> iterarSubCategoria(NodeList lista,
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

	private static List<SubCategoria> iterarSubCategorias(
			NodeList listaSubCategorias) {

		
		System.out.println("-- Percorrendo subcategorias: " + listaSubCategorias.getLength());
		
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

	private static SubCategoria popularObjSubCategoria(Element subCategoria,
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

	private static List<String> pegarKeywordsSubCategoria(Element subCategoria,
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

//				if (keyword.getParentNode().isEqualNode(keywords)) {
//					listaKey.add(keyword.getTextContent());
//				}
				
				if (keyword.getParentNode().getParentNode().isEqualNode(subCategoria)) {
					listaKey.add(keyword.getTextContent());
				}

			}
		}

		return listaKey;
	}

	// private static void iterarKeywordsSubCategoria(Element subCategoria,
	// List<Categoria> listaCatObj) {
	//
	// System.out.print("Keywords da subcategoria: ");
	// imprimirTextoTag("titulo", subCategoria);
	// NodeList listaKeywords = subCategoria.getElementsByTagName("keywords");
	//
	// for (int i = 0; i < listaKeywords.getLength(); i++) {
	// Node nNode = listaKeywords.item(i);
	// Element keywords = (Element) nNode;
	//
	// NodeList lista = keywords.getElementsByTagName("keyword");
	// for (int j = 0; j < lista.getLength(); j++) {
	// Node nNodeChild = lista.item(j);
	// Element keyword = (Element) nNodeChild;
	//
	// if (keyword.getParentNode().isEqualNode(keywords)) {
	// System.out.println(keyword.getTextContent());
	// }
	//
	// }
	// }
	//
	// }

	// private static void imprimirKeywordsCategoria(Element categoria,
	// List<Categoria> listaCatObj) {
	//
	// NodeList listaKeywords = categoria.getElementsByTagName("keywords");
	//
	// for (int i = 0; i < listaKeywords.getLength(); i++) {
	// Node nNode = listaKeywords.item(i);
	// Element keywords = (Element) nNode;
	//
	// // pula as keywords das subcategorias
	// if (!keywords.getParentNode().getNodeName().equals("categoria")) {
	// continue;
	// }
	//
	// NodeList lista = keywords.getElementsByTagName("keyword");
	// for (int j = 0; j < lista.getLength(); j++) {
	// Node nNodeChild = lista.item(j);
	// Element keyword = (Element) nNodeChild;
	//
	// if (keyword.getParentNode().isEqualNode(keywords)) {
	// System.out.println(keyword.getTextContent());
	// }
	//
	// }
	// }
	//
	// }

//	private static void imprimirTextoTag(String string, Element element) {
//		System.out.println(element.getElementsByTagName(string).item(0)
//				.getTextContent());
//	}

}
