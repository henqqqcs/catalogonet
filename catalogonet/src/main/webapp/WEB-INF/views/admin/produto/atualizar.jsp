<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<h1>Atualizar produto <small>${produto.nome} </small></h1>
			</div>

			<div class="alert alert-danger" role="alert"> Mensagem de erro </div>

			<!-- formulario cadastro produtos -->
			<c:url var="cadastrar" value="/adminadmin/produtos/atualizar-produto-handle" />
			<form:form modelAttribute="produto" action="${cadastrar}" method="post">
			
				<input type="hidden" name="id" value="${produto.id}">
				<div class="form-group">
				<label for="exampleInputEmail1">Nome do Produto</label>
					<input type="text" class="form-control" name="nome" placeholder="Nome do produto" value="${produto.nome}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Duração em meses</label>
					<select class="form-control" name="duracaoMeses">
					  <c:forEach var="i" begin="0" end="12">					   
						   <c:choose>
							  <c:when test="${produto.duracaoMeses == i}">
							  	<option selected>${i}</option>
							  </c:when>
							  <c:otherwise>
							  	<option>${i}</option>
							  </c:otherwise>
						    </c:choose>
					  </c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label for="exampleInputEmail1">Valor</label>
					    <div class="input-group">
					      <div class="input-group-addon">$</div>
					      <input type="text" class="form-control" name="valor" placeholder="Amount" value="${produto.valor}">
					      <div class="input-group-addon">.00</div>
					    </div>
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">Prioridade do produto</label>
					<select class="form-control" name="prioridadeProduto">				  
					    <c:forEach var="prioridade" items="${prioridadeProdutoEnum}" >
        					<option value="${prioridade}" ${produto.prioridadeProduto == prioridade ? 'selected' : ''}>${prioridade}</option>
    					</c:forEach>
					</select>
				</div>

				<button type="submit" class="btn btn-primary">Atualizar</button>
			</form:form>


			<!-- fim formulario cadastro produtos -->
		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->






</body>
</html>