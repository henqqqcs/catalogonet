<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Cadasrtrar Cidade</title>

	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/admin/css/bootstrap.min.css" />" />
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/admin/css/bootstrap-theme.min.css" />" />
	<!-- Jquery -->
	<script type="text/javascript" src="<c:url value="/resources/todos/js/jquery-1.11.3.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/admin/js/bootstrap.min.js"/>"></script>
	<!-- style admin -->
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/admin/css/style-admin.css" />" />
	
	
<c:url var="listaEstados" value="/servicos/lista-estados" />
<script type="text/javascript">
	$(document).ready(function() {
				
				$.getJSON('${listaEstados}', {
					ajax : 'true'
				}, function(data) {
					var optiID = '${cidade.estado.id}';
					var optiName = '${cidade.estado.nome}';
					var html = "<option value='" + optiID + "'>" + optiName + "</option>";
					var len = data.length;
					for (var i = 0; i < len; i++) {
						if (data[i].id != optiID) {
							html += '<option value="' + data[i].id + '">'
									+ data[i].nome + '</option>';
						}
					}
					html += '</option>';
					$('#estados').html(html);
				});
			});
</script>

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
				<h1>Editar Cidade</h1>
			</div>

				<!-- form atualizar cidade -->
				<c:url var="atualizar" value="/adminadmin/locais/atualizar-cidade-handle" />
				<form:form modelAttribute="cidade" action="${atualizar}" method="post">
				  <div class="form-group">
				   	<input type="hidden" class="form-control" name="id" value="${cidade.id}">
				    <label for="nome">Nome</label>
				    <input type="text" class="form-control" id="nome" name="nome" value="${cidade.nome}">
				  </div>
				  <div class="form-group">
				  	<label for="estado">Estado</label>
						<select id="estados" name="estado.id" class="form-control">
						</select>
				  </div>

				  <button type="submit" class="btn btn-primary">Atualizar</button>
				</form:form>
				<!-- fim form cadastro cidade -->

		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->
	
	


</body>
</html>