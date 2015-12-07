package com.catalogonet.banco;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.model.Produto;
import com.catalogonet.model.StatusPlanoAnuncio;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.PedidoRN;
import com.catalogonet.negocio.PlanoRN;
import com.catalogonet.negocio.ProdutoRN;
import com.catalogonet.negocio.UsuarioRN;


@Service
public class PopularPlanoService {

	
	@Autowired
	private PedidoRN pedidoRN;
	
	@Autowired
	private ProdutoRN produtoRN;
	
	@Autowired
	private UsuarioRN usuarioRN;
	
	@Autowired
	private PlanoRN planoRN;
	
	public void popular() {

		System.out.println("|-- Populando banco de dados: planos de teste");

		// plano gratuito
		PlanoAnuncio gratuito = new PlanoAnuncio();
		Usuario usuario = usuarioRN.buscarPorEmail("teste");
		gratuito.setUsuario(usuario);
		//produto gratuito
		Produto produto = produtoRN.buscarPorId(1l);
		gratuito.setProduto(produto);
		gratuito.setStatusPlanoAnuncio(StatusPlanoAnuncio.PLANO_PAGO_AGUARDANDO_APLICACAO);
		planoRN.adicionarPlanoAnuncio(gratuito);

		// plano profissional
		PlanoAnuncio profissional = new PlanoAnuncio();
		profissional.setUsuario(usuario);
		produto = produtoRN.buscarPorId(2l);
		profissional.setProduto(produto);
		profissional.setStatusPlanoAnuncio(StatusPlanoAnuncio.PLANO_PAGO_AGUARDANDO_APLICACAO);
		planoRN.adicionarPlanoAnuncio(profissional);

		// plano ultimate
		PlanoAnuncio ultimate = new PlanoAnuncio();
		ultimate.setUsuario(usuario);
		produto = produtoRN.buscarPorId(3l);
		ultimate.setProduto(produto);
		ultimate.setStatusPlanoAnuncio(StatusPlanoAnuncio.PLANO_TEMPORARIO);
		planoRN.adicionarPlanoAnuncio(ultimate);		

	}

}
