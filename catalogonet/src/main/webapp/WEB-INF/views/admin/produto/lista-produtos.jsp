<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Lista de Produtos</title>

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
				<h1>Lista de produtos</h1>
			</div>


			<!-- tabela de produtos -->
			<table class="table table-hover">

				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Duração meses</th>
					<th>Prioridade</th>
					<th>Valor</th>
					<th>Editar</th>
					<th>Remover</th>
				</tr>
	
	
	
				<c:forEach var="produto" items="${listaProdutos}">
					<tr>
						<td>${produto.id}</td>
						<td>${produto.nome}</td>
						<td>${produto.duracaoMeses}</td>
						<td>${produto.prioridadeProduto}</td>
						<td>R$ ${produto.valor}</td>
						<c:url var="editar" value="/adminadmin/produtos/editar-produto"/>
						<td><a href="${editar}?id=${produto.id}" class="btn btn-primary btn-xs">Editar <span class="glyphicon glyphicon-pencil"></span></a></td>
						<c:url var="remover" value="/adminadmin/produtos/remover-produto"/>
						<td><a href="${remover}?id=${produto.id}" class="btn btn-danger btn-xs">Remover <span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
				</c:forEach>

			</table>
			<!-- fim tabela de produtos -->

		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->






</body>
</html>