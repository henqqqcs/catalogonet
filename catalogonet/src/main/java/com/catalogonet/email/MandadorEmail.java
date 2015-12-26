package com.catalogonet.email;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.catalogonet.email.template.EmailTemplate;
import com.catalogonet.email.template.EmailTemplateBuilder;
import com.catalogonet.model.Anuncio;
import com.catalogonet.model.Pedido;
import com.catalogonet.model.Plano;
import com.catalogonet.model.Usuario;

@Service
public class MandadorEmail {

	@Autowired
	private EmailProvider emailProvider;

	private static final String PATH_CADASTRO_USUARIO = "/email/CADASTRO_USUARIO.ftl";
	private static final String PATH_PEDIDO_RECEBIDO = "/email/PEDIDO_RECEBIDO.ftl";
	private static final String PATH_PEDIDO_PAGO = "/email/PEDIDO_PAGO.ftl";
	private static final String PATH_PEDIDO_CANCELADO = "/email/PEDIDO_CANCELADO.ftl";
	private static final String PATH_ANUNCIO_CRIADO = "/email/ANUNCIO_CRIADO.ftl";
	private static final String PATH_ANUNCIO_PUBLICADO = "/email/ANUNCIO_PUBLICADO.ftl";
	// private static final String PATH_EMAIL_CADASTRO_ANUNCIO =
	// "/email/CADASTRO_ANUNCIO.ftl";
	// private static final String PATH_PEDIDO_APROVADO =
	// "/email/PEDIDO_APROVADO.ftl";
	// private static final String PATH_PEDIDO_CANCELADO =
	// "/email/PEDIDO_CANCELADO.ftl";
	// private static final String PATH_PLANO_ANUNCIO_PARA_VENCER =
	// "/email/PLANO_ANUNCIO_PARA_VENCER.ftl";
	// private static final String PATH_PLANO_ANUNCIO_VENCIDO =
	// "/email/PLANO_ANUNCIO_VENCIDO.ftl";
	// private static final String PATH_RECUPERAR_SENHA =
	// "/email/RECUPERAR_SENHA.ftl";
	// private static final String PATH_ANUNCIO_APROVADO =
	// "/email/ANUNCIO_APROVADO.ftl";
	// private static final String PATH_ANUNCIO_REPROVADO =
	// "/email/ANUNCIO_REPROVADO.ftl";

	@Async
	void mandar(String emailTo, String mensagem, String subject) {
		emailProvider.send(emailTo, mensagem, subject);
	}

	@Async
	public void mandarEmail(List<String> destinatarios, String mensagem, String assunto) {
		// for (String emailTo : destinatarios) {
		// emailProvider.send(emailTo, mensagem, assunto);
		// }
	}

	@Async
	public void mandarEmailDeCadastro(Usuario usuario) {

		EmailTemplate email = new EmailTemplateBuilder().addVariable("%USUARIO-NOME%", usuario.getNome())
				.setHeaderCharacters("##").setSubjectProperty("subject:").setSourceFileLocation(PATH_CADASTRO_USUARIO)
				.createHtmlEmail();

		emailProvider.send(usuario.getEmail(), email.getMessage(), email.getSubject());

	}

	@Async
	public void mandarEmailAnuncioCriado(Usuario usuario, Anuncio anuncio) {
		System.out.println("mandarEmailAnuncioCriado Sem implementacao");
	}

	@Async
	public void mandarEmailPedidoCriado(Usuario usuario, Pedido pedido) {

		EmailTemplate email = new EmailTemplateBuilder().addVariable("%NUMERO-PEDIDO%", pedido.getId().toString())
				.addVariable("%PRODUTO-NOME%", pedido.getProduto().getNome())
				.addVariable("%PEDIDO-VALOR%", pedido.getValor().toPlainString())
				.addVariable("%PRODUTO-DURACAO%", String.valueOf(pedido.getProduto().getDuracaoMeses()))
				.addVariable("%LINK-PAGAR-PEDIDO%", "http://www.catalogonet.com.br/area-da-empresa")
				.setHeaderCharacters("##").setSubjectProperty("subject:").setSourceFileLocation(PATH_PEDIDO_RECEBIDO)
				.createHtmlEmail();

		emailProvider.send(usuario.getEmail(), email.getMessage(), email.getSubject());

	}
	
