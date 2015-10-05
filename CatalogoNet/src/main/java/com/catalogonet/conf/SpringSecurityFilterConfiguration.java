package com.catalogonet.conf;

import javax.servlet.ServletContext;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.support.MultipartFilter;

public class SpringSecurityFilterConfiguration extends AbstractSecurityWebApplicationInitializer {
	
	/*
	 * Necessario para fazer upload de arquivos
	 * characterEncodingFilter eh necessario para obter o encode correto (utf-8) dos formularios
	 * */
	@Override
	protected void beforeSpringSecurityFilterChain(ServletContext servletContext) {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        
		insertFilters(servletContext, characterEncodingFilter, new MultipartFilter());
	}
}
