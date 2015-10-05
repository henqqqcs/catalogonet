package com.catalogonet.pagamento;

import java.math.BigDecimal;

import org.apache.commons.lang3.StringUtils;

import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.domain.checkout.Checkout;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;
import br.com.uol.pagseguro.properties.PagSeguroConfig;
import br.com.uol.pagseguro.service.NotificationService;

import com.catalogonet.pedido.Pedido;
import com.catalogonet.produto.Produto;
import com.catalogonet.usuario.Usuario;

public class PagSeguroCheckoutHelper {

	private static final String NOTIFICATION_URL = "http://localhost:8080/CatalogoNet/pagamento/finalizacao?pagSeguroNotificationCode=";
	private static final String REDIRECT_URL = "http://www.naointendo.com.br/viciados-da-semana";

	public ResultadoPagamento fazerCheckout(Produto produto, Usuario usuario, Pedido pedido) {

		Checkout checkout = new Checkout();
		checkout.addItem(String.valueOf(produto.getId()), // Identificação
															// em seu
															// sistema
				produto.getNome(), // Descrição
				Integer.valueOf(1), // Quantidade
				produto.getValor(), // Valor unitário
				new Long(0), // Peso unitário, em gramas
				new BigDecimal("0.00") // Valor unitário do frete
		);

		checkout.setCurrency(Currency.BRL);
		
		String reference = "";
		try {
			reference = String.valueOf(pedido.getId());
		} catch (Exception e1) {
			System.out.println("Erro ao pegar ID do pedido");
			e1.printStackTrace();
		}
		checkout.setReference(reference);
		checkout.setNotificationURL(NOTIFICATION_URL);
		checkout.setRedirectURL(REDIRECT_URL);

		String checkoutURL = "";
		try {

			Boolean onlyCheckoutCode = false;
			checkoutURL = checkout.register(
					PagSeguroConfig.getAccountCredentials(), onlyCheckoutCode);
			
			System.out.println("|-- pagseguro url: " + checkoutURL);
			
			String notificationCode = StringUtils.substringAfter(checkoutURL, "code=");
			
			System.out.println("|-- notification code: " + notificationCode);
			
			ResultadoPagamento resultadoPagamento = new ResultadoPagamento();
			resultadoPagamento.setPaymentID(notificationCode);
			resultadoPagamento.setRedirectURL(checkoutURL);
			resultadoPagamento.setPedido(pedido);
			return resultadoPagamento;
			

		} catch (PagSeguroServiceException e) {
			System.err.println(e.getMessage());
		}

		return null;

	}

	public ResultadoPagamento consultar(
			ResultadoPagamento resultadoPagamento) {

        // The authorizationCode received by your system
		
		System.out.println("Chamando o consultar");
		
        // The notificationCode received by your system
        String notificationCode = resultadoPagamento.getPaymentID();

        Transaction transaction = null;

        try {
        	
        	/* Set your account credentials on src/pagseguro-config.properties
			 * You can create an payment using an application credential and set an authorizationCode 
			 * ApplicationCredentials applicationCredentials = PagSeguroConfig.getApplicationCredentials();
             * applicationCredentials.setAuthorizationCode("your_authorizationCode");
			 */
        	
            transaction = NotificationService.checkTransaction(PagSeguroConfig.getAccountCredentials(),
                    notificationCode);
            

        } catch (PagSeguroServiceException e) {
            System.err.println(e.getMessage());
        }

        if (transaction != null) {
            System.out.println("code: " + transaction.getCode());
            System.out.println("reference: " + transaction.getReference());
            System.out.println("status: " + transaction.getStatus());
        }
		
		return null;
	}

}
