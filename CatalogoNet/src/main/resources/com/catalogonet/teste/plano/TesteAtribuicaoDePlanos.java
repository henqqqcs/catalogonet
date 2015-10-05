package com.catalogonet.teste.plano;

import com.catalogonet.produto.PrioridadeProduto;
import com.catalogonet.produto.Produto;

public class TesteAtribuicaoDePlanos {

	
	public static void main(String[] args) {
		
		
//		PlanoAnuncio planoAtual = new PlanoAnuncio();
////		Produto p = getProdutoGratuito();
//		Produto p = getProdutProfissional();
////		Produto p = getProdutoUltimate();
//		planoAtual.setProduto(p);
//		planoAtual.setStatusPlanoAnuncio(StatusPlanoAnuncio.PLANO_TEMPORARIO);
//		
//		
//		//produto pretendido
//		
//		Produto produto = getProdutoGratuito();
////		Produto produto = getProdutProfissional();
////		Produto produto = getProdutoUltimate();
//		
//		
//		//tenta atribuir
//		AtribuidorDePlanos atribuidorDePlanos = new AtribuidorDePlanos();
//		
//		ResultadoVerificacaoDeRegras resultado = atribuidorDePlanos.verifica(planoAtual, produto);
//		
//		System.out.println("|---- resultado ---------");
//		if (resultado == ResultadoVerificacaoDeRegras.PASSOU) {
//			System.out.println("Passou");
//		} else if (resultado == ResultadoVerificacaoDeRegras.ERRO_PLANO_ATIVO_PLANO_ATUAL_SUPERIOR) {
//			System.out.println("ERRO_PLANO_ATIVO_PLANO_ATUAL_SUPERIOR");
//		} else if (resultado == ResultadoVerificacaoDeRegras.ERRO_PLANO_TEMPORARIO_PLANO_ATUAL_IGUAL_OU_SUPERIOR) {
//			System.out.println("ERRO_PLANO_TEMPORARIO_PLANO_ATUAL_IGUAL_OU_SUPERIOR");
//		}
		
		
	}
	
	public static Produto getProdutoGratuito() {
		Produto gratuito = new Produto();
		gratuito.setPrioridadeProduto(PrioridadeProduto.PRODUTO_GRATUITO);
		gratuito.setNome("Plano Gratuito");
		return gratuito;
	}
	public static Produto getProdutProfissional() {
		Produto pro = new Produto();
		pro.setPrioridadeProduto(PrioridadeProduto.PRODUTO_PROFISSIONAL);
		pro.setNome("Plano Profissional");
		return pro;
	}
	public static Produto getProdutoUltimate() {
		Produto ultimate = new Produto();
		ultimate.setPrioridadeProduto(PrioridadeProduto.PRODUTO_ULTIMATE);
		ultimate.setNome("Plano Ultimate");
		return ultimate;
	}
	
	
	
	
}
