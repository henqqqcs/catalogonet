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
				<h1>Aprovar Anúncio? </h1>
			</div>

			<c:url var="aprovar" value="/adminadmin/anuncios/aprovar-anuncio"/>
			<a href="${aprovar}?id=${anuncio.id}" class="btn btn-success">Aprovar <span class="glyphicon glyphicon-thumbs-up"></span></a>
			<c:url var="reprovar" value="/adminadmin/anuncios/reprovar-anuncio"/>
			<a href="${reprovar}?id=${anuncio.id}" class="btn btn-danger">Reprovar <span class="glyphicon glyphicon-thumbs-up"></span></a>
			<c:url var="editar" value="/adminadmin/anuncios/editar-anuncio"/>
			<a href="${editar}?id=${anuncio.id}" class="btn btn-info">Editar <span class="glyphicon glyphicon-pencil"></span></a>

			<h1>Importar pagina do anuncio</h1>
			<br/>

		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->





</body>
</html>