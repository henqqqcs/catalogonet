<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
<div id="checkout-page-footer">
	<div class="checkout-page-content centro">
		<div class="checkout-page-alguma-duvida-botao-contato">
			<div class="checkout-footer-alguma-duvida">
				<p class="checkout-footer-alguma-duvida-middle">Alguma dúvida? Entre em contato conosco</p>
			</div>
			<div class="checkout-contato-button">
				<span class="checkout-contato-button-middle"><a href="<c:url value="/contato" />" class="botao">Entre em contato</a></span>
			</div>
		</div>
		<div class="checkout-page-metodos-pagamento">
			<c:url var="pagseguroImg" value="/resources/imgs/pagseguro-pequeno.gif" />
			<img src="${pagseguroImg}" alt="banner pagseguro metodos pagamento" />

			<c:url var="paypalImg" value="/resources/imgs/paypal-pequeno.gif" />
			<img src="${paypalImg}" alt="banner paypal brasil metodos pagamento" />

		</div>
		<div class="checkout-page-copy">
			<p>Copyright © 2014 www.catalogonet.com.br, TODOS OS DIREITOS RESERVADOS. É vedada qualquer reprodução, total ou parcial, de qualquer elemento de identidade, sem expressa
				autorização. Catálogonet.com.br | Seu guia comercial online do Distrito Federal</p>
		</div>
	</div>
</div>
</div>

