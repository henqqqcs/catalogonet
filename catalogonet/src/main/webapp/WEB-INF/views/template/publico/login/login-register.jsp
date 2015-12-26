<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- alerts -->
<div class="col-md-12">
	<c:if test="${not empty error}">
		<div class="alert alert-danger">Ops! Usuário não encontrado. Verifique seu e-mail e sua
			senha.</div>
	</c:if>
	<c:if test="${not empty denied}">
		<div class="alert alert-danger">Acesso negado.</div>
	</c:if>
	<c:if test="${not empty emailJaCadastrado}">
		<div class="alert alert-danger">Este email já está sendo utilizado.</div>
	</c:if>
	<c:if test="${not empty msg}">
		<div class="alert alert-success">Você fez logout com sucesso!</div>
	</c:if>

	<div class="well">
		<h2 class="login-register-tittle">Faça login ou registre-se</h2>
	</div>
</div>
<!-- fim alerts -->

<div class="col-md-6">

	<!-- well -->
	<div class="well">

		<!-- login-register-form -->
		<div class="login-register-form">

			<h3>JÁ SOU CADASTRADO</h3>

			<!-- form -->
			<c:url var="loginUrl" value="/login" />
			<form:form action="${loginUrl}" method="post" id="loginForm">

				<!-- form-item-wrapper -->
				<div class="form-item-wrapper">
					<div class="form-group">
						<label class="control-label" for="username">Email</label> <input class="form-control"
							type="text" id="username" name="username" placeholder="seu@email.com">
					</div>
				</div>
				<!-- fim form-item-wrapper -->
				<!-- form-item-wrapper -->
				<div class="form-item-wrapper">
					<div class="form-group">
						<label class="control-label" for="password">Senha</label> <input class="form-control"
							type="password" id="password" name="password" placeholder="********">
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
					<button type="submit" id="loginBtn" class="btn btn-default">
						Entrar <span class="glyphicon glyphicon-play"></span>
					</button>
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
			<c:url var="cadastroPaginaUrl" value="/cadastro" />
			<form id="registerForm" action="${cadastroPaginaUrl}">

				<!-- form-item-wrapper -->
				<div class="form-item-wrapper">
					<div class="form-group">
						<label class="control-label" for="email-register">Email</label> <input class="form-control"
							type="text" id="email-register" name="email" placeholder="seu@email.com">
					</div>
				</div>
				<!-- fim form-item-wrapper -->

				<!-- form-item-wrapper -->
				<div class="form-item-wrapper">
					<button type="submit" id="registerBtn" class="btn btn-default">
						Continuar <span class="glyphicon glyphicon-play"></span>
					</button>
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