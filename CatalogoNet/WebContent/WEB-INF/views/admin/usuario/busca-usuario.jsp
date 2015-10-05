<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Usuários</title>

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
			<c:url var="buscaNome" value="/adminadmin/usuarios/busca-nome-handle" />
			<form class="form-inline" action="${buscaNome}" method="get">
			  <div class="form-group">
			    <label for="exampleInputName2">Buscar usuário por nome: </label>
			    <input type="text" class="form-control" name="nome" placeholder="Nome">
			    <button type="submit" class="btn btn-default">Buscar <span class="glyphicon glyphicon-search"></span></button>
			  </div>
			</form>
			<br/>
			<!-- fim busca de usuarios -->

			<!-- busca de usuarios -->
			<c:url var="buscaCpf" value="/adminadmin/usuarios/busca-cpf-handle" />
			<form class="form-inline" action="${buscaCpf}" method="get">
			  <div class="form-group">
			    <label for="exampleInputName2">Buscar usuário por CPF: </label>
			    <input type="text" class="form-control" name="cpf" placeholder="cpf">
			    <button type="submit" class="btn btn-default">Buscar <span class="glyphicon glyphicon-search"></span></button>
			  </div>
			</form>
			<br/>
			<!-- fim busca de usuarios -->

			<!-- busca de usuarios -->
			<c:url var="buscaEmail" value="/adminadmin/usuarios/busca-email-handle" />
			<form class="form-inline" action="${buscaEmail}" method="get">
			  <div class="form-group">
			    <label for="exampleInputName2">Buscar usuário por E-MAIL: </label>
			    <input type="text" class="form-control" name="email" placeholder="email@email.com">
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
					<th>Nome</th>
					<th>Email</th>
					<th>CPF</th>
					<th>Telefone</th>
					<th>Mais Informações</th>
				</tr>
				<c:forEach var="usuario" items="${listaUsuarios}">
					<tr>
						<td>${usuario.id}</td>
						<td>${usuario.ativo}</td>
						<td>${usuario.nome}</td>
						<td>${usuario.email}</td>
						<td>${usuario.cpf}</td>
						<td>${usuario.telefone}</td>
						<c:url var="editar" value="/adminadmin/usuarios/usuario-info"/>
						<td><a href="${editar}?id=${usuario.id}" class="btn btn-primary btn-xs">Editar <span class="glyphicon glyphicon-pencil"></span></a></td>
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