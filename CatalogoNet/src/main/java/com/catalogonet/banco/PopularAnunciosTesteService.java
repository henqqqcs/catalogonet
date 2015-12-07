package com.catalogonet.banco;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Bairro;
import com.catalogonet.model.Categoria;
import com.catalogonet.model.Cidade;
import com.catalogonet.model.Estado;
import com.catalogonet.model.PrioridadeProduto;
import com.catalogonet.model.SubCategoria;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.CategoriaRN;
import com.catalogonet.negocio.LocalRN;
import com.catalogonet.negocio.UsuarioRN;

@Service
public class PopularAnunciosTesteService {

	@Autowired
	private AnuncioRN anuncioRN;

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private LocalRN localRN;

	@Autowired
	private CategoriaRN categoriaRN;

	public void popularAnunciosTeste() {

		System.out.println("|-- Populando banco de dados: anuncios de teste");
		
		Usuario usuario = usuarioRN.buscarPorEmail("teste");

		Estado estado = localRN.buscarEstadoPorId("DF");
		Cidade cidade = localRN.buscarCidadePorId(1l);
		Bairro bairro = localRN.buscarBairroPorId(1l);
		String endereco = "endereco teste";
		String telefone1 = "(61) 2312-5312";

		String[] titulos = { "PIZZARIA", "RESTAURANTE", "COMIDA CHINESA",
				"CHINA IN BOX", "ZIMBRUS" };

		Categoria categoria = categoriaRN.buscarCategoriaPorId(1l);
		SubCategoria subCategoria = categoriaRN.buscarSubCategoriaPorId(1l);

		for (int i = 0; i < titulos.length; i++) {

			Anuncio anuncio = new Anuncio();

			anuncio.setTitulo(titulos[i]);
			anuncio.setUsuario(usuario);
			anuncio.setEstado(estado);
			anuncio.setCidade(cidade);
			anuncio.setBairro(bairro);
			anuncio.setCategoria(categoria);
			anuncio.setSubCategoria(subCategoria);
			anuncio.setEndereco(endereco);
			anuncio.setTelefone1(telefone1);
			anuncio.setPrioridadeProduto(PrioridadeProduto.PRODUTO_GRATUITO.getPrioridadeProduto());

			anuncioRN.adicionar(anuncio);

		}
		
		Anuncio a = new Anuncio();
		a.setTitulo("ANUNCIO GRATUITO NAO APROVADO");
		a.setUsuario(usuario);
		a.setEstado(estado);
		a.setCidade(cidade);
		a.setBairro(bairro);
		a.setCategoria(categoria);
		a.setSubCategoria(subCategoria);
		a.setEndereco(endereco);
		a.setTelefone1(telefone1);
		a.setPrioridadeProduto(PrioridadeProduto.PRODUTO_GRATUITO.getPrioridadeProduto());
		
		anuncioRN.adicionar(a);
		

	}
}
