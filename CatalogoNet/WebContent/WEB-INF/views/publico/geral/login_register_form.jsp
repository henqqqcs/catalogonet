<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />


</head>
<body>


	<!-- Cabeçalho Checkout -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_checkout.jsp" />

<!-- container -->
<div class="container">

  <!-- row -->
  <div class="row login-register-row">

    <!-- alerts -->
    <div class="col-md-12">
	    <c:if test="${not empty error}">
			 <div class="alert alert-danger">Ops! Usuário não encontrado. Verifique seu e-mail e sua senha.</div>
		</c:if>
		<c:if test="${not empty emailJaCadastrado}">
			<div class="alert alert-danger">Este email já está sendo utilizado.</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="alert alert-success">Você fez logout com sucesso!</div>
		</c:if>
		
		<div class="well"><h2 class="login-register-tittle">Faça login ou registre-se</h2></div>
    </div>
    <!-- fim alerts --> 
    
    			<spring:hasBindErrors htmlEscape="true" name="usuario">
				<c:if test="${errors.errorCount gt 0}">
					<c:forEach items="${errors.allErrors}" var="error">
							<div class="alert alert-danger">
								<spring:message code="${error.code}" arguments="${error.arguments}" text="${error.defaultMessage}" />
							</div>
					</c:forEach>
				</c:if>
			</spring:hasBindErrors>
    
    <div class="col-md-6">

      <!-- well -->
      <div class="well">
        
      <!-- login-register-form -->
      <div class="login-register-form">

        <h3>JÁ SOU CADASTRADO</h3>

        <!-- form -->
        <c:url var="loginUrl" value="/login"/> 
		<form:form action="${loginUrl}" method="post" id="loginForm">

          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="username">Email</label>
              <input class="form-control" type="text" id="username" name="username" placeholder="seu@email.com">
            </div>
          </div>
          <!-- fim form-item-wrapper -->
          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="password">Senha</label>
              <input class="form-control" type="password" id="password" name="password" placeholder="********">
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
            <button type="submit" id="loginBtn" class="btn btn-default">Entrar <span class="glyphicon glyphicon-play"></span></button>
          </div>
          <!-- fim form-item-wrapper -->

        </form:form>
        <!-- fim form -->





      </div>
      <!-- fim login-register-form -->

      </div>
      <!-- fim well -->

    </div>

    <!-- col-md-6 -->
    <div class="col-md-6">


      <!-- well -->
      <div class="well">
        
      <!-- login-register-form -->
      <div class="login-register-form">

        <h3>SOU UM NOVO CLIENTE</h3>

        <!-- form -->
         <c:url var="cadastroPaginaUrl" value="/cadastro"/> 
        <form id="registerForm" action="${cadastroPaginaUrl}">

          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="email-register">Email</label>
              <input class="form-control" type="text" id="email-register" name="email-register" placeholder="seu@email.com">
            </div>
          </div>
          <!-- fim form-item-wrapper -->

          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <button type="submit" id="registerBtn" class="btn btn-default">Continuar <span class="glyphicon glyphicon-play"></span></button>
          </div>
          <!-- fim form-item-wrapper -->

        </form>
        <!-- fim form -->






      </div>
      <!-- fim login-register-form -->

      </div>
      <!-- fim well -->


    </div>
    <!-- fim col-md-5 -->


  </div>
  <!-- fim row -->



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
      <c:url var="esqueciSenhaHandle" value="/esqueci-senha-handle"/> 
      <form action="${esqueciSenhaHandle}" method="POST" id="formEsqueciSenha">
        <div class="modal-body">
        
			<div id="message"></div>
        
          <p>Digite abaixo seu e-mail com que se cadastrou e receba sua senha por e-mail.</p>
          <div class="form-item-wrapper">
            <label for="emailEsqueciSenha">Email</label>
            <input class="form-control" name="emailEsqueciSenha" id="emailEsqueciSenha" type="email" id="emailEsqueciSenha" placeholder="seu@email.com">
          </div>
        </div>
        <div class="modal-footer">
          <button style="float:left;" type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Fechar <span class="glyphicon glyphicon-remove"></span></button>
          <button type="submit" class="btn btn-default" id="submitEsqueciSenha">Enviar <span class="glyphicon glyphicon-play"></span></button>
        </div>
      </form>
      <!-- fim form -->
    </div>
  </div>
</div>
<!-- fim modal -->
</div>


<script type="text/javascript">
    $(document).ready(function() {
    $('#submitEsqueciSenha').click(function(e) {
    e.preventDefault();
    var ajaxdata = $("#emailEsqueciSenha").val();
    var value ='emailEsqueciSenha='+ajaxdata;
 
   $.ajax({
   url: "esqueci-senha-handle",
   type: "post",
   data: value,
   cache: false,
   success: function(data) {
	   $("#country").val('');
	   $("#message").html('Sua senha foi enviada para seu email!').slideDown('slow');
	   $("#message").addClass("alert alert-success" );
   },
   error: function(data) {
	   $("#country").val('');
	   $("#message").html('Este email não está cadastrado!').slideDown('slow');
	   $("#message").addClass( "alert alert-danger" );
   }
   });
});
});
</script>

	<!-- Cabeçalho Checkout -->
	<c:import url="/WEB-INF/views/template/publico/rodape_checkout.jsp" />

</body>
</html>