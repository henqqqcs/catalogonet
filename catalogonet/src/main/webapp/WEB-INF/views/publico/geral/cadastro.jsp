<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />

<script type="text/javascript" src='<c:url value="/resources/todos/js/bootstrapValidator.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/resources/todos/js/jquery.mask.min.js" />'></script>

</head>
<body>


	<!-- Cabeçalho Checkout -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_checkout.jsp" />

 <!-- container -->
  <div class="container">

    <!-- row -->
    <div class="row">

      <div class="col-md-2"></div>

      <!-- col-md-8 -->
      <div class="col-md-8">

        <div class="cadastro-header">
          <h2>Para fazer parte do CatálogoNet cadastre algumas informações</h2>
        </div>
        
        <c:if test="${not empty emailJaCadastrado}">
			<div class="alert alert-danger">Este email: <strong>${emailJaCadastrado}</strong> já está sendo utilizado.</div>
		</c:if>

        <!-- well -->
        <div class="well form-cadastro-usuario">

          <!-- row 2 -->
          <div class="row">

            <div class="col-md-2"></div>

            <!-- col-md-8 -->
            <div class="col-md-8">

              <!-- form -->
              <c:url var="adicionaUsuario" value="/cadastro-usuario-handle" />
			  <form:form modelAttribute="usuario" action="${adicionaUsuario}" method="post" id="registerForm">

                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="email-cadastro">Email <span class="glyphicon glyphicon-asterisk"></span></label>
                    <form:input class="form-control" type="email" id="email-cadastro" path="email" placeholder="seu@email.com" value="${email}" />
                    <form:errors path="email" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->

                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="confirmar-email-cadastro">Confirmar email <span class="glyphicon glyphicon-asterisk"></span></label>
                    <form:input class="form-control" type="email" id="confirmar-email-cadastro" path="confirmarEmail" placeholder="seu@email.com" />
                    <form:errors path="confirmarEmail" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->

                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="nome">Nome <span class="glyphicon glyphicon-asterisk"></span></label>
                    <form:input class="form-control" type="text" path="nome" placeholder="Seu nome" />
                    <form:errors path="nome" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->

                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="cpf">CPF ou CNPJ</label>
                    <form:input class="form-control" type="text" path="cpf" placeholder="CPF ou CNPJ" />
                    <form:errors path="cpf" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->

                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="telefone1">Celular <span class="glyphicon glyphicon-asterisk"></span></label>
                    <form:input class="form-control" type="tel" id="telefone1" path="telefone1" placeholder="(99) 9999-9999" />
                    <form:errors path="telefone1" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->
                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="telefone2">Telefone fixo </label>
                    <form:input class="form-control" type="tel" id="telefone2" path="telefone2" placeholder="(99) 9999-9999" />
                    <form:errors path="telefone2" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->
                <hr/>
                <p>Escolha uma senha para fazer login no sistema</p>
                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="senha">Senha <span class="glyphicon glyphicon-asterisk"></span></label>
                    <form:input class="form-control" type="password" path="senha" placeholder="******" />
                    <form:errors path="senha" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->

                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="confirmarSenha">Confirmar senha <span class="glyphicon glyphicon-asterisk"></span></label>
                    <form:input class="form-control" type="password" path="confirmarSenha" placeholder="******" />
                    <form:errors path="confirmarSenha" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->


                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <button id="registerBtn" type="submit" class="pull-right btn btn-primary">Cadastrar <span class="glyphicon glyphicon-triangle-right"></span></button>
                </div>
                <!-- fim form-item-wrapper -->

		        </form:form>
		        <!-- fim form -->

            </div>
            <!-- fim col-md-6 -->

            <div class="col-md-2"></div>

          </div> 
          <!-- fim row 2 -->


        </div>
        <!-- fim well -->

      </div>
      <!-- fim col-md-8 -->

      <div class="col-md-2"></div>

    </div>
    <!-- fim row -->



  </div>
  <!-- fim container -->
  
	<!-- Cabeçalho Checkout -->
	<c:import url="/WEB-INF/views/template/publico/rodape_checkout.jsp" />

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
            email: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    emailAddress: {
                        message: 'Esse email não é válido.'
                    }
                }
            }, 
            confirmarEmail: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    identical: {
                        field: 'email',
                        message: 'Esse email não confere com o e-mail acima.'
                    }
                }
            }, 
            nome: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    stringLength: {
                        min: 3,
                        max: 55,
                        message: 'O nome é muito pequeno.'
                    }
                }
            },
            cpf: {
                validators: {
                    stringLength: {
                        min: 10,
                        max: 55,
                        message: 'Este CPF ou CNPJ não parece válido.'
                    }
                }
            },
            telefone1: {
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
            telefone2: {
                validators: {
                    stringLength: {
                        min: 13,
                        max: 19,
                        message: 'Esse telefone não parece válido.'
                    }
                }
            },
            senha: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    stringLength: {
                        min: 5,
                        max: 55,
                        message: 'Sua senha deve ter no mínimo 5 caracteres.'
                    }
                }
            }, 
            confirmarSenha: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    identical: {
                        field: 'senha',
                        message: 'Esse senha não confere com a senha acima.'
                    }
                }
            }

        }
    });

});
</script> 
<!-- validate script 2 --> 
<!-- mask input --> 
<script>
$(document).ready(function(){
  $('#telefone1').mask('(00) 0000-0000');
  $('#telefone2').mask('(00) 0000-0000');
});
</script> 
<!-- mask input -->
</body>
</html>