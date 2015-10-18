package com.catalogonet.usuario;

import java.util.Locale;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UsuarioValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Usuario.class.equals(clazz);
	}

	private EmailValidator emailValidator = EmailValidator.getInstance();

	@Autowired
	private MessageSource messageSource;

	private Locale locale = new Locale("pt", "BR");

	public void validatePerfilUpdate(Object target, Errors errors) {

		Usuario usuario = (Usuario) target;

		// confirmar nome not null
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nome", "",
				messageSource.getMessage("usuario.nome.notnull", null, locale));

		// nome
		if (!stringLenghtBetween(usuario.getNome(), 4, 55)) {
			errors.rejectValue("nome", "", messageSource.getMessage("usuario.nome.size", null, locale));
		}

		// cnpj e cpf
		if ((usuario.getCpf() != null) && (!usuario.getCpf().isEmpty())) {
			if (!stringLenghtBetween(usuario.getCpf(), 7, 20)) {
				errors.rejectValue("cpf", "", messageSource.getMessage("usuario.cpf.size", null, locale));
			}
		}
		if ((usuario.getCnpj() != null) && (!usuario.getCnpj().isEmpty())) {
			if (!stringLenghtBetween(usuario.getCpf(), 7, 20)) {
				errors.rejectValue("cpf", "", messageSource.getMessage("usuario.cpf.size", null, locale));
			}
		}

		// telefone1
		ValidationUtils.rejectIfEmpty(errors, "telefone1", "",
				messageSource.getMessage("usuario.telefone.notnull", null, locale));

		// telefone lenght
		if (!stringLenghtBetween(usuario.getTelefone1(), 10, 15)) {
			errors.rejectValue("telefone1", "", messageSource.getMessage("usuario.telefone.size", null, locale));
		}

		// telefone2
		if ((usuario.getTelefone2() != null) && (!usuario.getTelefone2().isEmpty())) {
			if (!stringLenghtBetween(usuario.getTelefone2(), 10, 15)) {
				errors.rejectValue("telefone2", "", messageSource.getMessage("usuario.telefone.size", null, locale));
			}
		}
		
		//usuario.endereco.size
		
		//endereco
		//estado
		String str = usuario.getEndereco().getEstado();
		if ((str != null) && (!str.isEmpty())) {
			if (!stringLenghtBetween(str, 4, 55)) {
				errors.rejectValue("endereco.estado", "", messageSource.getMessage("usuario.endereco.size", null, locale));
			}
		}
		str = usuario.getEndereco().getCidade();
		if ((str != null) && (!str.isEmpty())) {
			if (!stringLenghtBetween(str, 4, 55)) {
				errors.rejectValue("endereco.cidade", "", messageSource.getMessage("usuario.endereco.size", null, locale));
			}
		}
		str = usuario.getEndereco().getBairro();
		if ((str != null) && (!str.isEmpty())) {
			if (!stringLenghtBetween(str, 4, 55)) {
				errors.rejectValue("endereco.bairro", "", messageSource.getMessage("usuario.endereco.size", null, locale));
			}
		}
		str = usuario.getEndereco().getEndereco();
		if ((str != null) && (!str.isEmpty())) {
			if (!stringLenghtBetween(str, 4, 55)) {
				errors.rejectValue("endereco.endereco", "", messageSource.getMessage("usuario.endereco.size", null, locale));
			}
		}
		str = usuario.getEndereco().getComplemento();
		if ((str != null) && (!str.isEmpty())) {
			if (!stringLenghtBetween(str, 4, 55)) {
				errors.rejectValue("endereco.complemento", "", messageSource.getMessage("usuario.endereco.size", null, locale));
			}
		}
		str = usuario.getEndereco().getCep();
		if ((str != null) && (!str.isEmpty())) {
			if (!stringLenghtBetween(str, 4, 55)) {
				errors.rejectValue("endereco.cep", "", messageSource.getMessage("usuario.endereco.size", null, locale));
			}
		}

	}

	@Override
	public void validate(Object target, Errors errors) {

		Usuario usuario = (Usuario) target;

		// email not null
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "",
				messageSource.getMessage("usuario.email.notnull", null, locale));

		// verifica se o email eh valido
		if (!emailValidator.isValid(usuario.getEmail())) {
			errors.rejectValue("email", "", messageSource.getMessage("usuario.email.invalido", null, locale));
		}

		// verifica se eh igual ao campo confirmar email
		if (!usuario.getEmail().equals(usuario.getConfirmarEmail())) {
			errors.rejectValue("confirmarEmail", "",
					messageSource.getMessage("usuario.email.confirmarEmail", null, locale));
		}

		// senha not null
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "senha", "",
				messageSource.getMessage("usuario.senha.notnull", null, locale));

		// senha
		if (!stringMaiorQue(usuario.getSenha(), 5)) {
			errors.rejectValue("senha", "", messageSource.getMessage("usuario.senha.size", null, locale));
		}

		// confirmar senha not null
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmarSenha", "",
				messageSource.getMessage("usuario.confirmarSenha.notnull", null, locale));

		// verifica se confirmar eh igual
		if (!usuario.getSenha().equals(usuario.getConfirmarSenha())) {
			errors.rejectValue("confirmarSenha", "",
					messageSource.getMessage("usuario.confirmarSenha.confirmarSenha", null, locale));
		}

		// confirmar nome not null
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nome", "",
				messageSource.getMessage("usuario.nome.notnull", null, locale));

		// nome
		if (!stringLenghtBetween(usuario.getNome(), 4, 55)) {
			errors.rejectValue("nome", "", messageSource.getMessage("usuario.nome.size", null, locale));
		}

		// cnpj e cpf
		if ((usuario.getCpf() != null) && (!usuario.getCpf().isEmpty())) {
			if (!stringLenghtBetween(usuario.getCpf(), 7, 20)) {
				errors.rejectValue("cpf", "", messageSource.getMessage("usuario.cpf.size", null, locale));
			}
		}
		if ((usuario.getCnpj() != null) && (!usuario.getCnpj().isEmpty())) {
			if (!stringLenghtBetween(usuario.getCpf(), 7, 20)) {
				errors.rejectValue("cpf", "", messageSource.getMessage("usuario.cpf.size", null, locale));
			}
		}

		// telefone1
		ValidationUtils.rejectIfEmpty(errors, "telefone1", "",
				messageSource.getMessage("usuario.telefone.notnull", null, locale));

		// telefone lenght
		if (!stringLenghtBetween(usuario.getTelefone1(), 10, 15)) {
			errors.rejectValue("telefone1", "", messageSource.getMessage("anuncio.telefone.size", null, locale));
		}

		// telefone2
		if ((usuario.getTelefone2() != null) && (!usuario.getTelefone2().isEmpty())) {
			if (!stringLenghtBetween(usuario.getTelefone2(), 10, 15)) {
				errors.rejectValue("telefone2", "", messageSource.getMessage("anuncio.telefone.size", null, locale));
			}
		}

	}

	private boolean stringLenghtBetween(String str, int min, int max) {

		if (str != null) {
			if ((str.length() >= min) && (str.length() <= max)) {
				return true;
			}
		}
		return false;
	}

	private boolean stringMaiorQue(String str, int min) {

		if (str != null) {
			if (str.length() >= min) {
				return true;
			}
		}
		return false;
	}

}
