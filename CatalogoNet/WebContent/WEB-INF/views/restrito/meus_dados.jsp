<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Meus Dados - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/restrito/arquivos-css-js.jsp" />

<script type="text/javascript" src="<c:url value="/resources/todos/js/bootstrapValidator.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/todos/js/jquery.mask.js" />"></script>
</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />

<div class="container">
  <div class="row">
    <div class="col-md-3">
	   	<!-- menu-esquerda -->
		<c:import url="/WEB-INF/views/template/restrito/menu-esquerda.jsp" />
		<!-- /menu-esquerda -->
    </div>
    
    <!-- conteudo -->
    <div class="col-md-9"> 
      
      <!--Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="<c:url value="/areaDaEmpresa/home" />">Home</a></li>
        <li class="active">Meus Dados</li>
      </ol>
      <!-- /breadcrumb --> 
      
      <!-- mensagem success error -->
      <c:if test="${not empty success}">
      	<div class="alert alert-success" role="alert"> <span class="textoMedio"><strong>Dados atualizados!</strong></span> <span class="textoMeioMedio">Seus dados foram atualizados com sucesso.</span> </div>
	  </c:if>
	  
      <c:if test="${not empty danger}">
      	<div class="alert alert-danger" role="alert"> <span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span class="textoMeioMedio">Verifique os dados do formulário novamente.</span> </div>
      </c:if>
      <!-- mensagem sucess error --> 
      
      <!-- meud dados -->
      <div class="meus-dados-info">
        <div class="page-header">
          <h1>Meus Dados <small>Atualize seus dados cadastrais</small></h1>
        </div>
               
        <!-- formulario -->
        <c:url var="atualiazarDados" value="/areaDaEmpresa/atualizarDados" />
        <sf:form id="defaultForm" method="post" class="form-horizontal" modelAttribute="usuario" action="${atualiazarDados}">
        
          <div class="form-group">
            <label class="col-lg-3 control-label">Nome</label>
            <div class="col-lg-5">
              <sf:input path="nome" type="text" class="form-control" placeholder="Seu nome" value="${usuario.nome}" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">CPF</label>
            <div class="col-lg-5">
              <sf:input path="cpf" type="text" class="form-control" id="cpf" value="${usuario.cpf}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">CNPJ</label>
            <div class="col-lg-5">
              <sf:input path="cnpj" type="text" class="form-control" id="cnpj" value="${usuario.cnpj}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Telefone</label>
            <div class="col-lg-5">
              <sf:input path="telefone" type="text" class="form-control" id="telefone" value="${usuario.telefone}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">FaceBook</label>
            <div class="col-lg-5">
              <sf:input path="facebook" type="text" class="form-control" placeholder="https://" value="${usuario.facebook}" />
            </div>
          </div>
          <h3><strong>Endereço</strong></h3>
          <hr/>
          <div class="form-group">
            <label class="col-lg-3 control-label">Estado</label>
            <div class="col-lg-5">
               <sf:input path="endereco.estado" type="text" class="form-control" id="estado" value="${usuario.endereco.estado}" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Cidade</label>
            <div class="col-lg-5">
				<sf:input path="endereco.cidade" type="text" class="form-control" value="${usuario.endereco.cidade}" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Bairro</label>
            <div class="col-lg-5">
				<sf:input id="bairro" name="endereco.bairro" path="endereco.bairro" type="text" class="form-control" value="${usuario.endereco.bairro}" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Endereço</label>
            <div class="col-lg-5">
				<sf:input path="endereco.endereco" name="endereco" type="text" class="form-control" value="${usuario.endereco.endereco}" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">CEP</label>
            <div class="col-lg-5">
              <sf:input path="endereco.cep" name="cep" type="text" class="form-control" id="cep" value="${usuario.endereco.cep}" />
            </div>
          </div>
          <div class="form-group">
            <div class="col-lg-9 col-lg-offset-3">
              <button type="submit" class="btn btn-success" value="Atualizar">Atualizar</button>
              <a class="btn btn-danger" href="#">Cancelar</a> </div>
          </div>
        </sf:form>
        
        <!-- /formulario --> 
        
      </div>
      <!-- meud dados --> 
      
    </div>
    <!-- fim conteudo (col-md-9) --> 
  </div>
</div>

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
            nome: {                
                validators: {
                    notEmpty: {
                        message: 'Seu nome é obrigatório'
                    },
					stringLength: {
                        min: 2,
                        max: 55,
                        message: 'O seu nome deve ter no mínimo 2 letras e no máximo 55.'
                    }
					
					
                }
            },
            cpf: {
                message: 'Esse CPF não é válido.',
                validators: {
                    stringLength: {
                        min: 14,
                        max: 14,
                        message: 'Esse CPF não parece estar correto.'
                    }
                }
            },
		    cnpj: {
                message: 'Esse CNPJ não é válido.',
                validators: {
                    stringLength: {
                        min: 14,
                        max: 99,
                        message: 'Esse CNPJ não parece estar correto.'
                    }
                }
            },
            telefone: {
                message: 'Esse telefone não parece válido.',
                validators: {
                    stringLength: {
                        min: 13,
                        max: 19,
                        message: 'Esse telefone não parece válido.'
                    }
                }
            },
            facebook: {
                validators: {
                    uri: {
                        allowLocal: true,
                        message: 'Essa URL não parece válida, lembre-se de colocar o http://'
                    }
                }
            },
            "endereco.estado": {
                validators: {
                    notEmpty: {
                        message: 'Selecione o estado'
                    }
                }
            },
			"endereco.cidade": {
                validators: {
                    notEmpty: {
                        message: 'Selecione a cidade'
                    }
                }
            },
			"endereco.bairro": {
                validators: {
                    notEmpty: {
                        message: 'Selecione o bairro'
                    }
                }
            },
		    "endereco.endereco": {                
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
		    "endereco.cep": {                
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
  $('#telefone').mask('(00) 0000-0000');
  $('#cpf').mask('000.000.000-00', {reverse: true});
  $('#cnpj').mask("99.999.999/9999-99");
});
</script> 
<!-- mask input -->	

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

</body>
</html>