package com.catalogonet.security;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.servlet.Filter;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
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
public class SecurityTest {

	
	@Autowired
	private UsuarioRN usuarioRN;
	
	@Autowired
	private Filter springSecurityFilterChain;
	
	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).addFilter(springSecurityFilterChain).build();
	}

	@Test
	public void deve_assegurar_que_apenas_usuario_com_role_usuario_acessem_area_da_empresa() throws Exception {
		
		String email = "teste_seguranca_usuario_autenticado@gmail.com";
		String senha = "123123";
		salvarUsuario("joazinho", email, senha);
		
		//usuario com role correto
		this.mockMvc
				.perform(get("/area-da-empresa/home").with(SecurityMockMvcRequestPostProcessors
						.user(email).password(senha).roles("USUARIO")))
				.andExpect(status().isOk());
		
		//acess denied
		this.mockMvc
		.perform(get("/area-da-empresa/home").with(SecurityMockMvcRequestPostProcessors
				.user(email).password(senha).roles("dxsdfsdf"))).andExpect(MockMvcResultMatchers.redirectedUrl("/login?denied"));
		
		//acess denied
		this.mockMvc
		.perform(get("/area-da-empresa/home").with(SecurityMockMvcRequestPostProcessors
				.user(email).password(senha).roles("ADMIN"))).andExpect(MockMvcResultMatchers.redirectedUrl("/login?denied"));
		
	}
	
	@Test
	public void deve_assegurar_que_apenas_usuario_com_role_usuario_acessem_adminadmin() throws Exception {
		
		String email = "teste_seguranca_admin@gmail.com";
		String senha = "123123";
		salvarUsuario("joazinho", email, senha);
		
		//usuario com role correto
		this.mockMvc
		.perform(get("/adminadmin/").with(SecurityMockMvcRequestPostProcessors
				.user(email).password(senha).roles("ADMIN")))
		.andExpect(status().isOk());
		
		//acess denied
		this.mockMvc
		.perform(get("/adminadmin/").with(SecurityMockMvcRequestPostProcessors
				.user(email).password(senha).roles("USUARIO"))).andExpect(MockMvcResultMatchers.redirectedUrl("/login?denied"));
		
		//acess denied
		this.mockMvc
		.perform(get("/adminadmin/").with(SecurityMockMvcRequestPostProcessors
				.user(email).password(senha).roles("asdasdasd"))).andExpect(MockMvcResultMatchers.redirectedUrl("/login?denied"));
		
	}
	
	private Usuario salvarUsuario(String nome, String email, String senha) {
		Usuario usuario = new Usuario();
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setSenha(senha);
		usuarioRN.adicionar(usuario);
		return usuario;
	}
}
