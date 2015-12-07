package com.catalogonet.validators;

import java.util.List;
import java.util.Locale;

import org.apache.commons.validator.routines.EmailValidator;
import org.apache.commons.validator.routines.UrlValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.catalogonet.anuncio.Anuncio;
import com.catalogonet.anuncio.AnuncioRN;
import com.catalogonet.local.Bairro;
import com.catalogonet.local.Cidade;
import com.catalogonet.local.Estado;

@Component
public class AnuncioValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Anuncio.class.equals(clazz);
	}

	private EmailValidator emailValidator = EmailValidator.getInstance();
	private UrlValidator urlValidator = UrlValidator.getInstance();

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private AnuncioRN anuncioRN;

	private Locale locale = new Locale("pt", "BR");

	/**
	 * Valida apenas as informacoes ...
	 * 
	 * @param target
	 * @param errors
	 */
	public void validateInformacoes(Object target, Errors errors) {

		Anuncio anuncio = (Anuncio) target;

		// Titulo
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "titulo", "",
				messageSource
						.getMessage("anuncio.titulo.notnull", null, locale));

		// titulo size
		if (!stringLenghtBetween(anuncio.getTitulo(), 5, 50)) {
			errors.rejectValue("titulo", "", messageSource.getMessage(
					"anuncio.titulo.size", null, locale));
		}

		// verifica se ja existe um titulo igual
		List<Anuncio> listaTitulos = anuncioRN.buscarPorTituloInteiro(anuncio
				.getTitulo());

		if (!listaTitulos.isEmpty()) {

			// verifica se eh o mesmo anuncio
			if (anuncio.getId() != listaTitulos.get(0).getId()) {
				errors.rejectValue("titulo", "", messageSource.getMessage(
						"anuncio.titulo.unique", null, locale));
			}

		}

		// descricao
		if ((anuncio.getDescricao() != null)
				&& (!anuncio.getDescricao().isEmpty())) {
			if (!stringLenghtMax(anuncio.getDescricao(), 1024)) {
				errors.rejectValue("descricao", "", messageSource.getMessage(
						"anuncio.descricao.size", null, locale));
			}
		}

		// telefone1
		ValidationUtils.rejectIfEmpty(errors, "telefone1", "", messageSource
				.getMessage("anuncio.telefone1.notnull", null, locale));

		// telefone lenght
		if (!stringLenghtBetween(anuncio.getTelefone1(), 10, 15)) {
			errors.rejectValue("telefone1", "", messageSource.getMessage(
					"anuncio.telefone1.size", null, locale));
		}

		// telefone2
		if ((anuncio.getTelefone2() != null)
				&& (!anuncio.getTelefone2().isEmpty())) {
			if (!stringLenghtBetween(anuncio.getTelefone2(), 10, 15)) {
				errors.rejectValue("telefone2", "", messageSource.getMessage(
						"anuncio.telefone2.size", null, locale));
			}
		}

		// email
		if ((anuncio.getEmail() != null) && (!anuncio.getEmail().isEmpty())) {
			if (!emailValidator.isValid(anuncio.getEmail())) {
				errors.rejectValue("email", "", messageSource.getMessage(
						"anuncio.email.email", null, locale));
			}
		}

		// site
		if ((anuncio.getSite() != null) && (!anuncio.getSite().isEmpty())) {
			if (!urlValidator.isValid(anuncio.getSite())) {
				errors.rejectValue("site", "", messageSource.getMessage(
						"anuncio.site.url", null, locale));
			}
		}

		// facebook
		if ((anuncio.getFacebook() != null)
				&& (!anuncio.getFacebook().isEmpty())) {
			if (!urlValidator.isValid(anuncio.getFacebook())) {
				errors.rejectValue("facebook", "", messageSource.getMessage(
						"anuncio.facebook.url", null, locale));
			}
		}

		// twitter
		if ((anuncio.getTwitter() != null) && (!anuncio.getTwitter().isEmpty())) {
			if (!urlValidator.isValid(anuncio.getTwitter())) {
				errors.rejectValue("twitter", "", messageSource.getMessage(
						"anuncio.twitter.url", null, locale));
			}
		}

		// instagram
		if ((anuncio.getInstagram() != null)
				&& (!anuncio.getInstagram().isEmpty())) {
			if (!urlValidator.isValid(anuncio.getInstagram())) {
				errors.rejectValue("instagram", "", messageSource.getMessage(
						"anuncio.instagram.url", null, locale));
			}
		}

		// google plus
		if ((anuncio.getGoogleplus() != null)
				&& (anuncio.getGoogleplus().isEmpty())) {
			if (!urlValidator.isValid(anuncio.getGoogleplus())) {
				errors.rejectValue("googleplus", "", messageSource.getMessage(
						"anuncio.google.url", null, locale));
			}
		}

	}

	public void validateLocalizacao(Object target, Errors errors) {

		Anuncio anuncio = (Anuncio) target;

		// estado
		Estado estado = anuncio.getEstado();
		if (estado != null) {
			if (estado.getId() == null) {
				errors.rejectValue("estado", "", messageSource.getMessage(
						"anuncio.estado.notnull", null, locale));
			}
		} else {
			errors.rejectValue("estado", "", messageSource.getMessage(
					"anuncio.estado.notnull", null, locale));
		}

		// cidade
		Cidade cidade = anuncio.getCidade();
		if (cidade != null) {
			if (cidade.getId() == null) {
				errors.rejectValue("cidade", "", messageSource.getMessage(
						"anuncio.cidade.notnull", null, locale));
			}
		} else {
			errors.rejectValue("cidade", "", messageSource.getMessage(
					"anuncio.cidade.notnull", null, locale));
		}

		// bairro
		Bairro bairro = anuncio.getBairro();
		if (bairro != null) {
			if (bairro.getId() == null) {
				errors.rejectValue("bairro", "", messageSource.getMessage(
						"anuncio.bairro.notnull", null, locale));
			}
		} else {
			errors.rejectValue("bairro", "", messageSource.getMessage(
					"anuncio.bairro.notnull", null, locale));
		}

		// endereco
		if ((anuncio.getEndereco() != null)
				&& (!anuncio.getEndereco().isEmpty())) {
			if (!stringLenghtBetween(anuncio.getEndereco(), 5, 50)) {
				errors.rejectValue("endereco", "", messageSource.getMessage(
						"anuncio.endereco.size", null, locale));
			}
		}

		// complemento
		if ((anuncio.getComplemento() != null)
				&& (!anuncio.getComplemento().isEmpty())) {
			if (!stringLenghtBetween(anuncio.getComplemento(), 5, 25)) {
				errors.rejectValue("complemento", "", messageSource.getMessage(
						"anuncio.complemento.size", null, locale));
			}
		}

		// cep
		if ((anuncio.getCep() != null) && (!anuncio.getCep().isEmpty())) {
			if (!stringLenghtBetween(anuncio.getCep(), 8, 9)) {
				errors.rejectValue("cep", "", messageSource.getMessage(
						"anuncio.cep.size", null, locale));
			}
		}

	}

	public void validateTags(Anuncio anuncio, Errors errors) {
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

				// remove palavras chave com menos de tres letras
				if ((tag.isEmpty()) || (tag.length() < 3)) {
					errors.rejectValue("tags[" + i + "]", "", messageSource
							.getMessage("anuncio.tag.size", null, locale));
				}

				// rejeita palavras chave com mais de 20
				if (tag.length() > 20) {
					errors.rejectValue("tags[" + i + "]", "", messageSource
							.getMessage("anuncio.tag.size", null, locale));
				}

			}
		}
	}

	@Override
	public void validate(Object target, Errors errors) {

		validateInformacoes(target, errors);
		validateLocalizacao(target, errors);

	}

	private boolean stringLenghtBetween(String str, int min, int max) {

		if (str != null) {
			if ((str.length() >= min) && (str.length() <= max)) {
				return true;
			}
		}
		return false;
	}

	private boolean stringLenghtMax(String str, int max) {

		if (str != null) {
			if (str.length() <= max) {
				return true;
			}
		}
		return false;
	}

}
