package com.catalogonet.plano.regra;

import com.catalogonet.plano.PlanoAnuncio;

public class RegraPassou implements RegraAtribuicaoPlanoAnuncio {


	@Override
	public ResultadoVerificacaoDeRegras verifica(PlanoAnuncio planoAtual,
			PlanoAnuncio planoPretendido) {
		return ResultadoVerificacaoDeRegras.PASSOU;
	}

	@Override
	public void setProxima(RegraAtribuicaoPlanoAnuncio proximo) {
	}

}
