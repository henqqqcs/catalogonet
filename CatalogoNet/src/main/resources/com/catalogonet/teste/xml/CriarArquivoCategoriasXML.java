package com.catalogonet.teste.xml;

import java.io.File;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Comment;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.catalogonet.model.Categoria;
import com.catalogonet.model.SubCategoria;

public class CriarArquivoCategoriasXML {

	public static void main(String[] args) {
		CategoriasXMLParser categoriasXMLParser = new CategoriasXMLParser();
		List<Categoria> lista = categoriasXMLParser
				.criarListaDeCategoriasAPartirDoArquivoDeTexto();

		CriarArquivoCategoriasXML criarArquivoCategoriasXML = new CriarArquivoCategoriasXML();

		try {
			criarArquivoCategoriasXML.criarArquivoXMLCategorias(lista);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void criarArquivoXMLCategorias(List<Categoria> lista)
			throws Exception {
		DocumentBuilderFactory docFactory = DocumentBuilderFactory
				.newInstance();
		DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

		// root elements
		Document doc = docBuilder.newDocument();
		Element rootElement = doc.createElement("categorias");
		doc.appendChild(rootElement);

		// iterar categorias
		for (Categoria c : lista) {

			//comentario categoria
			Comment comment = doc.createComment(" categoria ");
			rootElement.appendChild(comment);
			
			// categoria elements
			Element categoria = doc.createElement("categoria");
			rootElement.appendChild(categoria);

			// set attribute to categoria element
			Attr attr = doc.createAttribute("id");
			attr.setValue("1");
			categoria.setAttributeNode(attr);

			// titulo elements
			Element titulo = doc.createElement("titulo");
			titulo.appendChild(doc.createTextNode(c.getNome()));
			categoria.appendChild(titulo);

			// titulo-na-url elements
			Element tituloNaUrl = doc.createElement("titulo-na-url");
			tituloNaUrl.appendChild(doc.createTextNode(c.getNomeNaUrl()));
			categoria.appendChild(tituloNaUrl);

			// keywords elements
			Element keywords = doc.createElement("keywords");
			categoria.appendChild(keywords);

			// iterar keywords
			List<String> tags = c.getTags();
			for (String t : tags) {
				// keyword elements
				Element keyword = doc.createElement("keyword");
				keyword.appendChild(doc.createTextNode(t));
				keywords.appendChild(keyword);
			}
			
			// subcategorias elements
			Element subcategorias = doc.createElement("subcategorias");
			categoria.appendChild(subcategorias);

			// iterar subcategorias
			List<SubCategoria> listaSubCat = c.getListaSubCategorias();
			for (SubCategoria sub : listaSubCat) {
				
				//comentario subcategoria
				comment = doc.createComment(" subcategoria ");
				subcategorias.appendChild(comment);
				
				// subcategorias elements
				Element subcategoria = doc.createElement("subcategoria");
				subcategorias.appendChild(subcategoria);

				// titulo elements
				Element subTitulo = doc.createElement("titulo");
				subTitulo.appendChild(doc.createTextNode(sub.getNome()));
				subcategoria.appendChild(subTitulo);

				// titulo-na-url elements
				Element subTituloNaUrl = doc.createElement("titulo-na-url");
				subTituloNaUrl.appendChild(doc.createTextNode(sub
						.getNomeNaUrl()));
				subcategoria.appendChild(subTituloNaUrl);

				// keywords elements
				Element subKeywords = doc.createElement("keywords");
				subcategoria.appendChild(subKeywords);

				// iterar sob keywords
				List<String> subTags = sub.getTags();
				for (String subT : subTags) {

					// keyword elements
					Element skeyword = doc.createElement("keyword");
					skeyword.appendChild(doc.createTextNode(subT));
					subKeywords.appendChild(skeyword);

				}
				
				//comentario subcategoria
				comment = doc.createComment(" ./subcategoria ");
				subcategorias.appendChild(comment);

			}
			
			//comentario fim categoria
			comment = doc.createComment(" ./categoria ");
			rootElement.appendChild(comment);

		}

		// write the content into xml file
		TransformerFactory transformerFactory = TransformerFactory
				.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
		DOMSource source = new DOMSource(doc);
		StreamResult result = new StreamResult(new File("C:\\Users\\Henrique\\Documents\\file.xml"));

		// Output to console for testing
		// StreamResult result = new StreamResult(System.out);

		transformer.transform(source, result);

		System.out.println("File saved!");

	}

}
