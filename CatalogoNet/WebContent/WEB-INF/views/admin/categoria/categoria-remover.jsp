<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Remover Categoria</title>

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
					<h1>Remover categoria </h1>
				</div>


				<!-- mensagem remover produto -->
				<div class="panel panel-danger">
					<div class="panel-heading">Confirmar remover categoria</div>
					<div class="panel-body">
						<p><label>ID: </label> ${categoria.id}</p>
						<p><label>Nome: </label> ${categoria.nome}</p>
						
						<p><label>Tags da categoria: </label></p>
						<c:forEach var="tag" items="${categoria.tags}">
							<p>${tag}</p>
						</c:forEach>
						
						<div class="alert alert-danger" role="alert">Esta ação ira remover também todas as sub-categorias que pertencem a esta categoria, tem certeza que deseja excluir?</div>
						<c:url var="remover" value="/adminadmin/categorias/remover-categoria-handle" />
						<form:form modelAttribute="produto" action="${remover}" method="post">
							<input type="hidden" name="id" value="${categoria.id}">
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