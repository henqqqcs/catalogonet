package com.catalogonet.controller.publico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catalogonet.pagamento.PagSeguroCheckoutHelper;
import com.catalogonet.pagamento.PaypalCheckoutHelper;
import com.catalogonet.pagamento.ResultadoPagamento;
import com.catalogonet.pedido.MetodoPagamento;
import com.catalogonet.pedido.Pedido;
import com.catalogonet.pedido.PedidoRN;
import com.catalogonet.pedido.PedidoStatus;
import com.catalogonet.produto.Produto;
import com.catalogonet.produto.ProdutoRN;
import com.catalogonet.usuario.Usuario;
import com.catalogonet.usuario.UsuarioRN;

@Controller
@RequestMapping("/pagamento")
@SessionAttributes({ "produto", "fromCriarAnuncioSession", "resultadoPagamento" })
public class PagamentoController {

	@Autowired
	private ProdutoRN produtoRN;

	@Autowired
	private UsuarioRN usuarioRN;

	@Autowired
	private PedidoRN pedidoRN;

	@RequestMapping("/carrinho")
	public String paginaCarrinho(
			@RequestParam(required = false) Long idProduto,
			@RequestParam(required = false) boolean fromCriarAnuncio,
			WebRequest request, RedirectAttributes redirectAttributes,
			ModelMap map) {

		Produto produto = new Produto();
		if (idProduto != null) {
			produto = produtoRN.buscarPorId(idProduto);
		}

		System.out.println("|-- produto no carrinho: " + produto.getNome());
		map.put("produto", produto);

		// verifica se o fluxo veio do criar anuncio
		if (fromCriarAnuncio == true) {
			System.out.println("fromCriarAnuncio eh TRUE no carrinho");
			map.put("fromCriarAnuncioSession", fromCriarAnuncio);
		} else {
			// remove o atributo da sessao
			request.removeAttribute("fromCriarAnuncioSession",
					WebRequest.SCOPE_SESSION);
		}
		return "publico/pagamento/pagamento-carrinho";
	}

	@RequestMapping("/carrinho-handle")
	public String paginaCarrinhoHandle(ModelMap map) {

		// verifica se ha um usuario logado
		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		if (usuario != null) {
			// ja esta logado
			// pula a etapa de identificacao
			return "redirect:/pagamento/confirmar-pedido";
		}

		// usuario nao logado
		return "redirect:/pagamento/identificacao";
	}

	@RequestMapping(value = "/identificacao", method = RequestMethod.GET)
	public String paginaIdentificacao(
			@RequestParam(value = "error", required = false) String error,
			ModelMap map) {

		if (error != null) {
			map.put("error",
					"Ops! Esse usuário não foi encontrado, verique seu email e senha.");
		}

		if (map.get("usuarioRegistro") == null) {
			map.put("usuarioRegistro", new Usuario());
		}

		return "publico/pagamento/pagamento-identificacao";
	}

	@RequestMapping("/identificacao-handle")
	public String paginaIdentificacaoHandle(ModelMap map) {

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		if (usuario == null) {
			System.out.println("Usuario ainda nao esta autenticado?");
			return "redirect:/pagamento/identificacao";
		}
		map.put("usuario", usuario);

		// confirmar pedido
		return "redirect:/pagamento/confirmar-pedido";
	}

	@RequestMapping("/confirmar-pedido")
	public String paginaConfirmarPedido(ModelMap map) {

		Produto produto = (Produto) map.get("produto");
		if (produto == null) {
			System.err
					.println("|-ERRO: Produto null dentro do confirmar pedido");
			return "redirect:/carrinho";
		}

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		if (usuario == null) {
			System.out.println("Usuario ainda nao esta autenticado?");
			return "redirect:/pagamento/identificacao";
		}

		map.put("usuario", usuario);
		map.put("produto", produto);

		return "publico/pagamento/pagamento-confirmar-pedido";
	}

	@RequestMapping(value = "/confirmar-pedido-handle", method = RequestMethod.POST)
	public String paginaConfirmarPedidoHandle(
			@RequestParam(required = false) String metodoPagamento,
			RedirectAttributes redirectAttributes, ModelMap map) {

		System.out.println("Metodo de pagamento escolhido: " + metodoPagamento);

		Produto produto = (Produto) map.get("produto");
		if (produto == null) {
			System.err
					.println("|-ERRO: Produto null dentro do confirmar pedido");
			return "redirect:/carrinho";
		}

		System.out.println("|== produto: " + produto.getNome());

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		if (usuario == null) {
			System.out.println("Usuario ainda nao esta autenticado?");
			return "redirect:/pagamento/identificacao";
		}

		System.out.println("|== usuario: " + usuario.getEmail());

		// criar um novo pedido
		boolean renovacao = false;

		MetodoPagamento metodoPagamentoEnum = pedidoRN
				.pegarMetodoDePagamento(metodoPagamento);

		// set pedido
		Pedido pedido = new Pedido(metodoPagamentoEnum,
				PedidoStatus.AGUARDANDO_PAGAMENTO, renovacao, usuario, produto);

		// usuario
		pedido.setUsuario(usuario);

		// metodo de pagamento
		String paginaDeRedirecionamento = "/";
		if (metodoPagamento.equals("pagseguro")) {

			// set metodo de pagamento
			pedido.setMetodoPagamento(MetodoPagamento.PAG_SEGURO);

			// salvar o pedido
			pedido = pedidoRN.adicionar(pedido);

			// criar pagamento pagseguro
			PagSeguroCheckoutHelper pagSeguroCheckoutHelper = new PagSeguroCheckoutHelper();
			ResultadoPagamento resultadoPagamento = pagSeguroCheckoutHelper
					.fazerCheckout(produto, usuario, pedido);

			map.put("resultadoPagamento", resultadoPagamento);
			paginaDeRedirecionamento = resultadoPagamento.getRedirectURL();

		} else if (metodoPagamento.equals("paypal")) {

			// set metodo de pagamento
			pedido.setMetodoPagamento(MetodoPagamento.PAYPAL);

			// salvar o pedido
			pedido = pedidoRN.adicionar(pedido);

			PaypalCheckoutHelper paypalCheckoutHelper = new PaypalCheckoutHelper();
			paginaDeRedirecionamento = paypalCheckoutHelper.fazerCheckout(
					produto, usuario, pedido);
		}

		return "redirect:" + paginaDeRedirecionamento;
	}

