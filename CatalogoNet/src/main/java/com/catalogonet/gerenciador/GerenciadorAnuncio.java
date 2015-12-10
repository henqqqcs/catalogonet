package com.catalogonet.gerenciador;

import com.catalogonet.model.PlanoAnuncio;

public interface GerenciadorAnuncio {

	void criarAnuncio(PlanoAnuncio planoAnuncio);
	void desativar(Long idAnuncio);
	void atualzarPlano(PlanoAnuncio planoAnuncio);

}
