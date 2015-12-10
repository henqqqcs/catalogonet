package com.catalogonet.controller.publico;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.catalogonet.model.Usuario;

@Controller
public class LoginController {

	@Autowired
	private AuthenticationProvider auth;

	@RequestMapping("/login")
	public String loginRegisterForm(ModelMap map) {
		if (map.get("usuarioRegistro") == null) {
			map.put("usuarioRegistro", new Usuario());
		}
		return "publico/geral/login_register_form";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String customLogin(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request, ModelMap map) {
		
		
		String referrer = request.getHeader("Referer");
		System.out.println("Url que veio antes: " + referrer);

		System.out.println("Chamou o post!!");

		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
		auth.authenticate(token);

		return "redirect:/";
	}

	// Spring Security see this:
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "emailJaCadastrado", required = false) String emailJaCadastrado, ModelMap map) {

		if (error != null) {
			map.put("error", "Ops! Esse usuário não foi encontrado, verique seu email e senha.");
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

}
