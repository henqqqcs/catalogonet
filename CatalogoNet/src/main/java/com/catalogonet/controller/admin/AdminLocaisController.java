package com.catalogonet.controller.admin;

import java.util.List;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.catalogonet.local.Bairro;
import com.catalogonet.local.Cidade;
import com.catalogonet.local.Estado;
import com.catalogonet.local.LocalRN;

@Controller
@RequestMapping("/adminadmin/locais")
public class AdminLocaisController {

	@Autowired
	private LocalRN localRN;

	private static final String PAG_LISTA_ESTADOS = "redirect:/adminadmin/locais/lista-locais";
	private static final String PAG_LOCAIS_ERRO = "admin/locais/locais-erro";

	/**
	 * Lista de todos os estados.
	 * 
	 * @param map
	 * @return pagina de listagem dos estados
	 */
	@RequestMapping("/lista-locais")
	public String listaEstadosLocais(ModelMap map) {
		List<Estado> listaEstados = localRN.listarEstados();
		map.put("listaEstados", listaEstados);
		return "admin/locais/lista-locais";
	}

	/**
	 * Mostra a pagina de cadastro de estados
	 * 
	 * @param map
	 * @return pagina de cadastro de estados
	 */
	@RequestMapping(value = "/cadastrar-estado", method = RequestMethod.GET)
	public String cadastrarEstado(ModelMap map) {
		Estado estado = new Estado();
		map.put("estado", estado);
		return "admin/locais/cadastrar-estado";
	}

	/**
	 * Adiciona uma estado no banco de dados
	 * 
	 * @param cidade
	 * @param map
	 * @return pagina de listagem de estados
	 */
	@RequestMapping("/cadastrar-estado-handle")
	public String cadastrarEstadoHandle(@ModelAttribute Estado estado,
			ModelMap map) {
		localRN.adicionarEstado(estado);
		return PAG_LISTA_ESTADOS;
	}

	/**
	 * Pagina de edicao do estado. Edita o estado
	 * 
	 * @param id
	 *            do estado
	 * @param map
	 * @return pagina de edicao do estado
	 */
	@RequestMapping(value = "/editar-estado", method = RequestMethod.GET)
	public String editarEstado(@RequestParam String id, ModelMap map) {
		Estado estado = localRN.buscarEstadoPorId(id);
		map.put("estado", estado);
		return "admin/locais/atualizar-estado";
	}

	/**
	 * Atualiza o estado
	 * 
	 * @param estado
	 * @param map
	 * @return pagina de listagem
	 */
	@RequestMapping("/atualizar-estado-handle")
	public String atualizarEstadoHandle(@ModelAttribute Estado estado,
			ModelMap map) {
		// atualizar estado
		localRN.atualizarEstado(estado);
		return PAG_LISTA_ESTADOS;
	}

	/**
	 * Mostra a pagina de remocao estado
	 * 
	 * @param id
	 * @param map
	 * @return pagina de confirmacao
	 */
	@RequestMapping(value = "/remover-estado", method = RequestMethod.GET)
	public String removerEstado(@RequestParam String id, ModelMap map) {
		Estado estado = localRN.buscarEstadoPorId(id);
		map.put("estado", estado);
		return "admin/locais/remover-estado";
	}

	/**
	 * Tenta remover o bairro
	 * 
	 * @param cidade
	 * @param map
	 * @return pagina de listagem de estados caso a remocao aconteca, ou pagina
	 *         de erro
	 */
	@RequestMapping(value = "/remover-estado-handle", method = RequestMethod.POST)
	public String removerEstadoHandle(@ModelAttribute Estado es,
			ModelMap map) {

		try {
			Estado estado = localRN.buscarEstadoPorId(es.getId());

			List<Cidade> listaCidades = localRN.listarCidades(estado.getId());
			for (Cidade c : listaCidades) {
				List<Bairro> listaBairros = localRN.listarBairros(c.getId());
				// remover bairros
				for (Bairro b : listaBairros) {
					localRN.removerBairro(b.getId());
				}
				// remover cidades
				localRN.removerCidade(c.getId());
			}
			
			
			//remover estado
			localRN.removerEstado(estado.getId());
			return PAG_LISTA_ESTADOS;
		} catch (Exception e) {
			String mensagemErro = "<br/><br/> stack trace: <br/>"
					+ ExceptionUtils.getStackTrace(e);
			e.printStackTrace();
			map.put("mensagemErro", mensagemErro);
			return PAG_LOCAIS_ERRO;
		}

	}

