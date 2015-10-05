package com.catalogonet.local;

import java.util.List;

public interface LocalDAO {

	public void adicionarEstado(Estado estado);
	public void adicionarCidade(Cidade cidade);
	public void adicionarBairro(Bairro bairro);
	
	public void atualizarEstado(Estado estado);
	public void atualizarCidade(Cidade cidade);
	public void atualizarBairro(Bairro bairro);
	
	public void removerEstado(String idEstado);
	public void removerCidade(Long idCidade);
	public void removerBairro(Long idBairro);
	
	public List<Estado> listarEstados();
	public List<Cidade> listarCidades(String idEstado);
	public List<Bairro> listarBairros(Long idCidade);
	
	public List<Estado> listarLocais();
	
	public Estado buscarEstadoPorId(String idEstado);
	public Cidade buscarCidadePorId(Long idCidade);
	public Bairro buscarBairroPorId(Long idBairro);
	
	public Bairro buscarBairroPorNomeInteiro(String nome);
	public Cidade buscarCidadePorNomeInteiro(String nome);
	public Estado buscarEstadoPorNomeInteiro(String nome);
	
	public String buscarNomeEstado(String idEstado);
	

}
