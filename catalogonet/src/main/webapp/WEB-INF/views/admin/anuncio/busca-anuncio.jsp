<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Anúncios</title>

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
				<h1>Busca de Usuários </h1>
			</div>

			<!-- busca de usuarios -->
			<c:url var="buscaAnuncio" value="/adminadmin/anuncios/busca-titulo-handle" />
			<form class="form-inline" action="${buscaAnuncio}" method="get">
			  <div class="form-group">
			    <label for="exampleInputName2">Buscar anúncio por título: </label>
			    <input type="text" class="form-control" name="titulo" placeholder="Titulo">
			    <button type="submit" class="btn btn-default">Buscar <span class="glyphicon glyphicon-search"></span></button>
			  </div>
			</form>
			<br/>
			<!-- fim busca de usuarios -->


			<c:if test="${resultado != null}">
				<div class="alert alert-info" role="alert">Resultado da busca. Retornou ${resultado} usuários.</div>
			</c:if>

			<div class="page-header">
				<h1>Resultado da Busca </h1>
			</div>

			<!-- tabela de usuarios -->
			<table class="table table-hover">

				<tr>
					<th>ID</th>
					<th>Ativo</th>
					<th>Titulo</th>
					<th>categoria</th>
					<th>subCategoria</th>
					<th>Telefone</th>
					<th>Visualizar</th>
				</tr>
				<c:forEach var="anuncio" items="${listaAnuncios}">
					<tr>
						<td>${anuncio.id}</td>
						<td>${anuncio.ativo}</td>
						<td>${anuncio.titulo}</td>
						<td>${anuncio.categoria.nome}</td>
						<td>${anuncio.subCategoria.nome}</td>
						<td>${anuncio.telefone1}</td>
						<c:url var="visualizar" value="/adminadmin/anuncio/anuncio-visualizar"/>
						<td><a href="${visualizar}?id=${anuncio.id}" class="btn btn-primary btn-xs">Visualizar <span class="glyphicon glyphicon-pencil"></span></a></td>
					</tr>
				</c:forEach>

			</table>
			<!-- fim tabela de usuarios -->


		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->





</body>
</html>