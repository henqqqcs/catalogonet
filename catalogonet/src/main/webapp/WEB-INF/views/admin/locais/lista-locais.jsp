<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<h1>Lista de Locais <small>Estados</small></h1>
			</div>


			<!-- tabela de estado -->
			<table class="table table-hover">
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Cidades</th>
					<th>Editar</th>
					<th>Remover</th>
				</tr>
				<c:forEach var="estado" items="${listaEstados}">
					<tr>
						<td>${estado.id}</td>
						<td>${estado.nome}</td>
						<c:url var="cidades" value="/adminadmin/locais/lista-cidades"/>
						<td><a href="${cidades}?id=${estado.id}" class="btn btn-success btn-xs">Ver cidades <span class="glyphicon glyphicon-zoom-in"></span></a></td>
						<c:url var="editar" value="/adminadmin/locais/editar-estado"/>
						<td><a href="${editar}?id=${estado.id}" class="btn btn-primary btn-xs">Editar <span class="glyphicon glyphicon-pencil"></span></a></td>
						<c:url var="remover" value="/adminadmin/locais/remover-estado"/>
						<td><a href="${remover}?id=${estado.id}" class="btn btn-danger btn-xs">Remover <span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
				</c:forEach>
			</table>
			<!-- fim tabela de estados -->




		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->





</body>
</html>