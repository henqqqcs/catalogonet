package com.catalogonet.gerenciador;

import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Pedido;
import com.catalogonet.model.Plano;
import com.catalogonet.plano.ResultadoAplicacaoPlano;

public interface GerenciadorDePlano {

	//criar plano apos pedido pago
	void criarPlano(Pedido pedido);
	
	//comecar um plano, criar um anuncio
	void comecarPlano(Plano plano);
	
	//publicar anuncio
	void publicarAnuncio(Anuncio anuncio);

	//caso o usuario queria fazer uma renovao
	ResultadoAplicacaoPlano aplicarPlanoAoAnuncio(Plano plano, Anuncio anuncio);
	
}
