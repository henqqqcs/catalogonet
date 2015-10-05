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

import com.catalogonet.email.MandadorEmail;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;
import com.catalogonet.usuario.UsuarioValidator;

@Controller
public class LoginCadastroController {

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
	
	
	@RequestMapping("/login")
	public String loginRegisterForm(ModelMap map) {
		if (map.get("usuarioRegistro") == null) {
			map.put("usuarioRegistro", new Usuario());
		}
		return "publico/geral/login_register_form";
	}

	// Spring Security see this:
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "emailJaCadastrado", required = false) String emailJaCadastrado,
			ModelMap map) {

		if (error != null) {
			map.put("error",
					"Ops! Esse usuário não foi encontrado, verique seu email e senha.");
		}

		if (logout != null) {
			map.put("msg", "Você fez logout.");
		}
		
		if (emailJaCadastrado != null) {
			map.put("emailJaCadastrado", "Este email já está sendo utilizado.");
		}

		if (map.get("usuarioRegistro") == null) {
			map.put("usuarioRegistro", new Usuario());
		}

		return "publico/geral/login_register_form";

	}
	
	@RequestMapping("/cadastro")
	public String cadastroPagina(@RequestParam(value = "email-register", required = false) String email, ModelMap map) {
		
		
		if ((email != null)&&(!email.isEmpty())) {
			Usuario usuario = usuarioRN.buscarPorEmail(email);
			
			//ja existe um usuario com este email
			if (usuario != null) {
				return "redirect:/login?emailJaCadastrado";
			}
			
			map.put("email", email);
			
		}
		
		Usuario usuario = new Usuario();
		map.put("usuario", usuario);
		
		return "publico/geral/cadastro";
	}
	
	
	@RequestMapping(value = "/cadastro-usuario-handle", method = RequestMethod.POST)
	public String adicionaUsuario(@ModelAttribute("usuario") @Valid Usuario usuario, Errors errors,
			BindingResult result, HttpServletRequest request, ModelMap map) {
		
		if (result.hasErrors()) {
			System.out.println("usuario validator RESULT HAS ERRORS");
			map.put("usuario", usuario);
			map.put("errors", "errors");
			return "publico/geral/cadastro";
			
			
		}

		// salva o usuario
		usuarioRN.adicionar(usuario);

		//mandar email de cadastro
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
