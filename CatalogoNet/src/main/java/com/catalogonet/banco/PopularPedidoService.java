package com.catalogonet.banco;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catalogonet.model.MetodoPagamento;
import com.catalogonet.model.Pedido;
import com.catalogonet.model.PedidoStatus;
import com.catalogonet.model.Produto;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.PedidoRN;
import com.catalogonet.negocio.ProdutoRN;
import com.catalogonet.negocio.UsuarioRN;


@Service
public class PopularPedidoService {

	
	@Autowired
	private PedidoRN pedidoRN;
	
	@Autowired
	private ProdutoRN produtoRN;
	
	@Autowired
	private UsuarioRN usuarioRN;
	
	public void popular() {

		System.out.println("|-- Populando banco de dados: pedidos");
		

		for (int i = 0; i < 5; i++) {
			
			boolean renovacao = false;
			Usuario usuario = usuarioRN.buscarPorEmail("teste");
			Produto produto = produtoRN.buscarPorId(3l);
			Pedido pedido = new Pedido(MetodoPagamento.PAG_SEGURO, PedidoStatus.AGUARDANDO_PAGAMENTO, renovacao, usuario, produto);
			pedidoRN.adicionar(pedido);
		}
		
		
		

	}

}
