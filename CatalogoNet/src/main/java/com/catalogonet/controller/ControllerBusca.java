package com.catalogonet.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.anuncio.Anuncio;
import com.catalogonet.busca.Busca;
import com.catalogonet.busca.Buscador;
import com.catalogonet.busca.ResultadoBusca;
import com.catalogonet.busca.ServicoResultadoPagination;

@Controller
@RequestMapping("/busca")
public class ControllerBusca {

	@Autowired
	private Buscador buscador; 
	
	@Autowired
	private ServicoResultadoPagination servicoResultadoPagination;

	@RequestMapping(value = "/buscaRequest")
	public String criaBuscaRequest(@RequestParam(value = "busca", required = false) String busca,
			@RequestParam(value = "local", required = false) String local, RedirectAttributes redirectAttrs) {

		if ((busca == null) || (busca.isEmpty())) {
			return "redirect:/";
		}

		Busca objBusca = new Busca();
		// set as termos na url, etc. etc. etc.
		objBusca.setStringBusca(busca);
		objBusca.setStringLocal(local);
		
		System.out.println("local: " + local);

		redirectAttrs.addAttribute("buscaNaUrl", objBusca.getTermoBuscaNaUrl());
		redirectAttrs.addAttribute("localNaUrl", objBusca.getTermoLocalNaUrl());

		redirectAttrs.addFlashAttribute("objBusca", objBusca);

		return "redirect:/busca/{buscaNaUrl}+{localNaUrl}";

	}

	@RequestMapping(value = "/{busca}")
	public String tratarBusca(@PathVariable("busca") String busca, ModelMap map) {

		long inicio = System.currentTimeMillis();

		// verifica se o objBusca no map nao  é nulo, caso não seja, veio do
		// criaBuscaRequest
		Busca objBusca = (Busca) map.get("objBusca");
		if (objBusca == null) {
			objBusca = identificarTermoBuscaLocal(busca);
		}

		// faz a busca
		// ResultadoBusca resultadoBusca = buscaRN.busca(objBusca);
		ResultadoBusca resultadoBusca = buscador.busca(objBusca);

		//adiciona o resultado da busca o servicoResultadoPagination
		servicoResultadoPagination.adicionaResultadoBusca(resultadoBusca.getId(), resultadoBusca);
		
		map = colocaDependeciasNoModelMap(map, resultadoBusca, 0);

		long fim = System.currentTimeMillis();
		System.out.println("A busca demorou: " + (fim - inicio));
		return "publico/anuncio/resultado_busca";

	}

	@RequestMapping(value = "/{busca}/pagina/{pagina}/{BuscaID}")
	public String tratarBuscaComPagina(@PathVariable("busca") String busca, @PathVariable("pagina") Integer pagina,
			@PathVariable("BuscaID") String BuscaID, ModelMap map) {
		
		// pega o resultado da busca ja feita
		ResultadoBusca resultadoBusca = servicoResultadoPagination.pegaResultadoBusca(BuscaID);
		
		//ve se ele ainda existe na memoria
		if (resultadoBusca == null) {
			return "redirect:/busca/" + busca;
		}
		
		map = colocaDependeciasNoModelMap(map, resultadoBusca, pagina);
		
		return "publico/resultado_busca";
	}

	private ModelMap colocaDependeciasNoModelMap(ModelMap map, ResultadoBusca resultadoBusca, int pagina) {

		//List<Anuncio> listaAnuncios = resultadoBusca.getListaAnuncios();
		
		/**
		 * Pagination
		 */
		
		PagedListHolder<Anuncio> pagedListHolder = new PagedListHolder<Anuncio>(resultadoBusca.getListaAnuncios());
		pagedListHolder.setPageSize(50);
		pagedListHolder.setPage(pagina);
		
		//pega lista de anuncios
		List<Anuncio> listaAnuncios = pagedListHolder.getPageList();
		
		map.put("BuscaID", resultadoBusca.getId());
		map.put("beginIndex", (pagedListHolder.getFirstLinkedPage() + 1));
		map.put("endIndex", (pagedListHolder.getLastLinkedPage() + 1));
		if (pagina == 0) {
			pagina++;
		}
		map.put("currentIndex", pagina);
		map.put("totalPages", ((resultadoBusca.getListaAnuncios().size()/50)+1));
		map.put("urlBusca", resultadoBusca.getUrlBusca());
		
		/**
		 * end pagination
		 */
		

		// seta o ${buscandoPorBuscaEmLocal} == pizzaria em Bras�lia, DF
		//String buscandoPorBuscaEmLocal = objBusca.getStringBusca();
		String buscandoPorBuscaEmLocal = resultadoBusca.getStringBusca();
		
		buscandoPorBuscaEmLocal = buscandoPorBuscaEmLocal + " em " + resultadoBusca.getStringLocal();
		map.put("buscandoPorBuscaEmLocal", buscandoPorBuscaEmLocal);

		// seta a busca original ${stringBusca} == farm�cia
		map.put("stringBusca", resultadoBusca.getStringBusca());

		// seta a ${stringLocal} que � a string do local original == Bras�lia,
		// DF
		map.put("stringLocal", resultadoBusca.getStringLocal());

		// seta a lista de anuncios
		map.put("listaAnuncios", listaAnuncios);

		// seta o cssId para modificar o css da caixa de resultados
		if (listaAnuncios.size() < 1) {
			map.put("cssId", "alert alert-danger");
			map.put("mensagem", "Sua busca não retornou nenhum resultado");

		} else {
			map.put("cssId", "alert alert-info");
			map.put("mensagem", "Retornou " + resultadoBusca.getListaAnuncios().size() + " resultado(s)");
		}

		// seta a lista de keywords
		map.put("keywords", resultadoBusca.getStringDeKeywords());

		return map;
	}

	private Busca identificarTermoBuscaLocal(String busca) {

		if ((busca == null) || (busca.isEmpty())) {
			return null;
		}
		Busca objBusca = new Busca();

		String termoBuscaNaUrl = StringUtils.substringBeforeLast(busca, "+");
		String termoLocalNaUrl = StringUtils.substringAfterLast(busca, "+");

		if ((termoLocalNaUrl == null) || (termoLocalNaUrl.isEmpty())) {
			objBusca.setExisteStringLocal(false);
		}
		
		//remove os tra�os pao-de-queijo
		String stringBusca =termoBuscaNaUrl.replaceAll("-", " ");
		String stringLocal = termoLocalNaUrl.replaceAll("-", " ");
		
		objBusca.setStringBusca(stringBusca);
		objBusca.setStringLocal(stringLocal);

		return objBusca;
	}

}
