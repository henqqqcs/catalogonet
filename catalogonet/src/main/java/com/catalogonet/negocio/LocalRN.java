package com.catalogonet.negocio;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.catalogonet.dao.interfaces.LocalDAO;
import com.catalogonet.model.Bairro;
import com.catalogonet.model.Cidade;
import com.catalogonet.model.Estado;

@Component
@Transactional
public class LocalRN {

	@Autowired
	private LocalDAO dao;

	// adicionar
	public void adicionarEstado(Estado estado) {
		dao.adicionarEstado(estado);
	}

	public void adicionarCidade(Cidade cidade) {
		dao.adicionarCidade(cidade);
	}

	public void adicionarBairro(Bairro bairro) {
		dao.adicionarBairro(bairro);
	}

	// atualizar
	public void atualizarEstado(Estado e) {
		dao.atualizarEstado(e);
	}

	public void atualizarCidade(Cidade c) {
		dao.atualizarCidade(c);
	}

	public void atualizarBairro(Bairro b) {
		dao.atualizarBairro(b);
	}

	// remover
	public void removerEstado(String idEstado) {
		dao.removerEstado(idEstado);
	}

	public void removerCidade(Long idCidade) {
		dao.removerCidade(idCidade);
	}

	public void removerBairro(Long idBairro) {
		dao.removerBairro(idBairro);
	}

	// listar
	public List<Estado> listarEstados() {
		return this.listarLocais();
	}

	public List<Cidade> listarCidades(String idEstado) {

		List<Estado> listaEstados = this.listarEstados();

		for (Estado estado : listaEstados) {
			if (estado.getId().equals(idEstado)) {
				return estado.getListaCidades();
			}
		}

		return dao.listarCidades(idEstado);
	}

	public List<Bairro> listarBairros(Long idCidade) {

		List<Estado> listaEstados = this.listarEstados();

		for (Estado estado : listaEstados) {

			List<Cidade> listaCidades = estado.getListaCidades();

			for (Cidade cidade : listaCidades) {

				if (cidade.getId() == idCidade) {
					return cidade.getListaBairros();
				}
			}
		}

		return dao.listarBairros(idCidade);

	}

	// buscar por id
	public Estado buscarEstadoPorId(String idEstado) {
		return dao.buscarEstadoPorId(idEstado);
	}

	public Cidade buscarCidadePorId(Long idCidade) {
		return dao.buscarCidadePorId(idCidade);
	}

	public Bairro buscarBairroPorId(Long idBairro) {
		return dao.buscarBairroPorId(idBairro);
	}

	// buscar por nome inteiro

	public Bairro buscarBairroPorNomeInteiro(String nome) {
		return dao.buscarBairroPorNomeInteiro(nome);
	}

	public Cidade buscarCidadePorNomeInteiro(String nome) {
		return dao.buscarCidadePorNomeInteiro(nome);
	}

	public Estado buscarEstadoPorNomeInteiro(String nome) {
		return dao.buscarEstadoPorNomeInteiro(nome);
	}

	// buscar nome do estado
	public String buscarNomeEstado(String idEstado) {
		return dao.buscarNomeEstado(idEstado);
	}

	public List<Estado> listarLocais() {
		return dao.listarLocais();
	}

	// //mapa para lista de estados
	// public Map<String, String> pegarMapEstadosIdNome() {
	// List<Estado> estados = dao.listarEstados();
	// Map<String, String> mapEstados = new TreeMap<String, String>();
	// for (Estado e : estados) {
	// mapEstados.put(e.getId(), e.getNome());
	// }
	// return mapEstados;
	// }
	//
	// //mapa para lista de cidades
	// public Map<String, String> pegarMapCidadesIdNome(String idEstado) {
	// List<Cidade> cidades = dao.listarCidades(idEstado);
	// HashMap<String, String> mapCidades = new HashMap<String, String>();
	// for (Cidade c : cidades) {
	// mapCidades.put(c.getNome(), c.getNome());
	// }
	// return mapCidades;
	// }
	//
	//
	// public List<String> comparaStringBairro(String str) {
	// ArrayList<String> listaString = new ArrayList<String>();
	// for (String s : listaBairros) {
	// if (StringUtils.containsIgnoreCase(s, str)) {
	// listaString.add(s);
	// }
	// }
	// return listaString;
	// }

}
