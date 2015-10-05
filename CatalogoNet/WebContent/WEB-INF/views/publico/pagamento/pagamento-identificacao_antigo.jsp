<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
  <title>${buscandoPorBuscaEmLocal} - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
  <meta name="description" content="XXXXXXXX DESCRIPTION XXXXXXXX">
  <meta name="keywords" content="YYYYYYY KEYWORDS YYYYYYYYYY">
  
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/todos/css/catalogonet-bootstrap.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/todos/css/catalogonet-style-todos.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/publico/css/catalogonet-style-publico.css" />">
  
  <script type="text/javascript" src="<c:url value="/resources/todos/js/jquery-1.11.3.min.js" />"></script>
  <script type="text/javascript" src="<c:url value="/resources/todos/js/bootstrap-modal.min.js" />"></script>
<%--   <script type="text/javascript" src="<c:url value="/resources/todos/js/bootstrapValidator.min.js" />"></script> --%>
  <script type="text/javascript" src="<c:url value="/resources/todos/js/jquery.mask.min.js" />"></script>
</head>
<body>

	<!-- Cabeçalho Checkout -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_checkout.jsp" />
	

  <!-- container -->
  <div class="container">

    <div class="form-login-register">
      
      <c:if test="${not empty error}">
		<div class="alert alert-danger">${error}</div>
	  </c:if>
	   <c:if test="${not empty msg}">
	   	<div class="alert alert-success">${msg}</div>
	   </c:if>

			<spring:hasBindErrors htmlEscape="true" name="usuario">
				<c:if test="${errors.errorCount gt 0}">
					<c:forEach items="${errors.allErrors}" var="error">
							<div class="alert alert-danger">
								<spring:message code="${error.code}" arguments="${error.arguments}" text="${error.defaultMessage}" />
							</div>
					</c:forEach>
				</c:if>
			</spring:hasBindErrors>
			
			
      <div class="form-login">
        <h2>JÁ SOU CADASTRADO</h2>

        <!-- form -->
        <c:url var="loginUrl" value="/login"/> 
		<form:form action="${loginUrl}" method="post" id="loginForm">
		
          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="email">Email</label>
              <input class="form-control" type="text" id="username" name="username" placeholder="seu@email.com">
            </div>
          </div>
          <!-- fim form-item-wrapper -->
          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="senha">Senha</label>
              <input class="form-control" type="password" id="password" name="password">
            </div>
          </div>
          <!-- fim form-item-wrapper -->

          <!-- form-item-wrapper -->
          <div class="form-item-forget-pass">
            <a href="" class="" data-toggle="modal" data-target="#myModal">esqueci minha senha</a>



          </div>
          <!-- fim form-item-wrapper -->

          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <button type="submit" id="loginBtn" class="btn btn-primary">Entrar <span class="glyphicon glyphicon-play"></span></button>
          </div>
          <!-- fim form-item-wrapper -->

        </form:form>
        <!-- fim form -->

      </div>

      <!-- form-register -->
      <div class="form-register">

        <h2>SOU UM NOVO CLIENTE</h2>

        <!-- form -->
        <c:url var="adicionaUsuario" value="/cadastrar-usuario" />
		<form:form modelAttribute="usuarioRegistro" action="${adicionaUsuario}" method="post" id="registerForm">

          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="nome">Nome</label>
              <form:input path="nome"  class="form-control" type="text" id="nome" name="nome" placeholder="Seu nome" />
            </div>
          </div>
          <!-- fim form-item-wrapper -->

          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="telefone">Telefone</label>
              <input class="form-control" type="tel" name="telefone" id="telefone" placeholder="(61) 9999-9999">
            </div>
          </div>
          <!-- fim form-item-wrapper -->

          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="email-register">Email</label>
              <form:input path="email" class="form-control" type="email" id="emailRegister" placeholder="seu@email.com" />
            </div>
          </div>
          <!-- fim form-item-wrapper -->

<!--           form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="senha-register">Senha</label>
              <form:input path="senha" class="form-control" type="password" id="senha-register" />
            </div>
          </div>
<!--           fim form-item-wrapper -->

<!--           form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="senha-confirm">Confirmar senha</label>
              <form:input path="confirmarSenha" class="form-control" type="password" id="senha-confirm" />
            </div>
          </div>
<!--           fim form-item-wrapper -->


			<!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <button type="submit" id="registerBtn" class="btn btn-primary">Continuar <span class="glyphicon glyphicon-play"></span></button>
          </div>
			<!-- fim form-item-wrapper -->

        </form:form>
        <!-- fim form -->

      </div>
      <!-- fim-form-register -->
    
    </div>   
    <!-- fim form-login-register -->

  </div>
  <!-- fim container -->



<div class="container">
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">ESQUECI MINHA SENHA</h4>
      </div>
      <!-- form -->
      <form action="#" method="POST">
        <div class="modal-body">
          <p>Digite abaixo seu e-mail com que se cadastrou e receba sua senha por e-mail.</p>
          <div class="form-item-wrapper">
            <label for="email-register">Email</label>
            <input class="form-control" type="email" id="email-recover-senha" placeholder="seu@email.com">
          </div>
        </div>
        <div class="modal-footer">
          <button style="float:left;" type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Fechar <span class="glyphicon glyphicon-remove"></span></button>
          <button type="submit" class="btn btn-default">Enviar <span class="glyphicon glyphicon-play"></span></button>
        </div>
      </form>
      <!-- fim form -->
    </div>
  </div>
</div>
<!-- fim modal -->
</div>


<!-- validate script --> 
<script type="text/javascript">
$(document).ready(function() {

    $('#loginForm').bootstrapValidator({
        message: 'Esse valor não é válido.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	username: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    emailAddress: {
                        message: 'Esse email não é válido.'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
		            stringLength: {
		                min: 5,
		                max: 55,
		                message: 'A senha deve ter no mínimo 5 dígitos.'
		            }
                }
            }

        }
    });

    // Validate the form manually
    $('#loginBtn').click(function() {
        $('#loginForm').bootstrapValidator('validate');
    });
});
</script> 
<!-- validate script --> 
<!-- validate script 2 --> 
<script type="text/javascript">
$(document).ready(function() {

    $('#registerForm').bootstrapValidator({
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
                        message: 'Esse campo é obrigatório.'
                    },
                    stringLength: {
                        min: 3,
                        max: 55,
                        message: 'O seu nome é muito pequeno.'
                    }
                }
            },
            telefone: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    stringLength: {
                        min: 13,
                        max: 19,
                        message: 'Esse telefone não parece válido.'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    emailAddress: {
                        message: 'Esse email não parece válido.'
                    }
                }
            },
            "senha": {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
		            stringLength: {
		                min: 5,
		                max: 55,
		                message: 'A senha deve ter no mínimo 5 dígitos.'
		            }
                }
            },
            "confirmarSenha": {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
		            stringLength: {
		                min: 5,
		                max: 55,
		                message: 'A senha deve ter no mínimo 5 dígitos.'
		            },
                    identical: {
                      field: 'senha',
                      message: 'O campo senha e confirmar senha são diferentes.'
                    }
                }
            }

        }
    });

    // Validate the form manually
    $('#registerBtn').click(function() {
        $('#registerForm').bootstrapValidator('validate');
    });
});
</script> 
<!-- validate script 2 --> 
<!-- mask input --> 
<script>
$(document).ready(function(){
  $('#telefone').mask('(00) 0000-0000');
});
</script> 
<!-- mask input -->

	<div class="clearfix"></div>		
	
	<!-- rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape_checkout.jsp" />
	
</body>
</html>