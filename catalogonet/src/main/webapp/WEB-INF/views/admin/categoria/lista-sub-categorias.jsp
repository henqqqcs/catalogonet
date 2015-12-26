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
				<h1>Lista Sub Categorias - ${categoria.nome} </h1>
			</div>

			<div class="categoria-info">
				<p><label>ID: </label> ${categoria.id}</p>
				<p><label>Nome: </label> ${categoria.nome}</p>
				
				<!-- lista de tags -->
				<p><label>Tag: </label>
					<c:forEach var="tag" items="${categoria.tags}" varStatus="loop">
						<c:out value="${tag}"/><c:if test="${fn:length(categoria.tags) != (loop.index + 1)}">, </c:if>
					</c:forEach>
				</p>
				
				<c:url var="cadastrar" value="/adminadmin/categorias/cadastrar-sub-categoria?id=${categoria.id}"/>
				<a class="btn btn-success" href="${cadastrar}">Adicionar Sub Categorias <span class="glyphicon glyphicon-plus"></span></a>
			</div>

			<br/>
			<br/>
			<!-- tabela de sub categorias -->
			<table class="table table-hover">

				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Tags</th>
					<th>Editar</th>
					<th>Remover</th>
				</tr>
				
				<c:forEach var="subCategoria" items="${listaSubCategorias}">
					<tr>
						<td>${subCategoria.id}</td>
						<td>${subCategoria.nome}</td>
						<td>
						<c:forEach var="subTag" items="${subCategoria.tags}" varStatus="loop">
							<c:out value="${subTag}"/><c:if test="${fn:length(subCategoria.tags) != (loop.index + 1)}">, </c:if>
						</c:forEach>
						</td>
						<c:url var="editar" value="/adminadmin/categorias/editar-sub-categoria"/>
						<td><a href="${editar}?id=${subCategoria.id}" class="btn btn-primary btn-xs">Editar <span class="glyphicon glyphicon-pencil"></span></a></td>
						<c:url var="remover" value="/adminadmin/categorias/remover-sub-categoria"/>
						<td><a href="${remover}?id=${subCategoria.id}" class="btn btn-danger btn-xs">Remover <span class="glyphicon glyphicon-remove"></span></a></td>
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