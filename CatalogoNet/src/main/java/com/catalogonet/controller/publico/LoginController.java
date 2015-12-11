package com.catalogonet.controller.publico;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.catalogonet.model.Usuario;

@Controller
public class LoginController {


	@RequestMapping("/login")
	public String loginRegisterForm(ModelMap map) {
		if (map.get("usuarioRegistro") == null) {
			map.put("usuarioRegistro", new Usuario());
		}
		return "publico/geral/login_register_form";
	}

	// Spring Security see this:
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "denied", required = false) String denied,
			@RequestParam(value = "emailJaCadastrado", required = false) String emailJaCadastrado, ModelMap map) {

		if (error != null) {
			map.put("error", "Ops! Esse usuário não foi encontrado, verique seu email e senha.");
		}

		if (logout != null) {
			map.put("msg", "Você fez logout.");
		}
		
		if (denied != null) {
			map.put("denied", "Acesso negado.");
		}

		if (emailJaCadastrado != null) {
			map.put("emailJaCadastrado", "Este email já está sendo utilizado.");
		}

		if (map.get("usuarioRegistro") == null) {
			map.put("usuarioRegistro", new Usuario());
		}

		return "publico/geral/login_register_form";

	}

}
