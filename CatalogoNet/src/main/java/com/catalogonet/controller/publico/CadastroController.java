package com.catalogonet.controller.publico;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.email.MandadorEmail;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;
import com.catalogonet.validators.UsuarioValidator;

@Controller
public class CadastroController {

	@Autowired
	private MandadorEmail mandadorEmail;

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private UsuarioValidator usuarioValidator;

	@InitBinder("usuario")
	public void dataBinding(WebDataBinder binder) {
		binder.setValidator(usuarioValidator);
	}

	@RequestMapping("/cadastro")
	public String cadastroPagina(@RequestParam(value = "email-register", required = false) String email,
			@RequestParam(value = "emailJaCadastrado", required = false) String emailJaCadastrado, ModelMap map) {

		if ((email != null) && (!email.isEmpty())) {
			Usuario u = usuarioRN.buscarPorEmail(email);
			// ja existe um usuario com este email
			if (u != null) {
				return "redirect:/login?emailJaCadastrado";
			}
			map.put("email", email);
		}

		// mensagem de email ja cadastrado
		if (emailJaCadastrado != null) {
			map.put("emailJaCadastrado", emailJaCadastrado);
		}
		
		if (!map.containsAttribute("usuario")) {
			map.put("usuario", new Usuario());
		}

		return "publico/geral/cadastro";
	}

	@RequestMapping(value = "/cadastro-usuario-handle", method = RequestMethod.POST)
	public String adicionaUsuario(@ModelAttribute("usuario") @Valid Usuario usuario, Errors errors,
			BindingResult result, HttpServletRequest request, RedirectAttributes redirectAttributes, ModelMap map) {

		Usuario u = usuarioRN.buscarPorEmail(usuario.getEmail());
		boolean usuarioJaExiste = false;
		// ja existe um usuario com este email
		if (u != null) {
			usuarioJaExiste = true;
			errors.rejectValue("email", "", "Este email: " + u.getEmail() + " já esta sendo utilizado.");
		}

		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("usuario", usuario);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.usuario", result);
		}
		
		//redireciona caso tenha erro
		if ((usuarioJaExiste) || (result.hasErrors())) {
			if (usuarioJaExiste) {
				return "redirect:/cadastro?emailJaCadastrado=" + usuario.getEmail();
			} else {
				return "redirect:/cadastro";
			}
		}

		// salva o usuario
		usuarioRN.adicionar(usuario);

		// mandar email de cadastro
		mandadorEmail.mandarEmailDeCadastro(usuario);

		// faz a autenticacao desse usuario e redireciona para home!
		boolean fezLogin = usuarioRN.autenticaUsuarioEColocaNaSessao(usuario, request);
		if (fezLogin) {
			return "redirect:/area-da-empresa";
		}

		// caso o login nao de certo redireciona para pagina de login?
		return "publico/login_register_form";
	}
	
}
