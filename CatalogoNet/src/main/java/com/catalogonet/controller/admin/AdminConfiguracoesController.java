package com.catalogonet.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.catalogonet.backup.Backup;
import com.catalogonet.backup.BackupRN;
import com.catalogonet.email.EmailProperties;

@Controller
@RequestMapping("/adminadmin/configuracoes")
public class AdminConfiguracoesController {

	
	@Autowired
	private EmailProperties emailProperties;
	
	@Autowired
	private BackupRN backupRN;
	
	private final String COMANDO_BACKUP_PADRAO = "mysqldump test";
	
	@RequestMapping("/backup")
	public String configuracoesBackup(ModelMap map) {
		
		List<Backup> listaBackup = backupRN.listarBackup();
		map.put("listaBackup", listaBackup);
		
		return "/admin/configuracoes/config-backup";
	}
	
	
	@RequestMapping(value = "/executar-comando-sql", method=RequestMethod.GET)
	public String configuracoesExecutarComandoSQL(@RequestParam String comando, ModelMap map) {
		
		
		System.out.println(comando);
		backupRN.executarComandoSQL(COMANDO_BACKUP_PADRAO);
		return "redirect:/adminadmin/configuracoes/backup";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//emails
	
	@RequestMapping("/email")
	public String configuracoesEmail(ModelMap map) {
		map.put("emailProperties", emailProperties);
		return "/admin/configuracoes/config-email";
	}
	
	@RequestMapping("/atualizar-email")
	public String configuracoesAtualizarEmail(@ModelAttribute EmailProperties emailProperties, ModelMap map) {
		
//		try {
//			Properties props = new Properties();
//			props = FileUtils.loadProperties();
//			
//			System.out.println("No controller:");
//			if (props == null) {
//				System.out.println("No controller props eh null");
//			} else {
//				System.out.println("Props no controller nao eh null");
//			}
//			
//			if (emailProperties == null) {
//				System.out.println("email properties eh null");
//			} else {
//				System.out.println("email properties nao eh null");
//			}
//			
//			//atualiza as properties
//			props.setProperty("hostName", emailProperties.getHostName());
//			props.setProperty("fromAdrr", emailProperties.getFromAdrr());
//			props.setProperty("fromName", emailProperties.getFromName());
//			props.setProperty("autheticatorLogin", emailProperties.getAutheticatorLogin());
//			props.setProperty("autheticatorPassword", emailProperties.getAutheticatorPassword());
//			props.setProperty("smtpPort", String.valueOf(emailProperties.getSmtpPort()));
//			props.setProperty("charset", emailProperties.getCharset());
//			
//			//salva a props
//			FileUtils.salvarProperties(props);

			//map.put("mensagem", "As configuraçoes foram salvas com sucesso! Para que as alterações tenham efeito e necessario um server reset.");
	
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			//map.put("mensagem", "Aconteceu algum erro ao tentar salvar as configurações de email.");
//			e.printStackTrace();
//		}
		
		return "redirect:/adminadmin/configuracoes/email";
	}
	
	
}
