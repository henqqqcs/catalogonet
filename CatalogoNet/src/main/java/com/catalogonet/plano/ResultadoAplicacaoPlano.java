package com.catalogonet.plano;

import java.util.ArrayList;
import java.util.List;

public class ResultadoAplicacaoPlano {
	
	private List<RegraAplicacaoPlano> listaRegras = new ArrayList<RegraAplicacaoPlano>();

	public void adicionaRegra(RegraAplicacaoPlano regra) {
		listaRegras.add(regra);
	}
	
	public void adicionaAllRegra(List<RegraAplicacaoPlano> listaRegras) {
		listaRegras.addAll(listaRegras);
	}

	public boolean isAprovado() {
		if (listaRegras.isEmpty()) 
			return true;
		else
			return false;
	}

	public List<RegraAplicacaoPlano> getListaRegras() {
		return listaRegras;
	}
	

}
