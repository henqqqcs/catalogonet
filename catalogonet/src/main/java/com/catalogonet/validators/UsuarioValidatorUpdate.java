package com.catalogonet.validators;

import java.util.HashMap;
import java.util.Locale;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

@Service
public class UsuarioValidatorUpdate {

	private EmailValidator emailValidator = EmailValidator.getInstance();

	@Autowired
	private MessageSource messageSource;

	private Locale locale = new Locale("pt", "BR");

	public HashMap<String, String> validateAtualizarEmail(String novoEmail, String confirmarNovoEmail, String senha) {

		HashMap<String, String> mapa = new HashMap<String, String>();

		if ((senha == null) || (senha.isEmpty())) {
			mapa.put("senhaNull", messageSource.getMessage("usuario.senha.notnull", null, locale));
		}

		if ((novoEmail == null) || (novoEmail.isEmpty())) {
			mapa.put("novoEmailNull", messageSource.getMessage("usuario.email.notnull", null, locale));
		}

		if ((confirmarNovoEmail == null) || (confirmarNovoEmail.isEmpty())) {
			mapa.put("confirmarNovoEmailNull", messageSource.getMessage("usuario.email.notnull", null, locale));
		}

		// verifica se o email eh valido
		if (!emailValidator.isValid(novoEmail)) {
			mapa.put("novoEmailIvalido", messageSource.getMessage("usuario.email.invalido", null, locale));
		}

		// verifica se eh igual ao campo confirmar email
		if (!novoEmail.equals(confirmarNovoEmail)) {
			mapa.put("confirmarNovoEmailInvalido", messageSource.getMessage("usuario.email.confirmarEmail", null, locale));
		}

		return mapa;
	}
}
