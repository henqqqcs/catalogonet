package com.catalogonet.validators;

import org.apache.commons.validator.GenericValidator;

public abstract class CatalogoNetValidator {

	public boolean validarCampoSize(String campo, int minLenght, int maxLenght) {
		if (campo != null) {
			if (!(GenericValidator.minLength(campo, minLenght) && GenericValidator.maxLength(campo, maxLenght)))
				return false;
		}
		return true;
	}

	public boolean validarCampoObrigatorio(String campo) {
		if (GenericValidator.isBlankOrNull(campo)) {
			return false;
		}
		return true;
	}
}
