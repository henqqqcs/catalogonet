package com.catalogonet.gerenciador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.model.Pedido;
import com.catalogonet.model.PedidoStatus;
import com.catalogonet.negocio.PedidoRN;

@Component
public class GerenciadorDePedidos implements GerenciadorPedido {

	@Autowired
	private GerenciadorPlano gerenciadorPlano;

	@Autowired
	private PedidoRN pedidoRN;

	@Override
	public void atualizarStatus(Long idPedido, PedidoStatus status) {

		Pedido pedido = pedidoRN.buscarPorId(idPedido);
		pedido.setPedidoStatus(status);
		pedidoRN.atualizar(pedido);

		if (status == PedidoStatus.PAGO) {
			if (pedido.isRenovacao()) {
				gerenciadorPlano.renovarPlano(pedido);
			} else {
				gerenciadorPlano.criarPlano(pedido);
			}
		}

	}

}
