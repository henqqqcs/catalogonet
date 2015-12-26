package com.catalogonet.util;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

import org.apache.commons.io.IOUtils;

public class FileUtils {


	public static InputStream getInputStream(String path) {
		return FileUtils.class.getResourceAsStream(path);
	}

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
