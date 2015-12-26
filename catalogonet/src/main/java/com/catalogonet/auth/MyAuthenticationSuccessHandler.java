package com.catalogonet.auth;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

@Component
public class MyAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	private RequestCache requestCache = new HttpSessionRequestCache();
	private static final String DEFAULT_TARGET_URL = "/area-da-empresa";
	private static final String ADMIN_TARGET_URL = "/adminadmin";
	private static final String CART_TARGET_URL = "/pagamento/identificacao-handle";
	

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		//check if its coming from cart login page
		if (fromCartRequest(request)) {
				redirectStrategy.sendRedirect(request, response, CART_TARGET_URL);
				return;
		}
		
		//check user role
		if (hasRoleUser(authentication)) {
			//user is logging in on login page
			if (savedRequest == null) {
				redirectStrategy.sendRedirect(request, response, DEFAULT_TARGET_URL);
				return;
			} else {
				//user is trying to acess a secured page
				String redirectUrl = savedRequest.getRedirectUrl();
				redirectStrategy.sendRedirect(request, response, redirectUrl);
				return;
			}
		} else if (hasRoleAdmin(authentication)) {
			redirectStrategy.sendRedirect(request, response, ADMIN_TARGET_URL);
			return;
		}
		
	}

	private boolean hasRoleAdmin(Authentication auth) {
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
		for (GrantedAuthority grantedAuthority : authorities) {
			if (grantedAuthority.getAuthority().equals("ROLE_ADMIN"))
				return true;
		}
		return false;
	}

	private boolean hasRoleUser(Authentication auth) {
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
		for (GrantedAuthority grantedAuthority : authorities) {
			if (grantedAuthority.getAuthority().equals("ROLE_USUARIO"))
				return true;
		}
		return false;
	}

	protected boolean fromCartRequest(HttpServletRequest request) {

		String previusUrl = request.getHeader("referer");
		if (previusUrl.contains("pagamento") || (previusUrl.contains("carrinho"))) {
			return true;
		}

		return false;
	}

	
	public void setRequestCache(RequestCache requestCache) {
		this.requestCache = requestCache;
	}
	
}
