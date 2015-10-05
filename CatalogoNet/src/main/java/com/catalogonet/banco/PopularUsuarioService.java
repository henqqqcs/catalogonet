package com.catalogonet.banco;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catalogonet.usuario.Permissao;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;

@Service
public class PopularUsuarioService {

	@Autowired
	private UsuarioRN usuarioRN;

	public void popularUsuarios() {
		System.out.println("|-- Populando banco de dados: usuarios");
		
		criarUsuarioAdministrador();
		criarUsuarioPadrao();
	}

	private void criarUsuarioPadrao() {
		// padrao
		Usuario usuario = new Usuario();
		usuario.setNome("Jose maria das neves");
		usuario.setCpf("123.123.123-23");
		usuario.setAtivo(true);
		usuario.setEmail("teste");
		usuario.setSenha("123");
		usuario.setPermissao(Permissao.ROLE_USUARIO);
		usuarioRN.adicionar(usuario);
	}

	private void criarUsuarioAdministrador() {
		// admin
		Usuario usuario = new Usuario();
		usuario.setNome("Henrique Goncalves Barreto");
		usuario.setAtivo(true);
		usuario.setEmail("henrique");
		usuario.setSenha("123");
		usuario.setPermissao(Permissao.ROLE_ADMIN);
		usuarioRN.adicionar(usuario);
	}
}
