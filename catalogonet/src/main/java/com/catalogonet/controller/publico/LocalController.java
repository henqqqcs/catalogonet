package com.catalogonet.controller.publico;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catalogonet.model.Bairro;
import com.catalogonet.model.BairroString;
import com.catalogonet.model.Cidade;
import com.catalogonet.model.CidadeString;
import com.catalogonet.model.Estado;
import com.catalogonet.negocio.LocalRN;

@Controller
@RequestMapping("/servicos")
public class LocalController {

	@Autowired
	private LocalRN localRN;

	@RequestMapping("/lista-estados")
	@ResponseBody
	public List<Estado> pegaEstados() {
		List<Estado> lista = localRN.listarEstados();
		return lista;
	}

	@RequestMapping(value = "/lista-cidades", method = RequestMethod.GET)
	public @ResponseBody List<CidadeString> pegaCidades(
			@RequestParam(value = "idEstado", required = true) String idEstado) {
		List<Cidade> cidades = localRN.listarCidades(idEstado);

		ArrayList<CidadeString> lista = new ArrayList<CidadeString>();
		for (Cidade c : cidades) {
			lista.add(new CidadeString(c.getId().toString(), c.getNome()));
		}
		return lista;
	}

	/**
	 * Nao recebe um id da cidade
	 */
	@RequestMapping(value = "/lista-bairros")
	public @ResponseBody List<BairroString> pegaBairros() {

		List<Bairro> bairros = localRN.listarBairros(1l);
		ArrayList<BairroString> lista = new ArrayList<BairroString>();
		for (Bairro b : bairros) {
			lista.add(new BairroString(b.getId().toString(), b.getNome()));
		}
		return lista;
	}

	// @RequestMapping(value = "/lista-bairros", method = RequestMethod.GET)
	// public @ResponseBody List<BairroString> pegaBairros(@RequestParam(value =
	// "idCidade", required = true) String idCidade) {
	//
	// List<Bairro> bairros = localRN.listarBairros(Long.valueOf(idCidade));
	// ArrayList<BairroString> lista = new ArrayList<BairroString>();
	// for (Bairro b : bairros) {
	// lista.add(new BairroString(b.getId().toString(), b.getNome()));
	// }
	// return lista;
	// }

}
