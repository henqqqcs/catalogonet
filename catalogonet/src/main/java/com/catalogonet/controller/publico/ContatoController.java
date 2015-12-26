package com.catalogonet.controller.publico;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.catalogonet.email.MandadorEmail;

@Controller
public class ContatoController {

	@Autowired
	private MandadorEmail mandadorEmail;
	
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
}
