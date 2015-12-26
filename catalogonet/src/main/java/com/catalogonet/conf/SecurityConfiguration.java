package com.catalogonet.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthenticationSuccessHandler successHandler;
	
	@Autowired
	private AuthenticationFailureHandler failureHandler;
	
	@Autowired
	private AccessDeniedHandler accessDeniedHandler;
	
	@Autowired
	private UserDetailsService userDetailsService;
	
//	@Autowired
//	private DataSource dataSource;

	@Override
	protected void configure(HttpSecurity http) throws Exception {


		http.
			authorizeRequests().
			antMatchers("/area-da-empresa/**").hasRole("USUARIO").
			antMatchers("/adminadmin/**").hasRole("ADMIN").
			antMatchers("/**").permitAll().
		and().
			formLogin().
			loginPage("/login").
			successHandler(successHandler).
			failureHandler(failureHandler).
		and().
			logout().
			logoutRequestMatcher(new AntPathRequestMatcher("/logout")).
			logoutSuccessUrl("/login?logout").
		and().	
			exceptionHandling().
			accessDeniedHandler(accessDeniedHandler);
		

	}
	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		auth.jdbcAuthentication().dataSource(dataSource)
//				.usersByUsernameQuery("SELECT email, senha, ativo FROM usuario WHERE email = ?")
//				.authoritiesByUsernameQuery("SELECT u.email, u.permissao FROM usuario u WHERE u.email = ?");
		auth.userDetailsService(userDetailsService);
	}
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

}
