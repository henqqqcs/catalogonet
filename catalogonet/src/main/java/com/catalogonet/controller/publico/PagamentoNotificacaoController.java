package com.catalogonet.controller.publico;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catalogonet.gerenciador.GerenciadorDePedido;
import com.catalogonet.model.PedidoStatus;

import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.properties.PagSeguroConfig;
import br.com.uol.pagseguro.service.NotificationService;

@Controller
@RequestMapping("/pagamento/notificacoes")
public class PagamentoNotificacaoController {

	@Autowired
	private GerenciadorDePedido gerenciadorDePedidos;
	
	@RequestMapping(value = "/notificacoesPagSeguro", method = RequestMethod.POST)
	@ResponseBody
	public void receberNotificacoesPagSeguro(HttpServletRequest request) {

		String notificationCode = request.getParameter("notificationCode");
		System.out.println("O codido de notifica é: " + notificationCode);

		String notificationType = request.getParameter("notificationType");
		System.out.println("O tipo da notificação é: " + notificationType);

		Transaction transaction = null;

		try {

			transaction = NotificationService.checkTransaction(PagSeguroConfig.getAccountCredentials(),
					notificationCode);

			printTransaction(transaction);
			
			//catalogonet status
			PedidoStatus statusCatalogonet = converterStatusPagseguro(transaction);
			
			//if do pedido
			Long idPedido = Long.valueOf(transaction.getReference());
			
			//atualizar o pedido
			gerenciadorDePedidos.atualizarStatus(idPedido, statusCatalogonet);
			
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

	/**
	 * Converte o status da transação do pagseguro, para o status de pedido do
	 * Catalgonet
	 */
	private PedidoStatus converterStatusPagseguro(Transaction transaction) {
		try {
			Integer valor = transaction.getStatus().getValue();
			if (valor == 1) {
				return PedidoStatus.AGUARDANDO_PAGAMENTO;
			} else if (valor == 3) {
				return PedidoStatus.PAGO;
			} else if (valor == 4) { // disponivel?
				return PedidoStatus.PAGO;
			} else if (valor == 7) {
				return PedidoStatus.CANCELADO;
			}
		} catch (Exception e) {
			throw new IllegalArgumentException(
					"O metodo que converte o status da transacao do pagseguro para o status do pedido catalgonet, nao deveria chegar ate aqui");
		}
		
		return null;

	}

	// private String converterStatusPaypal(Transaction transaction) {
	// return null;
	// }

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
				System.out.println(
						"shippingAddressComplement: " + transaction.getShipping().getAddress().getComplement());
				System.out.println("shippingAddressDistrict: " + transaction.getShipping().getAddress().getDistrict());
				System.out.println("shippingAddressCity: " + transaction.getShipping().getAddress().getCity());
				System.out.println("shippingAddressState: " + transaction.getShipping().getAddress().getState());
				System.out.println("shippingAddressCountry: " + transaction.getShipping().getAddress().getCountry());
				System.out.println(
						"shippingAddressPostalCode: " + transaction.getShipping().getAddress().getPostalCode());
			}
			System.out.println("shippingType: " + transaction.getShipping().getType());
			System.out.println("shippingCost: " + transaction.getShipping().getCost());
		}

	}

}
