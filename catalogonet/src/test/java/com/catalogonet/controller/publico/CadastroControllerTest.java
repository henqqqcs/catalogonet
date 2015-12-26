package com.catalogonet.controller.publico;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.catalogonet.conf.AppWebConfiguration;
import com.catalogonet.conf.JPATestConfiguration;
import com.catalogonet.conf.SecurityConfiguration;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.UsuarioRN;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = { AppWebConfiguration.class, JPATestConfiguration.class, SecurityConfiguration.class })
public class CadastroControllerTest {

	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private UsuarioRN usuarioRN;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}

	@Test
	public void deve_ir_para_form_de_cadastro() throws Exception {
		this.mockMvc.perform(get("/cadastro"))
				.andExpect(MockMvcResultMatchers.forwardedUrl("/WEB-INF/views/publico/geral/cadastro.jsp"));
	}

	@Test
	public void deve_ir_voltar_para_pagina_de_login_pois_email_ja_cadastrado() throws Exception {

		String emailJaExistente = "henrique_teste_cadastro@gmail.com";
		salvarUsuario("henrqiue", emailJaExistente);

		RequestBuilder request = post("/cadastro").param("email", emailJaExistente);
		this.mockMvc.perform(request).andExpect(MockMvcResultMatchers.redirectedUrl("/login?emailJaCadastrado"));

	}

	private Usuario salvarUsuario(String nome, String emailJaExistente) {
		Usuario usuario = new Usuario();
		usuario.setNome(nome);
		usuario.setEmail(emailJaExistente);
		usuarioRN.adicionar(usuario);
		return usuario;
	}

}
