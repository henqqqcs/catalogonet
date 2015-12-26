package com.catalogonet.controller.publico;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GeralController {

	@RequestMapping("/")
	public String paginaInicial(ModelMap map) {
		return "publico/geral/index";
	}

	@RequestMapping("/divulgue-seu-negocio")
	public String divulgueSeuNegocio(ModelMap map) {
		return "publico/divulgue/divulgue-guia";
	}

}
