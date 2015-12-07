package com.catalogonet.banco;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catalogonet.model.PrioridadeProduto;
import com.catalogonet.model.Produto;
import com.catalogonet.negocio.ProdutoRN;


@Service
public class PopularProdutoService {

	
	@Autowired
	private ProdutoRN produtoRN;
	
	public void popularProdutos() {

		System.out.println("|-- Populando banco de dados: produtos");
		
		//criar produto - plano gratuito
		Produto gratuito = new Produto();
		gratuito.setNome("Plano Gratuito");
		gratuito.setNomeCompleto("Guia Comercial - Anúncio - Plano Gratuito");
		gratuito.setValor(new BigDecimal("0.00"));
		gratuito.setPrioridadeProduto(PrioridadeProduto.PRODUTO_GRATUITO);
		gratuito.setDuracaoMeses(12);
		produtoRN.adicionar(gratuito);
		
		//criar produto - plano profissional
		Produto profissional = new Produto();
		profissional.setNome("Plano Profissional");
		profissional.setNomeCompleto("Guia Comercial - Anúncio - Plano Profissional");
		profissional.setValor(new BigDecimal("99.90"));
		profissional.setPrioridadeProduto(PrioridadeProduto.PRODUTO_PROFISSIONAL);
		profissional.setDuracaoMeses(12);
		produtoRN.adicionar(profissional);
		
		//criar produto - plano ultimate
		Produto ultimate = new Produto();
		ultimate.setNome("Plano Ultimate");
		ultimate.setNomeCompleto("Guia Comercial - Anúncio - Plano Ultimate");
		ultimate.setValor(new BigDecimal("149.90"));
		ultimate.setPrioridadeProduto(PrioridadeProduto.PRODUTO_ULTIMATE);
		ultimate.setDuracaoMeses(12);
		produtoRN.adicionar(ultimate);

	}

}
