<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Obrigado - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
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
				» <a href="<c:url value="/areaDaEmpresa/contratarPlano" />" itemprop="url"><span itemprop="title">Contratar Plano</span></a> » Obrigado
			</div>
		</div>
		<!-- /breadcrumb -->

	<br/>
		<div class="check-out-site-logo">
			<c:url var="catalgonetLogo" value="/resources/imgs/logo.jpg" />
			<img src="${catalgonetLogo}" alt="catalogonet logo" />
			<hr />
		</div>

		<br /> <br />
		<div class="mensagem-obrigado-depois-checkout">

			<span class="textoGrande negrito">Obrigado!</span> <br /> <br />
			<p>Agradecemos por participar do CatálogoNet. Dentro de algumas horas (aguardando a aprovação) seu anúncio estará disponível no sistema de buscas.</p>
			<br />
			<p>
				Caso tenha optado por um plano pago, assim que recebermos a confirmação do pagamento seu anúncio estará ativado e disponível para buscas. O acompanhamento deste pedido pode ser
				feito na página <a href="<c:url value="/areaDaEmpresa/meusPedidos" /> ">meus pedidos</a>.
			</p>
			<br />
			<p>
				Lembre-se também que você pode atualizar seu anúncio a qualquer momento pelo sistema, vá até a página <a href="<c:url value="/areaDaEmpresa/meusAnuncios" /> ">meus anúncios</a>, e atualize as informações que desejar.
			</p>
			<br />
			<p> Caso tenha alguma dúvida, entre em <a href="<c:url value="/contato" /> ">contato</a>.</p>
			
			<p>CatálogoNet agradece a preferência.</p>
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