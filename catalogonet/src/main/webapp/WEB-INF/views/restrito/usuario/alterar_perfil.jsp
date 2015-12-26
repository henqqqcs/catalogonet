<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Alterar perfil - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/restrito/arquivos-css-js.jsp" />

</head>
<body>



	<!-- wrapper -->
	<div id="wrapper">

		<!-- cabecalho -->
		<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />
		<!-- cabecalho -->

		<!-- content-wrapper -->
		<div id="content-restrito-wrapper">

			<div id="pagina-restrito-conteudo">

				<div class="container">
					<div class="menu-responsivo">
						<div class="toggle-menu">
							<span class="menu-mensagem">Menu</span>
							<div class="pull-right">
								<span class="glyphicon glyphicon-menu-hamburger"></span>
							</div>
						</div>
						<ul class="nav-responsivo nav-responsivo-horizontal">
							<li><a href="<c:url value="/area-da-empresa"/>">Resumo</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-anuncios"/>">Meus anúncios</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-planos"/>">Meus planos</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-pedidos"/>">Meus pedidos</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-dados/perfil"/>">Perfil</a></li>
						</ul>
						<div class="clear"></div>
					</div>
				</div>

				<script type="text/javascript">
					$(document).ready(function() {
						$(".toggle-menu").click(function() {
							$(".nav-responsivo").toggle(500);
						});
					});
				</script>


				<div class="container">

					<!-- meud dados -->
					<div class="painel-restrito-item">

						<!-- mensagem success error -->
						<c:if test="${not empty success}">
							<div class="alert alert-success" role="alert">
								<span class="textoMedio"><strong>Dados atualizados!</strong></span> <span
									class="textoMeioMedio">Sua senha foi atualizada com sucesso.</span>
							</div>
						</c:if>

						<c:if test="${not empty danger}">
							<div class="alert alert-danger" role="alert">
								<strong>Ops! Aconteceu um erro</strong>
								<br>Verifique novamente o formulário
							</div>
						</c:if>
						<!-- mensagem sucess error -->

						<div class="page-header">
							<h1>Alterar perfil</h1>
							<p>Atualize seus dados</p>
						</div>



						<!-- inicio form -->
						<c:url var="info" value="/area-da-empresa/meus-dados/alterar-perfil-handle" />
						<form:form id="anuncioForm" modelAttribute="usuarioUpdate" class="form-horizontal" action="${info}"
							method="POST">

							<!-- form-group -->
							<div class="form-group">
								<label for="titulo" class="col-sm-2 control-label">Nome <span
									class="glyphicon glyphicon-asterisk"></span></label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="titulo" path="nome"
										placeholder="Seu nome" />
									<form:errors path="nome" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->
							<!-- form-group -->
							<div class="form-group">
								<label for="titulo" class="col-sm-2 control-label">CPF ou CNPJ</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="cpf" path="cpf"
										placeholder="000.000.000-00" />
									<form:errors path="cpf" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->
							<!-- form-group -->
							<div class="form-group">
								<label for="titulo" class="col-sm-2 control-label">Celular <span
									class="glyphicon glyphicon-asterisk"></span></label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="telefone1" path="telefone1"
										placeholder="(61) 0000-0000" />
									<form:errors path="telefone1" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->
							<!-- form-group -->
							<div class="form-group">
								<label for="titulo" class="col-sm-2 control-label">Telefone fixo</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="titulo" path="telefone2"
										placeholder="(61) 0000-0000" />
									<form:errors path="telefone2" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<h3>
								<strong>Endereço</strong>
							</h3>
							<hr />

							<!-- form-group -->
							<div class="form-group">
								<label for="telefone1" class="col-sm-2 control-label">Estado</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="estado" path="endereco.estado"
										placeholder="Digite seu estado" value="${endereco.estado}" />
									<form:errors path="endereco.estado" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->
							<!-- form-group -->
							<div class="form-group">
								<label for="telefone1" class="col-sm-2 control-label">Cidade</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="cidade" path="endereco.cidade"
										placeholder="Digite sua cidade" value="${endereco.cidade}" />
									<form:errors path="endereco.cidade" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->
							<!-- form-group -->
							<div class="form-group">
								<label for="telefone1" class="col-sm-2 control-label">Bairro</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="cidade" path="endereco.bairro"
										placeholder="Digite seu bairro" value="${endereco.bairro}" />
									<form:errors path="endereco.bairro" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->
							<!-- form-group -->
							<div class="form-group">
								<label for="telefone1" class="col-sm-2 control-label">Endereço</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="endereco" path="endereco.endereco"
										placeholder="Digite seu endereço" value="${endereco.endereco}" />
									<form:errors path="endereco.endereco" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->
							<!-- form-group -->
							<div class="form-group">
								<label for="telefone1" class="col-sm-2 control-label">CEP </label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="cep" path="endereco.cep"
										placeholder="Digite seu CEP" value="${endereco.bairro}" />
									<form:errors path="endereco.cep" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button id="botaoContinuar" type="submit" class="pull-right btn btn-primary">
										Atualizar <span class="glyphicon glyphicon-triangle-right"></span>
									</button>
								</div>
							</div>
						</form:form>
						<!-- fim form -->



					</div>

				</div>

			</div>


		</div>
		<!-- fim content-wrapper -->

		<div class="clear"></div>
		<!-- Rodape -->
		<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	</div>
	<!-- fim wrapper -->
</body>
</html>