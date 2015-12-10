package com.catalogonet.gerenciador;

import com.catalogonet.model.PedidoStatus;

public interface GerenciadorPedido {

	void atualizarStatus(Long idPedido, PedidoStatus status);
}
