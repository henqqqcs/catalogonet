package com.catalogonet.plano;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.model.Anuncio;
import com.catalogonet.model.PlanoAnuncio;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.PlanoRN;

@Component
public class AtribuidorDePlanos {

	@Autowired
	private PlanoRN planoRN;

	@Autowired
	private AnuncioRN anuncioRN;

	/**
	 * Tem a funcao apenas fazer a ligacao entre um plano e um anuncio
	 * 
	 * @param plano
	 * @param anucio
	 */
	public ResultadoVerificacaoDeRegras atribuir(PlanoAnuncio planoPretendido,
			Anuncio anuncio) {

		// buscar plano atual
		PlanoAnuncio planoAtual = planoRN.buscarPlanoAtivoDoAnuncio(anuncio.getId());
		ResultadoVerificacaoDeRegras resultado = verifica(planoAtual,
				planoPretendido);

		// nao passou no teste
		if (resultado != ResultadoVerificacaoDeRegras.PASSOU) {
			return resultado;
		}

		// atribuir anuncio ao plano e vice versa
		planoPretendido.setAnuncio(anuncio);

		// setar a prioridade
		anuncio.setPrioridadeProduto(planoPretendido.getProduto()
				.getPrioridadeProduto().getPrioridadeProduto());

		// atualizar plano
		planoRN.atualizarPlanoAnuncio(planoPretendido);
		
		//atualizar anuncio
		anuncioRN.atualizar(anuncio);

		return resultado;

	}

	public ResultadoVerificacaoDeRegras ativarPlano(
			PlanoAnuncio planoPretendido, Anuncio anuncio) {

		// buscar plano atual
		PlanoAnuncio planoAtual = planoRN.buscarPlanoAtivoDoAnuncio(anuncio.getId());

		ResultadoVerificacaoDeRegras resultado = ResultadoVerificacaoDeRegras.PASSOU;

		// se existe um plano atual
		if (planoAtual != null) {

			// verifica se ok...
			resultado = verifica(planoAtual, planoPretendido);

			// verifica se passou nas regras
			if (resultado != ResultadoVerificacaoDeRegras.PASSOU) {
				return resultado;
			}

			// ok.. passou

			// suspender plano atual
			planoRN.suspenderPlano(planoAtual);
		}

		// atribuir anuncio ao plano novo
		planoPretendido.setAnuncio(anuncio);

		// ativar plano pretendido
		planoRN.ativarPlano(planoPretendido);

		// ativar o anuncio
		anuncioRN.ativar(anuncio, planoPretendido);

		return ResultadoVerificacaoDeRegras.PASSOU;

	}

	public void suspenderPlano(PlanoAnuncio planoAnuncio)
			throws IllegalArgumentException {

		Anuncio anuncio = planoAnuncio.getAnuncio();

		if (anuncio == null) {
			throw new IllegalArgumentException(
					"Este plano nao possui nenhum anuncio");
		}

		// suspender
		planoRN.suspenderPlano(planoAnuncio);

		// desativar anuncio
		anuncioRN.desativar(anuncio);

	}
	
	
	public void aprovarAnuncio(Anuncio anuncio) {
		
		//buscar plano do anuncio
		PlanoAnuncio plano = planoRN.buscarPlanoAtivoDoAnuncio(anuncio.getId());
		
		//verificado	
		anuncio.setVerificado(true);

		//aprovado
		anuncio.setAprovado(true);
		
		//ativar o plano
		this.ativarPlano(plano, anuncio);
		
	}

	private ResultadoVerificacaoDeRegras verifica(PlanoAnuncio planoAtual,
			PlanoAnuncio pretendido) {

		if (planoAtual != null) {

			int prioridadePlanoAtual = planoAtual.getProduto()
					.getPrioridadeProduto().getPrioridadeProduto();
			int prioridadePlanoPretendido = pretendido.getProduto()
					.getPrioridadeProduto().getPrioridadeProduto();

			if (prioridadePlanoPretendido >= prioridadePlanoAtual) {
				return ResultadoVerificacaoDeRegras.PASSOU;
			} else {
				return ResultadoVerificacaoDeRegras.ERRO_PLANO_PRETENDIDO_INFERIOR;
			}

		}

		System.out.println("|-- passou nas verificacao de regra: anuncio nao tem plano ativo");
		return ResultadoVerificacaoDeRegras.PASSOU;

	}

}
