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
        
		<c:if test="${not empty danger}">
        <!-- mensagem error -->
			<div class="alert alert-danger" role="alert"> <span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span class="textoMeioMedio">Verifique se você selecionou a categoria corretamente.</span> </div>
		<!-- mensagem sucess error --> 
		</c:if>
      
         <!-- page header -->
        <div class="page-header">
          <h1>Atualizar Anúncio <small>Atualize a categoria</small></h1>
        </div>
        <!-- /page-header -->        
        <!-- formulario info --> 
        
        <!-- formulario -->
        <c:url var="passo2" value="/areaDaEmpresa/meusAnuncios/atualizarCategoriaPasso2" />
        <sf:form id="defaultForm" modelAttribute="anuncio" method="post" class="form-horizontal" action="${passo2}" >

		<div class="form-group">
            <div class="col-lg-3"><p class="text-right"><strong>Categoria atual</strong></p></div>
            <div class="col-lg-5">
				${categoriaAtual}
            </div>
          </div>
		<div class="form-group">
            <div class="col-lg-3"><p class="text-right"><strong>Subcategoria atual</strong></p></div>
            <div class="col-lg-5">
				${subCategoriaAtual}
            </div>
          </div>
          
          <!-- categoria -->
          <div class="form-group">
            <label class="col-lg-3 control-label">Nova categoria*</label>
            <div class="col-lg-5">
            	<sf:select path="subCategoria.id" data-placeholder="Escolha a categoria" style="width:350px;" class="form-control" data-live-search="true">
					<c:forEach items="${mapaCategorias}" var="entry">
						<option value=""></option>
					    <optgroup label="${entry.key.nome}">
						    <c:forEach items="${entry.value}" var="item" varStatus="loop">
						        <option value="${item.id}">${item.nome}</option>
						    </c:forEach>
					    </optgroup>
					</c:forEach>
				</sf:select>
            </div>
            <sf:errors path="subCategoria.id" cssStyle="color:red" />
          </div>
          <!-- /categoria -->

          
          <div class="form-group">
            <label class="col-lg-3 control-label"></label>
            <div class="col-lg-5 text-center">
               <a class="btn btn-danger" href="#">Cancelar</a> 
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
		    "subCategoria.id": {
                message: 'Você deve selecionar um categoria.',
                validators: {
                    notEmpty: {
                        message: 'Você deve selecionar um categoria'
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