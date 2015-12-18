package com.catalogonet.gerenciador;

import com.catalogonet.model.PedidoStatus;

public interface GerenciadorDePedido {

	void atualizarStatus(Long idPedido, PedidoStatus status);
}
