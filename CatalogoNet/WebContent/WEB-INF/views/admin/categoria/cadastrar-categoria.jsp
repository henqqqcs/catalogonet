<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
				<h1>Cadastrar nova categoria </h1>
			</div>



			<c:url var="cadastrar" value="/adminadmin/categorias/cadastrar-categoria-handle" />
			<form:form modelAttribute="categoria" action="${cadastrar}" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">Nome da categoria</label>
					<input type="text" class="form-control" name="nome" placeholder="Restaurante">
				</div>

				
				<div id="tags-wrapper"class="form-group">
					<label for="exampleInputEmail1">Tags utlizadas pelo sistema de busca</label><br/>
					<button class="btn btn-success" type="button" id="more_fields" onclick="add_fields();">Adicionar tag <span class="glyphicon glyphicon-plus"></span></button><br/><br/>
					<input type="text" class="form-control" name="tags" placeholder="restaurante"><br/>
					
				</div>

				<button type="submit" class="btn btn-primary">Cadastrar</button>
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