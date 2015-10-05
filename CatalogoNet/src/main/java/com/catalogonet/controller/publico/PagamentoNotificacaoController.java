package com.catalogonet.controller.publico;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.properties.PagSeguroConfig;
import br.com.uol.pagseguro.service.NotificationService;

import com.catalogonet.pedido.Pedido;
import com.catalogonet.plano.AtribuidorDePlanos;


@Controller
@RequestMapping("/pagamento/notificacoes")
public class PagamentoNotificacaoController {

	
	@RequestMapping(value = "/notificacoesPagSeguro", method = RequestMethod.POST)
	@ResponseBody
	public void receberNotificacoesPagSeguro(HttpServletRequest request) {

		String notificationCode = request.getParameter("notificationCode");
		System.out.println("O codido de notifica é: " + notificationCode);

		String notificationType = request.getParameter("notificationType");
		System.out.println("O tipo da notificação é: " + notificationType);

		Transaction transaction = null;

		try {

			transaction = NotificationService.checkTransaction(PagSeguroConfig.getAccountCredentials(), notificationCode);

			printTransaction(transaction);
			String statusCatalogonet = verificarStatus(transaction);

//			if (transaction != null) {
//
//				// pega refencia da transacao(id do pedido no meu sistema)
//				String reference = transaction.getReference();
//				Pedido pedido = pedidoRN.buscarPorId(Long.valueOf(reference));
//
//				if (statusCatalogonet.equals(AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_PAGO)) {
//					// chama o atribuidor de planos
//					pedido.setStatus(AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_PAGO);
//					atribuidorDePlanos.atribuirPlano(pedido);
//					pedidoRN.atualizar(pedido);
//					mandrillMandadorEmail.mandarEmailPedidoPagamentoConfirmado(pedido);
//				} else if (statusCatalogonet.equals(AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_AGUARDANDO_PAGAMENTO)) {
//					pedido.setStatus(AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_AGUARDANDO_PAGAMENTO);
//					pedidoRN.atualizar(pedido);
//				} else if (statusCatalogonet.equals(AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_CANCELADO)) {
//					pedido.setStatus(AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_CANCELADO);
//					atribuidorDePlanos.cancelarPedido(pedido);
//					pedidoRN.atualizar(pedido);
//					mandrillMandadorEmail.mandarEmailPedidoCancelado(pedido);
//				}
//			}

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

	/**
	 * Converte o status da transação do pagseguro, para o status de pedido do
	 * Catalgonet
	 */
	private String verificarStatus(Transaction transaction) {
		try {
//			Integer valor = transaction.getStatus().getValue();
//			if (valor == 1) {
//				return AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_AGUARDANDO_PAGAMENTO;
//			} else if (valor == 3) {
//				return AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_PAGO;
//			} else if (valor == 4) { // disponivel?
//				return AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_PAGO;
//			} else if (valor == 7) {
//				return AtribuidorDePlanos.CATALOGONET_PEDIDO_STATUS_CANCELADO;
//			}
		} catch (Exception e) {
			throw new IllegalArgumentException(
					"O metodo que converte o status da transacao do pagseguro para o status do pedido catalgonet, nao deveria cehgar ate aqui");
		}

		return null;

	}

	private static void printTransaction(Transaction transaction) {

		System.out.println("date: " + transaction.getDate());
		System.out.println("code: " + transaction.getCode());
		System.out.println("reference: " + transaction.getReference());
		System.out.println("type: " + transaction.getType());
		System.out.println("status: " + transaction.getStatus());

		if (transaction.getStatus().getValue() == 7) {
			System.out.println("cancellationSource: " + transaction.getCancellationSource());
		}

		System.out.println("lastEventDate: " + transaction.getLastEventDate());
		System.out.println("paymentMethodType: " + transaction.getPaymentMethod().getType());
		System.out.println("paymentMethodCode: " + transaction.getPaymentMethod().getCode());

		if (transaction.getPaymentLink() != null) {
			System.out.println("paymentLink: " + transaction.getPaymentLink());
		}

		System.out.println("grossAmount: " + transaction.getGrossAmount());
		System.out.println("discountAmount: " + transaction.getDiscountAmount());
		System.out.println("feeAmount: " + transaction.getFeeAmount());
		System.out.println("netAmount: " + transaction.getNetAmount());
		System.out.println("extraAmount: " + transaction.getExtraAmount());
		System.out.println("installmentCount: " + transaction.getInstallmentCount());
		System.out.println("itemCount: " + transaction.getItemCount());

		for (int i = 0; i < transaction.getItems().size(); i++) {
			System.out.println("itemId: " + transaction.getItems().get(i).getId());
			System.out.println("itemDescription: " + transaction.getItems().get(i).getDescription());
			System.out.println("itemQuantity: " + transaction.getItems().get(i).getQuantity());
			System.out.println("itemAmount: " + transaction.getItems().get(i).getAmount());
		}

		System.out.println("senderName: " + transaction.getSender().getName());
		System.out.println("senderEmail: " + transaction.getSender().getEmail());

		if (transaction.getSender() != null) {
			System.out.println("senderPhoneAreaCode: " + transaction.getSender().getPhone().getAreaCode());
			System.out.println("senderPhoneNumber: " + transaction.getSender().getPhone().getNumber());
		}

		if (transaction.getShipping() != null) {
			if (transaction.getShipping().getAddress() != null) {
				System.out.println("shippingAddressStreet: " + transaction.getShipping().getAddress().getStreet());
				System.out.println("shippingAddressNumber: " + transaction.getShipping().getAddress().getNumber());
				System.out.println("shippingAddressComplement: " + transaction.getShipping().getAddress().getComplement());
				System.out.println("shippingAddressDistrict: " + transaction.getShipping().getAddress().getDistrict());
				System.out.println("shippingAddressCity: " + transaction.getShipping().getAddress().getCity());
				System.out.println("shippingAddressState: " + transaction.getShipping().getAddress().getState());
				System.out.println("shippingAddressCountry: " + transaction.getShipping().getAddress().getCountry());
				System.out.println("shippingAddressPostalCode: " + transaction.getShipping().getAddress().getPostalCode());
			}
			System.out.println("shippingType: " + transaction.getShipping().getType());
			System.out.println("shippingCost: " + transaction.getShipping().getCost());
		}

	}
	
	
	
}
