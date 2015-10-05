<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="Aqui voc� pode gerenciar seus an�ncios e atualiz�-los.">
<meta name="keywords" content="gerenciar, atualizar, anuncios, alterar dados">
<title>Atualizar An�ncio - Cat�logoNet | Guia Comercial Online do Distrito Federal</title>
<link rel="shortcut icon" href="<c:url value="/resources/imgs/favicon.gif" />" type="image/ico" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/restrito/css/bootstrap.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/restrito/css/bootstrap-theme.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/restrito/css/estilos_restrito_bootstrap.css" />">
</head>
<body>

<!-- Topo da pagina -->
<c:import url="/WEB-INF/views/template/publico/topo_pagina.jsp" />

<div class="container">
  <div class="row">
    <div class="col-md-3">
    
	   	<!-- menu-esquerda -->
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="<c:url value="/areaDaEmpresa"/>">Home</a></li>
			<li><a href="<c:url value="/areaDaEmpresa/criar-anuncio/passo-1-escolha-plano"/>">Criar An�ncio</a></li>
			<li><a href="<c:url value="/areaDaEmpresa/meusAnuncios"/>">Meus An�ncios</a></li>
			<li><a href="<c:url value="/areaDaEmpresa/contratarPlano"/>">Contratar Plano</a></li>
			<li><a href="<c:url value="/areaDaEmpresa/meusPlanos"/>">Meus Planos</a></li>
			<li><a href="<c:url value="/areaDaEmpresa/meusPedidos"/>">Meus Pedidos</a></li>
			<li><a href="<c:url value="/areaDaEmpresa/meusDados"/>">Meus Dados</a></li>
		</ul>
		<!-- /menu-esquerda -->
      
    </div>
    
    <!-- conteudo -->
    <div class="col-md-9"> 
      
      <!--Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="#">Home</a></li>
        <li class="active">Vizualizar An�ncio</li>
      </ol>
      <!-- /breadcrumb --> 
      
      <!-- vizualizae anuncio -->
      <div class="vizualizar-anuncio"> 
        
        <!-- page header -->
        <div class="page-header">
          <h1>Vizualizar An�ncio <small>Veja como est� o seu an�ncio</small></h1>
        </div>
        <!-- /page-header -->    

        <c:if test="${not empty success}">
	        <!-- mensagem -->
	        <div class="alert alert-success">
				<span class="textoGrande"><strong>Seu an�ncio foi atualizado!</strong> Veja como ele ficou</span>
				<p>para voltar para a p�gina meus anuncios, clique no bot�o abaixo.</p>
				<p><a href="<c:url value="/areaDaEmpresa/meusAnuncios"/>" class="btn btn-success"><span class="glyphicon glyphicon-backward"></span> Meus An�ncios</a></p>
	        </div> 
	        <!-- /mensagem -->   
        </c:if>
        
       maostar anuncio squi
        
      </div>
      <!-- /vizualizar-anuncio --> 
      
    </div>
    <!-- /conteudo --> 
    
  </div>
  <!-- /row --> 
  
</div>
<!-- /container -->

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	<!-- Sub-rodape -->
	<c:import url="/WEB-INF/views/template/publico/sub_rodape.jsp" />

</body>
</html>