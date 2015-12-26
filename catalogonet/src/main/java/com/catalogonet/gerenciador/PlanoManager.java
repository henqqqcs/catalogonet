package com.catalogonet.gerenciador;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Pedido;
import com.catalogonet.model.Plano;
import com.catalogonet.model.StatusPlano;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.PlanoRN;
import com.catalogonet.plano.RegraAplicacaoPlano;
import com.catalogonet.plano.ResultadoAplicacaoPlano;

@Component
public class PlanoManager implements GerenciadorDePlano {

	@Autowired
	private PlanoRN planoRN;

	@Autowired
	private AnuncioRN anuncioRN;
	
	@Override
	public void criarPlano(Pedido pedido) {

		System.out.println("| -- Criando um plano-------------------------------");
		Plano plano = new Plano(pedido.getUsuario(), pedido.getProduto());
		
		System.out.println("|-- nome: " + plano.getNomePlano());
		System.out.println("|-- prioridade: " + plano.getPrioridadeProduto());
		System.out.println("|---------------------------------------------------");
		
		// salvar
		planoRN.atualizar(plano);
		
	}

	@Override
	public void comecarPlano(Plano plano) {

		System.out.println("|-- comecar plano: criando um anuncio para o plano com id: " + plano.getId());
		Anuncio anuncio = new Anuncio(plano.getNomePlano(), plano, plano.getUsuario());
		
		//atuaizar status
		plano.atualizarStatus(StatusPlano.AGUARDANDO_PUBLICACAO);
		
		// salvar anuncio
		anuncioRN.salvar(anuncio);

		plano.setAnuncio(anuncio);
		planoRN.atualizar(plano);
	}

	@Override
	public void publicarAnuncio(Anuncio anuncio) {

		System.out.println("|-- publicando anuncio: " + anuncio.getTitulo());
		Plano plano = anuncio.getPlano();
		ativarAnuncio(anuncio);

		LocalDate dataFinalizacao = LocalDate.now().plusMonths(plano.getDuracaoProdutoEmMeses());
		ativarPlano(plano, dataFinalizacao);

		anuncioRN.atualizar(anuncio);
		planoRN.atualizar(plano);
	}

	@Override
	public ResultadoAplicacaoPlano aplicarPlanoAoAnuncio(Plano planoPretendido, Anuncio anuncio) {
		
		System.out.println("|-- aplicando anuncio ----------------");
		
		Plano planoAtual = anuncio.getPlano();
		
		System.out.println("|---Plano pretendido: " + planoPretendido.getNomePlano() + " Prioridade: " + planoPretendido.getPrioridadeProduto());
		System.out.println("|------- Plano atual: " + planoAtual.getNomePlano() + " Prioridade: " + planoAtual.getPrioridadeProduto());
		
		ResultadoAplicacaoPlano resultado = verificarRegrasAtribuicao(planoPretendido, planoAtual);
		
		if (resultado.isAprovado()) {
			
			System.out.println("|-- ResultadoAplicacaoPlano: aprovado ");
			int prioridadeAtual = planoAtual.getPrioridadeProduto();
			int prioridadePretendido = planoPretendido.getPrioridadeProduto();
			
			System.out.println("Aplicacao de plano foi aprovada: ");
			System.out.println("Prioridade atual: " + prioridadeAtual);
			System.out.println("Prioridade pretendido: " + prioridadePretendido);
			
			if (prioridadeAtual < prioridadePretendido) {
				System.out.println("|-- Chamando metodo para fazer upgrade de plano");
				this.upgradePlano(planoAtual, planoPretendido);
			} else if (prioridadeAtual == prioridadePretendido) {
				renovarPlano(planoAtual, planoPretendido);
			}
			
			System.out.println("|-- terminou salvando os planos");
			planoRN.atualizar(planoAtual);
			planoRN.atualizar(planoPretendido);
		} else {
			System.out.println("|-- ResultadoAplicacaoPlano: reprovado ");
		}
		
		
		return resultado;
	}

