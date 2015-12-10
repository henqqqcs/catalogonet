package com.catalogonet.gerenciador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.model.Anuncio;
import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.PlanoRN;

@Component
public class GerenciadorDeAnuncio implements GerenciadorAnuncio {

	@Autowired
	private AnuncioRN anuncioRN;
	
	@Autowired 
	private PlanoRN planoRN;
	
	@Override
	public void criarAnuncio(PlanoAnuncio plano) {
		
		Usuario usuario = plano.getUsuario();
		
		Anuncio anuncio = new Anuncio(plano.getProduto().getNome());
		anuncio.setUsuario(usuario);
		anuncioRN.adicionar(anuncio);

		plano.setAnuncio(anuncio);
		planoRN.atualizarPlanoAnuncio(plano);
		
	}

	@Override
	public void desativar(Long idAnuncio) {
		
	}

	@Override
	public void atualzarPlano(PlanoAnuncio planoAnuncio) {
		
	}

}
