package com.catalogonet.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

@Component
public class MyAccessDeniedHandler implements AccessDeniedHandler{

private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	private static final String DEFAULT_ACESS_DENIED_PAGE = "/login?denied";
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {

		redirectStrategy.sendRedirect(request, response, DEFAULT_ACESS_DENIED_PAGE);
		
	}

}
