package com.catalogonet.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/adminadmin")
public class AdminController {
	
	
	@RequestMapping("/")
	public String paginaInicial() {
		return "admin/home";
	}

}
