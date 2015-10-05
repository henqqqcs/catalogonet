package com.catalogonet.locais;

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
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.catalogonet.local.Bairro;

public class LocaisXMLCreate {

	public static void main(String[] args) {
		// C:/Users/henrique/Downloads/locais_brasilia.txt

		LocalTxtToJava toJAva = new LocalTxtToJava();

		List<Bairro> listaBairros = toJAva.pegarListaBairros();

		try {
			criarArquivoXML(listaBairros);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void criarArquivoXML(List<Bairro> listaBairros)
			throws Exception {

		DocumentBuilderFactory docFactory = DocumentBuilderFactory
				.newInstance();
		DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
		
		// root elements
		Document doc = docBuilder.newDocument();
		
		Element rootElement = doc.createElement("locais");
		doc.appendChild(rootElement);

		// estado elements
		Element estado = doc.createElement("estado");
		rootElement.appendChild(estado);

		// set attribute to categoria element
		Attr attr = doc.createAttribute("id");
		attr.setValue("1");
		estado.setAttributeNode(attr);
		
		// nome elements
		Element titulo = doc.createElement("nome");
		titulo.appendChild(doc.createTextNode("Distrito Federal"));
		estado.appendChild(titulo);

		// sigla elements
		Element sigla = doc.createElement("sigla");
		sigla.appendChild(doc.createTextNode("DF"));
		estado.appendChild(sigla);
		
		// cidades elements
		Element cidades = doc.createElement("cidades");
		estado.appendChild(cidades);
		
		// cidade elements
		Element cidade = doc.createElement("cidade");
		cidades.appendChild(cidade);
		
		// cidade nome elements
		Element nome = doc.createElement("nome");
		nome.appendChild(doc.createTextNode("Brasília"));
		cidade.appendChild(nome);

		// bairros elements
		Element bairros = doc.createElement("bairros");
		cidade.appendChild(bairros);

		// iterar bairros
		for (Bairro b : listaBairros) {
			
			// bairro elements
			Element bairro = doc.createElement("bairro");
			bairro.appendChild(doc.createTextNode(b.getNome()));
			bairros.appendChild(bairro);

		}
		
		// write the content into xml file
		TransformerFactory transformerFactory = TransformerFactory
				.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
		DOMSource source = new DOMSource(doc);
		StreamResult result = new StreamResult(new File("C:\\lista-locais-brasilia.xml"));

		transformer.transform(source, result);

		System.out.println("File saved!");

	}

}
