<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Remover Bairro</title>

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
					<h1>Remover Bairro </h1>
				</div>


				<!-- mensagem remover cidade -->
				<div class="panel panel-danger">
					<div class="panel-heading">Confirmar remover bairro</div>
					<div class="panel-body">
						<p><label>ID: </label> ${bairro.id}</p>
						<p><label>Nome: </label> ${bairro.nome}</p>
						<p><label>Cidade: </label> ${bairro.cidade.nome}</p>
						
						<c:url var="remover" value="/adminadmin/locais/remover-bairro-handle" />
						<form:form modelAttribute="bairro" action="${remover}" method="post">
							<input type="hidden" name="id" value="${bairro.id}">
							<button type="submit" class="btn btn-danger">Confirmar</button>
						</form:form>
					</div>
				</div>
				<!-- fim mesagem remover cidade -->

			</div>
			<!-- fim conteudo pagina -->


		</div>
		<!-- fim row principal -->

</body>
</html>