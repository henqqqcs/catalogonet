package com.catalogonet.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class MyAuthenticationFailureHandler implements AuthenticationFailureHandler{

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	private static final String DEFAULT_FAILURE_URL = "/login?error";
	private static final String CART_FAILURE_URL = "/pagamento/identificacao?error";
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		handle(request, response);
		clearAuthenticationAttributes(request);
		
	}

	private void handle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (fromPaymentLogin(request)) {
			redirectStrategy.sendRedirect(request, response, CART_FAILURE_URL);
			return;
		}
		
		redirectStrategy.sendRedirect(request, response, DEFAULT_FAILURE_URL);
	}
	
	private boolean fromPaymentLogin(HttpServletRequest request) {

		String previusUrl = request.getHeader("referer");
		if (previusUrl.contains("pagamento") || previusUrl.contains("carrinho")) {
			return true;
		}
		
		return false;
	}

	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	protected RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}
	
}
