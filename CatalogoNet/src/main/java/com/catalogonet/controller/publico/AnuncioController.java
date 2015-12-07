package com.catalogonet.controller.publico;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catalogonet.model.Anuncio;
import com.catalogonet.model.FileMeta;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.ImagemRN;

@Controller
@RequestMapping("/anuncio")
public class AnuncioController {
	
	@Autowired
	private AnuncioRN anuncioRN;
	
	@Autowired
	private ImagemRN imagemRN;
	
	@RequestMapping(value = {"", "/"})
	public String anuncioPagInicial() {
		return "redirect:/";
	}

	@RequestMapping(value = "{titulo}-{categoria}-{bairro}-{cidade}-{estadoId}-{id}")
	public String mostraAnuncio(@PathVariable("titulo") String titulo, @PathVariable("categoria") String categoria,
			@PathVariable("bairro") String bairro, @PathVariable("cidade") String cidade, @PathVariable("estadoId") String estadoId,
			@PathVariable("id") String id, ModelMap map) {

		Anuncio anuncio;
		try {
			Long idLong = Long.valueOf(id);
			anuncio = anuncioRN.buscarPorId(idLong);
			map.put("anuncio", anuncio);
		} catch (NumberFormatException e) {
			System.out.println("String do id nao pode ser convertida para um Long");
			List<Anuncio> lista = anuncioRN.buscarPorTituloInteiro(titulo);
			anuncio = lista.get(0);
			map.put("anuncio", anuncio);
		}

		StringBuilder sb = new StringBuilder();
		StringBuilder desc = new StringBuilder();
		StringBuilder tit = new StringBuilder();
		if (anuncio != null) {
			sb.append(anuncio.getTitulo()).append(",").append("telefone").append(",").append("endere�o").append(",")
					.append(anuncio.getBairro().getNome()).append(",").append(anuncio.getCidade().getNome()).append(",")
					.append(anuncio.getEstado().getNome()).append(",").append(anuncio.getEstado().getId());

			desc.append("Venha conhecer ").append(anuncio.getTitulo())
					.append(", veja o telefone, endere�o, site, e outras formas de contato. Especializado em ")
					.append(anuncio.getCategoria().getNome()).append(", localizado em ").append(anuncio.getBairro().getNome()).append(",")
					.append(anuncio.getCidade().getNome()).append(",").append(anuncio.getEstado().getId());

			tit.append(anuncio.getTitulo()).append(" - ").append(anuncio.getBairro().getNome()).append(" - ").append(anuncio.getCidade().getNome())
					.append(" - ").append(anuncio.getEstado().getId());

		}
		String keywords = sb.toString();
		String description = desc.toString();
		String tittle = tit.toString();
		map.put("keywords", keywords);
		map.put("description", description);
		map.put("tittle", tittle);
		map.put("termoBusca", anuncio.getTitulo());
		map.put("termoLocal", anuncio.getBairro().getNome());
		
		
		//imagens
		List<FileMeta> listaImagens = imagemRN.listarImagensDoAnuncio(anuncio.getId());
		map.put("listaImagens", listaImagens);

		return "publico/anuncio/mostra_anuncio";

	}
	@RequestMapping(value = "{titulo}-{categoria}-{cidade}-{estadoId}-{id}")
	public String mostraAnuncioSemBairro(@PathVariable("titulo") String titulo, @PathVariable("categoria") String categoria, @PathVariable("cidade") String cidade, @PathVariable("estadoId") String estadoId,
			@PathVariable("id") String id, ModelMap map) {
		
		Anuncio anuncio;
		try {
			Long idLong = Long.valueOf(id);
			anuncio = anuncioRN.buscarPorId(idLong);
			map.put("anuncio", anuncio);
		} catch (NumberFormatException e) {
			System.out.println("String do id nao pode ser convertida para um Long");
			List<Anuncio> lista = anuncioRN.buscarPorTituloInteiro(titulo);
			anuncio = lista.get(0);
			map.put("anuncio", anuncio);
		}
		
		StringBuilder sb = new StringBuilder();
		StringBuilder desc = new StringBuilder();
		StringBuilder tit = new StringBuilder();
		if (anuncio != null) {
			sb.append(anuncio.getTitulo()).append(",").append("telefone").append(",").append("endere�o").append(",")
			.append(anuncio.getBairro().getNome()).append(",").append(anuncio.getCidade().getNome()).append(",")
			.append(anuncio.getEstado().getNome()).append(",").append(anuncio.getEstado().getId());
			
			desc.append("Venha conhecer ").append(anuncio.getTitulo())
			.append(", veja o telefone, endere�o, site, e outras formas de contato. Especializado em ")
			.append(anuncio.getCategoria().getNome()).append(", localizado em ").append(anuncio.getBairro().getNome()).append(",")
			.append(anuncio.getCidade().getNome()).append(",").append(anuncio.getEstado().getId());
			
			tit.append(anuncio.getTitulo()).append(" - ").append(anuncio.getBairro().getNome()).append(" - ").append(anuncio.getCidade().getNome())
			.append(" - ").append(anuncio.getEstado().getId());
			
		}
		String keywords = sb.toString();
		String description = desc.toString();
		String tittle = tit.toString();
		map.put("keywords", keywords);
		map.put("description", description);
		map.put("tittle", tittle);
		map.put("termoBusca", anuncio.getTitulo());
		map.put("termoLocal", anuncio.getBairro().getNome());
		
		
		//imagens
		List<FileMeta> listaImagens = imagemRN.listarImagensDoAnuncio(anuncio.getId());
		map.put("listaImagens", listaImagens);
		return "publico/anuncio/mostra_anuncio";
		
	}
	
}
