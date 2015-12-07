package com.catalogonet.dao.interfaces;

import java.util.List;

import com.catalogonet.model.Pedido;


public interface PedidoDAO {

	
	public Pedido adicionar(Pedido pedido);
	public void atualizar(Pedido pedido);
	public void remover(Long id);
	public Pedido buscarPorId(Long id); 
	
	public List<Pedido> listarPedidoUsuario(Long idUsuario);
	
}
