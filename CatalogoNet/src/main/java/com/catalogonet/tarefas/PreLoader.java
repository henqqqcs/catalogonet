package com.catalogonet.tarefas;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catalogonet.email.EmailProperties;
import com.catalogonet.negocio.CategoriaRN;
import com.catalogonet.negocio.LocalRN;
import com.catalogonet.util.FileUtils;

@Service
public class PreLoader {

	@Autowired
	private LocalRN localRN;

	@Autowired
	private CategoriaRN categoriaRN;

	@PostConstruct
	public void loadProperties() {
		try {
			InputStream input = FileUtils.getInputStream("/catalogonet-config.properties");
			Properties prop = new Properties();
			prop.load(input);
			input.close();

			EmailProperties.setEmailProperties(prop);

			System.out.println(
					"|-- CatalogoNet: As configuracoes de email do arquivo /catalogonet-config.properties foram feitas.");
		} catch (IOException e) {
			System.out.println("Erro ao dar load no arquivo de properties");
			e.printStackTrace();
		}
	}

	/**
	 * Esse metodo faz o uso de cache
	 * 
	 * @return lista de estados com todas as cidades e bairros
	 */
	@PostConstruct
	public void inicializarListaLocais() {
		System.out.println("|-- CatalogoNet: Construindo lista de locais");
		localRN.listarLocais();
	}

	/**
	 * Esse metodo faz o uso de cache
	 * 
	 * @return lista de categorias
	 */
	@PostConstruct
	public void inicializarListaCategorias() {
		System.out.println("|-- CatalogoNet: Construindo lista de categorias");
		categoriaRN.listarCategorias();
	}

}
