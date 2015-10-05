<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Alterar Senha - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
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
        <li><a href="#">Meus Dados</a></li>
        <li class="active">Alterar Senha</li>
      </ol>
      <!-- /breadcrumb --> 
      
      <!-- mensagem success error -->
      <c:if test="${not empty success}">
	      <div class="alert alert-success" role="alert"> <span class="textoMedio"><strong>Dados atualizados!</strong></span> <span class="textoMeioMedio">Sua senha foi atualizada com sucesso.</span> </div>
	  </c:if>
	  
      <c:if test="${not empty dangerSenhaAtual}">
	      <div class="alert alert-danger" role="alert"> <span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span class="textoMeioMedio"><br/>A campo senha atual não confere, por favor confira sua senha novamente!</span> </div>
      </c:if>
      <c:if test="${not empty dangerConfirmarSenha}">
	      <div class="alert alert-danger" role="alert"> <span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span class="textoMeioMedio"><br/>O campo confirmar senha, não bateu com o campo senha, tente novamente.</span> </div>
      </c:if>
      <!-- mensagem sucess error --> 
      
      
      
      <!-- meud dados -->
      <div class="meus-dados-info">
        <div class="page-header">
          <h1>Alterar Senha <small>Altere sua senha</small></h1>
        </div>
               
        <!-- formulario -->
    	<c:url var="alterarSenha" value="/areaDaEmpresa/alterarSenhaPasso2" />
        <form id="defaultForm" method="post" class="form-horizontal" action="${alterarSenha}">
          <div class="form-group">
            <label class="col-lg-3 control-label">Senha atual</label>
            <div class="col-lg-5">
              <input type="password" class="form-control" name="senhaAtual" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Nova senha</label>
            <div class="col-lg-5">
              <input type="password" class="form-control" name="novaSenha" id="novaSenha" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Confirmar nova senha</label>
            <div class="col-lg-5">
              <input type="password" class="form-control" name="confirmarNovaSenha" id="confirmarNovaSenha" />
            </div>
          </div>
          <div class="form-group">
            <div class="col-lg-9 col-lg-offset-3">
              <button type="submit" class="btn btn-success" value="Atualizar">Alterar Senha</button>
              <a class="btn btn-danger" href="#">Cancelar</a> </div>
          </div>
        </form>
        
        <!-- /formulario --> 
        
      </div>
      <!-- meud dados --> 
      
    </div>
    <!-- fim conteudo (col-md-9) --> 
  </div>
</div>

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	<!-- Sub-rodape -->
	<c:import url="/WEB-INF/views/template/publico/sub_rodape.jsp" />

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
        	senhaAtual: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 30,
                        message: 'A senha deve ter entre 5 e 30 caracteres.'
                    },
					notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    }
                }
            },
			novaSenha: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 30,
                        message: 'A senha deve ter entre 5 e 30 caracteres.'
                    },
					notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
					identical: {
                        field: 'confirmarNovaSenha',
                        message: 'O senha não confere com o campo confirmar senha.'
                    }
                }
            },
			confirmarNovaSenha: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 30,
                        message: 'A senha deve ter entre 5 e 30 caracteres.'
                    },
					notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
					identical: {
                        field: 'novaSenha',
                        message: 'Esta senha não confere com a senha acima.'
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


</body>
</html>