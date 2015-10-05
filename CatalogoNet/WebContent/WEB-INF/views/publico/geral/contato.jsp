<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Insert tittle here</title>
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <meta name="description" content="XXXXXXXX DESCRIPTION XXXXXXXX">
  <meta name="keywords" content="YYYYYYY KEYWORDS YYYYYYYYYY">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/publico/css/style.css" /> ">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/publico/css/style_global_responsive.css" /> ">
</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/publico/topo_pagina.jsp" />

	<!-- Cabeçalho principal -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_principal.jsp" />
	
	<!-- container -->
<div class="container">

<!-- contato-page -->
<div class="contato-page">

  <div class="contato-page-header">
    <h1>Entre em contato conosco <span class="glyphicon glyphicon-send"></span></h1>
    <hr/>
  </div>


  <!-- contato-page-texto -->
  <div class="contato-page-texto">
      <div class="well">
        <p class="texto-grande">Alguma dúvida?</p>
        <p>Para informações, dúvidas, sugestões, entre em contato conosco através do formulário ao lado. Retornaremos o contato o mais rápido possível.</p>
        <p><label><span class="glyphicon glyphicon-envelope"></span> Email:</label> contato@catalogonet.com.br</p>
        </div>
  </div>
  <!-- fim contato-page-texto -->

  <!-- contato-page-form -->
  <div class="contato-page-form">
	    <c:if test="${mensagem != null}">
		 	 <div class="alert alert-success" role="alert">Sua mensagem foi enviada, iremos entrar em contato pelo ${email}.</div>
		  </c:if>
		  <c:if test="${erro != null}">
		  	<div class="alert alert-danger" role="alert">Ops! Ocorreu algum erro com as informações passadas. Verifique e tente novamente.</div>
		  </c:if>
  
		<c:url var="tratarContato" value="/contato-handle" />
		<form id="contatoForm" method="POST" action="${tratarContato}">
        <div class="form-group">
          <label for="nome">Nome</label>
          <input type="text" class="form-control" name="nome" placeholder="Seu nome">
        </div>
        <div class="form-group">
          <label for="assunto">Assunto</label>
          <input type="text" class="form-control" name="assunto" placeholder="Assunto">
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" class="form-control" name="email" placeholder="seu-email@email.com">
        </div>
        <div class="form-group">
          <label for="mensagem">Mensagem</label>
          <textarea class="form-control" rows="4" name="mensagem"></textarea>
        </div>
        <button type="submit" class="btn btn-default">Enviar <span class="glyphicon glyphicon-play"></span></button>
      </form>
  </div>
  <!-- fim contato-page-form -->


</div>
<!-- fim contato-page -->

</div>
<!-- fim container -->
	
	<!-- rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

</body>
</html>