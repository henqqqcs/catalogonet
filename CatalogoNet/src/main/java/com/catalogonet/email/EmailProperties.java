package com.catalogonet.email;

import java.util.Properties;

import org.springframework.stereotype.Component;

@Component
public class EmailProperties {

	private static String hostName;
	private static String fromAdrr;
	private static String fromName;
	private static String autheticatorLogin;
	private static String autheticatorPassword;
	private static int smtpPort;
	private static String charset;
	private static boolean producao;

	public static void setEmailProperties(Properties prop) {
		if ((!(prop == null)) && (!(prop.isEmpty()))) {

			hostName = prop.getProperty("hostName");
			fromAdrr = prop.getProperty("fromAdrr");
			fromName = prop.getProperty("fromName");
			autheticatorLogin = prop.getProperty("autheticatorLogin");
			autheticatorPassword = prop.getProperty("autheticatorPassword");
			smtpPort = Integer.parseInt(prop.getProperty("smtpPort").trim());
			charset = prop.getProperty("charset");
			producao = Boolean.parseBoolean(prop.getProperty("producao"));

		} else {
			throw new IllegalArgumentException(
					"Error: Impossible to create the email configuration. Email properties is null or empty");
		}
	}


	public String getHostName() {
		return hostName;
	}

	public String getFromAdrr() {
		return fromAdrr;
	}

	public String getFromName() {
		return fromName;
	}

	public String getAutheticatorLogin() {
		return autheticatorLogin;
	}

	public String getAutheticatorPassword() {
		return autheticatorPassword;
	}

	public int getSmtpPort() {
		return smtpPort;
	}

	public String getCharset() {
		return charset;
	}
	
	public static boolean isProducao() {
		return producao;
	}

}
