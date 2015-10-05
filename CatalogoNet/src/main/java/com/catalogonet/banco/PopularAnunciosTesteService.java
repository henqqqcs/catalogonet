package com.catalogonet.banco;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catalogonet.anuncio.Anuncio;
import com.catalogonet.anuncio.AnuncioRN;
import com.catalogonet.categoria.Categoria;
import com.catalogonet.categoria.CategoriaRN;
import com.catalogonet.categoria.SubCategoria;
import com.catalogonet.local.Bairro;
import com.catalogonet.local.Cidade;
import com.catalogonet.local.Estado;
import com.catalogonet.local.LocalRN;
import com.catalogonet.produto.PrioridadeProduto;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;

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
