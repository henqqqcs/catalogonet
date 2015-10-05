package com.catalogonet.banco;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catalogonet.produto.PrioridadeProduto;
import com.catalogonet.produto.Produto;
import com.catalogonet.produto.ProdutoRN;


@Service
public class PopularProdutoService {

	
	@Autowired
	private ProdutoRN produtoRN;
	
	public void popularProdutos() {

		System.out.println("|-- Populando banco de dados: produtos");
		
		//criar produto - plano gratuito
		Produto gratuito = new Produto();
		gratuito.setNome("Plano Gratuito");
		gratuito.setValor(new BigDecimal("0.00"));
		gratuito.setPrioridadeProduto(PrioridadeProduto.PRODUTO_GRATUITO);
		gratuito.setDuracaoMeses(12);
		produtoRN.adicionar(gratuito);
		
		//criar produto - plano profissional
		Produto profissional = new Produto();
		profissional.setNome("Plano Profissional");
		profissional.setValor(new BigDecimal("99.90"));
		profissional.setPrioridadeProduto(PrioridadeProduto.PRODUTO_PROFISSIONAL);
		profissional.setDuracaoMeses(12);
		produtoRN.adicionar(profissional);
		
		//criar produto - plano ultimate
		Produto ultimate = new Produto();
		ultimate.setNome("Plano Ultimate");
		ultimate.setValor(new BigDecimal("149.90"));
		ultimate.setPrioridadeProduto(PrioridadeProduto.PRODUTO_ULTIMATE);
		ultimate.setDuracaoMeses(12);
		produtoRN.adicionar(ultimate);

	}

}
