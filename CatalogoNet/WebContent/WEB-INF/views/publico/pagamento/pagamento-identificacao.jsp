<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
  <title>${buscandoPorBuscaEmLocal} - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
  <meta name="description" content="XXXXXXXX DESCRIPTION XXXXXXXX">
  <meta name="keywords" content="YYYYYYY KEYWORDS YYYYYYYYYY">
  
<!-- dependencias -->
<c:import url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />
  
  <script type="text/javascript" src="<c:url value="/resources/todos/js/bootstrap-modal.min.js" />"></script>
<%--   <script type="text/javascript" src="<c:url value="/resources/todos/js/bootstrapValidator.min.js" />"></script> --%>
  <script type="text/javascript" src="<c:url value="/resources/todos/js/jquery.mask.min.js" />"></script>
</head>
<body>


	<!-- Cabeçalho Checkout -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_checkout.jsp" />

<!-- container -->
<div class="container">

  <!-- row -->
  <div class="row login-register-row">
  
        	 <!-- progress bar -->
        <div class="progress-tracker">
          <div class="text-center hidden-sm hidden-xs">
            <ol class="progtrckr" data-progtrckr-steps="5">
              <li class="progtrckr-done">Carrinho</li><!--
              --><li class="progtrckr-todo">Identificação</li><!--
              --><li class="progtrckr-todo">Pagamento</li><!--
              --><li class="progtrckr-todo">Finalização</li>
            </ol>
          </div>
        </div>
        <br/>
        <!-- /progress bar --> 

    <!-- alerts -->
    <div class="col-md-12">
	    <c:if test="${not empty error}">
			 <div class="alert alert-danger">Ops! Usuário não encontrado. Verifique seu e-mail e sua senha.</div>
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
        <form id="registerForm">

          <!-- form-item-wrapper -->
          <div class="form-item-wrapper">
            <div class="form-group">
              <label class="control-label" for="email-register">Email</label>
              <input class="form-control" type="email" id="email-register" name="email-register" placeholder="seu@email.com">
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


	<!-- Cabeçalho Checkout -->
	<c:import url="/WEB-INF/views/template/publico/rodape_checkout.jsp" />

</body>
</html>