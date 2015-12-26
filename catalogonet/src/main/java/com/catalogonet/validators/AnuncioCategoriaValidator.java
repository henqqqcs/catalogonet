package com.catalogonet.validators;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.catalogonet.model.Anuncio;

@Component
public class AnuncioCategoriaValidator extends CatalogoNetValidator implements Validator {

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

		// categoria
		if (anuncio.getCategoria() == null)
			errors.rejectValue("categoria", "", messageSource.getMessage("anuncio.categoria.null", null, locale));

		// subcategoria
		if (anuncio.getSubCategoria() == null)
			errors.rejectValue("subCategoria", "", messageSource.getMessage("anuncio.subcategoria.null", null, locale));

	}

}
