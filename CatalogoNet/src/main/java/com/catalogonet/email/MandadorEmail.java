package com.catalogonet.email;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.catalogonet.anuncio.Anuncio;
import com.catalogonet.pedido.Pedido;
import com.catalogonet.plano.PlanoAnuncio;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.util.FileUtils;

@Service
public class MandadorEmail {

	@Autowired
	@Qualifier("mandrillMandadorEmail")
	private EmailProvider emailProvider;

	private static final String PATH_EMAIL_CADASTRO_USUARIO = "/email/CADASTRO_USUARIO";
	private static final String PATH_EMAIL_CADASTRO_ANUNCIO = "/email/CADASTRO_ANUNCIO";
	private static final String PATH_EMAIL_PEDIDO_AGUARDANDO = "/email/PEDIDO_AGUARDANDO";
	private static final String PATH_EMAIL_PEDIDO_APROVADO = "/email/PEDIDO_APROVADO";
	private static final String PATH_EMAIL_PEDIDO_CANCELADO = "/email/PEDIDO_CANCELADO";
	private static final String PATH_EMAIL_PLANO_ANUNCIO_PARA_VENCER = "/email/PLANO_ANUNCIO_PARA_VENCER";
	private static final String PATH_EMAIL_PLANO_ANUNCIO_VENCIDO = "/email/PLANO_ANUNCIO_VENCIDO";
	private static final String PATH_EMAIL_RECUPERAR_SENHA = "/email/RECUPERAR_SENHA";
	private static final String PATH_EMAIL_ANUNCIO_APROVADO = "/email/ANUNCIO_APROVADO";
	private static final String PATH_EMAIL_ANUNCIO_REPROVADO = "/email/ANUNCIO_REPROVADO";

	@Async
	void mandar(String emailTo, String mensagem, String subject) {
		emailProvider.mandar(emailTo, mensagem, subject);
	}

	@Async
	public void mandarEmail(List<String> destinatarios, String mensagem, String assunto) {
		for (String emailTo : destinatarios) {
			emailProvider.mandar(emailTo, mensagem, assunto);
		}
	}

	@Async
	public void mandarEmailDeCadastro(Usuario usuario) {

		String emailTo = usuario.getEmail();
		String subject = "Cat&aacute;logoNet - Bem-vindo, " + usuario.getNome();
		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_CADASTRO_USUARIO);

