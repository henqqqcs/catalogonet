package com.catalogonet.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

import org.apache.commons.io.IOUtils;

public class FileUtils {

	public static void main(String[] args) throws Exception {

		Properties props = FileUtils.loadProperties();

		System.out.println("Antes de editar: " + props.getProperty("hostName"));

		props.setProperty("hostName", "sddsfsdfs");

		FileUtils.salvarProperties(props);

	}

	public static InputStream getInputStream(String path) {
		return FileUtils.class.getResourceAsStream(path);
	}

	public static Properties loadProperties() throws Exception {

		Properties prop = new Properties();
		InputStream input = null;


		try {

			input = FileUtils.class
					.getResourceAsStream("/catalogonet-config.properties");

			// load a properties file
			prop.load(input);
			return prop;

		} catch (IOException ex) {
			System.out
					.println("Nao foi possivel ler o arquivo: /catalogonet-config.properties");
			ex.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					System.out
							.println("Erro ao ler o arquivo: /catalogonet-config.properties");
					e.printStackTrace();
				}
			}
		}

		return prop;

	}

	// private static void writeProperties() {
	//
	// try {
	// // pega input strem
	// InputStream input = FileUtils.class
	// .getResourceAsStream("/src/main/resources/email/ANUNCIO_CRIADO");
	//
	// // load properties
	// Properties props = new Properties();
	// props.load(input);
	// input.close();
	//
	// String str = props.getProperty("charset");
	// System.out.println("tentando modificar: " + str);
	//
	// // modifica
	// props.setProperty("charset", "changed");
	//
	// // pega outputstrem
	// URL resourceUrl = FileUtils.class
	// .getResource("/resources/catalogonet-config.properties");
	// System.out.println(resourceUrl.toURI());
	// File file = new File(resourceUrl.toURI());
	//
	// OutputStream output = new FileOutputStream(file);
	// props.store(output, "slfjksdhfk");
	// output.close();
	//
	// System.out.println("terminnout");
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	//
	// }

	public static String pegarStringArquivo(String caminhoArquivo) {

		/**
		 * Para acessar o arquivo na pasta resources basta apenas o nome do
		 * arquivo. para acessar o arquivo do email /email/nome do arquivo
		 */

		try {

			// InputStream in = getClass().getResourceAsStream(nomeArquivo);
			InputStream in = FileUtils.class
					.getResourceAsStream(caminhoArquivo);
			return IOUtils.toString(in);
		} catch (Exception e) {
			System.out.println("Erro ao abrir arquivo: " + caminhoArquivo);
			e.printStackTrace();
		}
		return "";
	}

	public static void salvarProperties(Properties props) throws Exception {

		PrintWriter writer = null;

		try {
			// pega outputstrem
			// URL resourceUrl = FileUtils.class.getResource(name)
			// URL resourceUrl =
			// FileUtils.class.getResourceAsStream("catalogonet-config.properties");

			writer = new PrintWriter(new File(FileUtils.class.getResource(
					"/catalogonet-config.properties").getPath()));
			props.store(writer, null);

		} catch (Exception e) {
			throw e;
		} finally {
			if (writer != null) {
				writer.close();
			}

		}
	}
}
