<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Cadastrar Produto</title>

	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/admin/css/bootstrap.min.css" />" />
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/admin/css/bootstrap-theme.min.css" />" />
	<!-- Jquery -->
	<script type="text/javascript" src="<c:url value="/resources/todos/js/jquery-1.11.3.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/admin/js/bootstrap.min.js"/>"></script>
	<!-- style admin -->
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/admin/css/style-admin.css" />" />
	
</head>
<body>


	<!-- navbar -->
	<c:import url="/WEB-INF/views/template/admin/cabecalho-admin.jsp" />
	<!-- ./ navnar -->


	<!-- row principal -->
	<div id="pagina" class="row-fluid">

		<!-- menu esquerda -->
		<c:import url="/WEB-INF/views/template/admin/menu-esquerda.jsp" />
		<!-- ./ fim menu equerda -->

		<!-- conteudo=pagina -->
		<div class="conteudo-pagina col-md-10">


					<div class="page-header">
						<h1>Configurações de Email </h1>
					</div>
					
					
					<c:if test="${mensagem}">
						<div class="alert alert-warning" role="alert">${mensagem}</div>
					</c:if>

				<!-- inicio configuracoes de email -->
				<div class="configuracoes-email">
		
					<div class="panel panel-primary">
					  <div class="panel-heading">Configurações de email</div>
					  <div class="panel-body">
					  	<c:url var="atualizar" value="/adminadmin/configuracoes/atualizar-email" />
					  	<form:form modelAttribute="emailProperties" action="${atualizar}" method="post">
					  	
					  	
							<div class="form-group">
								<label for="hostName">hostName:</label>
								<input type="text" class="form-control" name="hostName" value="${emailProperties.hostName}">
							</div>
							<div class="form-group">
								<label for="fromAdrr">fromAdrr:</label>
								<input type="text" class="form-control" name="fromAdrr" value="${emailProperties.fromAdrr}">
							</div>
							<div class="form-group">
								<label for="fromName">fromName:</label>
								<input type="text" class="form-control" name="fromName" value="${emailProperties.fromName}">
							</div>
							<div class="form-group">
								<label for="autheticatorLogin">autheticatorLogin:</label>
								<input type="text" class="form-control" name="autheticatorLogin" value="${emailProperties.autheticatorLogin}">
							</div>
							<div class="form-group">
								<label for="autheticatorPassword">autheticatorPassword:</label>
								<input type="text" class="form-control" name="autheticatorPassword" value="${emailProperties.autheticatorPassword}">
							</div>
							<div class="form-group">
								<label for="smtpPort">smtpPort:</label>
								<input type="text" class="form-control" name="smtpPort" value="${emailProperties.smtpPort}">
							</div>
							<div class="form-group">
								<label for="charset">charset:</label>
								<input type="text" class="form-control" name="charset" value="${emailProperties.charset}">
							</div>
					  	
						    <p><button type="submit" class="btn btn-primary">Editar <span class="glyphicon glyphicon-edit"></span></button></p>
						    
					    </form:form>
					  </div>
					</div>

				</div>
				<!-- fim configuracores de email -->
	
		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->






</body>
</html>