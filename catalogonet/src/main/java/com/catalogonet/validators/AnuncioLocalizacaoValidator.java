package com.catalogonet.validators;

import java.util.Locale;

import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Bairro;
import com.catalogonet.model.Cidade;
import com.catalogonet.model.Estado;

@Component
public class AnuncioLocalizacaoValidator extends CatalogoNetValidator implements Validator {

	public static final int ENDERECO_MIN_LENGTH = 5;
	public static final int ENDERECO_MAX_LENGTH = 50;
	public static final int COMPLEMENTO_MIN_LENGTH = 5;
	public static final int COMPLEMENTO_MAX_LENGTH = 25;
	public static final int CEP_MIN_LENGTH = 8;
	public static final int CEP_MAX_LENGTH = 9;
	
	@Autowired
	private MessageSource messageSource;
	
	private Locale locale = new Locale("pt", "BR");
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Anuncio.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		
		Anuncio anuncio = (Anuncio) target;
		// --------------- estado ----------------
		Estado estado = anuncio.getEstado();
		if (estado == null || estado.getId() == null)
			errors.rejectValue("estado", "", messageSource.getMessage("anuncio.estado.notnull", null, locale));

		// --------------- cidade ----------------
		Cidade cidade = anuncio.getCidade();
		if (cidade == null || cidade.getId() == null)
			errors.rejectValue("cidade", "", messageSource.getMessage("anuncio.cidade.notnull", null, locale));

		// --------------- bairro ----------------
		Bairro bairro = anuncio.getBairro();
		if (bairro == null || bairro.getId() == null)
			errors.rejectValue("bairro", "", messageSource.getMessage("anuncio.bairro.notnull", null, locale));

		// --------------- endereco ----------------
		if (!GenericValidator.isBlankOrNull(anuncio.getEndereco())
				&& !validarCampoSize(anuncio.getEndereco(), ENDERECO_MIN_LENGTH, ENDERECO_MAX_LENGTH))
			errors.rejectValue("endereco", "", messageSource.getMessage("anuncio.endereco.size", null, locale));

		// --------------- complemento ----------------
		if (!GenericValidator.isBlankOrNull(anuncio.getComplemento())
				&& !validarCampoSize(anuncio.getComplemento(), COMPLEMENTO_MIN_LENGTH, COMPLEMENTO_MAX_LENGTH))
			errors.rejectValue("complemento", "", messageSource.getMessage("anuncio.complemento.size", null, locale));

		// --------------- CEP ----------------
		if (!GenericValidator.isBlankOrNull(anuncio.getCep())
				&& !validarCampoSize(anuncio.getCep(), COMPLEMENTO_MIN_LENGTH, COMPLEMENTO_MAX_LENGTH))
			errors.rejectValue("cep", "", messageSource.getMessage("anuncio.cep.size", null, locale));
		
	}

}
