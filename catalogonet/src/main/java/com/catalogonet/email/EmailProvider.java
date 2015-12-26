package com.catalogonet.email;

import java.util.List;

public interface EmailProvider {
	
	public void send(String emailTo, String mensagem, String subject);
	
	public void send(List<String> listEmails, String mensagem, String subject);
	
}
