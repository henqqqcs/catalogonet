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
				<h1>Anúncios Gratuitos Aguardando Aprovação </h1>
			</div>

			<!-- tabela de anuncios -->
			<table class="table table-hover">

				<tr>
					<th>ID</th>
					<th>Título</th>
					<th>Cateogoria</th>
					<th>Sub Categoria</th>
					<th>Vizualizar</th>
				</tr>
				
				<c:forEach var="anuncio" items="${listaAnuncios}">
					<tr>
						<td>${anuncio.id}</td>
						<td>${anuncio.titulo}</td>
						<td>${anuncio.categoria.nome}</td>
						<td>${anuncio.subCategoria.nome}</td>
						<c:url var="visualizar" value="/adminadmin/anuncios/visualizar-anuncio-aprovacao"/>
						<td><a href="${visualizar}?id=${anuncio.id}" class="btn btn-primary btn-xs">Visualizar <span class="glyphicon glyphicon-pencil"></span></a></td>
					</tr>
				</c:forEach>

			</table>
			<!-- fim tabela de anuncios -->

		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->





</body>
</html>