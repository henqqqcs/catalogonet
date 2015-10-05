package com.catalogonet.pedido;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Transactional
public class PedidoRN  {

	@Autowired
	private PedidoDAO dao;

	public Pedido adicionar(Pedido pedido) {

		if (pedido.getId() == null) {
			pedido.setPago(false);
			pedido.setStatus(PedidoStatus.AGUARDANDO_PAGAMENTO);
			// coloca data de criacao
			if (pedido.getDataInicio() == null) {
				//data de inicio e data final
				LocalDate hoje = LocalDate.now();
				pedido.setDataInicio(hoje);
				LocalDate dataFinal = hoje.plusDays(10);
				pedido.setDataFinalizacao(dataFinal);
			}
			// seta o valor
			pedido.setValor(pedido.getProduto().getValor());
		}
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
