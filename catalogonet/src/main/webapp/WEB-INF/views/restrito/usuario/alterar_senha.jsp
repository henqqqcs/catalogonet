<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Alterar senha - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

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

						<c:if test="${not empty dangerSenhaAtual}">
							<div class="alert alert-danger" role="alert">
								<span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span
									class="textoMeioMedio"><br />A campo senha atual não confere, por favor confira sua
									senha novamente!</span>
							</div>
						</c:if>
						<c:if test="${not empty dangerConfirmarSenha}">
							<div class="alert alert-danger" role="alert">
								<span class="textoMedio"><strong>Ops! Aconteceu um erro</strong></span> <span
									class="textoMeioMedio"><br />O campo confirmar senha, não bateu com o campo senha,
									tente novamente.</span>
							</div>
						</c:if>
						<!-- mensagem sucess error -->

						<div class="page-header">
							<h1>Alterar senha</h1>
						</div>

						<!-- formulario -->
						<c:url var="alterarSenha" value="/area-da-empresa/meus-dados/alterar-senha-handle" />
						<form id="defaultForm" method="post" class="form-horizontal" action="${alterarSenha}">
							<div class="form-group">
								<label class="col-lg-3 control-label">Senha atual</label>
								<div class="col-lg-5">
									<input type="password" class="form-control" name="senhaAtual" />
									<c:if test="${not empty senhaAtualNull}">
										<div style="color: #FF0000; margin-top: 5px;" role="alert">
											<p>Este campo é obrigatório.</p>
										</div>
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Nova senha</label>
								<div class="col-lg-5">
									<input type="password" class="form-control" name="novaSenha" id="novaSenha" />
									<c:if test="${not empty novaSenhaNull}">
										<div style="color: #FF0000; margin-top: 5px;" role="alert">
											<p>Este campo é obrigatório.</p>
										</div>
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Confirmar nova senha</label>
								<div class="col-lg-5">
									<input type="password" class="form-control" name="confirmarNovaSenha"
										id="confirmarNovaSenha" />
									<c:if test="${not empty confirmarNovaSenhaNull}">
										<div style="color: #FF0000; margin-top: 5px;" role="alert">
											<p>Este campo é obrigatório.</p>
										</div>
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-3">
									<button type="submit" class="btn btn-success" value="Atualizar">Alterar Senha</button>
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