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


						<c:if test="${not empty errors}">
							<div class="alert alert-danger">Ops! Existem alguns erros no formulário. As
								palavras-chave devem ter no minimo 3 e no máximo 20 caracteres.</div>
						</c:if>
						<c:if test="${not empty success}">
							<div class="alert alert-success">Pronto! As informações foram atualizadas com sucesso!</div>
						</c:if>

						<h2>
							<strong>Palavras-chave</strong>
						</h2>
						<p>Adicione palavras-chave que se ralacionam com o seu anúncio para que ele seja
							encontrado mais facilmente.</p>
						<hr>

						<!-- inicio form -->
						<c:url var="url"
							value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/palavras-chave-handle" />
						<form:form modelAttribute="anuncioUpdate" id="anuncioForm" class="form-horizontal"
							action="${url}" method="POST">

							<c:choose>
								<c:when test="${not empty anuncio.tags}">
									<c:forEach var="tags" items="${anuncio.tags}" varStatus="index">
										<!-- form-group -->
										<div class="form-group">
											<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
											<div id="tags-input-wrapper" class="col-sm-10">
												<form:input type="text" class="form-control" path="tags[${index.index}]"
													id="tagInput${index.index}" />
												<form:errors path="tags[${index.index}]" cssStyle="color: red;" />
											</div>
										</div>
										<!-- /. form-group -->
									</c:forEach>


									<c:forEach var="i" begin="${fn:length(anuncio.tags)}" end="4">
										<!-- form-group -->
										<div class="form-group">
											<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
											<div id="tags-input-wrapper" class="col-sm-10">
												<form:input type="text" class="form-control" path="tags[${i}]" />
											</div>
										</div>
										<!-- /. form-group -->
									</c:forEach>

								</c:when>
								<c:otherwise>
									<!-- form-group -->
									<div class="form-group">
										<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
										<div id="tags-input-wrapper" class="col-sm-10">
											<form:input type="text" class="form-control" path="tags[0]" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
										<div id="tags-input-wrapper" class="col-sm-10">
											<form:input type="text" class="form-control" path="tags[1]" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
										<div id="tags-input-wrapper" class="col-sm-10">
											<form:input type="text" class="form-control" path="tags[2]" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
										<div id="tags-input-wrapper" class="col-sm-10">
											<form:input type="text" class="form-control" path="tags[3]" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
										<div id="tags-input-wrapper" class="col-sm-10">
											<form:input type="text" class="form-control" path="tags[4]" />
										</div>
									</div>
									<!-- /. form-group -->
								</c:otherwise>
							</c:choose>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button id="botaoContinuar" type="submit" class="pull-right btn btn-primary">
										Atualizar <span class="glyphicon glyphicon-triangle-right"></span>
									</button>
								</div>
							</div>
						</form:form>
						<!-- fim form -->




						<!-- ============================================================ -->


					</div>
					<!-- fim atualizar-anuncio -->

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