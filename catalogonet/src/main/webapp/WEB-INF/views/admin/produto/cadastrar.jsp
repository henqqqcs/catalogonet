<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Cadastrar Produto</title>

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
				<h1>Cadastrar produtos</h1>
			</div>

			<div class="alert alert-danger" role="alert"> Mensagem de erro </div>

			<!-- formulario cadastro produtos -->
			<c:url var="cadastrar" value="/adminadmin/produtos/cadastrar-produto-handle" />
			<form:form modelAttribute="produto" action="${cadastrar}" method="post">
				<div class="form-group">
				<label for="exampleInputEmail1">Nome do Produto</label>
					<input type="text" class="form-control" name="nome" placeholder="Nome do produto">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Duração em meses</label>
					<select class="form-control" name="duracaoMeses">
					  <option>1</option>
					  <option>2</option>
					  <option>3</option>
					  <option>4</option>
					  <option>5</option>
					  <option>6</option>
					  <option>7</option>
					  <option>8</option>
					  <option>9</option>
					  <option>10</option>
					  <option>11</option>
					  <option>12</option>
					</select>
				</div>

				<div class="form-group">
					<label for="exampleInputEmail1">Valor</label>
					    <div class="input-group">
					      <div class="input-group-addon">$</div>
					      <input type="text" class="form-control" name="valor" placeholder="Amount">
					      <div class="input-group-addon">.00</div>
					    </div>
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">Prioridade do produto</label>
					<select class="form-control" name="numPrioridade">
					  <option>1</option>
					  <option>2</option>
					  <option>3</option>
					  <option>4</option>
					  <option>5</option>
					</select>
				</div>

				<button type="submit" class="btn btn-primary">Cadastrar</button>
			</form:form>


			<!-- fim formulario cadastro produtos -->
		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->






</body>
</html>