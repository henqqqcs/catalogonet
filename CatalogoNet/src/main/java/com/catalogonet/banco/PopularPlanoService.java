package com.catalogonet.banco;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catalogonet.pedido.PedidoRN;
import com.catalogonet.plano.PlanoAnuncio;
import com.catalogonet.plano.PlanoRN;
import com.catalogonet.plano.StatusPlanoAnuncio;
import com.catalogonet.produto.Produto;
import com.catalogonet.produto.ProdutoRN;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;


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
