package com.catalogonet.controller.restrito;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.gerenciador.GerenciadorDePlano;
import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Plano;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.AnuncioRN;
import com.catalogonet.negocio.PlanoRN;
import com.catalogonet.negocio.UsuarioRN;
import com.catalogonet.plano.RegraAplicacaoPlano;
import com.catalogonet.plano.ResultadoAplicacaoPlano;

@Controller
@RequestMapping("/area-da-empresa/meus-planos")
public class PlanoController {

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private GerenciadorDePlano gerenciadorDePlano;

	@Autowired
	private PlanoRN planoRN;

	@Autowired
	private AnuncioRN anuncioRN;

	@RequestMapping("/comecar-plano/{idPlano}")
	public String comecarPlano(@PathVariable("idPlano") String idPlano, ModelMap map) {

		// verifica se o plano pertence ao usuario logado
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Plano plano = planoRN.buscarPorId(Long.valueOf(idPlano));
		if (!plano.getUsuario().equals(usuario)) {
			return "redirect:/area-da-empresa";
		}

		// verifica se existem erros na aplicacao do anuncio
		ResultadoAplicacaoPlano resultado = (ResultadoAplicacaoPlano) map.get("ResultadoAplicacaoPlano");
		if (resultado != null) {
			List<RegraAplicacaoPlano> listaRegras = resultado.getListaRegras();
			System.out.println("Existem regras no ResultadoAplicacaoPlano");
			for (RegraAplicacaoPlano regra : listaRegras) {
				map.put(regra.toString(), regra.toString());
			}
		}
		
		
		// perguntar ao usuario se deseja atribuir a um anuncio ja existente ou
		// criar um novo anuncio
		List<Anuncio> listaAnuncios = anuncioRN.listarAnunciosDoUsuario(usuario.getId());
		if (listaAnuncios.isEmpty()) {

			// comecar o plano
			gerenciadorDePlano.comecarPlano(plano);

			Anuncio anuncio = plano.getAnuncio();
			return "redirect:/area-da-empresa/meus-anuncios/" + anuncio.getTituloNaUrl() + "/" + anuncio.getId();

		}

		// usuario ja possui anuncios
		// perguntar se deve atribuir o plano a um ja existente ou criar um novo
		// anuncio
		map.put("idPlanoPretendido", plano.getId());
		map.put("listaAnuncios", listaAnuncios);
		return "restrito/plano/comecar_plano";
	}

	@RequestMapping("/aplicar-plano/{idPlanoPretendido}/anuncio/{idAnuncio}")
	public String aplicarPlano(@PathVariable("idPlanoPretendido") String idPlanoPretendido,
			@PathVariable("idAnuncio") String idAnuncio, RedirectAttributes redirectAttributes, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		Plano planoPretendido = planoRN.buscarPorId(Long.valueOf(idPlanoPretendido));
		Anuncio anuncio = anuncioRN.buscarPorId(Long.valueOf(idAnuncio));

		if (usuario == null || planoPretendido == null || anuncio == null) {
			System.out.println("(usuario == null || plano == null || anuncio == null)");
			return "redirect:/area-da-empresa";
		}

		// verificar se o plano pertence ao usuario
		if (!planoPretendido.getUsuario().equals(usuario)) {
			System.out.println("Plano nao pertence ao usuario");
			return "redirect:/area-da-empresa";
		}

		// verificar se o anuncio pertence ao usuario
		if (anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), anuncio.getId()) == null) {
			System.out.println("anuncioRN.buscarAnuncioDoUsuario(usuario.getId(), anuncio.getId()) == null");
			return "redirect:/area-da-empresa";
		}

		ResultadoAplicacaoPlano resultado = gerenciadorDePlano.aplicarPlanoAoAnuncio(planoPretendido, anuncio);
		if (!resultado.isAprovado()) {
			System.out.println("Nao foi aprovado");
			// resultado da verificacao
			redirectAttributes.addFlashAttribute("ResultadoAplicacaoPlano", resultado);
			return "redirect:/area-da-empresa/meus-planos/comecar-plano/" + planoPretendido.getId();
		}

		return "redirect:/area-da-empresa/meus-anuncios/" + anuncio.getTituloNaUrl() + "/" + anuncio.getId();
	}

}