	// ==================================cidades
	// ===========================================================
	// ==================================cidades
	// ===========================================================
	// ==================================cidades
	// ===========================================================

	/**
	 * Pagina de listagem das cidades
	 * 
	 * @param id
	 *            do estado (tipo String)
	 * @param map
	 * @return pagina de listagen de cidades
	 */
	@RequestMapping(value = "/lista-cidades", method = RequestMethod.GET)
	public String listaCidades(@RequestParam String id, ModelMap map) {

		Estado estado = localRN.buscarEstadoPorId(id);
		map.put("estado", estado);
		List<Cidade> listaCidades = localRN.listarCidades(id);
		map.put("listaCidades", listaCidades);
		return "admin/locais/lista-cidades";
	}

	/**
	 * Mostra a pagina de cadastro de cidades
	 * 
	 * @param map
	 * @return pagina de cadastro de cidades
	 */
	@RequestMapping(value = "/cadastrar-cidade", method = RequestMethod.GET)
	public String cadastrarCidade(ModelMap map) {
		Cidade cidade = new Cidade();
		map.put("cidade", cidade);
		return "admin/locais/cadastrar-cidade";
	}

	/**
	 * Adiciona uma cidade no banco de dados
	 * 
	 * @param cidade
	 * @param map
	 * @return pagina de listagem de estados
	 */
	@RequestMapping("/cadastrar-cidade-handle")
	public String cadastrarCidadeHandle(@ModelAttribute Cidade cidade,
			ModelMap map) {
		localRN.adicionarCidade(cidade);
		return PAG_LISTA_ESTADOS;
	}

	/**
	 * Mostra a pagina de edicao para cidades.
	 * 
	 * @param id
	 * @param map
	 * @return pagina de edicao para cidades
	 */
	@RequestMapping(value = "/editar-cidade", method = RequestMethod.GET)
	public String editarCidade(@RequestParam Long id, ModelMap map) {
		Cidade cidade = localRN.buscarCidadePorId(id);
		map.put("cidade", cidade);
		return "admin/locais/atualizar-cidade";
	}

	/**
	 * Atualiza a cidade no banco de dados
	 * 
	 * @param cidade
	 * @param map
	 * @return retorna para pagina de listagem de estados
	 */
	@RequestMapping("/atualizar-cidade-handle")
	public String atualizarCidadesHandle(@ModelAttribute Cidade cidade,
			ModelMap map) {
		// atualizar cidade

		Estado estado = localRN.buscarEstadoPorId(cidade.getEstado().getId());
		cidade.setEstado(estado);
		localRN.atualizarCidade(cidade);
		return PAG_LISTA_ESTADOS;
	}

	/**
	 * Mostra a pagina de remocao cidade
	 * 
	 * @param id
	 * @param map
	 * @return pagina de confirmacao
	 */
	@RequestMapping(value = "/remover-cidade", method = RequestMethod.GET)
	public String removerCidade(@RequestParam Long id, ModelMap map) {
		Cidade cidade = localRN.buscarCidadePorId(id);
		map.put("cidade", cidade);
		return "admin/locais/remover-cidade";
	}

	/**
	 * Tenta remover a cidade
	 * 
	 * @param cidade
	 * @param map
	 * @return pagina de listagem de estados caso a remocao aconteca, ou pagina
	 *         de erro
	 */
	@RequestMapping(value = "/remover-cidade-handle", method = RequestMethod.POST)
	public String removerCidadeHandle(@ModelAttribute Cidade cidade,
			ModelMap map) {

		try {
			localRN.removerCidade(cidade.getId());
			return PAG_LISTA_ESTADOS;
		} catch (Exception e) {
			String mensagemErro = "<br/><br/> stack trace: <br/>"
					+ ExceptionUtils.getStackTrace(e);
			e.printStackTrace();
			map.put("mensagemErro", mensagemErro);
			return PAG_LOCAIS_ERRO;
		}

	}

