package com.catalogonet.controller.restrito;

import java.util.HashMap;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;
import com.catalogonet.validators.UsuarioValidator;
import com.catalogonet.validators.UsuarioValidatorUpdate;

@Controller
@RequestMapping("/area-da-empresa/meus-dados")
@SessionAttributes("usuario")
public class MeusDadosController {

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private MessageSource messageSource;
	private Locale locale = new Locale("pt", "BR");

	@Autowired
	private UsuarioValidatorUpdate usuarioValidatorUpdate;
	
	@Autowired
	private UsuarioValidator usuarioValidator;

	@InitBinder("usuario")
	public void dataBinding(WebDataBinder binder) {
		binder.setValidator(usuarioValidator);
	}
	
	@RequestMapping("/alterar-perfil")
	public String mostraPerfilForm(ModelMap map) {
		
		
		Usuario usuarioUpdate = (Usuario) map.get("usuarioUpdate");
		if (usuarioUpdate == null) {
			Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
			map.put("usuarioUpdate", usuario);
		}
		
		return "restrito/usuario/alterar_perfil";
	}
	
	@RequestMapping(value = "/alterar-perfil-handle", method = RequestMethod.POST)
	public String atualizarUsuario(@ModelAttribute("usuarioUpdate") Usuario usuarioUpdate, Errors errors, BindingResult result, RedirectAttributes redirectAttrs,
			ModelMap map) {
		
		
		usuarioValidator.validatePerfilUpdate(usuarioUpdate, errors);

		if (result.hasErrors()) {
			redirectAttrs.addFlashAttribute("danger", "danger");
			redirectAttrs.addFlashAttribute("usuarioUpdate", usuarioUpdate);
			redirectAttrs.addFlashAttribute("org.springframework.validation.BindingResult.usuarioUpdate", result);
			
			return "redirect:/area-da-empresa/meus-dados/alterar-perfil";
		}
		
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		
		//atualizar usuario
		usuario.setNome(usuarioUpdate.getNome());
		usuario.setCpf(usuarioUpdate.getCpf());
		usuario.setTelefone1(usuarioUpdate.getTelefone1());
		usuario.setTelefone2(usuarioUpdate.getTelefone2());
		
		//endereco
		usuario.setEndereco(usuarioUpdate.getEndereco());
		
		//atualizar usuario
		usuarioRN.atualizar(usuario);
		
		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-dados/alterar-perfil";
	}

	@RequestMapping("/alterar-email")
	public String mostraEmailForm(ModelMap map) {
		return "restrito/usuario/alterar_email";
	}

	@RequestMapping(value = "/alterar-email-handle", method = RequestMethod.POST)
	public String tratarAlterarEmail(@RequestParam(value = "senha", required = false) String senha,
			@RequestParam(value = "novoEmail", required = false) String novoEmail,
			@RequestParam(value = "confirmarNovoEmail", required = false) String confirmarNovoEmail,
			RedirectAttributes redirectAttrs, HttpServletRequest request, ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);

		// validar
		HashMap<String, String> mapaErros = usuarioValidatorUpdate.validateAtualizarEmail(novoEmail, confirmarNovoEmail,
				senha);

		if (senha != null) {
			if (!usuario.getSenha().equals(senha)) {
				mapaErros.put("senhaNull", messageSource.getMessage("usuario.senha.incorreta", null, locale));
			}
		}

		Set<String> setErros = mapaErros.keySet();
		if (setErros.size() > 0) {
			redirectAttrs.addFlashAttribute("error", messageSource.getMessage("usuario.erro.formulario", null, locale));
		}
		for (String key : setErros) {
			redirectAttrs.addFlashAttribute(key, mapaErros.get(key));
		}

		// coloca dados do usuario nos inputs
		redirectAttrs.addFlashAttribute("novoEmail", novoEmail);
		redirectAttrs.addFlashAttribute("confirmarNovoEmail", confirmarNovoEmail);

		// verifica se esse email já existe
		if (usuarioRN.buscarPorEmail(novoEmail) != null) {
			redirectAttrs.addFlashAttribute("dangerEmailUtilizado", "dangerEmailUtilizado");
			return "redirect:/area-da-empresa/meus-dados/alterar-email";
		}

		// retornar erros
		if (setErros.size() > 0) {
			return "redirect:/area-da-empresa/meus-dados/alterar-email";
		}

		// atualiza email
		usuario.setEmail(novoEmail);
		usuarioRN.atualizar(usuario);

		// autentica novo usario
		usuarioRN.autenticaUsuarioEColocaNaSessao(usuario, request);

		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-dados/alterar-email";
	}

	@RequestMapping("/alterar-senha")
	public String mostraSenhaForm(ModelMap map) {
		return "restrito/usuario/alterar_senha";
	}

	@RequestMapping(value = "/alterar-senha-handle", method = RequestMethod.POST)
	public String tratarAlterarSenha(@RequestParam(value = "senhaAtual", required = false) String senhaAtual,
			@RequestParam(value = "novaSenha", required = false) String novaSenha,
			@RequestParam(value = "confirmarNovaSenha", required = false) String confirmarNovaSenha, ModelMap map,
			RedirectAttributes redirectAttrs) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		
		boolean erro = false;
		if ((senhaAtual == null) || (senhaAtual.isEmpty())) {
			redirectAttrs.addFlashAttribute("senhaAtualNull", "senhaAtualNull");
			erro = true;
		}
		if ((novaSenha == null) || (novaSenha.isEmpty())) {
			redirectAttrs.addFlashAttribute("novaSenhaNull", "novaSenhaNull");
			erro = true;
		}
		if ((confirmarNovaSenha == null) || (confirmarNovaSenha.isEmpty())) {
			redirectAttrs.addFlashAttribute("confirmarNovaSenhaNull", "confirmarNovaSenhaNull");
			erro = true;
		}
		
		
		if (erro) {
			return "redirect:/area-da-empresa/meus-dados/alterar-senha";
		}
		
		if ((usuario.getSenha() != null) && (senhaAtual != null) && (!senhaAtual.equals(usuario.getSenha()))) {
			redirectAttrs.addFlashAttribute("dangerSenhaAtual", "dangerSenhaAtual");
			return "redirect:/area-da-empresa/meus-dados/alterar-senha";
		}

		if ((novaSenha != null) && (confirmarNovaSenha != null) && (!novaSenha.equals(confirmarNovaSenha))) {
			redirectAttrs.addFlashAttribute("dangerConfirmarSenha", "dangerConfirmarSenha");
			return "redirect:/area-da-empresa/meus-dados/alterar-senha";
		}

		// setar nova senha
		usuario.setSenha(novaSenha);

		// atualizar usuario
		usuarioRN.atualizar(usuario);

		redirectAttrs.addFlashAttribute("success", "success");
		return "redirect:/area-da-empresa/meus-dados/alterar-senha";
	}

	// =====================================================================================


}
