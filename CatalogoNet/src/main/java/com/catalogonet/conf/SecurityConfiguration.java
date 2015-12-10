package com.catalogonet.conf;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthenticationSuccessHandler myAuthenticationSuccessHandler;

	@Autowired
	private AuthenticationFailureHandler myAuthenticationFailureHandler;

	@Autowired
	private AuthenticationProvider authenticationProvider;
	
	@Autowired
	private AccessDeniedHandler accessDeniedHandler;
	
	@Autowired
	private AuthenticationEntryPoint authenticationEntryPoint;

	@Override
	protected void configure(HttpSecurity http) throws Exception {


		http.
			authorizeRequests().
			antMatchers("/area-da-empresa/**").
			hasRole("USUARIO").
			antMatchers("/**").
			permitAll().
			anyRequest().
			authenticated().
		and().
			exceptionHandling().
			accessDeniedHandler(accessDeniedHandler).
			authenticationEntryPoint(authenticationEntryPoint).
		and().
			csrf().
			disable();
		

		// http.authorizeRequests().
		// antMatchers("/area-da-empresa/**").
		// hasRole("USUARIO").
		// antMatchers("/**").
		// permitAll()
		// .anyRequest().
		// authenticated().
		// and().
		// formLogin().
		// loginPage("/login")
		// .successHandler(myAuthenticationSuccessHandler).
		// failureHandler(myAuthenticationFailureHandler)
		// .and()
		// .csrf().disable();

	}

	
	/**
	 * Remove o filtro para parar de utilizar o /login
	 * @return
	 */
//	@Bean
//	public MyFilterPassword authenticationFilter() {
//		MyFilterPassword authFilter = new MyFilterPassword();
//		authFilter.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/4563633333335645656563", "POST"));
//
//		authFilter.setAuthenticationManager(authenticationManager);
//
//		authFilter.setAuthenticationSuccessHandler(myAuthenticationSuccessHandler);
//		authFilter.setAuthenticationFailureHandler(myAuthenticationFailureHandler);
//		authFilter.setUsernameParameter("username");
//		authFilter.setPasswordParameter("password");
//		return authFilter;
//	}

//	@Bean
//	@Override
//	public AuthenticationManager authenticationManagerBean() throws Exception {
//		return super.authenticationManagerBean();
//	}

	@Override
	protected void configure(AuthenticationManagerBuilder authBuilder) throws Exception {
		authBuilder.authenticationProvider(authenticationProvider);
	}

	// @Autowired
	// public void configureGlobal(AuthenticationManagerBuilder auth) throws
	// Exception {
	// auth.jdbcAuthentication().dataSource(dataSource)
	// .usersByUsernameQuery("SELECT email, senha, ativo FROM usuario WHERE
	// email = ?")
	// .authoritiesByUsernameQuery("SELECT u.email, u.permissao FROM usuario u
	// WHERE u.email = ?");
	// }

	// @Override
	// public AuthenticationManager authenticationManagerBean() throws Exception
	// {
	// return super.authenticationManagerBean();
	// }
	// @Bean(name="myAuthenticationManager")
	// @Override
	// public AuthenticationManager authenticationManagerBean() throws Exception
	// {
	// return super.authenticationManagerBean();
	// }
}
