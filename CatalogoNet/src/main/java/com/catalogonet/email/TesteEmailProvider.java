package com.catalogonet.email;

public class TesteEmailProvider implements EmailProvider {

	@Override
	public void mandar(String emailTo, String mensagem, String subject) {

		
		System.out.println("Mandando email da classe teste ---- ");
		
		System.out.println("emailTo: " + emailTo);
		System.out.println("mensagem: " + mensagem);
		System.out.println("subject: " + subject);
		
	}

}
