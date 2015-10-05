<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Pagamento - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
<link rel="shortcut icon" href="<c:url value="/resources/imgs/favicon.gif" /> " type="image/ico" />

<link rel="stylesheet" href="<c:url value="/resources/css/reset.css" /> ">
<link rel="stylesheet" href="<c:url value="/resources/css/estilos.css" /> ">
<link rel="stylesheet" href="<c:url value="/resources/css/estilos_restrito.css" /> ">

</head>

<body>


	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/publico/topo_pagina.jsp" />

	<!-- Conteudo da pagina -->
	<section id="conteudoAlternativo">

	<div class="container">

		<div id="breadcrumb">
			<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
				» <a href="<c:url value="/areaDaEmpresa/home" />" itemprop="url"><span itemprop="title">Home</span></a>
			</div>
			<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" id="breadcrumb">
				» <a href="<c:url value="/areaDaEmpresa/contratarPlano" />" itemprop="url"><span itemprop="title">Contratar Plano</span></a> » Pagamento
			</div>
		</div>
		<br />
		<div class="content-wrapper-gray">
			<p class="textoGrande negrito">Pagamento</p>
		</div>
		<br />
		<div class="content-wrapper">

			<c:url var="redirecionarPagamento" value="/areaDaEmpresa/redirecionarPagamento" />
			<sf:form modelAttribute="pedido" action="${redirecionarPagamento}" method="POST">

				<p class="textoMedio negrito">Informações do pedido</p>
				<hr />
				<p>
					<span class="negrito">Plano contratado: </span>${pedido.produto.nome}</p>
				<p>
					<span class="negrito">Valor: </span>R$ ${pedido.valor}
				</p>
				<p>
					<span class="negrito">Aplicado ao anúncio: </span>${pedido.anuncio.titulo}</p>
				<p>
					<span class="negrito">Duração: </span>${pedido.produto.duracaoMeses} meses
				</p>
				<br />
				<br />
				<p class="textoMedio negrito">Escolha o método de pagamento</p>
				<hr />
				<ul class="payment-methods">
					<li class="payment-method pagseguro"><input name="metodoPagamento" value="PagSeguro" type="radio" id="pagseguro" checked> <label for="pagseguro">PagSeguro</label><br /></li>
<!-- 					<li class="payment-method paypal"><input name="metodoPagamento" value="PayPal" type="radio" id="paypal"> <label for="paypal">PayPal</label></li> -->
				</ul>
				<div class="clear"></div>
				<br />
				<br />
				<div class="centro">
					<button type="submit" id="botaoPagamento">Pagar &#10148;</button>
					<span class="textoMuitoPequeno"><br /> (Você será redirecionado para a página de pagamento)</span>
				</div>

			</sf:form>
		</div>

	</div>
	<!-- Fim do Container --> <!-- checkout footer --> <br />
	<c:import url="/WEB-INF/views/template/publico/checkout_footer.jsp" /> </section>

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	<!-- Sub-rodape -->
	<c:import url="/WEB-INF/views/template/publico/sub_rodape.jsp" />

</body>
</html>