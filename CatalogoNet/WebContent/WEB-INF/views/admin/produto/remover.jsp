<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
					<h1>Remover produto </h1>
				</div>


				<!-- mensagem remover produto -->
				<div class="panel panel-danger">
					<div class="panel-heading">Confirmar remover produto</div>
					<div class="panel-body">
						<p><label>ID: </label> ${produto.id}</p>
						<p><label>Nome: </label> ${produto.nome}</p>
						<p><label>Duração em meses: </label> ${produto.duracaoMeses}</p>
						<p><label>Valor: </label> ${produto.valor }</p>
						<p><label>Prioridade: </label> ${produto.numPrioridade}</p>
						
						<c:url var="remover" value="/adminadmin/produtos/remover-produto-handle" />
						<form:form modelAttribute="produto" action="${remover}" method="post">
							<input type="hidden" name="id" value="${produto.id}">
							<button type="submit" class="btn btn-danger">Confirmar</button>
						</form:form>
					</div>
				</div>
				<!-- fim mesagem remover prodito -->

			</div>
			<!-- fim conteudo pagina -->


		</div>
		<!-- fim row principal -->

</body>
</html>