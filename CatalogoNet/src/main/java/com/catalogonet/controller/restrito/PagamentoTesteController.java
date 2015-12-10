package com.catalogonet.controller.restrito;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catalogonet.gerenciador.GerenciadorPedido;
import com.catalogonet.model.PedidoStatus;

@Controller
public class PagamentoTesteController {

	
	@Autowired
	private GerenciadorPedido gerenciadorPedido;
	
	@RequestMapping("/pagamento-teste/{idPedido}")
	public String pagamentoTeste(@PathVariable("idPedido") String idPedido) {
		
		//pagar pedido teste
		gerenciadorPedido.atualizarStatus(Long.valueOf(idPedido), PedidoStatus.PAGO);
		
		return "redirect:/area-da-empresa/meus-pedidos";
	}
	
	
}
