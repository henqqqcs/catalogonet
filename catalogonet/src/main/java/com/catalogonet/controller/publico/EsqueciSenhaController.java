package com.catalogonet.controller.publico;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catalogonet.email.MandadorEmail;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.UsuarioRN;

@Controller
public class EsqueciSenhaController {

	@Autowired
	private MandadorEmail mandadorEmail;

	@Autowired
	private UsuarioRN usuarioRN;

	@RequestMapping("/esqueci-senha-handle")
	public @ResponseBody String esqueciSenhaHandle(
			@RequestParam(value = "emailEsqueciSenha", required = false) String email, HttpServletResponse response,
			ModelMap map) {
		if (email != null) {
			Usuario usuario = usuarioRN.buscarPorEmail(email);
			if (usuario != null) {
				// envia a senha por email
				mandadorEmail.mandarEmailRecuperacaoSenha(usuario);

				// http 200
				response.setStatus(200);
				return "sucess";
			}
		}
		// http 400
		response.setStatus(400);
		return "erro";
	}

}
