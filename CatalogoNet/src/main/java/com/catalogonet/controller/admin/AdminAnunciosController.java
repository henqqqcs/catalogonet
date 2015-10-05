package com.catalogonet.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.catalogonet.anuncio.Anuncio;
import com.catalogonet.anuncio.AnuncioRN;
import com.catalogonet.email.MandadorEmail;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;

@Controller
@RequestMapping("/adminadmin/anuncios")
public class AdminAnunciosController {

	@Autowired
	private AnuncioRN anuncioRN;

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private MandadorEmail mandadorEmail;

	@RequestMapping("/lista-anuncios-aprovacao")
	public String listaCategorias(ModelMap map) {

		List<Anuncio> listaAnuncios = anuncioRN
				.listarAnunciosGratuitosNaoAprovados();
		map.put("listaAnuncios", listaAnuncios);

		return "admin/anuncio/anuncio-lista-aprovacao";
	}

	@RequestMapping(value = "/visualizar-anuncio-aprovacao", method = RequestMethod.GET)
	public String visualizarAnuncioAprovacao(@RequestParam Long id, ModelMap map) {

		Anuncio anuncio = anuncioRN.buscarPorId(id);
		map.put("anuncio", anuncio);
		return "admin/anuncio/anuncio-visualizar-aprovacao";
	}

	@RequestMapping(value = "/aprovar-anuncio", method = RequestMethod.GET)
	public String aprovarAnuncio(@RequestParam Long id, ModelMap map) {

		Anuncio anuncio = anuncioRN.buscarPorId(id);
		Usuario usuario = anuncioRN.buscarUsuarioDoAnuncio(id);
		// ativa anuncio
		anuncio.setAtivo(true);
		anuncio.setVerificado(true);
		anuncio.setAprovado(true);
		anuncioRN.atualizar(anuncio);

		mandadorEmail.mandarEmailAprovacaoDeAnuncio(usuario, anuncio);

		return "redirect:/adminadmin/anuncios/lista-anuncios-aprovacao";
	}

	@RequestMapping(value = "/reprovar-anuncio", method = RequestMethod.GET)
	public String reprovarAnuncio(@RequestParam Long id, ModelMap map) {

		Anuncio anuncio = anuncioRN.buscarPorId(id);
		Usuario usuario = anuncioRN.buscarUsuarioDoAnuncio(id);

		// foi verificado
		anuncio.setVerificado(true);
		anuncio.setAprovado(false);

		// enviar email
		mandadorEmail.mandarEmailReprovacaoDeAnuncio(usuario, anuncio);
		return "redirect:/adminadmin/anuncios/lista-anuncios-aprovacao";
	}

	@RequestMapping("/busca-anuncio")
	public String anuncioBusca(ModelMap map) {
		return "admin/anuncio/busca-anuncio";
	}

	@RequestMapping(value = "/busca-titulo-handle", method = RequestMethod.GET)
	public String buscarAnuncioTitulo(@RequestParam String titulo, ModelMap map) {

		List<Anuncio> listaAnuncios = anuncioRN.buscarPorParteTitulo(titulo);
		map.put("listaAnuncios", listaAnuncios);

		int tamanho = listaAnuncios.size();
		map.put("resultado", tamanho);

		return "admin/anuncio/busca-anuncio";

	}

}