	/*
	 * Para confirmar pedido do paypal
	 */
	@RequestMapping("/confirmar-pagamento")
	public String paginaConfirmarPagamento(
			@RequestParam(required = false) String paymentId,
			@RequestParam(required = false) String token,
			@RequestParam(required = false) String PayerID, ModelMap map) {

		System.out.println("|-- confirmar pagamento --");
		System.out.println("|-- payment id: " + paymentId);
		System.out.println("|-- token: " + token);
		System.out.println("|-- payerid: " + PayerID);

		Produto produto = (Produto) map.get("produto");
		if (produto == null) {
			System.err
					.println("|-ERRO: Produto null dentro do confirmar pedido");
			return "redirect:/carrinho";
		}

		Usuario usuario = usuarioRN.pegaUsuarioNaSessao(map);
		if (usuario == null) {
			System.out.println("Usuario ainda nao esta autenticado?");
			return "redirect:/pagamento/identificacao";
		}

		map.put("usuario", usuario);
		map.put("produto", produto);
		map.put("paymentId", paymentId);
		map.put("token", token);
		map.put("PayerID", PayerID);

		return "publico/pagamento/pagamento-confirmar-pagamento";

	}

	/**
	 * Confirmar paypal
	 */
	@RequestMapping(value = "/confirmar-pagamento-handle", method = RequestMethod.POST)
	public String paginaConfirmarPagamentoHandle(
			@RequestParam(required = false) String paymentId,
			@RequestParam(required = false) String token,
			@RequestParam(required = false) String PayerID,
			RedirectAttributes redirectAttributes, ModelMap map) {

		PaypalCheckoutHelper paypalCheckoutHelper = new PaypalCheckoutHelper();
		String resultado = paypalCheckoutHelper.executarPagamento(paymentId,
				token, PayerID);

		if (resultado.equals("approved")) {
			redirectAttributes.addFlashAttribute("aprovado", "aprovado");
			return "redirect:/pagamento/finalizacao?paypalApproved=true";
		}

		return "redirect:/pagamento/finalizacao";
	}

	/**
	 * Decide qual pagina de finalizacao sera mostrada: a pagina de obrigado do
	 * fluxo de pagamento, ou a paginaa de criacao de anuncios....
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("/finalizacao")
	public String pagamentoFinalizacao(RedirectAttributes redirectAttributes,
			@RequestParam(required = false) String transaction_id,
			@RequestParam(required = false) String paypalApproved,
			WebRequest request, ModelMap map) {

		String paginaObrigado = "redirect:/pagamento/obrigado";

		// verfica se eh do pagseguro
		if (transaction_id != null) {

			// consultar transacao
			// PagSeguroCheckoutHelper pagSeguroHelper = new
			// PagSeguroCheckoutHelper();
			// boolean pago =
			// pagSeguroHelper.consultarStatusPagamento(transaction_id);
			
			boolean pago = Boolean.valueOf(transaction_id);
			if (pago) {
				redirectAttributes.addFlashAttribute("pago", "pago");
			}
		}

		// verifica id do paypal
		if (paypalApproved != null) {
			redirectAttributes.addFlashAttribute("pago", "pago");
		} 
		
		//verifica se vem do fluxo de criacao de anuncios
		Object fromAnuncioObject = map.get("fromCriarAnuncioSession");
		if (fromAnuncioObject != null) {
			// remove o atributo fromCriarAnuncio
			map.remove("fromCriarAnuncioSession");
			// remove o atributo da sessao
			request.removeAttribute("fromCriarAnuncioSession",
					WebRequest.SCOPE_SESSION);

			// pagina a ser mostrada
//			redirectAttributes.addFlashAttribute("paginaConfirmacao",
//					"confirmacao-aguardando-pagamento");

			paginaObrigado = "redirect:/area-da-empresa/criar-anuncio/obrigado";
		}


		return paginaObrigado;
	}

	@RequestMapping("/obrigado")
	public String pagamentoObrigado(ModelMap map) {

		if (map.get("pago") != null) {
			return "publico/pagamento/finalizacao/pagamento-aprovado";
		}

		return "publico/pagamento/finalizacao/pagamento-aguardando";
	}

}
