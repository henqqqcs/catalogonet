<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Ops! Erro, você não pode fazer isso - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
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
				» <a href="<c:url value="/areaDaEmpresa/contratarPlano" />" itemprop="url"><span itemprop="title">Contratar Plano</span></a> » Erro!
			</div>
		</div>
		<!-- /breadcrumb -->


		<div class="contratar-plano-erro-regra">
			
			<h1 class="textoMedio negrito">Ops! Aconteceu um erro</h1>
			
			<br />
			<br />
			<c:if test="${mensagem == 'teste feito'}">
				<p>O anúncio para o qual você deseja contratar um <span class="negrito">Plano Gratuito</span>, já passou pelo período de testes.</p><br />
				<p>Ao fim do período de testes, você deve escolher um dos planos pagos. </p><br />
				
				<p><a href="<c:url value="/areaDaEmpresa/contratarPlano" />" >Clique aqui para escolher um outro plano.</a></p>
				
		
			</c:if>
			<c:if test="${mensagem == 'plano inferior'}">
				<p>Nós identificamos que o anúncio para o qual você deseja contratar um plano, <strong>já possui um plano superior</strong>.</p><br />
				<p>Para não interromper o plano atual, evitando a perda das vantagens do plano superior, você deve escolher um plano igual ou superior ao atual, ou aguardar o plano atual ser finalizado.</p><br />
				
				<p><a href="<c:url value="/areaDaEmpresa/contratarPlano" />" >Clique aqui para escolher um outro plano.</a></p>
			</c:if>
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