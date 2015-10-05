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
				<h1>Lista de Categorias </h1>
			</div>

			<!-- busca de categorias -->
			<form class="form-inline">
			  <div class="form-group">
			    <label for="exampleInputName2">Buscar categorias: </label>
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="palavras-chave">
			    <button type="submit" class="btn btn-default">Buscar <span class="glyphicon glyphicon-search"></span></button>
			  </div>
			</form>
			<!-- fim busca de categorias -->
			
			<c:url var="cadastrar" value="/adminadmin/categorias/cadastrar-categoria" />
			<a class="btn btn-success" href="${cadastrar}">Adicionar Categoria <span class="glyphicon glyphicon-plus"></span></a><br/><br/>

			<!-- 
			<nav>
			  <ul class="pagination">
			    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			  </ul>
			</nav>
			fim pagination -->

			<!-- tabela de categorias -->
			<table class="table table-hover">

				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Tags</th>
					<th>Visualizar Sub-Categorias</th>
					<th>Editar</th>
					<th>Remover</th>
				</tr>
				
				<c:forEach var="categoria" items="${listaCategorias}">
					<tr>
						<td>${categoria.id}</td>
						<td>${categoria.nome}</td>
						<td>
						<c:forEach var="tag" items="${categoria.tags}" varStatus="loop">
							<c:out value="${tag}"/><c:if test="${fn:length(categoria.tags) != (loop.index + 1)}">, </c:if>
						</c:forEach>
						</td>
						<c:url var="info" value="/adminadmin/categorias/lista-sub-categorias"/>
						<td><a href="${info}?id=${categoria.id}" class="btn btn-success btn-xs">Ver sub-categorias <span class="glyphicon glyphicon-zoom-in"></span></a></td>
						<c:url var="editar" value="/adminadmin/categorias/editar-categoria"/>
						<td><a href="${editar}?id=${categoria.id}" class="btn btn-primary btn-xs">Editar <span class="glyphicon glyphicon-pencil"></span></a></td>
						<c:url var="remover" value="/adminadmin/categorias/remover-categoria"/>
						<td><a href="${remover}?id=${categoria.id}" class="btn btn-danger btn-xs">Remover <span class="glyphicon glyphicon-remove"></span></a></td>
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