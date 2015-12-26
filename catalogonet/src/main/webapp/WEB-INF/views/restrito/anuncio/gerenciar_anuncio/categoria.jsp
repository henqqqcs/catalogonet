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
	<c:url var="pegaCategorias" value="/servicos/lista-categorias" />
	<script type="text/javascript">
		$(document).ready(
				function() {

					$.getJSON('${pegaCategorias}', {
						ajax : 'true'
					}, function(data) {
						var html = "";
						var len = data.length;
						for (var i = 0; i < len; i++) {
							html += '<option value="' + data[i].id + '">'
									+ data[i].nome + '</option>';
						}
						html += '</option>';
						$('#box-select-categoria').html(html);
					});
				});
	</script>

	<c:url var="pegaCidades" value="/servicos/lista-sub-categorias" />

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#box-select-categoria')
									.change(
											function() {
												$("#categoria-loading").show();
												$
														.getJSON(
																'${pegaCidades}',
																{
																	idCategoria : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = "";
																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		html += '<option value="' + data[i].id + '">'
																				+ data[i].nome
																				+ '</option>';
																	}
																	html += '</option>';
																	$(
																			'#box-select-sub-categoria')
																			.html(
																					html);
																	$(
																			"#categoria-loading")
																			.hide();
																	$(
																			"#subcategoria-box")
																			.show();
																});
											});
						});
	</script>


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
							<strong>Categoria</strong>
						</h2>
						<p>Escolha uma categoria e subcategoria para seu anúncio.</p>
						<hr>
						
						<div class="categoria-atual">
								<p><label>Categoria: </label> ${anuncioUpdate.categoria.nome }</p>
								<p><label>Subcategoria: </label> ${anuncioUpdate.subCategoria.nome }</p>
						</div>

						<!-- row -->
						<div class="row">

							<!-- form -->
							<c:url var="categoria"
								value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/categoria-handle" />
							<form:form modelAttribute="anuncioUpdate" action="${categoria}" method="POST">



								<!-- col-md-4-1 -->
								<div class="col-md-6">
									<div class="categoria-box-select box-categoria">
										<form:select id="box-select-categoria" path="categoria.id" title="Escolha uma categoria"
											size="20" required="required">
										</form:select>

									</div>
								</div>
								<!-- fim col-md-4-1 -->

								<!-- col-md-4-1 -->
								<div class="col-md-6">
									<div class="subcategoria-box-wrapper">
										<c:url var="url" value="/resources/restrito/imagens/ajax-loader.gif" />
										<img id="categoria-loading" src="${url}" style="display: none;">

										<div id="subcategoria-box" class="categoria-box-select box-sub" style="display: none;">
											<form:select id="box-select-sub-categoria" path="subCategoria.id"
												title="Escolha uma sub categoria" size="20" required="required">
											</form:select>
										</div>

									</div>


								</div>

								<!-- fim col-md-4-1 -->


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
						<!--fim row  -->



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