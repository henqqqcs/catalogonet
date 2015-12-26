package com.catalogonet.controller.publico;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NewsletterController {

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
