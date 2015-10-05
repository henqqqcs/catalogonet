package com.catalogonet.email;

import java.util.Properties;

import javax.annotation.PostConstruct;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.catalogonet.util.FileUtils;

@Service
@Scope("singleton")
public class EmailProperties {

	private String hostName;
	private String fromAdrr;
	private String fromName;
	private String autheticatorLogin;
	private String autheticatorPassword;
	private int smtpPort;
	private String charset;
	
	@PostConstruct
	public void loadEmailProperties() {

		try {
			Properties prop = FileUtils.loadProperties();
			if ((!(prop == null)) && (!(prop.isEmpty()))) {
				getValues(prop);
			}
		} catch (Exception e) {
			System.out.println("Erro ao ler arquivo properties do email");
			e.printStackTrace();
		}
	}
	

	private void getValues(Properties prop) {

		hostName = prop.getProperty("hostName");
		fromAdrr = prop.getProperty("fromAdrr");
		fromName = prop.getProperty("fromName");
		autheticatorLogin = prop.getProperty("autheticatorLogin");
		autheticatorPassword = prop.getProperty("autheticatorPassword");
		smtpPort =  Integer.parseInt(prop.getProperty("smtpPort").trim());
		charset = prop.getProperty("charset");
		
		System.out.println("|-- CatalogoNet: As configuracoes de email do arquivo /catalogonet-config.properties foram feitas.");

	}


	public String getHostName() {
		return hostName;
	}


	public void setHostName(String hostName) {
		this.hostName = hostName;
	}


	public String getFromAdrr() {
		return fromAdrr;
	}


	public void setFromAdrr(String fromAdrr) {
		this.fromAdrr = fromAdrr;
	}


	public String getFromName() {
		return fromName;
	}


	public void setFromName(String fromName) {
		this.fromName = fromName;
	}


	public String getAutheticatorLogin() {
		return autheticatorLogin;
	}


	public void setAutheticatorLogin(String autheticatorLogin) {
		this.autheticatorLogin = autheticatorLogin;
	}


	public String getAutheticatorPassword() {
		return autheticatorPassword;
	}


	public void setAutheticatorPassword(String autheticatorPassword) {
		this.autheticatorPassword = autheticatorPassword;
	}


	public int getSmtpPort() {
		return smtpPort;
	}


	public void setSmtpPort(int smtpPort) {
		this.smtpPort = smtpPort;
	}


	public String getCharset() {
		return charset;
	}


	public void setCharset(String charset) {
		this.charset = charset;
	}

	

}
