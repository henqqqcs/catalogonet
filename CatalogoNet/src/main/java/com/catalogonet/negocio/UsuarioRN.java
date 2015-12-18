package com.catalogonet.negocio;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

import com.catalogonet.dao.interfaces.UsuarioDAO;
import com.catalogonet.model.Permissao;
import com.catalogonet.model.Usuario;

@Component
@Transactional
public class UsuarioRN {

	@Autowired
	private UsuarioDAO dao;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	public void adicionar(Usuario usuario) {
		if ((usuario.getPermissao() == null) || (!usuario.isAtivo())) {
			usuario.setPermissao(Permissao.ROLE_USUARIO);
			usuario.setAtivo(true);
		}
		dao.adicionar(usuario);
	}

	public void atualizar(Usuario usuario) {
		dao.atualizar(usuario);
	}


	public void remover(Long id) {
		dao.remover(id);
	}

	public Usuario buscarPorId(Long id) {
		return dao.buscarPorId(id);
	}

	public Usuario buscarPorEmail(String email) {
		return dao.buscarPorEmail(email);
	}

	public List<Usuario> buscarPorNome(String nome) {
		return dao.buscarPorNome(nome);
	}

	public Usuario pegaUsuarioNaSessao(Map<String, Object> map) {

		Usuario usuario = null;
		if (map.get("usuario") != null) {
			usuario = (Usuario) map.get("usuario");
		} else {
			return this.pegaUsuarioLogado();
		}
		return usuario;
	}
	
	private Usuario pegaUsuarioLogado() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String email = auth.getName();
		Usuario usuario = dao.buscarPorEmail(email);
		return usuario;
	}

	public List<Usuario> buscarPorParteEmail(String email) {
		return dao.buscarPorParteEmail(email);
	}

	public List<Usuario> buscarPorParteCPF(String cpf) {
		return dao.buscarPorParteCPF(cpf);
	}
	
	public boolean autenticaUsuarioEColocaNaSessao(Usuario user, HttpServletRequest request) {

		try {
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user.getEmail(), user.getSenha());

			request.getSession();

			token.setDetails(new WebAuthenticationDetails(request));
			Authentication authenticatedUser = authenticationManager.authenticate(token);

			SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
			return true;
		} catch (Exception e) {
			System.out.println("Ocorreu um erro no metodo autenticaEColocaUsuarioNaSessao.");
			e.printStackTrace();
			return false;
		}
	}
	

	
}
