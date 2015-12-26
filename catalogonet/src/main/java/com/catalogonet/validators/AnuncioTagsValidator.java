package com.catalogonet.validators;

import java.util.List;
import java.util.Locale;

import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.catalogonet.model.Anuncio;

@Component
public class AnuncioTagsValidator extends CatalogoNetValidator implements Validator {

	public static final int TAG_MIN_LENGTH = 3;
	public static final int TAG_MAX_LENGTH = 25;
	
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
		// tags
		List<String> tags = anuncio.getTags();
		if (tags != null) {
			for (int i = 0; i < tags.size(); i++) {
				String tag = tags.get(i);
				// remove tags vazias
				if (tag == null || tag.isEmpty()) {
					tags.remove(i);
					i--;
					continue;
				}
				if (!GenericValidator.isBlankOrNull(tag) && !validarCampoSize(tag, TAG_MIN_LENGTH, TAG_MAX_LENGTH)) {
					errors.rejectValue("tags[" + i + "]", "",
							messageSource.getMessage("anuncio.tag.size", null, locale));
				}
			}
		}

	}

}
