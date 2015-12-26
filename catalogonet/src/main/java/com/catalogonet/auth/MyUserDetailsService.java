package com.catalogonet.auth;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.catalogonet.model.Permissao;
import com.catalogonet.model.Usuario;
import com.catalogonet.negocio.UsuarioRN;

@Component
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	private UsuarioRN usuarioRN;

	protected final Log logger = LogFactory.getLog(getClass());
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		
		Usuario usuario = usuarioRN.buscarPorEmail(username);

		if (usuario == null) {
			throw new UsernameNotFoundException("User '" + username +": UsernameNotFoundException");
		}

		// get authorities
		List<GrantedAuthority> authorities = loadUserAuthorities(usuario);

		//no authorities
		if (authorities.size() == 0) {
			throw new UsernameNotFoundException("User '" + username + "' has no authorities and will be treated as 'not found'");
		}

		return createUserDetails(usuario, authorities);
	}


	private List<GrantedAuthority> loadUserAuthorities(Usuario usuario) {

		Permissao permissao = usuario.getPermissao();

		List<GrantedAuthority> authorities = new ArrayList<>();
		if (permissao == Permissao.ROLE_USUARIO) {
			authorities.add(new SimpleGrantedAuthority("ROLE_USUARIO"));
		} else if (permissao == Permissao.ROLE_ADMIN) {
			authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		} else if (permissao == Permissao.ROLE_FUNCIONARIO) {
			authorities.add(new SimpleGrantedAuthority("ROLE_FUNCIONARIO"));
		}

		return authorities;

	}
	
	private UserDetails createUserDetails(Usuario usuario,
			List<GrantedAuthority> authorities) {
		
		return new User(usuario.getEmail(), usuario.getSenha(),
				true, true, true, true, authorities);
		
	}

}
