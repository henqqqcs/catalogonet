<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="Aqui você pode gerenciar seus anúncios e atualizá-los.">
<meta name="keywords" content="gerenciar, atualizar, anuncios, alterar dados">
<title>Atualizar Anúncio - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
<link rel="shortcut icon" href="<c:url value="/resources/imgs/favicon.gif" />" type="image/ico" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/restrito/css/bootstrap.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/restrito/css/bootstrap-theme.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/restrito/css/estilos_restrito_bootstrap.css" />">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/restrito/js/bootstrapValidator.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/restrito/js/jquery.mask.js" />"></script>
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
			<li><a href="<c:url value="/areaDaEmpresa/criar-anuncio/passo-1-escolha-plano"/>">Criar Anúncio</a></li>
			<li><a href="<c:url value="/areaDaEmpresa/meusAnuncios"/>">Meus Anúncios</a></li>
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
        <li class="active">Criar Anúncio</li>
      </ol>
      <!-- /breadcrumb --> 
      
      <!-- atualizar anuncio -->
      <div class="criar-anuncio-form-info"> 
        
        <!-- mensagem error -->
		<c:if test="${not empty danger}">
			<div class="alert alert-danger" role="alert"> <span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span class="textoMeioMedio">Verifique os dados do formulário novamente.</span> </div>
		</c:if>
		<!-- mensagem sucess error --> 
      
        <!-- page header -->
        <div class="page-header">
          <h1>Atualizar Anúncio <small>Adicione palavras-chave (opcional)</small></h1>
        </div>
        <!-- /page-header --> 
        
        <div class="well well-sm">
        	<p class="textoMeioMedio"><strong>Adicione palvras chave ao seu anúncio</strong></p>
            <p>Essas palavras serão usadas pelo sistema de buscas para classificar seu anúncio. Apesar de opcionais, <strong> é extremamente recomendado</strong> que você coloque algumas palavras-chave.</p>
            <p>As palavras chaves são palavras únicas que se relacionam com o seu negócio, um bom exemplo de palavras-chave para uma pizzaria em taguatinga, seriam: <strong>pizzaria, pizzarias, pizza, taguatinga, massas</strong>.
        </div>
        
        <!-- formulario -->
        <c:url var="atualizarAnuncio" value="/areaDaEmpresa/meusAnuncios/atualizarPalavrasChavePasso2" />
        <sf:form modelAttribute="anuncio" id="defaultForm" method="post" class="form-horizontal" action="${atualizarAnuncio}" >
          <div class="form-group">
            <label class="col-lg-3 control-label">Palavra-chave 1</label>
            <div class="col-lg-5">
              <input type="text" class="form-control" name="chave1" id="palavra-chave-1" value="${listaTags[0]}"/>
            </div>
          </div>
          
          <!-- tag2 -->
          <div class="form-group">
            <label class="col-lg-3 control-label">Palavra-chave 2</label>
            <div class="col-lg-5">
              <input type="text" class="form-control" name="chave2" id="palavra-chave-2" value="${listaTags[1]}"/>
            </div>
          </div>
          <!-- /tag2 -->
          
          <!-- tag2 -->
          <div class="form-group">
            <label class="col-lg-3 control-label">Palavra-chave 3</label>
            <div class="col-lg-5">
              <input type="text" class="form-control" name="chave3" id="palavra-chave-2" value="${listaTags[2]}"/>
            </div>
          </div>
          <!-- /tag2 -->
          
          <!-- tag2 -->
          <div class="form-group">
            <label class="col-lg-3 control-label">Palavra-chave 4</label>
            <div class="col-lg-5">
              <input type="text" class="form-control" name="chave4" id="palavra-chave-2" value="${listaTags[3]}"/>
            </div>
          </div>
          <!-- /tag2 -->
          
          <!-- tag2 -->
          <div class="form-group">
            <label class="col-lg-3 control-label">Palavra-chave 5</label>
            <div class="col-lg-5">
              <input type="text" class="form-control" name="chave5" id="palavra-chave-2" value="${listaTags[4]}"/>
            </div>
          </div>
          <!-- /tag2 -->

          <div class="form-group">
            <label class="col-lg-3 control-label"></label>
            <div class="col-lg-5 text-center">
               <a class="btn btn-danger" href="<c:url value="/areaDaEmpresa/meusAnuncios" />">Cancelar</a> 
              <button type="submit" class="btn btn-success" value="Atualizar">Atualizar</button>
            </div>
          </div>

        </sf:form>
        <!-- /formulario-info --> 
        
      </div>
      <!-- /criar anuncio --> 
      
    </div>
    <!-- /conteudo --> 
    
  </div>
  <!-- /row --> 
  
</div>
<!-- /container --> 

<!-- validate script --> 
<script type="text/javascript">
$(document).ready(function() {

    $('#defaultForm').bootstrapValidator({
        message: 'Esse valor não é válido.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            chave1: {                
                validators: {
					stringLength: {
                        min: 3,
                        max: 55,
                        message: 'A sua palavra-chave deve ter mais de 3 letras e menos de 55.'
                    }
                }
            },
            chave2: {                
                validators: {
					stringLength: {
                        min: 3,
                        max: 55,
                        message: 'A sua palavra-chave deve ter mais de 3 letras e menos de 55.'
                    }
                }
            },
            chave3: {                
                validators: {
					stringLength: {
                        min: 3,
                        max: 55,
                        message: 'A sua palavra-chave deve ter mais de 3 letras e menos de 55.'
                    }
                }
            },
            chave3: {                
                validators: {
					stringLength: {
                        min: 3,
                        max: 55,
                        message: 'A sua palavra-chave deve ter mais de 3 letras e menos de 55.'
                    }
                }
            },
            chave4: {                
                validators: {
					stringLength: {
                        min: 3,
                        max: 55,
                        message: 'A sua palavra-chave deve ter mais de 3 letras e menos de 55.'
                    }
                }
            },
            chave5: {                
                validators: {
					stringLength: {
                        min: 3,
                        max: 55,
                        message: 'A sua palavra-chave deve ter mais de 3 letras e menos de 55.'
                    }
                }
            }
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#defaultForm').bootstrapValidator('validate');
    });
});
</script> 
<!-- validate script --> 

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	<!-- Sub-rodape -->
	<c:import url="/WEB-INF/views/template/publico/sub_rodape.jsp" />

</body>
</html>