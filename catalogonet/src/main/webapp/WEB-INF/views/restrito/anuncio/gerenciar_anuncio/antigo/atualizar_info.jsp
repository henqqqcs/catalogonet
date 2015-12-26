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
        <li class="active">Criar An�ncio</li>
      </ol>
      <!-- /breadcrumb --> 
      
      <!-- atualizar anuncio -->
      <div class="criar-anuncio-form-info"> 
        
        <!-- mensagem error -->
		<c:if test="${not empty danger}">
			<div class="alert alert-danger" role="alert"> <span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span class="textoMeioMedio">Verifique os dados do formul�rio novamente.</span> </div>
		</c:if>
		<!-- mensagem sucess error --> 
      
        <!-- page header -->
        <div class="page-header">
          <h1>Atualizar An�ncio <small>Atualize informa��es do an�ncio</small></h1>
        </div>
        <!-- /page-header -->        
        
        <!-- formulario -->
        <c:url var="atualizarAnuncio" value="/areaDaEmpresa/meusAnuncios/atualizarInformacoesPasso2" />
        <sf:form modelAttribute="anuncio" action="${atualizarAnuncio}" id="defaultForm" class="form-horizontal" >
        
          <div class="form-group">
            <label class="col-lg-3 control-label">T�tulo do an�ncio*</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="titulo" placeholder="T�tulo do an�ncio" id="titulo" value="${anuncio.titulo}" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Descri��o</label>
            <div class="col-lg-5">
              <textarea type="text" class="form-control" path="descricao" id="descricao" placeholder="Escreva aqui uma descri��o do seu neg�cio">${anuncio.descricao}</textarea>
            </div>
          </div>

          <h3><strong>Contato</strong></h3>
          <hr/>
          <div class="form-group">
            <label class="col-lg-3 control-label">Telefone*</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="telefone1" id="telefone1" value="${anuncio.telefone1}" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Telefone 2</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="telefone2" id="telefone2" value="${anuncio.telefone2}" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">E-mail</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="email" id="email"  value="${anuncio.email}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Site</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="site" id="site" placeholder="https://" value="${anuncio.site}" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">FaceBook</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="facebook" id="facebook" placeholder="https://"  value="${anuncio.facebook}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Twitter</label>
            <div class="col-lg-5">
              <sf:input type="text" class="form-control" path="twitter" id="twitter" placeholder="https://"  value="${anuncio.twitter}"/>
            </div>
          </div>
          
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
        message: 'Esse valor n�o � v�lido.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            titulo: {                
                validators: {
                    notEmpty: {
                        message: 'O t�tulo � obrigat�rio.'
                    },
					stringLength: {
                        min: 5,
                        max: 55,
                        message: 'O t�tulo do seu an�ncio deve ter no m�nimo 5 letras e no m�ximo 55.'
                    }
					
					
                }
            },
            descricao: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 255,
                        message: 'A descri��o deve ter no m�nimo 5 letras e no m�ximo 255.'
                    }
                }
            },
            telefone1: {
                message: 'Esse telefone n�o parece v�lido.',
                validators: {
					notEmpty: {
                        message: 'O telefone � obrigat�rio.'
                    },
                    stringLength: {
                        min: 13,
                        max: 19,
                        message: 'Esse telefone n�o parece v�lido.'
                    }
                }
            },
	       telefone2: {
                message: 'Esse telefone n�o parece v�lido.',
                validators: {
                    stringLength: {
                        min: 13,
                        max: 19,
                        message: 'Esse telefone n�o parece v�lido.'
                    }
                }
            },
            facebook: {
                validators: {
                    uri: {
                        allowLocal: true,
                        message: 'Essa URL n�o parece v�lida, lembre-se de colocar o http://'
                    }
                }
            },
            email: {
                validators: {
                    emailAddress: {
                        message: 'Esse email n�o � v�lido.'
                    }
                }
            },
			site: {
                validators: {
                    uri: {
                        allowLocal: true,
                        message: 'Essa URL n�o parece v�lida, lembre-se de colocar o http://'
                    }
                }
            },
			twitter: {
                validators: {
                    uri: {
                        allowLocal: true,
                        message: 'Essa URL n�o parece v�lida, lembre-se de colocar o http://'
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