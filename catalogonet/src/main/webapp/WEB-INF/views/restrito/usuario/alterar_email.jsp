<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Alterar e-mail - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

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
							<li class="active"><a href="<c:url value="/area-da-empresa"/>">Resumo</a></li>
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
									class="textoMeioMedio">Seus email foi atualizado com sucesso.</span>
							</div>
						</c:if>
						<!-- mensagem success error -->
						<c:if test="${not empty error}">
							<div class="alert alert-danger" role="alert">
								<p>${error}</p>
							</div>
						</c:if>
						<c:if test="${not empty dangerEmailUtilizado}">
							<div class="alert alert-danger" role="alert">
								<span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span
									class="textoMeioMedio"><br />Já existe um usuário com este endereço de email.</span>
							</div>
						</c:if>
						<c:if test="${not empty dangerEmailConfirmar}">
							<div class="alert alert-danger" role="alert">
								<span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span
									class="textoMeioMedio"><br />O endereço de email do campo confirmar não confere,
									tente novamente.</span>
							</div>
						</c:if>
						<!-- mensagem sucess error -->

						<div class="page-header">
							<h1>
								Alterar e-mail <small>Atualize seu email</small>
							</h1>
						</div>

						<!-- formulario -->
						<c:url var="alterarEmailPasso2" value="/area-da-empresa/meus-dados/alterar-email-handle" />
						<form id="defaultForm" method="post" class="form-horizontal" action="${alterarEmailPasso2}">
							<div class="form-group">
								<label class="col-lg-3 control-label">Senha</label>
								<div class="col-lg-5">
									<input type="password" class="form-control" name="senha" />
									<c:if test="${not empty senhaNull}">
										<div style="color: #FF0000; margin-top: 5px;" role="alert">
											<p>${senhaNull}</p>
										</div>
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Novo email</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="novoEmail" id="novoEmail"
										value="${novoEmail}" />
									<c:if test="${not empty novoEmailNull}">
										<div style="color: #FF0000; margin-top: 5px;" role="alert">
											<p>${novoEmailNull}</p>
										</div>
									</c:if>
									<c:if test="${not empty novoEmailIvalido}">
										<div style="color: #FF0000; margin-top: 5px;" role="alert">
											<p>${novoEmailIvalido}</p>
										</div>
									</c:if>
									<c:if test="${not empty dangerEmailUtilizado}">
										<div style="color: #FF0000; margin-top: 5px;" role="alert">
											<p>Já existe um usuário com este endereço de email.</p>
										</div>
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Confirmar novo email</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="confirmarNovoEmail" id="confirmarNovoEmail"
										value="${confirmarNovoEmail}" />
									<c:if test="${not empty confirmarNovoEmailNull}">
										<div style="color: #FF0000; margin-top: 5px;" role="alert">
											<p>${confirmarNovoEmailNull}</p>
										</div>
									</c:if>
									<c:if test="${not empty confirmarNovoEmailInvalido}">
										<div style="color: #FF0000; margin-top: 5px;" role="alert">
											<p>${confirmarNovoEmailInvalido}</p>
										</div>
									</c:if>
									

								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-3">
									<button type="submit" class="btn btn-success" value="Atualizar">Atualizar</button>
									<a class="btn btn-danger" href="<c:url value="/area-da-empresa" />">Cancelar</a>
								</div>
							</div>
						</form>

						<!-- /formulario -->

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