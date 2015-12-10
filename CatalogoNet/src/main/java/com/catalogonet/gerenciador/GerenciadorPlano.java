package com.catalogonet.gerenciador;

import com.catalogonet.model.Pedido;
import com.catalogonet.model.PlanoAnuncio;

public interface GerenciadorPlano {

	
	void criarPlano(Pedido pedido);
	void upgradePlano(Long idPlano, Pedido pedido);
	void renovarPlano(Pedido pedido);
	
	void ativarPlano(Long idPlano);
	void suspenderPlano(Long idPlano);
	void comecarPlano(PlanoAnuncio plano);
	
}
