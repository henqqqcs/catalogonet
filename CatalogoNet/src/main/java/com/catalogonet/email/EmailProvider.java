package com.catalogonet.email;

public interface EmailProvider {
	
	// manda o email
	public void mandar(String emailTo, String mensagem, String subject);
	
}
