package com.catalogonet.xml;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.catalogonet.model.Bairro;
import com.catalogonet.model.Cidade;
import com.catalogonet.model.Estado;
import com.catalogonet.util.FileUtils;

public class LocalXmlReader {

	public List<Estado> listarEstados() {
		return pegarEstados();
	}

	public List<Cidade> listarCidades() {

		// pega o estado
		List<Estado> listaEstados = pegarEstados();

		List<Cidade> listaCidades = new ArrayList<Cidade>();
		// iterar estados
		for (Estado estado : listaEstados) {

			//System.out.println(" ---------- Estado: " + estado.getNome()
			//		+ "--------");
			// buscar lista de cidades
			listaCidades = pegarCidades(estado);

			// iterar cidades
			//for (Cidade cidade : listaCidades) {
			//	System.out.println("Cidade: " + cidade.getNome());
			//}
		}

		return listaCidades;
	}

	public List<Bairro> listarBairros() {
		// pega o estado
		List<Estado> listaEstados = pegarEstados();

		List<Bairro> listaBairros = new ArrayList<Bairro>();
		// iterar estados
		for (Estado estado : listaEstados) {

			//System.out.println(" ---------- Estado: " + estado.getNome()
			//		+ "--------");
			// buscar lista de cidades
			List<Cidade> listaCidades = pegarCidades(estado);

			// iterar cidades
			for (Cidade cidade : listaCidades) {
				//System.out.println("Cidade: " + cidade.getNome());
				listaBairros = pegarBairros(cidade, estado);

				// iterar bairros
				//for (Bairro bairro : listaBairros) {
					//System.out.println("Bairro: " + bairro.getNome());
				//}
			}
		}
		
		
		return listaBairros;
	}

	private List<Estado> pegarEstados() {

		Document doc = pegarDoc();
		NodeList listaEstados = doc.getElementsByTagName("estado");

		List<Estado> listaEstadoObj = new ArrayList<Estado>();
		listaEstadoObj = iterarEstados(listaEstados, listaEstadoObj);
		return listaEstadoObj;

	}

	private List<Estado> iterarEstados(NodeList listaEstados,
			List<Estado> listaEstadoObj) {

		for (int i = 0; i < listaEstados.getLength(); i++) {

			Node nNode = listaEstados.item(i);
			Element e = (Element) nNode;

			Estado estado = new Estado();

			// seta nome
			estado.setNome(e.getElementsByTagName("nome").item(0)
					.getTextContent());

			// seta sigla
			estado.setId(e.getElementsByTagName("sigla").item(0)
					.getTextContent());

			// adiconar o estado na lista
			listaEstadoObj.add(estado);
		}

		return listaEstadoObj;
	}

	private List<Cidade> pegarCidades(Estado estado) {

		Document doc = pegarDoc();
		NodeList listaEstados = doc.getElementsByTagName("estado");

		List<Cidade> listaCidades = new ArrayList<Cidade>();
		// percorre estados ate o nome ser igual
		for (int i = 0; i < listaEstados.getLength(); i++) {

			Node nNode = listaEstados.item(i);
			Element e = (Element) nNode;

			// verifica se eh igual
			String nodeName = e.getElementsByTagName("nome").item(0)
					.getTextContent();
			if (estado.getNome().equals(nodeName)) {

				// iterar nodeList de cidades
				listaCidades = iterarListaCidades(e);
			}
		}

		return listaCidades;
	}

	private List<Cidade> iterarListaCidades(Element e) {

		List<Cidade> listaCidades = new ArrayList<Cidade>();
		NodeList listaC = e.getElementsByTagName("cidade");
		for (int i = 0; i < listaC.getLength(); i++) {

			Node nNode = listaC.item(i);
			Element cid = (Element) nNode;

			Cidade cidade = new Cidade();
			cidade.setNome(cid.getElementsByTagName("nome").item(0)
					.getTextContent());
			listaCidades.add(cidade);
		}

		return listaCidades;
	}

	
	private static List<Bairro> pegarBairros(Cidade cidade, Estado estado) {
		
		Document doc = pegarDoc();
		NodeList listaCida = doc.getElementsByTagName("cidade");
		
		
		List<Bairro> listaBairros = new ArrayList<Bairro>();
		for (int i = 0; i < listaCida.getLength(); i++) {

			Node nNode = listaCida.item(i);
			Element e = (Element) nNode;
			
			// verifica se o estado é o mesmo, e o nome da cidade também
			String nodeName = e.getElementsByTagName("nome").item(0)
					.getTextContent();
			if (cidade.getNome().equals(nodeName)) {
				// iterar nodeList de cidades
				listaBairros = iterarListaBairros(e);
			}
		}
		
		return listaBairros;
	}

	private static List<Bairro> iterarListaBairros(Element e) {
		
		List<Bairro> listaBairros = new ArrayList<Bairro>();
		NodeList listaC = e.getElementsByTagName("bairros");
		
		
		for (int i = 0; i < listaC.getLength(); i++) {

			Node nNode = listaC.item(i);
			Element bairros = (Element) nNode;
			
			
			//pegar lista de bairros
			NodeList lista = bairros.getElementsByTagName("bairro");
			for (int j = 0; j < lista.getLength(); j++) {
				
				Node nNodeChild = lista.item(j);
				Element bairro = (Element) nNodeChild;

				if (bairro.getParentNode().isEqualNode(bairros)) {
					Bairro bairroObj = new Bairro();
					bairroObj.setNome(bairro.getTextContent());
					listaBairros.add(bairroObj);
				}

			}
			
		}

		return listaBairros;
	}
	
	private static Document pegarDoc() {

		try {
			InputStream is = FileUtils
					.getInputStream("/lista-locais-brasilia.xml");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(is);

			return doc;
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;

	}

}