	@Async
	public void mandarEmailPedidoPagamentoConfirmado(Pedido pedido) {
		
		EmailTemplate email = new EmailTemplateBuilder().addVariable("%NUMERO-PEDIDO%", pedido.getId().toString())
				.addVariable("%USUARIO-NOME%", pedido.getUsuario().getNome())
				.addVariable("%PRODUTO-NOME%", pedido.getProduto().getNome())
				.addVariable("%PEDIDO-VALOR%", pedido.getValor().toPlainString())
				.addVariable("%PRODUTO-DURACAO%", String.valueOf(pedido.getProduto().getDuracaoMeses()))
				.addVariable("%LINK-AREA-EMPRESA%", "http://www.catalogonet.com.br/area-da-empresa")
				.setHeaderCharacters("##").setSubjectProperty("subject:").setSourceFileLocation(PATH_PEDIDO_PAGO)
				.createHtmlEmail();

		emailProvider.send(pedido.getUsuario().getEmail(), email.getMessage(), email.getSubject());

	}
	
	@Async
	public void mandarEmailPedidoPagamentoCancelado(Pedido pedido) {
		
		EmailTemplate email = new EmailTemplateBuilder().addVariable("%NUMERO-PEDIDO%", pedido.getId().toString())
				.addVariable("%USUARIO-NOME%", pedido.getUsuario().getNome())
				.addVariable("%PRODUTO-NOME%", pedido.getProduto().getNome())
				.addVariable("%PEDIDO-VALOR%", pedido.getValor().toPlainString())
				.addVariable("%PRODUTO-DURACAO%", String.valueOf(pedido.getProduto().getDuracaoMeses()))
				.addVariable("%LINK-MEUS-PEDIDOS%", "http://www.catalogonet.com.br/area-da-empresa/meus-pedidos")
				.setHeaderCharacters("##").setSubjectProperty("subject:").setSourceFileLocation(PATH_PEDIDO_CANCELADO)
				.createHtmlEmail();

		emailProvider.send(pedido.getUsuario().getEmail(), email.getMessage(), email.getSubject());

	}
	
	@Async
	public void mandarEmailAnuncioCriado(Plano plano) {
		
		EmailTemplate email = new EmailTemplateBuilder()
				.addVariable("%USUARIO-NOME%", plano.getUsuario().getNome())
				.addVariable("%LINK-AREA-EMPRESA%", "http://www.catalogonet.com.br/area-da-empresa")
				.setHeaderCharacters("##").setSubjectProperty("subject:").setSourceFileLocation(PATH_ANUNCIO_CRIADO)
				.createHtmlEmail();

		emailProvider.send(plano.getUsuario().getEmail(), email.getMessage(), email.getSubject());

	}
	
	@Async
	public void mandarEmailAnuncioPublicado(Usuario usuario, Anuncio anuncio) {
		
		EmailTemplate email = new EmailTemplateBuilder()
				.addVariable("%USUARIO-NOME%", usuario.getNome())
				.addVariable("%ANUNCIO-TITULO%", anuncio.getTitulo())
				.addVariable("%LINK-AREA-EMPRESA%", "http://www.catalogonet.com.br/area-da-empresa")
				.setHeaderCharacters("##").setSubjectProperty("subject:").setSourceFileLocation(PATH_ANUNCIO_PUBLICADO)
				.createHtmlEmail();

		emailProvider.send(usuario.getEmail(), email.getMessage(), email.getSubject());

	}
	
	@Async
	public void mandarEmailRecuperacaoSenha(Usuario usuario) {
		throw new RuntimeException("mandarEmailRecuperacaoSenha ainda nao implementado");
	}
	
	
	@Async
	public void mandarEmailAprovacaoDeAnuncio(Usuario usuario, Anuncio anuncio) {
		//System.out.println("mandarEmailAprovacaoDeAnuncio ainda nao implementado: " + PATH_EMAIL_ANUNCIO_APROVADO);
		throw new RuntimeException("mandarEmailAprovacaoDeAnuncio ainda nao implementado");
	}

