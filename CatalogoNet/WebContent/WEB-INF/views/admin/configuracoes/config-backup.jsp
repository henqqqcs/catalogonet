<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
		
			<!-- inicio configuracoes de backup -->
				<div class="configuracoes-email">

					<div class="page-header">
						<h1>Configurações de Backup </h1>
					</div>
		
					<div class="panel panel-primary">
					  <div class="panel-heading">Configurações de Backup</div>
					  <div class="panel-body">

						<c:url var="comando" value="/adminadmin/configuracoes/executar-comando-sql"/>
					  <form class="form-horizontal" action="${comando}">

						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">ComandoSQL</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="comando" value="mysqldump -u 234324 -password skdfhksjdfh">
						    </div>
						  </div>

						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-success">Executar Comando <span class="glyphicon glyphicon-play"></span></button>
						    </div>
						  </div>
						</form>

					  </div>
					</div>

				</div>
				<!-- fim configuracores de back -->


				<!-- inicio configuracoes de backup -->
				<div class="configuracoes-email">

					<div class="page-header">
						<h1>Lista de Backup's</h1>
					</div>

					<p><a href="" class="btn btn-success">Fazer Backup <span class="glyphicon glyphicon-download-alt"></span></a></p>
		
					<!-- tabela de backup -->
					<table class="table table-hover">
					  <tr>
					  	<th>ID</th>
					  	<th>Data do Backup</th>
					  	<th>Hora</th>
					  	<th>Tipo</th>
					  	<th>Tamanho Kb's</th>
					  	<th>Download</th>
					  	<th>Deletar</th>
					  </tr>
					  <tr>
					  	<td>1</td>
					  	<td>12/12/2015</td>
					  	<td>02:23:00</td>
					  	<td>Automático</td>
					  	<td>23123 KB</td>
					  	<td><a href="" class="btn btn-primary">Download Backup <span class="glyphicon glyphicon-download-alt"></span></a></td>
					  	<td><a href="" class="btn btn-danger">Deletar <span class="glyphicon glyphicon-remove"></span></a></td>
					  </tr>
					  <tr>
					  	<td>2</td>
					  	<td>15/12/2015</td>
					  	<td>02:23:00</td>
					  	<td>Manual</td>
					  	<td>23123 KB</td>
					  	<td><a href="" class="btn btn-primary">Download Backup <span class="glyphicon glyphicon-download-alt"></span></a></td>
					  	<td><a href="" class="btn btn-danger">Deletar <span class="glyphicon glyphicon-remove"></span></a></td>
					  </tr>
					</table>
					<!-- fim tabela de backup -->
				</div>
				<!-- fim configuracores de email -->

		</div>
		<!-- fim conteudo pagina -->


	</div>
	<!-- fim row principal -->






</body>
</html>