	// bairros ==========================================================
	@RequestMapping(value = "/lista-bairros", method = RequestMethod.GET)
	public String listaCidades(@RequestParam Long id, ModelMap map) {

		Cidade cidade = localRN.buscarCidadePorId(id);
		map.put("cidade", cidade);

		List<Bairro> listaBairros = localRN.listarBairros(id);
		map.put("listaBairros", listaBairros);
		return "admin/locais/lista-bairros";
	}

	/**
	 * Mostra a pagina de cadastro de bairros
	 * 
	 * @param map
	 * @return pagina de cadastro de bairros
	 */
	@RequestMapping(value = "/cadastrar-bairro", method = RequestMethod.GET)
	public String cadastrarBairro(ModelMap map) {
		Bairro bairro = new Bairro();
		map.put("bairro", bairro);
		return "admin/locais/cadastrar-bairro";
	}

	/**
	 * Adiciona uma bairro no banco de dados
	 * 
	 * @param cidade
	 * @param map
	 * @return pagina de listagem de estados
	 */
	@RequestMapping("/cadastrar-bairro-handle")
	public String cadastrarbairroHandle(@ModelAttribute Bairro bairro,
			ModelMap map) {
		localRN.adicionarBairro(bairro);
		return PAG_LISTA_ESTADOS;
	}

	/**
	 * Mostra a pagina de edicao para bairros.
	 * 
	 * @param id
	 * @param map
	 * @return pagina de edicao para bairros
	 */
	@RequestMapping(value = "/editar-bairro", method = RequestMethod.GET)
	public String editarBairro(@RequestParam Long id, ModelMap map) {
		Bairro bairro = localRN.buscarBairroPorId(id);
		map.put("bairro", bairro);
		return "admin/locais/atualizar-bairro";
	}

	/**
	 * Atualiza o bairro no banco de dados
	 * 
	 * @param bairro
	 * @param map
	 * @return retorna para pagina de listagem de estados
	 */
	@RequestMapping("/atualizar-bairro-handle")
	public String atualizarBairrosHandle(@ModelAttribute Bairro bairro,
			ModelMap map) {

		Cidade cidade = localRN.buscarCidadePorId(bairro.getCidade().getId());
		bairro.setCidade(cidade);

		Estado estado = localRN.buscarEstadoPorId(bairro.getEstado().getId());
		bairro.setEstado(estado);

		// atualizar bairro
		localRN.atualizarBairro(bairro);
		return PAG_LISTA_ESTADOS;
	}

	/**
	 * Mostra a pagina de remocao bairro
	 * 
	 * @param id
	 * @param map
	 * @return pagina de confirmacao
	 */
	@RequestMapping(value = "/remover-bairro", method = RequestMethod.GET)
	public String removerBairro(@RequestParam Long id, ModelMap map) {
		Bairro bairro = localRN.buscarBairroPorId(id);
		map.put("bairro", bairro);
		return "admin/locais/remover-bairro";
	}

	/**
	 * Tenta remover o bairro
	 * 
	 * @param cidade
	 * @param map
	 * @return pagina de listagem de estados caso a remocao aconteca, ou pagina
	 *         de erro
	 */
	@RequestMapping(value = "/remover-bairro-handle", method = RequestMethod.POST)
	public String removerBairroHandle(@ModelAttribute Bairro bairro,
			ModelMap map) {

		try {
			localRN.removerBairro(bairro.getId());
			return PAG_LISTA_ESTADOS;
		} catch (Exception e) {
			String mensagemErro = "<br/><br/> stack trace: <br/>"
					+ ExceptionUtils.getStackTrace(e);
			e.printStackTrace();
			map.put("mensagemErro", mensagemErro);
			return PAG_LOCAIS_ERRO;
		}

	}

}
