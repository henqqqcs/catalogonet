<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Meus planos - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

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
							<li><a href="<c:url value="/area-da-empresa/criar-anuncio/informacoes"/>">Criar
									anúncio</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-anuncios"/>">Meus anúncios</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-planos"/>">Meus planos</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-pedidos"/>">Meus pedidos</a></li>
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

					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb breadcrumb-white">
								<li><a href="#">Home</a></li>
								<li class="active">Meus planos</li>
							</ol>
						</div>
						<div class="col-md-12">
							<div class="painel-restrito-item item-anuncio-header">

								<div class="row">

									<div class="col-md-12">

										<div class="page-header">
											<h2>Meus planos</h2>
										</div>


										<table class="table table-hover">
											<tr>
												<th>Produto</th>
												<th>Status</th>
												<th>Ação</th>
											</tr>
											<c:forEach items="${listaPlanos}" var="plano">
												<tr>
													<td>${plano.nomeCompletoPlano}</td>
													<td><c:if test="${plano.ativo}">
															<strong>Ativado <span class="glyphicon glyphicon-ok" style="color: #00CC00"></span></strong>
														</c:if> <c:if test="${!plano.ativo}">
															<strong>Desativado <span class="glyphicon glyphicon-remove"
																style="color: #FF0000"></span></strong>
														</c:if></td>
													<td>
													<c:if test="${plano.anuncio != null}">
	              										<a href="<c:url value="/area-da-empresa"/>">${plano.anuncio.titulo}</a>
	              									</c:if>
	              									<c:if test="${plano.anuncio == null}">
	              										<a href="<c:url value="/area-da-empresa"/>">Comece agora!</a>
	              									</c:if>
													</td>													
														
												</tr>
											</c:forEach>
										</table>


									</div>

								</div>
							</div>
						</div>
					</div>

				</div>


			</div>
			<!-- fim pagina restrito conteudo -->



		</div>
		<!-- fim content-wrapper -->

		<div class="clear"></div>
		<!-- Rodape -->
		<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	</div>
	<!-- fim wrapper -->



</body>
</html>