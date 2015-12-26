package com.catalogonet.conf;

import javax.servlet.Filter;

import org.springframework.orm.jpa.support.OpenEntityManagerInViewFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletSpringMVC extends
		AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { AppWebConfiguration.class, JPAConfiguration.class,
				SecurityConfiguration.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	// @Override
	// public void onStartup(ServletContext servletContext)
	// throws ServletException {
	// super.onStartup(servletContext);
	// servletContext.addListener(RequestContextListener.class);
	// servletContext.setInitParameter(
	// AbstractEnvironment.DEFAULT_PROFILES_PROPERTY_NAME, "dev");
	//
	// }

	@Override
	protected Filter[] getServletFilters() {
		return new Filter[] {new OpenEntityManagerInViewFilter() };
	}
}