	@Async
	public void mandarEmailReprovacaoDeAnuncio(Usuario usuario, Anuncio anuncio) {
		//System.out.println("mandarEmailReprovacaoDeAnuncio" + PATH_EMAIL_ANUNCIO_REPROVADO);
		throw new RuntimeException("mandarEmailReprovacaoDeAnuncio");
	}

//	@Async
//	public void mandarEmailPedidoPagamentoConfirmado(Pedido pedido) {
//
//		Usuario usuario = pedido.getUsuario();
//
//		String emailTo = usuario.getEmail();
//		String subject = "Cat&aacute;logoNet - Confirma&ccedil;&atilde;o de recebimento de pagamento";
//		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_PEDIDO_APROVADO);
//
//		// %USUARIO-NOME%
//		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());
//
//		// %PEDIDO-NUMERO
//		mensagem = StringUtils.replace(mensagem, "%PEDIDO-NUMERO%", String.valueOf(pedido.getId()));
//
//		emailProvider.send(emailTo, mensagem, subject);
//
//	}

//	@Async
//	public void mandarEmailPedidoCancelado(Pedido pedido) {
//
//		Usuario usuario = pedido.getUsuario();
//
//		String emailTo = usuario.getEmail();
//		String subject = "Cat&aacute;logoNet - Pagamento n&atilde;o realizado";
//		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_PEDIDO_CANCELADO);
//
//		// %USUARIO-NOME%
//		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());
//
//		// %PEDIDO-NUMERO
//		mensagem = StringUtils.replace(mensagem, "%PEDIDO-NUMERO%", String.valueOf(pedido.getId()));
//
//		emailProvider.send(emailTo, mensagem, subject);
//	}

//	@Async
//	public void mandarEmailAnuncioPresteAVencimento(Usuario usuario, Anuncio anuncio, Plano plano) {
//
//		String emailTo = usuario.getEmail();
//		String subject = "Cat&aacute;logoNet &ndash; O plano do seu an&uacute;ncio est&aacute; quase vencendo";
//		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_PLANO_ANUNCIO_PARA_VENCER);
//
//		// %USUARIO-NOME%
//		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());
//
//		// %PRODUTO-NOME%
//		mensagem = StringUtils.replace(mensagem, "%PRODUTO-NOME%", plano.getProduto().getNome());
//
//		// %ANUNCIO-TITULO%
//		mensagem = StringUtils.replace(mensagem, "%ANUNCIO-TITULO%", anuncio.getTitulo());
//
//		// %PLANO-DIAS-VENCIMENTO%
//		mensagem = StringUtils.replace(mensagem, "%PRODUTO-DURACAO%", String.valueOf(plano.getDiasRestantes()));
//
//		emailProvider.send(emailTo, mensagem, subject);
//
//	}

//	@Async
//	public void mandarEmailAnuncioVencimento(Usuario usuario, Anuncio anuncio, Plano plano) {
//
//		String emailTo = usuario.getEmail();
//		String subject = "Cat&aacute;logoNet &ndash; O plano do seu an&uacute;ncio venceu";
//		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_PLANO_ANUNCIO_VENCIDO);
//
//		// %USUARIO-NOME%
//		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());
//
//		// %PRODUTO-NOME%
//		mensagem = StringUtils.replace(mensagem, "%PRODUTO-NOME%", plano.getProduto().getNome());
//
//		// %ANUNCIO-TITULO%
//		mensagem = StringUtils.replace(mensagem, "%ANUNCIO-TITULO%", anuncio.getTitulo());
//
//		// %DATA-ATUAL%
//		LocalDate hoje = LocalDate.now();
//		DateTimeFormatter formatador = DateTimeFormatter.ofPattern("dd/MM/yyyy");
//		String dataAtual = hoje.format(formatador);
//		mensagem = StringUtils.replace(mensagem, "%DATA-ATUAL%", dataAtual);
//
//		emailProvider.send(emailTo, mensagem, subject);
//	}

}
