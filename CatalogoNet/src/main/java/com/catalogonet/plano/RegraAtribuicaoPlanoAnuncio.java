package com.catalogonet.plano.regra;

import com.catalogonet.plano.PlanoAnuncio;

public interface RegraAtribuicaoPlanoAnuncio {

	public ResultadoVerificacaoDeRegras verifica(PlanoAnuncio planoAtual, PlanoAnuncio planoPretendido);
	public void setProxima(RegraAtribuicaoPlanoAnuncio proximo);
	
}
