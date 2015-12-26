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
          <h1>Atualizar Anúncio <small>Atualize o endereço do anúncio</small></h1>
        </div>
        <!-- /page-header -->        
        
        <!-- formulario-endereco -->
        <c:url var="passo2" value="/areaDaEmpresa/meusAnuncios/atualizarEnderecoPasso2" />
        <sf:form id="defaultForm" modelAttribute="anuncio" method="post" class="form-horizontal" action="${passo2}" >
     	
          <div class="form-group">
            <label class="col-lg-3 control-label">Estado*</label>
            <div class="col-lg-5">
            	<sf:select path="estado.id" multiple="false" class="form-control" id="estados">
            		<sf:option value="${anuncio.estado.id}">${anuncio.estado.nome}</sf:option>
            		<c:forEach items="${listaEstados}" var="estados">
            			<sf:option value="${estados.id}">${estados.nome}</sf:option>
            		</c:forEach>
				</sf:select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Cidade*</label>
            <div class="col-lg-5">
            	<sf:select path="cidade.id" multiple="false" class="form-control" id="cidades">
            		<c:set var="idCidade">${anuncio.cidade.id}</c:set>
            		<sf:option value="${idCidade}">${anuncio.cidade.nome}</sf:option>
            		<c:forEach items="${listaCidades}" var="cidades">
	            		<c:set var="idCidade">${cidades.id}</c:set>
            			<sf:option value="${idCidade}">${cidades.nome}</sf:option>
            		</c:forEach>
				</sf:select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Bairro*</label>
            <div class="col-lg-5">
            	<sf:select path="bairro.id" multiple="false" class="form-control" id="bairros">
            	    <c:set var="idBairro">${anuncio.bairro.id}</c:set>
            		<sf:option value="${idBairro}">${anuncio.bairro.nome}</sf:option>
            		<c:forEach items="${listaBairros}" var="bairros">
	            		<c:set var="idBairro">${bairros.id}</c:set>
            			<sf:option value="${idBairro}">${bairros.nome}</sf:option>
            		</c:forEach>
				</sf:select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Endereço*</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="endereco" id="endereco" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Complemento</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="complemento" id="complemento" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">CEP</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="cep" id="cep" />
            </div>
          </div>     	


          <div class="form-group">
            <label class="col-lg-3 control-label"></label>
            <div class="col-lg-5 text-center">
               <a class="btn btn-danger" href="#">Cancelar</a> 
              <button type="submit" class="btn btn-success" value="Atualizar">Atualizar</button>
            </div>
          </div>

        </sf:form>
        <!-- /formulario-endereco --> 

        
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
        	 "estado.id": {
                 validators: {
                     notEmpty: {
                         message: 'Selecione o estado'
                     }
                 }
             },
 			"cidade.id": {
                 validators: {
                     notEmpty: {
                         message: 'Selecione a cidade'
                     }
                 }
             },
 			"bairro.id": {
                 validators: {
                     notEmpty: {
                         message: 'Selecione o bairro'
                     }
                 }
             },
 		    endereco: {                
                 validators: {
                     notEmpty: {
                         message: 'O endereço é obrigatório'
                     },
 					stringLength: {
                         min: 2,
                         max: 55,
                         message: 'O seu endereço deve ter no mínimo 2 letras e no máximo 55.'
                     }
 					
 					
                 }
             },
 			complemento: {                
                 validators: {
 					stringLength: {
                         min: 2,
                         max: 55,
                         message: 'O complemento do seu endereço deve ter no mínimo 2 letras e no máximo 55.'
                     }
 					
 					
                 }
             },
 		    cep: {                
                 validators: {
 					stringLength: {
                         min: 9,
                         max: 9,
                         message: 'O CEP deve conter 9 dígitos'
                     }
                	}
             },
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#defaultForm').bootstrapValidator('validate');
    });
});
</script> 
<!-- validate script --> 
<!-- mask input --> 
<script>
$(document).ready(function(){
  $('#cep').mask('00000-000');
  $('#telefone1').mask('(00) 0000-0000');
  $('#telefone2').mask('(00) 0000-0000');
});
</script> 
<!-- mask input -->

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	<!-- Sub-rodape -->
	<c:import url="/WEB-INF/views/template/publico/sub_rodape.jsp" />

</body>
</html>