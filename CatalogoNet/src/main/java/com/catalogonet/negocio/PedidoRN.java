package com.catalogonet.negocio;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.dao.interfaces.PedidoDAO;
import com.catalogonet.model.MetodoPagamento;
import com.catalogonet.model.Pedido;

@Component
@Transactional
public class PedidoRN  {

	@Autowired
	private PedidoDAO dao;

	public Pedido adicionar(Pedido pedido) {
		return dao.adicionar(pedido);
	}

	public void atualizar(Pedido pedido) {
		dao.atualizar(pedido);
	}

	public void remover(Long id) {
		dao.remover(id);
	}

	public Pedido buscarPorId(Long id) {
		return dao.buscarPorId(id);
	}

	public List<Pedido> listarPedidoUsuario(Long idUsuario) {
		return dao.listarPedidoUsuario(idUsuario);
	}

	public MetodoPagamento pegarMetodoDePagamento(String metodoPagamento) {
		
		if (metodoPagamento.equals("pagseguro")) {
			return MetodoPagamento.PAG_SEGURO;
		} else if(metodoPagamento.equals("paypal")) {
			return MetodoPagamento.PAYPAL;
		} else if (metodoPagamento.equals("boleto")) {
			return MetodoPagamento.BOLETO;
		}
			
		return null;
	}

}
