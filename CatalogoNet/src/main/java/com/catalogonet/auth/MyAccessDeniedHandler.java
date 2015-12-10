package com.catalogonet.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

@Component
public class MyAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException ex)
			throws IOException, ServletException {
		
		
		String referrer = request.getHeader("Referer");
		System.out.println("Url que veio antes: " + referrer);
		
		System.out.println("Acesso negado");
		response.sendRedirect(request.getContextPath() + "/login");
		
	}

}
