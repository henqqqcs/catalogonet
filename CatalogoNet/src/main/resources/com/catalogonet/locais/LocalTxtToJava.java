package com.catalogonet.locais;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.catalogonet.local.Bairro;
import com.catalogonet.local.Cidade;
import com.catalogonet.local.Estado;

public class LocalTxtToJava {

	/**
	 * ler o arquivo de texto C:/Users/henrique/Downloads/locais_brasilia.txt e
	 * criar uma lista de bairros
	 */
	public List<Bairro> pegarListaBairros() {
		return listarBairros();
	}

	private List<Bairro> listarBairros() {

		// criar estado
		Estado estado = new Estado();
		estado.setId("DF");
		estado.setNome("Distrito Federal");

		Cidade cidade = new Cidade();
		cidade.setNome("Brasília");
		cidade.setEstado(estado);
		
		List<Bairro> listaBairros = new ArrayList<Bairro>();

		try {

			String localArquivo = "C:/Users/henrique/Downloads/locais_brasilia.txt";
			//String locaisBrasilia = FileUtils.pegarStringArquivo(localArquivo);
			String locaisBrasilia = org.apache.commons.io.FileUtils.readFileToString(new File(localArquivo), "ISO-8859-1");

			String[] split = locaisBrasilia.split(System
					.getProperty("line.separator"));

			for (String s : split) {

				if (!s.isEmpty()) {
					Bairro bairro = new Bairro();
					bairro.setNome(s.trim());
					bairro.setEstado(estado);
					bairro.setCidade(cidade);
					//System.out.println("Adicionando bairro: "
					//		+ bairro.getNome());
					listaBairros.add(bairro);
				}

			}
			
			
			return listaBairros;

		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.println("Deu merda na popular bairros");

		} finally {
			System.out.println("terminou de popular os bairros");
		}
		
		return Collections.emptyList();

	}

}
