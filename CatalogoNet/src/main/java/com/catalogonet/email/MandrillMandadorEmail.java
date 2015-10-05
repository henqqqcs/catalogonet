package com.catalogonet.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MandrillMandadorEmail implements EmailProvider {

	@Autowired
	private EmailProperties emailProperties;

	@Override
	public void mandar(String emailTo, String mensagem, String subject) {
		
		System.out.println("Mandando email ---- ");
		
		System.out.println("emailTo: " + emailTo);
		System.out.println("mensagem: " + mensagem);
		System.out.println("subject: " + subject);
		System.out.println("From addr (email properties) : " + emailProperties.getFromAdrr());
		
//		HtmlEmail email = new HtmlEmail();
//		try {
//			email.addTo(emailTo);
//			email.setSubject(subject);
//			email.setHtmlMsg(mensagem);
//			
//			
//			System.out.println("Mandando email:");
//			System.out.println(emailProperties.getHostName());
//			System.out.println(emailProperties.getFromAdrr() + " " + emailProperties.getFromName());
//			System.out.println(emailProperties.getAutheticatorLogin() + " " + emailProperties.getAutheticatorPassword());
//			System.out.println(emailProperties.getSmtpPort());
//			System.out.println(emailProperties.getCharset());
//			
//			email.setHostName(emailProperties.getHostName());
//			email.setFrom(emailProperties.getFromAdrr(), emailProperties.getFromName());
//			email.setAuthenticator(new DefaultAuthenticator(emailProperties.getAutheticatorLogin(), emailProperties.getAutheticatorPassword()));
//			email.setSmtpPort(emailProperties.getSmtpPort());
//			email.setCharset(emailProperties.getCharset());
//			email.setSSLOnConnect(true);
//			email.setSSLOnConnect(true);
//			email.send();
//			
//		} catch (EmailException e) {
//			System.out.println("Ocorreu um erro ao mandar um email para: ");
//			for (InternetAddress ia : email.getToAddresses()) {
//				System.out.println("Email: " + ia.getAddress());
//			}
//			e.printStackTrace();
//		}
		
	}

}
