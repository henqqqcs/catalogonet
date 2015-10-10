package com.catalogonet.controller.publico;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catalogonet.email.MandadorEmail;
import com.catalogonet.usuario.Usuario;

@Controller
public class GeralController {

	@Autowired
	private MandadorEmail mandadorEmail;

	@RequestMapping("/")
	public String paginaInicial(ModelMap map) {
		return "publico/geral/index";
	}

	@RequestMapping("/divulgue-seu-negocio")
	public String divulgueSeuNegocio(ModelMap map) {
		return "publico/divulgue/divulgue-guia";
	}

	@RequestMapping("/contato")
	public String contato(ModelMap map) {
		return "publico/geral/contato";
	}

	@RequestMapping("/contato-handle")
	public String tratarContato(@RequestParam(value = "nome", required = false) String nome,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "mensagem", required = false) String mensagem,
			@RequestParam(value = "assunto", required = false) String assunto, ModelMap map) {

		// verifica o nome
		if ((nome == null) || (nome.isEmpty())) {
			map.put("erro", "erro");
			return "publico/geral/contato";
		}
		// verifica o email
		if ((email == null) || (email.isEmpty())) {
			map.put("erro", "erro");
			return "publico/geral/contato";
		}
		// verifica o assunto
		if ((assunto == null) || (assunto.isEmpty())) {
			map.put("erro", "erro");
			return "publico/geral/contato";
		}
		// verifica o mensagem
		if ((mensagem == null) || (mensagem.isEmpty())) {
			map.put("erro", "erro");
			return "publico/geral/contato";
		}

		List<String> listaEmail = new ArrayList<String>();
		listaEmail.add(email);

		mandadorEmail.mandarEmail(listaEmail, mensagem, assunto);

		map.put("nome", nome);
		map.put("email", email);
		map.put("mensagem", "mensagem");

		return "publico/geral/contato";
	}

	@RequestMapping("/newsletter-subscribe-handle")
	public @ResponseBody String esqueciSenhaHandle(
			@RequestParam(value = "emailSubscribe", required = false) String email, HttpServletResponse response,
			ModelMap map) {
		
		EmailValidator emailValidator = EmailValidator.getInstance();
		if (emailValidator.isValid(email)) {
			System.out.println("Email cadastrado na newsletter: " + email);
			// http 200
			response.setStatus(200);
			return "sucess";
		}
		
		// http 400
		System.out.println("Erro no cadastro de email da newsletter");
		response.setStatus(400);
		return "erro";
	}

}
