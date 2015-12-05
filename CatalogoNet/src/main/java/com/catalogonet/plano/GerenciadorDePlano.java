package com.catalogonet.plano;

import com.catalogonet.produto.Produto;
import com.catalogonet.usuario.Usuario;

public class GerenciadorDePlano {
	
	
	public void criarPlanoAnuncio(Produto produto, Usuario usuario) {
		
		
		PlanoAnuncio plano = new PlanoAnuncio();
		plano.setUsuario(usuario);
		plano.setProduto(produto);
		plano.setStatusPlanoAnuncio(StatusPlanoAnuncio.PLANO_PAGO_AGUARDANDO_APLICACAO);
		
		//plano.set
		
	}
	
	private void criarAnuncio() {
		
		
	}
	
	public void publicarAnuncio() {

		
	}

}
