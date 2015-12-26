<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Editar Usuário</title>

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
				<h1>Editar Usuário</h1>
			</div>



			<c:url var="atualizar" value="/adminadmin/usuarios/atualizar-usuario-handle" />
			<form:form modelAttribute="usuario" action="${atualizar}" method="post">
			
				<div class="form-group">
					<label for="id">ID: ${usuario.id}</label>
					<input type="hidden" name="id" value="${usuario.id}">
				</div>
				<div class="form-group">
					<label for="nome">Nome do usuário: </label>
					<input type="text" class="form-control" name="nome" value="${usuario.nome}">
				</div>
				<div class="form-group">
					<label for="nome">CPF: </label>
					<input type="text" class="form-control" name="cpf" value="${usuario.cpf}">
				</div>
				<div class="form-group">
					<label for="nome">Telefone: </label>
					<input type="text" class="form-control" name="telefone" value="${usuario.telefone}">
				</div>
				<hr/>
				<div class="form-group">
					<label for="nome">Estado: </label>
					<input type="text" class="form-control" name="endereco.estado" value="${usuario.endereco.estado}">
				</div>
				<div class="form-group">
					<label for="nome">Cidade: </label>
					<input type="text" class="form-control" name="endereco.cidade" value="${usuario.endereco.cidade}">
				</div>
				<div class="form-group">
					<label for="nome">Bairro: </label>
					<input type="text" class="form-control" name="endereco.bairro" value="${usuario.endereco.bairro}">
				</div>
				<div class="form-group">
					<label for="nome">Endereço: </label>
					<input type="text" class="form-control" name="endereco.bairro" value="${usuario.endereco.endereco}">
				</div>
				<div class="form-group">
					<label for="nome">CEP: </label>
					<input type="text" class="form-control" name="endereco.bairro" value="${usuario.endereco.cep}">
				</div>

				<button type="submit" class="btn btn-primary">Atualizar</button>
			</form:form>

			


		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->


<script type="text/javascript">
function add_fields() {
	var tags = ["restaurantes", "alimentação", "comida", "tag name"];
	var inputCount = document.getElementById('tags-wrapper').getElementsByTagName('input').length;
	if (inputCount < 5) {
    	var input = document.createElement("input");
    	var br = document.createElement('br');
		input.type = "text";
		input.className = "form-control";
		input.name = "tags";
		input.placeholder = tags[inputCount - 1];
    	document.getElementById('tags-wrapper').appendChild(input).focus();;
    	document.getElementById('tags-wrapper').appendChild(br);
	}
}
</script>

</body>
</html>