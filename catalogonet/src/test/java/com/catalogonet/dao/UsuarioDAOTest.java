package com.catalogonet.dao;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.catalogonet.auth.MyAccessDeniedHandler;
import com.catalogonet.auth.MyAuthenticationFailureHandler;
import com.catalogonet.auth.MyAuthenticationSuccessHandler;
import com.catalogonet.auth.MyUserDetailsService;
import com.catalogonet.conf.JPATestConfiguration;
import com.catalogonet.conf.SecurityConfiguration;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.UsuarioRN;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { JPATestConfiguration.class, SecurityConfiguration.class,
		MyAuthenticationFailureHandler.class, MyAccessDeniedHandler.class, MyAuthenticationSuccessHandler.class, MyUserDetailsService.class,
		UsuarioRN.class, JpaUsuarioDAO.class })
public class UsuarioDAOTest {

	@Autowired
	private UsuarioRN usuarioRN;

	@Test
	public void deve_salvar_um_usuario() {

		Usuario usuario = salvarUsuario("Henrique", "salvar_teste@gmail.com");
		
		assertTrue(usuarioRN.existeComEmail(usuario.getEmail()));
		assertFalse(usuarioRN.existeComEmail("whatever@dev.null"));
		assertFalse(usuarioRN.existeComEmail(null));

	}
	
	@Test
	public void deve_remover_um_usuario() {
		salvarUsuario("Henrique", "remover_teste@gmail.com");
		Usuario usuario = usuarioRN.buscarPorEmail("remover_teste@gmail.com");
		Long id = usuario.getId();
		usuarioRN.remover(id);
		Assert.assertNull(usuarioRN.buscarPorId(id));
		Assert.assertNull(usuarioRN.buscarPorEmail("remover_teste@gmail.com"));
	}
	
	@Test
	public void deve_buscar_usuario_por_email() {
		
		String email = "teste_buscar@gmail.com";
		Usuario teste = salvarUsuario("teste busca por email", email);
		
		Usuario usuario = usuarioRN.buscarPorEmail(email);
		assertTrue(usuario.getEmail().equals(teste.getEmail()));
		assertFalse(usuario.getEmail().equals("asdasdasd"));
		assertFalse(usuario.getEmail().equals(null));
		
	}
	
	@Test
	public void deve_buscar_usuario_por_email_e_senha() {
		
		String email = "teste_buscar_email_senha@gmail.com";
		Usuario teste = salvarUsuario("teste busca por email", email);
		
		
		String senha = "123123";
		Usuario usuario = usuarioRN.buscarPorEmailESenha(email, senha);
		
		assertTrue(usuario.getEmail().equals(teste.getEmail()));
		assertTrue(usuario.getSenha().equals(senha));
		assertFalse(usuario.getSenha().equals("any password"));
		assertFalse(usuario.getEmail().equals("asdasdasd"));
		assertFalse(usuario.getSenha().equals(null));
		assertFalse(usuario.getEmail().equals(null));
		
	}
	
	
	@Test
	public void deve_buscar_usuario_por_parte_de_email() {
		
		salvarUsuario("teste", "henrique_teste1@gmail.com");
		salvarUsuario("teste", "henrique_teste2@gmail.com");
		salvarUsuario("teste", "henrique_teste3@gmail.com");
		
		String parteEmail = "henri";
		List<Usuario> listaUsuario = usuarioRN.buscarPorParteEmail(parteEmail);
		
		for (Usuario u : listaUsuario) {
			assertTrue(u.getEmail().contains(parteEmail));
			assertFalse(u.getEmail().contains("coisa_qualquer"));
			assertFalse(u.getEmail().equals(null));
		}
		
	}
	
	@Test
	public void deve_verificar_se_usuario_existe_por_email() {
		String email = "teste_usuario_existe@gmail.com";
		
		salvarUsuario("henrique", email);
		assertTrue(usuarioRN.existeComEmail(email));
		assertFalse(usuarioRN.existeComEmail("asdasdasdasdad"));
		assertFalse(usuarioRN.existeComEmail(null));
	}
	
	
	@Test
	public void deve_buscar_usuario_por_parte_do_nome() {
		
		salvarUsuario("joazinho goncalves barreto", "test_parte_nome_1@gmail.com");
		salvarUsuario("joazinho goncalves araujo", "test_parte_nome_2@gmail.com");
		salvarUsuario("joazinho araujo teste", "test_parte_nome_3@gmail.com");
		salvarUsuario("joazinho skywalker barreto", "test_parte_nome_4@gmail.com");
		
		String parteNome = "joazinho gon";
		List<Usuario> listaUsuario = usuarioRN.buscarPorNome(parteNome);
		for (Usuario u : listaUsuario) {
			assertTrue(u.getNome().contains(parteNome));
			assertFalse(u.getEmail().contains("coisa_qualquer"));
			assertFalse(u.getEmail().equals(null));
		}
		
		assertTrue(listaUsuario.size() == 2);
		
	}
	
	@Test
	public void deve_buscar_usuario_por_parte_do_cpf() {
		
		salvarUsuario("teste_cpf", "test_parte_cpf_1@gmail.com", "123.321.456-12");
		salvarUsuario("teste_cpf", "test_parte_cpf_2@gmail.com", "123.321.111-11");
		salvarUsuario("teste_cpf", "test_parte_cpf_3@gmail.com", "123.321.asdasd");
		salvarUsuario("teste_cpf", "test_parte_cpf_4@gmail.com", "123.123.123-12");
		salvarUsuario("teste_cpf", "test_parte_cpf_5@gmail.com", "000.000.000-34");
		
		String parteCPF = "123.321";
		List<Usuario> listaUsuario = usuarioRN.buscarPorParteCPF(parteCPF);
		for (Usuario u : listaUsuario) {
			assertTrue(u.getCpf().contains(parteCPF));
			assertFalse(u.getCpf().contains("coisa_qualquer"));
			assertFalse(u.getCpf().equals(null));
		}
		
		assertTrue(listaUsuario.size() == 3);
		
	}
	
	
	
	
	
	private Usuario salvarUsuario(String nome, String email) {
		Usuario usuario = new Usuario();
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setSenha("123123");
		usuarioRN.adicionar(usuario);
		return usuario;
	}
	
	private Usuario salvarUsuario(String nome, String email, String cpf) {
		Usuario usuario = new Usuario();
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setSenha("123123");
		usuario.setCpf(cpf);
		usuarioRN.adicionar(usuario);
		return usuario;
	}


}
