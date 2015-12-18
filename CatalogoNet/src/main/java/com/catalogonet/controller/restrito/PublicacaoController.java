package com.catalogonet.controller.restrito;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.email.MandadorEmail;
import com.catalogonet.gerenciador.GerenciadorDePlano;
import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.UsuarioRN;
import com.catalogonet.validators.AnuncioValidator;

@Controller
@RequestMapping("/area-da-empresa/meus-anuncios")
@SessionAttributes("anuncio")
public class PublicacaoController {

	@Autowired
	private UsuarioRN usuarioRN;
	
	@Autowired
	private AnuncioRN anuncioRN;
	
	@Autowired
	private AnuncioValidator anuncioValidator;

	@Autowired
	private GerenciadorDePlano gerenciadorAnuncio;
	
	@Autowired
	private MandadorEmail mandadorEmail;

	@InitBinder("anuncio")
	public void dataBinding(WebDataBinder binder) {
		binder.setValidator(anuncioValidator);
	}

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/publicar")
	public String publicarAnuncio(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, @ModelAttribute("anuncio") Anuncio anuncio,
			RedirectAttributes redirectAttrs, BindingResult result, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		// verifica se o anuncio pertence ao usuario
		if (anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio) == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}

		map.put("anucio", anuncio);
		
		//verifica se o anuncio ja esta publicado
		if (anuncio.isAtivo() && anuncio.getPlano().isAtivo()) {
			System.out.println("|-- anuncio ja esta publicado");
		}

		Map<String, String> mapaInformacoes = new HashMap<String, String>();
		Map<String, String> mapaLocalizacao = new HashMap<String, String>();
		Map<String, String> mapaCategoria = new HashMap<String, String>();
		Map<String, String> mapaTags = new HashMap<String, String>();

		// valida informacao
		anuncioValidator.validateInformacoes(anuncio, result);
		if (result.hasErrors()) {
			for (FieldError f : result.getFieldErrors()) {
				mapaInformacoes.put(f.getField(), f.getDefaultMessage());
			}
		}

		// valida localizacao
		anuncioValidator.validateLocalizacao(anuncio, result);
		if (result.hasErrors()) {
			for (FieldError f : result.getFieldErrors()) {
				if (!mapaInformacoes.containsKey(f.getField()))
					mapaLocalizacao.put(f.getField(), f.getDefaultMessage());
			}
		}

		// valida categoria
		anuncioValidator.validateCategorias(anuncio, result);
		if (result.hasErrors()) {
			for (FieldError f : result.getFieldErrors()) {
				if (!mapaInformacoes.containsKey(f.getField()) && !mapaLocalizacao.containsKey(f.getField()))
					mapaCategoria.put(f.getField(), f.getDefaultMessage());
			}
		}

		// valida tags
		anuncioValidator.validateTags(anuncio, result);
		if (result.hasErrors()) {
			for (FieldError f : result.getFieldErrors()) {
				if (!mapaInformacoes.containsKey(f.getField()) && !mapaLocalizacao.containsKey(f.getField())
						&& !mapaCategoria.containsKey(f.getField()))
					mapaTags.put(f.getField(), f.getDefaultMessage());
			}
		}

		if (mapaInformacoes.isEmpty() && mapaLocalizacao.isEmpty() && mapaCategoria.isEmpty() && mapaTags.isEmpty()) {
			gerenciadorAnuncio.publicarAnuncio(anuncio);
			mandadorEmail.mandarEmailAnuncioPublicado(usuario, anuncio);
			return "/restrito/anuncio/gerenciar_anuncio/publicar";
		}

		map.put("mapaInformacoes", mapaInformacoes);
		map.put("mapaLocalizacao", mapaLocalizacao);
		map.put("mapaCategoria", mapaCategoria);
		map.put("mapaTags", mapaTags);

		return "/restrito/anuncio/gerenciar_anuncio/publicar_erro";
	}

}
