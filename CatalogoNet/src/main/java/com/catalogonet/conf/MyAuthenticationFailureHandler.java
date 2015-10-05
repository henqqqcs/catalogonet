package com.catalogonet.conf;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
public class MyAuthenticationFailureHandler implements
		AuthenticationFailureHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationFailure(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException auth)
			throws IOException, ServletException {
		
		handle(request, response);
		clearAuthenticationAttributes(request);

	}

	protected void handle(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException {

		String targetUrl = "/login?error";

		/**
		 * Verifica se o usuario fez login no carrinho de compras ou normalmente
		 */
		String previusUrl = request.getHeader("referer");
		System.out.println("Previus URL: " + previusUrl);
		
		if (previusUrl.contains("/pagamento")) {
			System.out.println("Contem a string pagamento");
			targetUrl = "/pagamento/identificacao?error";
		}
		if (response.isCommitted()) {
			System.out
					.println("Response has already been committed. Unable to redirect to "
							+ targetUrl);
			return;
		}

		redirectStrategy.sendRedirect(request, response, targetUrl);
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
