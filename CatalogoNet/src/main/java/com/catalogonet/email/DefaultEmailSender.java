package com.catalogonet.email;

import java.util.List;

import javax.mail.internet.InternetAddress;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DefaultEmailSender implements EmailProvider {

	@Autowired
	private EmailProperties emailProperties;

	@Override
	public void send(String emailTo, String mensagem, String subject) {

		if (EmailProperties.isProducao()) {
			HtmlEmail email = new HtmlEmail();
			try {
				email.addTo("henriquegb100@hotmail.com");
				email.setSubject(subject);
				email.setHtmlMsg(mensagem);

				System.out.println(emailProperties.getHostName());
				System.out.println(emailProperties.getFromAdrr() + " " + emailProperties.getFromName());
				System.out.println(
						emailProperties.getAutheticatorLogin() + " " + emailProperties.getAutheticatorPassword());
				System.out.println(emailProperties.getSmtpPort());
				System.out.println(emailProperties.getCharset());

				email.setHostName(emailProperties.getHostName());
				email.setFrom(emailProperties.getFromAdrr(), emailProperties.getFromName());
				email.setAuthenticator(new DefaultAuthenticator(emailProperties.getAutheticatorLogin(),
						emailProperties.getAutheticatorPassword()));
				email.setSmtpPort(emailProperties.getSmtpPort());
				email.setCharset(emailProperties.getCharset());
				email.setSSLOnConnect(true);
				email.setSSLOnConnect(true);
				email.send();

			} catch (EmailException e) {
				System.out.println("Ocorreu um erro ao mandar um email para: ");
				for (InternetAddress ia : email.getToAddresses()) {
					System.out.println("Email: " + ia.getAddress());
				}
				e.printStackTrace();
			}

		} else {

			System.out.println("|-- Enviando email - Em Desenvolvimento ------------------- ");
			System.out.println("emailTo: " + emailTo);
			System.out.println("subject: " + subject);
			System.out.println("From addr (email properties) : " + emailProperties.getFromAdrr());
			System.out.println("|----------------------------------------------------------");

		}

	}

	@Override
	public void send(List<String> listEmails, String mensagem, String subject) {

		for (String emailTo : listEmails) {

			System.out.println("Mandando email ---- ");
			System.out.println("emailTo: " + emailTo);
			System.out.println("mensagem: " + mensagem);
			System.out.println("subject: " + subject);
			System.out.println("From addr (email properties) : " + emailProperties.getFromAdrr());

		}

	}

}
