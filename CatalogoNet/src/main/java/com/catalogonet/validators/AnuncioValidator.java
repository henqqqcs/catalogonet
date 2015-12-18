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
import com.catalogonet.model.Bairro;
import com.catalogonet.model.Cidade;
import com.catalogonet.model.Estado;
import com.catalogonet.negocio.AnuncioRN;

@Component
public class AnuncioValidator implements Validator {

	public static final int TITULO_MIN_LENGTH = 5;
	public static final int TITULO_MAX_LENGTH = 55;
	public static final int DESCRICAO_MIN_LENGTH = 5;
	public static final int DESCRICAO_MAX_LENGTH = 1024;
	public static final int TELEFONE_MIN_LENGTH = 14;
	public static final int TELEFONE_MAX_LENGTH = 15;
	public static final int ENDERECO_MIN_LENGTH = 5;
	public static final int ENDERECO_MAX_LENGTH = 50;
	public static final int COMPLEMENTO_MIN_LENGTH = 5;
	public static final int COMPLEMENTO_MAX_LENGTH = 25;
	public static final int CEP_MIN_LENGTH = 8;
	public static final int CEP_MAX_LENGTH = 9;
	public static final int TAG_MIN_LENGTH = 3;
	public static final int TAG_MAX_LENGTH = 25;

	@Override
	public boolean supports(Class<?> clazz) {
		return Anuncio.class.equals(clazz);
	}

	private UrlValidator urlValidator = UrlValidator.getInstance();

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private AnuncioRN anuncioRN;

	private Locale locale = new Locale("pt", "BR");

	public void validateInformacoes(Object target, Errors errors) {

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

	public void validateLocalizacao(Object target, Errors errors) {

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

	public void validateTags(Object target, Errors errors) {
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
				if (!GenericValidator.isBlankOrNull(tag)
						&& !validarCampoSize(tag, TAG_MIN_LENGTH, TAG_MAX_LENGTH)) {
					errors.rejectValue("tags[" + i + "]", "",
							messageSource.getMessage("anuncio.tag.size", null, locale));
				}
			}
		}
	}

	public void validateCategorias(Object target, Errors errors) {
		Anuncio anuncio = (Anuncio) target;

		// categoria
		if (anuncio.getCategoria() == null) 
			errors.rejectValue("categoria", "", messageSource.getMessage("anuncio.categoria.null", null, locale));
		
		//subcategoria
		if (anuncio.getSubCategoria() == null) 
			errors.rejectValue("subCategoria", "", messageSource.getMessage("anuncio.subcategoria.null", null, locale));

	}

	public void validate(Object target, Errors errors) {

		validateInformacoes(target, errors);
		validateLocalizacao(target, errors);
		validateTags(target, errors);
		validateCategorias(target, errors);

	}

	private boolean validarCampoSize(String campo, int minLenght, int maxLenght) {
		if (campo != null) {
			if (!(GenericValidator.minLength(campo, minLenght) && GenericValidator.maxLength(campo, maxLenght)))
				return false;
		}
		return true;
	}

	private boolean validarCampoObrigatorio(String campo) {
		if (GenericValidator.isBlankOrNull(campo)) {
			return false;
		}
		return true;
	}

}
