package com.catalogonet.plano;

import com.catalogonet.model.PlanoAnuncio;

public interface RegraAtribuicaoPlanoAnuncio {

	public ResultadoVerificacaoDeRegras verifica(PlanoAnuncio planoAtual, PlanoAnuncio planoPretendido);
	public void setProxima(RegraAtribuicaoPlanoAnuncio proximo);
	
}
