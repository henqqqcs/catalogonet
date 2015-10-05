<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Editar Estado</title>

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
				<h1>Editar Estado</h1>
			</div>

				<!-- form atualizar estado -->
				<c:url var="atualizar" value="/adminadmin/locais/atualizar-estado-handle" />
				<form:form modelAttribute="estado" action="${atualizar}" method="post">
				  <div class="form-group">
				  	<input type="hidden" class="form-control" name="id" value="${estado.id}">
				    <label for="nome">Nome do estado</label>
				    <input type="text" class="form-control" id="nome" name="nome" value="${estado.nome}">
				  </div>
				  <div class="form-group">
				  	<label for="nome">Sigla do estado: </label> ${estado.id}
				  	<div class="alert alert-danger" role="alert">Não é possível trocar o id do estado.</div>
				  </div>

				  <button type="submit" class="btn btn-primary">Atualizar</button>
				</form:form>
				<!-- fim form atualizar estado -->

		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->
	
	


</body>
</html>