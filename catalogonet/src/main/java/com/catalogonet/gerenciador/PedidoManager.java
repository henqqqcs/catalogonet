package com.catalogonet.gerenciador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.email.MandadorEmail;
import com.catalogonet.model.Pedido;
import com.catalogonet.model.PedidoStatus;
import com.catalogonet.negocio.PedidoRN;

@Component
public class PedidoManager implements GerenciadorDePedido{

	@Autowired
	private GerenciadorDePlano gerenciadorPlano;

	@Autowired
	private PedidoRN pedidoRN;
	
	@Autowired
	private MandadorEmail mandadorEmail;
	
	@Override
	public void atualizarStatus(Long idPedido, PedidoStatus status) {
		
		Pedido pedido = pedidoRN.buscarPorId(idPedido);
		pedido.atualizarStatus(status);
		pedidoRN.atualizar(pedido);

		if (status == PedidoStatus.PAGO) {
			mandadorEmail.mandarEmailPedidoPagamentoConfirmado(pedido);
			gerenciadorPlano.criarPlano(pedido);
		}
		
	}

}
