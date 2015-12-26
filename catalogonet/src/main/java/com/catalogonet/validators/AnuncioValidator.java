package com.catalogonet.validators;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.validation.FieldError;
import org.springframework.validation.Validator;

import com.catalogonet.model.Anuncio;

@Component
public class AnuncioValidator {

	@Autowired
	private AnuncioInformacoesValidator informacoesValidator;

	@Autowired
	private AnuncioLocalizacaoValidator localizacaoValidator;

	@Autowired
	private AnuncioTagsValidator tagsValidator;

	@Autowired
	private AnuncioCategoriaValidator categoriaValidator;

	public ResultadoValidacaoAnuncio validate(Anuncio anuncio) {
		ResultadoValidacaoAnuncio resultadoValidacao = validar(anuncio);
		return resultadoValidacao;
	}

	public BindingResult validateInformacoes(Anuncio anuncio) {
		DataBinder binder = new DataBinder(anuncio);
		binder.setValidator(informacoesValidator);
		binder.validate();
		return binder.getBindingResult();
	}
	
	public BindingResult validateLocalizacao(Anuncio anuncio) {
		DataBinder binder = new DataBinder(anuncio);
		binder.setValidator(localizacaoValidator);
		binder.validate();
		return binder.getBindingResult();
	}
	public BindingResult validateCategoria(Anuncio anuncio) {
		DataBinder binder = new DataBinder(anuncio);
		binder.setValidator(categoriaValidator);
		binder.validate();
		return binder.getBindingResult();
	}
	
	public BindingResult validateTags(Anuncio anuncio) {
		DataBinder binder = new DataBinder(anuncio);
		binder.setValidator(tagsValidator);
		binder.validate();
		return binder.getBindingResult();
	}

	private ResultadoValidacaoAnuncio validar(Anuncio anuncio) {

		Map<String, String> mapaInformacoes = validarComValidator(anuncio, informacoesValidator);
		Map<String, String> mapaCategoria = validarComValidator(anuncio, categoriaValidator);
		Map<String, String> mapaLocalizacao = validarComValidator(anuncio, localizacaoValidator);
		Map<String, String> mapaTags = validarComValidator(anuncio, tagsValidator);

		return new ResultadoValidacaoAnuncio(mapaInformacoes, mapaLocalizacao, mapaCategoria, mapaTags);
	}

	private Map<String, String> pegarMapDeErros(BindingResult result) {

		Map<String, String> mapa = new HashMap<String, String>();
		if (result.hasErrors()) {
			for (FieldError f : result.getFieldErrors()) {
				mapa.put(f.getField(), f.getDefaultMessage());
			}
		}
		return mapa;
	}

	private Map<String, String> validarComValidator(Anuncio anuncio, Validator validator) {
		DataBinder binder = new DataBinder(anuncio);

		// set validator
		binder.setValidator(validator);

		// validar
		binder.validate();

		// binder result
		BindingResult result = binder.getBindingResult();

		// mapa de erros
		Map<String, String> mapErros = pegarMapDeErros(result);
		return mapErros;
	}

}
