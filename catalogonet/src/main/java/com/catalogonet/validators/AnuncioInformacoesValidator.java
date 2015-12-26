package com.catalogonet.validators;

import java.util.List;
import java.util.Locale;

import org.apache.commons.validator.GenericValidator;
import org.apache.commons.validator.routines.UrlValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.catalogonet.model.Anuncio;
import com.catalogonet.negocio.AnuncioRN;

@Component
public class AnuncioInformacoesValidator extends CatalogoNetValidator implements Validator {

	public static final int TITULO_MIN_LENGTH = 5;
	public static final int TITULO_MAX_LENGTH = 55;
	public static final int DESCRICAO_MIN_LENGTH = 5;
	public static final int DESCRICAO_MAX_LENGTH = 1024;
	public static final int TELEFONE_MIN_LENGTH = 14;
	public static final int TELEFONE_MAX_LENGTH = 15;
	
	@Autowired
	private MessageSource messageSource;
	
	private Locale locale = new Locale("pt", "BR");
	
	@Autowired
	private AnuncioRN anuncioRN;
	
	private UrlValidator urlValidator = UrlValidator.getInstance();
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Anuncio.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		
		Anuncio anuncio = (Anuncio) target;
		
		// ------------------------ titulo ------------------
		if (!validarCampoObrigatorio(anuncio.getTitulo()))
			errors.rejectValue("titulo", "", messageSource.getMessage("anuncio.titulo.notnull", null, locale));
		
		if (anuncio.getTituloNaUrl().contains("sem-titulo"))
			errors.rejectValue("titulo", "", messageSource.getMessage("anuncio.titulo.notnull", null, locale));
		
		if (anuncio.getTituloNaUrl().startsWith("anuncio-"))
			errors.rejectValue("titulo", "", messageSource.getMessage("anuncio.titulo.notnull", null, locale));

		if (!validarCampoSize(anuncio.getTitulo(), TITULO_MIN_LENGTH, TITULO_MAX_LENGTH))
			errors.rejectValue("titulo", "", messageSource.getMessage("anuncio.titulo.size", null, locale));

		// verifica se ja existe um titulo igual
		List<Anuncio> listaTitulos = anuncioRN.buscarPorTituloInteiro(anuncio.getTitulo());
		if (!listaTitulos.isEmpty()) {
			// verifica se eh o mesmo anuncio
			if (anuncio.getId() != listaTitulos.get(0).getId())
				errors.rejectValue("titulo", "", messageSource.getMessage("anuncio.titulo.unique", null, locale));
		}

		// ------------------------ descricao ------------------
		if (!GenericValidator.isBlankOrNull(anuncio.getDescricao())
				&& !validarCampoSize(anuncio.getDescricao(), DESCRICAO_MIN_LENGTH, DESCRICAO_MAX_LENGTH))
			errors.rejectValue("descricao", "", messageSource.getMessage("anuncio.descricao.size", null, locale));

		// ------------------------ telefone1 ------------------

		if (!validarCampoObrigatorio(anuncio.getTelefone1()))
			errors.rejectValue("telefone1", "", messageSource.getMessage("anuncio.telefone1.notnull", null, locale));

		if (!validarCampoSize(anuncio.getTelefone1(), TELEFONE_MIN_LENGTH, TELEFONE_MAX_LENGTH))
			errors.rejectValue("telefone1", "", messageSource.getMessage("anuncio.telefone1.size", null, locale));

		// ------------------------ telefone2 ------------------
		if (!GenericValidator.isBlankOrNull(anuncio.getTelefone2())
				&& !validarCampoSize(anuncio.getTelefone2(), TELEFONE_MIN_LENGTH, TELEFONE_MAX_LENGTH))
			errors.rejectValue("telefone2", "", messageSource.getMessage("anuncio.telefone2.size", null, locale));

		// ------------------------ email ------------------
		if (!GenericValidator.isBlankOrNull(anuncio.getEmail()) && !GenericValidator.isEmail(anuncio.getEmail()))
			errors.rejectValue("email", "", messageSource.getMessage("anuncio.email.email", null, locale));

		// ------------------------ site ------------------
		if (!GenericValidator.isBlankOrNull(anuncio.getSite()) && !urlValidator.isValid(anuncio.getSite()))
			errors.rejectValue("site", "", messageSource.getMessage("anuncio.site.url", null, locale));

		// ------------------------ facebook ------------------
		if (!GenericValidator.isBlankOrNull(anuncio.getFacebook()) && !urlValidator.isValid(anuncio.getFacebook()))
			errors.rejectValue("facebook", "", messageSource.getMessage("anuncio.facebook.url", null, locale));

		// ------------------------ twitter ------------------
		if (!GenericValidator.isBlankOrNull(anuncio.getTwitter()) && !urlValidator.isValid(anuncio.getTwitter()))
			errors.rejectValue("twitter", "", messageSource.getMessage("anuncio.twitter.url", null, locale));

		// ------------------------ instagram ------------------
		if (!GenericValidator.isBlankOrNull(anuncio.getInstagram()) && !urlValidator.isValid(anuncio.getInstagram()))
			errors.rejectValue("instagram", "", messageSource.getMessage("anuncio.instagram.url", null, locale));

		// ------------------------ google plus ------------------
		if (!GenericValidator.isBlankOrNull(anuncio.getGoogleplus()) && !urlValidator.isValid(anuncio.getGoogleplus()))
			errors.rejectValue("googleplus", "", messageSource.getMessage("anuncio.google.url", null, locale));
		
		
		
	}

	
}
