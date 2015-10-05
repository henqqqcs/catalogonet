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

						<!-- info-usuario -->
			<div class="info-usuario">

				<div class="page-header">
					<h1>Informações de Usuário </h1>
				</div>

					<p><label>Nome: </label>${usuario.nome}</p>
					<p><label>Email: </label>${usuario.email}</p>
					<p><label>CPF: </label>${usuario.cpf}</p>
					<p><label>telefone: </label>${usuario.telefone}</p>
					<hr>
					<p><label>Estado: </label>${usuario.endereco.estado}</p>
					<p><label>Cidade: </label>${usuario.endereco.cidade}</p>
					<p><label>Bairro: </label>${usuario.endereco.bairro}</p>
					<p><label>Endereço: </label>${usuario.endereco.endereco}</p>
					<p><label>CEP: </label>${usuario.endereco.cep}</p>
					
					<c:url var="editar" value="/adminadmin/usuarios/editar-usuario"/>
					<p><a href="${editar}?id=${usuario.id}" class="btn btn-primary">Editar <span class="glyphicon glyphicon-edit"></span></a></p>


			</div>
			<!-- fim info-usuario -->


			<!-- pedidos -->
			<div class="info-usuario">
				<br/>

				<div class="page-header">
					<h1>Pedidos do Usuário </h1>
				</div>

				<!-- tabela de pedidos -->
				<table class="table table-hover">

					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>Tags</th>
						<th>Editar</th>
						<th>Remover</th>
					</tr>

					<tr>
						<td>1</td>
						<td>Pizzaria</td>
						<td>italiana, pizza</td>
						<td><a href="" class="btn btn-primary btn-xs">Editar <span class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="" class="btn btn-danger btn-xs">Remover <span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>

				</table>
				<!-- fim tabela de pedidos -->

			</div>
			<!-- fim pedidos -->


			<!-- usuario-planos -->
			<div class="info-usuario-planos">
				<br/>

				<div class="page-header">
					<h1>Planos Contratados </h1>
				</div>

				<!-- tabela de sub usuario-planos -->
				<table class="table table-hover">

					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>Tags</th>
						<th>Editar</th>
						<th>Remover</th>
					</tr>

					<tr>
						<td>1</td>
						<td>Pizzaria</td>
						<td>italiana, pizza</td>
						<td><a href="" class="btn btn-primary btn-xs">Editar <span class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="" class="btn btn-danger btn-xs">Remover <span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>

				</table>
				<!-- fim tabela de usuario-planos -->

			</div>
			<!-- fim usuario-planos -->


			<!-- usuario-anuncios -->
			<div class="info-usuario-planos">
				<br/>

				<div class="page-header">
					<h1>Anúncios do Usuário </h1>
				</div>

				<!-- tabela de sub usuario-anuncios -->
				<table class="table table-hover">

					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>Tags</th>
						<th>Editar</th>
						<th>Remover</th>
					</tr>

					<tr>
						<td>1</td>
						<td>Pizzaria</td>
						<td>italiana, pizza</td>
						<td><a href="" class="btn btn-primary btn-xs">Editar <span class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="" class="btn btn-danger btn-xs">Remover <span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>

				</table>
				<!-- fim tabela de usuario-anuncios -->

			</div>
			<!-- fim usuario-anuncios -->

			<!-- usuario-Cupons -->
			<div class="info-usuario-cupons">
				<br/>

				<div class="page-header">
					<h1>Cupons </h1>
				</div>

				<!-- tabela de sub usuario-anuncios -->
				<table class="table table-hover">

					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>Tags</th>
						<th>Editar</th>
						<th>Remover</th>
					</tr>

					<tr>
						<td>1</td>
						<td>Pizzaria</td>
						<td>italiana, pizza</td>
						<td><a href="" class="btn btn-primary btn-xs">Editar <span class="glyphicon glyphicon-pencil"></span></a></td>
						<td><a href="" class="btn btn-danger btn-xs">Remover <span class="glyphicon glyphicon-remove"></span></a></td>
					</tr>

				</table>
				<!-- fim tabela de usuario-cupons -->

			</div>
			<!-- fim usuario-cupons -->

		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->





</body>
</html>