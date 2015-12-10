package com.catalogonet.gerenciador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.model.Pedido;
import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.model.StatusPlanoAnuncio;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.PlanoRN;


@Component
public class GerenciadorDePlano implements GerenciadorPlano{
	
	@Autowired
	private GerenciadorAnuncio gerenciadorDeAnuncio;
	
	@Autowired
	private PlanoRN planoRN;

	@Override
	public void criarPlano(Pedido pedido) {
		
		Usuario usuario = pedido.getUsuario();
		
		PlanoAnuncio planoAnuncio = new PlanoAnuncio();

		planoAnuncio.setProduto(pedido.getProduto());
		planoAnuncio.setStatusPlanoAnuncio(StatusPlanoAnuncio.PLANO_PAGO_AGUARDANDO_APLICACAO);
		planoAnuncio.setUsuario(usuario);

		//quando o anuncio for publicado
		planoAnuncio.setAtivo(false);

		//salvar
		planoRN.adicionarPlanoAnuncio(planoAnuncio);
		
	}

	@Override
	public void upgradePlano(Long idPlano, Pedido pedido) {
		
		//usuario clica em comece agora!
		//abre-se uma opcao onde ele escolhe se deseja aplicar a um anuncio ja usado
		//se plano for superior, faz um upgrade, se for igual, faz uma renovacao
		
	}


	@Override
	public void renovarPlano(Pedido pedido) {
		
		//usuario clica em comece agora!
		//abre-se uma opcao onde ele escolhe se deseja aplicar a um anuncio ja usado
		//se plano for superior, faz um upgrade, se for igual, faz uma renovacao
		
	}

	@Override
	public void ativarPlano(Long idPlano) {
		
		
		
	}

	@Override
	public void suspenderPlano(Long idPlano) {
		
		
		
	}

	@Override
	public void comecarPlano(PlanoAnuncio plano) {
		
		System.out.println("Comencado um plano..");
		
		//criar anuncio
		gerenciadorDeAnuncio.criarAnuncio(plano);
		
	}

}
