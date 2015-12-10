<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb breadcrumb-white">
								<li><a href="#">Home</a></li>
								<li><a href="#">Meus anúncios</a></li>
								<li class="active">${anuncio.titulo}</li>
							</ol>
						</div>
					</div>


					<!-- atualizar anuncio -->
					<div class="atualizar-anuncio-wrapper painel-restrito-item">

						<!-- ============================================================ -->


						<div class="painel-restrito-item alert alert-danger">
							<h2>Erro ao publicar anúncio</h2>
							<p>Alguns erros foram identificados. Não foi possível publicar o seu anúncio, altere os
								campos indicados para publicar o seu anúncio.</p>
						</div>



					</div>
					<!-- fim atualizar-anuncio -->

					<c:if test="${not empty mapaInformacoes}">
						<div class="painel-restrito-item">
							<h2>Informações</h2>

							<div class="alert alert-danger">
								<c:forEach var="entry" items="${mapaInformacoes}">
									<div class="validacao-item">
										<label>${fn:toUpperCase(fn:substring(entry.key, 0, 1))}${fn:substring(entry.key, 1, fn:length(entry.key))}:</label>
										${entry.value}
									</div>
								</c:forEach>
							</div>
							<a class="btn btn-success" href="<c:url value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/informacoes" />">Alterar informações</a>
						</div>
					</c:if>
					<c:if test="${not empty mapaLocalizacao}">
						<div class="painel-restrito-item">
							<h2>Localização</h2>

							<div class="alert alert-danger">
								<c:forEach var="entry" items="${mapaLocalizacao}">
									<div class="validacao-item">
										<label>${fn:toUpperCase(fn:substring(entry.key, 0, 1))}${fn:substring(entry.key, 1, fn:length(entry.key))}:</label>
										${entry.value}
									</div>
								</c:forEach>
							</div>
							<a class="btn btn-success" href="<c:url value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/localizacao" />">Alterar localização</a>
						</div>
					</c:if>
					<c:if test="${not empty mapaCategoria}">
						<div class="painel-restrito-item">
							<h2>Categoria</h2>

							<div class="alert alert-danger">
								<c:forEach var="entry" items="${mapaCategoria}">
									<div class="validacao-item">
										<label>${fn:toUpperCase(fn:substring(entry.key, 0, 1))}${fn:substring(entry.key, 1, fn:length(entry.key))}:</label>
										${entry.value}
									</div>
								</c:forEach>
							</div>
							<a class="btn btn-success" href="<c:url value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/categoria" />">Alterar categoria</a>
						</div>
					</c:if>
					<c:if test="${not empty mapaTags}">
						<div class="painel-restrito-item">
							<h2>Palavras-chave</h2>

							<div class="alert alert-danger">
								<c:forEach var="entry" items="${mapaTags}">
									<div class="validacao-item">
										<label>${fn:toUpperCase(fn:substring(entry.key, 0, 1))}${fn:substring(entry.key, 1, fn:length(entry.key))}:</label>
										${entry.value}
									</div>
								</c:forEach>
							</div>
							<a class="btn btn-success" href="<c:url value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/palavras-chave" />">Alterar palavras-chave</a>
						</div>
					</c:if>
					

					<!-- ============================================================ -->



				</div>
				<!-- fim container -->


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