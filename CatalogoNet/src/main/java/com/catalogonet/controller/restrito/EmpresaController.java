package com.catalogonet.controller.restrito;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.anuncio.Anuncio;
import com.catalogonet.anuncio.AnuncioRN;
import com.catalogonet.pedido.Pedido;
import com.catalogonet.pedido.PedidoRN;
import com.catalogonet.plano.PlanoAnuncio;
import com.catalogonet.plano.PlanoRN;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;

@Controller
@RequestMapping("/area-da-empresa")
@SessionAttributes("usuario")
public class EmpresaController {

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private AnuncioRN anuncioRN;

	@Autowired
	private PedidoRN pedidoRN;

	@Autowired
	private PlanoRN planoRN;

	@RequestMapping(value = { "", "/", "/home" })
	public String areaDaEmpresaHome(ModelMap map) {
		if (map.get("usuario") == null) {
			Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
			map.put("usuario", usuario);
		}
		return "restrito/home";
	}

	@RequestMapping("/meus-anuncios")
	public String meusAnuncios(ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		if (usuario != null) {
			List<Anuncio> lista = anuncioRN.listarAnunciosUsuario(usuario
					.getId());
			map.put("listaAnuncios", lista);
		} else {
			return "redirect:/login";
		}
		return "restrito/meus_anuncios";
	}

	@RequestMapping("/meus-dados")
	public String areaDaEmpresaMeusDados(ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		map.put("usuario", usuario);
		map.remove("mensagem");
		return "restrito/meus_dados";
	}

	@RequestMapping("/meus-pedidos")
	public String areaDaEmpresaMeusPedidos(ModelMap map) {
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		List<Pedido> listaPedidos = pedidoRN.listarPedidoUsuario(usuario
				.getId());
		map.put("listaPedidos", listaPedidos);
		return "restrito/meus_pedidos";
	}

	@RequestMapping("/meus-cupons")
	public String meusCupons(ModelMap map) {
		return "restrito/meus_cupons";
	}

	@RequestMapping("/meus-planos")
	public String areaDaEmpresaMeusPlanos(ModelMap map) {
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		List<PlanoAnuncio> listaPlanos = planoRN
				.listarPlanoAnuncioUsuario(usuario.getId());
		
		map.put("listaPlanos", listaPlanos);
		return "restrito/meus_planos";
	}

	@RequestMapping(value = "/atualizar-dados", method = RequestMethod.POST)
	public String atualizarUsuario(
			@ModelAttribute("usuario") @Valid Usuario usuario,
			BindingResult result, ModelMap map) {
		
		if (result.hasErrors()) {
			map.put("danger", "danger");
			return "restrito/meus_dados";
		}
		usuarioRN.atualizar(usuario);
		map.put("success", "sucess");
		return "restrito/meus_dados";
	}

	@RequestMapping("/alterar-senha")
	public String mostraSenhaForm(ModelMap map) {
		return "restrito/usuario/alterar_senha";
	}

	@RequestMapping("/alterar-senha-handle")
	public String tratarAlterarSenha(
			@RequestParam(value = "senhaAtual", required = true) String senhaAtual,
			@RequestParam(value = "novaSenha", required = true) String novaSenha,
			@RequestParam(value = "confirmarNovaSenha", required = true) String confirmarNovaSenha,
			ModelMap map, RedirectAttributes redirectAttrs) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		if ((usuario.getSenha() != null) && (senhaAtual != null)
				&& (!senhaAtual.equals(usuario.getSenha()))) {
			redirectAttrs.addFlashAttribute("dangerSenhaAtual",
					"dangerSenhaAtual");
			return "redirect:/area-da-empresa/alterar-senha";
		}

		if ((novaSenha != null) && (confirmarNovaSenha != null)
				&& (!novaSenha.equals(confirmarNovaSenha))) {
			redirectAttrs.addFlashAttribute("dangerConfirmarSenha",
					"dangerConfirmarSenha");
			return "redirect:/area-da-empresa/alterar-senha";
		}

		// setar nova senha
		usuario.setSenha(novaSenha);

		// atualizar usuario
		usuarioRN.atualizar(usuario);

		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/alterar-senha";
	}

	@RequestMapping("/alterar-email")
	public String mostraEmailForm(ModelMap map) {
		return "restrito/usuario/alterar_email";
	}

	@RequestMapping("/alterar-email-handle")
	public String tratarAlterarEmail(
			@RequestParam(value = "senha", required = true) String senha,
			@RequestParam(value = "novoEmail", required = true) String novoEmail,
			@RequestParam(value = "confirmarNovoEmail", required = true) String confirmarNovoEmail,
			RedirectAttributes redirectAttrs, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);

		// coloca dados do usuario nos inputs
		redirectAttrs.addFlashAttribute("novoEmail", novoEmail);
		redirectAttrs.addFlashAttribute("confirmarNovoEmail",
				confirmarNovoEmail);

		// verifica se esse email já existe
		if (usuarioRN.buscarPorEmail(novoEmail) != null) {
			redirectAttrs.addFlashAttribute("dangerEmailUtilizado",
					"dangerEmailUtilizado");
			return "redirect:/area-da-empresa/alterar-email";
		}

		// verifica se a senha esta correta
		if (!usuario.getSenha().equals(senha)) {
			redirectAttrs.addFlashAttribute("dangerSenhaIncorreta",
					"dangerSenhaIncorreta");
			return "redirect:/area-da-empresa/alterar-email";
		}

		// verifica se o email bate
		if ((!novoEmail.equals(confirmarNovoEmail))) {
			redirectAttrs.addFlashAttribute("dangerEmailConfirmar",
					"dangerEmailConfirmar");
			return "redirect:/area-da-empresa/alterar-email";
		}

		// atualiza email
		usuario.setEmail(novoEmail);
		usuarioRN.atualizar(usuario);

		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/alterar-email";
	}

}