	private ResultadoAplicacaoPlano verificarRegrasAtribuicao(Plano planoPretendido, Plano planoAtual) {

		
		ResultadoAplicacaoPlano resultado = new ResultadoAplicacaoPlano();
		int prioridadeAtual = planoAtual.getPrioridadeProduto();
		int prioridadePretendido = planoPretendido.getPrioridadeProduto();
		
		System.out.println("Prioridade atual: " + prioridadeAtual);
		System.out.println("Prioridade pretendido: " + prioridadePretendido);

		if (prioridadeAtual > prioridadePretendido) {
			System.out.println("|-- adicionando regra: PLANO_ATUAL_SUPERIOR");
			resultado.adicionaRegra(RegraAplicacaoPlano.PLANO_ATUAL_SUPERIOR);
		}
		
		//verifica se o plano atual ja foi ativado
		if (planoAtual.getDataFinalizacao() == null) {
			System.out.println("|-- adicionando regra: PLANO_ATUAL_NAO_ATIVADO");
			resultado.adicionaRegra(RegraAplicacaoPlano.PLANO_ATUAL_NAO_ATIVADO);
		}
		return resultado;
	}

	private void ativarPlano(Plano plano, LocalDate dataFinalizacao) {

		System.out.println("|-- ativando o plano: " + plano.getNomePlano());
		plano.atualizarStatus(StatusPlano.ATIVO);
		plano.setDataInicio(LocalDate.now());
		plano.setDataFinalizacao(dataFinalizacao);
		
		DateTimeFormatter pattern = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		System.out.println("Data de finalizacao do plano: " + plano.getNomePlano() + " data: " + plano.getDataFinalizacao().format(pattern));
		System.out.println("|------------------------------------------------------");
	}

	private void ativarAnuncio(Anuncio anuncio) {
		anuncio.setAtivo(true);
	}
	
	private void planoAgregado(Plano plano) {
		plano.atualizarStatus(StatusPlano.AGREGADO);
		plano.setDataFinalizacao(LocalDate.now());
	}

	private void finalizarPlano(Plano plano) {
		
		System.out.println("|-- finalizando o plano: " + plano.getNomePlano());
		plano.atualizarStatus(StatusPlano.FINALIZADO);
		plano.setDataFinalizacao(LocalDate.now());
	}
//
//	private void suspenderPlano(Plano plano) {
//		plano.atualizarStatus(StatusPlano.SUSPENSO);
//		plano.setDataFinalizacao(LocalDate.now());
//	}
//
	private void renovarPlano(Plano atual, Plano pretendido) {

		System.out.println("|--Renovando um plano ....");
		System.out.println("|-- renovando um plano atual: " + atual.getNomePlano());
		DateTimeFormatter pattern = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		System.out.println("|-- data de finalizacao antes da renovacao: " + atual.getDataFinalizacao().format(pattern));
		
		if (atual.getDataFinalizacao() == null)
			throw new IllegalArgumentException("Nao e possivel renovar o plano, pois a data de finalizacao do plano atual eh null");
		
		LocalDate hoje = LocalDate.now();
		LocalDate novaDataFinal;
		LocalDate dataFinalizacao = atual.getDataFinalizacao();
		
		
		if (dataFinalizacao.isBefore(hoje)) {
			novaDataFinal = LocalDate.now().plusMonths(pretendido.getDuracaoProdutoEmMeses());
		} else {
			novaDataFinal = dataFinalizacao.plusMonths(pretendido.getDuracaoProdutoEmMeses());
		}

		
		System.out.println("|-- nova data de finalizacao: " + novaDataFinal.format(pattern));
		this.ativarPlano(atual, novaDataFinal);
		this.planoAgregado(pretendido);

	}
	
	private void upgradePlano(Plano planoAtual, Plano planoPretendido) {
		
		//finalizar atual
		finalizarPlano(planoAtual);
		
		//setar novo anuncio
		planoPretendido.setAnuncio(planoAtual.getAnuncio());
		
		//ativar novo plano
		DateTimeFormatter pattern = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate dataFinalizacao = LocalDate.now().plusMonths(planoPretendido.getDuracaoProdutoEmMeses());
		System.out.println("Data de finalizacao do plano: " + planoPretendido.getNomePlano() + " data: " + dataFinalizacao.format(pattern));
		this.ativarPlano(planoPretendido, dataFinalizacao);
		
		//atualiza o plano do anucio
		Anuncio anuncio = planoPretendido.getAnuncio();
		anuncio.setPlano(planoPretendido);
		this.ativarAnuncio(anuncio);
		anuncioRN.atualizar(anuncio);
	}

}
