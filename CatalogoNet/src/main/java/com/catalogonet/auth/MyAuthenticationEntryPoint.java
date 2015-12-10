package com.catalogonet.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

@Component
public class MyAuthenticationEntryPoint implements AuthenticationEntryPoint {

	
	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException ex)
			throws IOException, ServletException {
		
		
		
		String previusUrl = request.getHeader("referer");
		System.out.println("Url que veio antes: " + previusUrl);
		
		System.out.println("MyAuthenticationEntryPoint Acesso negado");
		response.sendRedirect(request.getContextPath() + "/login");
		
	}

}
