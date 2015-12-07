package com.catalogonet.plano;

import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.model.Produto;
import com.catalogonet.model.StatusPlanoAnuncio;
import com.catalogonet.model.Usuario;

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
