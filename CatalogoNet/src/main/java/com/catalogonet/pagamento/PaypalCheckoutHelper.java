package com.catalogonet.pagamento;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.catalogonet.pedido.Pedido;
import com.catalogonet.produto.Produto;
import com.catalogonet.usuario.Usuario;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;

public class PaypalCheckoutHelper {

//	private static final String NOTIFICATION_URL = "http://www.catalogonet.com.br/pagamento/notificacoes/pagsegurO";
	private static final String REDIRECT_URL = "http://localhost:8080/CatalogoNet/pagamento/confirmar-pagamento";
	
	static Map<String, PaymentDetails> paymentDetailsMap = new HashMap<String, PaymentDetails>();

	public String fazerCheckout(Produto produto, Usuario usuario, Pedido pedido) {

		try {
			
			System.out.println("|-- chamando paypal");
			
			Map<String, String> sdkConfig = new HashMap<String, String>();
			sdkConfig.put("mode", "sandbox");

			String accessToken = new OAuthTokenCredential(
					"AdjcNoN6TaGA8-mWwvkSsRJEAfcpe3H0xzpV2XVY2SaW_p7oDY61xl1ctomZflj6VwpBCA2KGTmOxlJC",
					"EJi1p7WIiyt3AH21i5pAOFdC6LFuJ7QscF7xUgO6W6BPNSrgwZMk_i4w0bF55FPqOr4Yyl2TNIx8RBEZ",
					sdkConfig).getAccessToken();

			APIContext apiContext = new APIContext(accessToken);
			apiContext.setConfigurationMap(sdkConfig);

			Amount amount = new Amount();
			amount.setCurrency("BRL");
			amount.setTotal(pedido.getValor().toString());

			Transaction transaction = new Transaction();
			transaction.setDescription(pedido.getProduto().getNome());
			transaction.setAmount(amount);

			List<Transaction> transactions = new ArrayList<Transaction>();
			transactions.add(transaction);

			Payer payer = new Payer();
			payer.setPaymentMethod("paypal");

			Payment payment = new Payment();
			payment.setIntent("sale");
			payment.setPayer(payer);
			payment.setTransactions(transactions);
			RedirectUrls redirectUrls = new RedirectUrls();
			redirectUrls
					.setCancelUrl("https://devtools-paypal.com/guide/pay_paypal?cancel=true");
			redirectUrls
					.setReturnUrl(REDIRECT_URL);
			payment.setRedirectUrls(redirectUrls);

			Payment createdPayment = payment.create(apiContext);

			PaymentDetails paymentDetails = new PaymentDetails();
			paymentDetails.id = createdPayment.getId();
			for (Links link : createdPayment.getLinks()) {
				if ("approval_url".equals(link.getRel()))
					paymentDetails.approvalUrl = link.getHref();
				if ("execute".equals(link.getRel()))
					paymentDetails.executeUrl = link.getHref();
			}
			String token = paymentDetails.approvalUrl
					.substring(paymentDetails.approvalUrl.indexOf("token=")
							+ "token=".length());
			paymentDetailsMap.put(token, paymentDetails);

			System.out.println("Created Paypal payment:");
			System.out.println("- id: " + createdPayment.getId());
			System.out.println("- token: " + token);
			System.out.println("- state: " + createdPayment.getState());
			System.out.println("- approval URL: " + paymentDetails.approvalUrl);
			System.out.println("- execute URL: " + paymentDetails.executeUrl);

			return paymentDetails.approvalUrl;
			
		} catch (PayPalRESTException e) {
			e.printStackTrace();
		}

		return null;

	}
	
    class PaymentDetails {
        String id;
        String approvalUrl;
        String executeUrl;
    }

	public String executarPagamento(String paymentId, String token, String payerID) {

		
		
		try {
			Map<String, String> sdkConfig = new HashMap<String, String>();
			sdkConfig.put("mode", "sandbox");

			String accessToken = new OAuthTokenCredential(
					"AdjcNoN6TaGA8-mWwvkSsRJEAfcpe3H0xzpV2XVY2SaW_p7oDY61xl1ctomZflj6VwpBCA2KGTmOxlJC",
					"EJi1p7WIiyt3AH21i5pAOFdC6LFuJ7QscF7xUgO6W6BPNSrgwZMk_i4w0bF55FPqOr4Yyl2TNIx8RBEZ",
					sdkConfig).getAccessToken();
			
			
			
			
			APIContext apiContext = new APIContext(accessToken);
			apiContext.setConfigurationMap(sdkConfig);

			Payment payment = new Payment();
			
			//payment id
			payment.setId(paymentId);
			
			PaymentExecution paymentExecute = new PaymentExecution();
			
			//payer id
			paymentExecute.setPayerId(payerID);
			
			//executar
			Payment createdPayment = payment.execute(apiContext, paymentExecute);
			
			String state = createdPayment.getState();
			
			return state;
			
		} catch (PayPalRESTException e) {
			e.printStackTrace();
		}
		
		return "erro";
		
		
	}

}