		// %USUARIO-NOME%
		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());

		System.out.println(mensagem);
		emailProvider.mandar(emailTo, mensagem, subject);

	}

	@Async
	public void mandarEmailAnuncioCriado(Usuario usuario, Anuncio anuncio) {

		String emailTo = usuario.getEmail();
		String subject = "Cat&aacute;logoNet - Seu an&uacute;ncio foi cadastrado com sucesso!";
		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_CADASTRO_ANUNCIO);
		mensagem = StringUtils.replace(mensagem, "%ANUNCIO-TITULO%", anuncio.getTitulo());

		emailProvider.mandar(emailTo, mensagem, subject);

	}
	
	@Async
	public void mandarEmailPedidoCriado(Usuario usuario, Pedido pedido) {
		
		String emailTo = usuario.getEmail();
		String subject = "Cat&aacute;logoNet - Recebemos o seu pedido";
		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_PEDIDO_AGUARDANDO);
		
		// %USUARIO-NOME%
		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());
		
		// %PEDIDO-NUMERO
		mensagem = StringUtils.replace(mensagem, "%PEDIDO-NUMERO%", String.valueOf(pedido.getId()));
		
		// %PEDIDO-VALOR%
		mensagem = StringUtils.replace(mensagem, "%PEDIDO-VALOR%", pedido.getValor().toString());
		
		// %PRODUTO-DURACAO%
		mensagem = StringUtils.replace(mensagem, "%PRODUTO-DURACAO%",
				String.valueOf(pedido.getProduto().getDuracaoMeses()));
		
		emailProvider.mandar(emailTo, mensagem, subject);
		
	}



	@Async
	public void mandarEmailPedidoPagamentoConfirmado(Pedido pedido) {

		Usuario usuario = pedido.getUsuario();

		String emailTo = usuario.getEmail();
		String subject = "Cat&aacute;logoNet - Confirma&ccedil;&atilde;o de recebimento de pagamento";
		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_PEDIDO_APROVADO);

		// %USUARIO-NOME%
		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());

		// %PEDIDO-NUMERO
		mensagem = StringUtils.replace(mensagem, "%PEDIDO-NUMERO%", String.valueOf(pedido.getId()));

		emailProvider.mandar(emailTo, mensagem, subject);

	}

	@Async
	public void mandarEmailPedidoCancelado(Pedido pedido) {

		Usuario usuario = pedido.getUsuario();

		String emailTo = usuario.getEmail();
		String subject = "Cat&aacute;logoNet - Pagamento n&atilde;o realizado";
		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_PEDIDO_CANCELADO);

		// %USUARIO-NOME%
		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());

		// %PEDIDO-NUMERO
		mensagem = StringUtils.replace(mensagem, "%PEDIDO-NUMERO%", String.valueOf(pedido.getId()));

		emailProvider.mandar(emailTo, mensagem, subject);
	}

	@Async
	public void mandarEmailRecuperacaoSenha(Usuario usuario) {

		String emailTo = usuario.getEmail();
		String subject = "Cat&aacute;logoNet &ndash; Recupera&ccedil;&atilde;o de senha";
		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_RECUPERAR_SENHA);

		// %USUARIO-NOME%
		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());

		// %USUARIO-EMAIL%
		mensagem = StringUtils.replace(mensagem, "%USUARIO-EMAIL%", usuario.getEmail());

		// %USUARIO-SENHA%
		mensagem = StringUtils.replace(mensagem, "%USUARIO-SENHA%", usuario.getSenha());

		emailProvider.mandar(emailTo, mensagem, subject);

	}
	
	@Async
	public void mandarEmailAnuncioPresteAVencimento(Usuario usuario, Anuncio anuncio, PlanoAnuncio plano) {
		
		String emailTo = usuario.getEmail();
		String subject = "Cat&aacute;logoNet &ndash; O plano do seu an&uacute;ncio est&aacute; quase vencendo";
		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_PLANO_ANUNCIO_PARA_VENCER);
		
		// %USUARIO-NOME%
		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());
		
		// %PRODUTO-NOME%
		mensagem = StringUtils.replace(mensagem, "%PRODUTO-NOME%", plano.getProduto().getNome());
		
		// %ANUNCIO-TITULO%
		mensagem = StringUtils.replace(mensagem, "%ANUNCIO-TITULO%", anuncio.getTitulo());
		
		// %PLANO-DIAS-VENCIMENTO%
		mensagem = StringUtils.replace(mensagem, "%PRODUTO-DURACAO%", String.valueOf(plano.getDiasRestantes()));
		
		emailProvider.mandar(emailTo, mensagem, subject);
		
	}
	
	@Async
	public void mandarEmailAnuncioVencimento(Usuario usuario, Anuncio anuncio, PlanoAnuncio plano) {
		
		String emailTo = usuario.getEmail();
		String subject = "Cat&aacute;logoNet &ndash; O plano do seu an&uacute;ncio venceu";
		String mensagem = FileUtils.pegarStringArquivo(PATH_EMAIL_PLANO_ANUNCIO_VENCIDO);
		
		// %USUARIO-NOME%
		mensagem = StringUtils.replace(mensagem, "%USUARIO-NOME%", usuario.getNome());
		
		// %PRODUTO-NOME%
		mensagem = StringUtils.replace(mensagem, "%PRODUTO-NOME%", plano.getProduto().getNome());
		
		// %ANUNCIO-TITULO%
		mensagem = StringUtils.replace(mensagem, "%ANUNCIO-TITULO%", anuncio.getTitulo());
		
		// %DATA-ATUAL%
		LocalDate hoje = LocalDate.now();
		DateTimeFormatter formatador = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		String dataAtual = hoje.format(formatador);
		mensagem = StringUtils.replace(mensagem, "%DATA-ATUAL%", dataAtual);
		
		emailProvider.mandar(emailTo, mensagem, subject);
	}


	@Async
	public void mandarEmailAprovacaoDeAnuncio(Usuario usuario, Anuncio anuncio) {
		System.out.println("mandarEmailAprovacaoDeAnuncio ainda nao implementado: " + PATH_EMAIL_ANUNCIO_APROVADO);
		throw new RuntimeException("mandarEmailAprovacaoDeAnuncio ainda nao implementado");
	}

	@Async
	public void mandarEmailReprovacaoDeAnuncio(Usuario usuario, Anuncio anuncio) {
		System.out.println("mandarEmailReprovacaoDeAnuncio" + PATH_EMAIL_ANUNCIO_REPROVADO);
		throw new RuntimeException("mandarEmailReprovacaoDeAnuncio");
	}
}
