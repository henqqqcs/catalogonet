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

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/todos/css/catalogonet-bootstrap.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/todos/css/catalogonet-style-todos.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/publico/css/catalogonet-style-publico.css" />">
		
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
                    <form:input class="form-control" type="text" id="email-cadastro" path="email" placeholder="seu@email.com" value="${email}" />
                    <form:errors path="email" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->

                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="confirmar-email-cadastro">Confirmar email <span class="glyphicon glyphicon-asterisk"></span></label>
                    <form:input class="form-control" type="text" id="confirmar-email-cadastro" path="confirmarEmail" placeholder="seu@email.com" />
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
                    <label class="control-label" for="telefone">Celular <span class="glyphicon glyphicon-asterisk"></span></label>
                    <form:input class="form-control" type="text" id="telefone" path="telefone1" placeholder="(99) 9999-9999" />
                    <form:errors path="telefone1" cssStyle="color: red;"/>
                  </div>
                </div>
                <!-- fim form-item-wrapper -->
                <!-- form-item-wrapper -->
                <div class="form-item-wrapper">
                  <div class="form-group">
                    <label class="control-label" for="telefone">Telefone fixo </label>
                    <form:input class="form-control" type="text" id="telefone" path="telefone2" placeholder="(99) 9999-9999" />
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

</body>
</html>