package com.catalogonet.controller.restrito;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.email.MandadorEmail;
import com.catalogonet.gerenciador.GerenciadorDePlano;
import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.UsuarioRN;
import com.catalogonet.validators.AnuncioValidator;
import com.catalogonet.validators.ResultadoValidacaoAnuncio;

@Controller
@RequestMapping("/area-da-empresa/meus-anuncios")
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

	@RequestMapping("/{tituloNaUrl}/{idAnuncio}/publicar")
	public String publicarAnuncio(@PathVariable("tituloNaUrl") String tituloNaUrl,
			@PathVariable("idAnuncio") Long idAnuncio, RedirectAttributes redirectAttrs, ModelMap map) {

		Anuncio anuncio = anuncioRN.buscarPorId(idAnuncio);
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		// verifica se o anuncio pertence ao usuario
		if (anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), idAnuncio) == null) {
			return "redirect:/area-da-empresa/meus-anuncios";
		}
		
		// verifica se o anuncio ja esta publicado
		if (anuncio.isAtivo() && anuncio.getPlano().isAtivo()) {
			System.out.println("|-- anuncio ja esta publicado");
		}

		//faz a validacao do anuncio
		ResultadoValidacaoAnuncio resultadoValidacao = anuncioValidator.validate(anuncio);

		if (resultadoValidacao.isAprovado()) {
			gerenciadorAnuncio.publicarAnuncio(anuncio);
			mandadorEmail.mandarEmailAnuncioPublicado(usuario, anuncio);
			return "/restrito/anuncio/gerenciar_anuncio/publicar";
		}

		
		 map.put("mapaInformacoes", resultadoValidacao.getMapaInformacoes());
		 map.put("mapaLocalizacao", resultadoValidacao.getMapaLocalizacao());
		 map.put("mapaCategoria", resultadoValidacao.getMapaCategoria());
		 map.put("mapaTags", resultadoValidacao.getMapaTags());
		 map.put("anuncio", anuncio);
		
		 return "/restrito/anuncio/gerenciar_anuncio/publicar_erro";

	}

}
