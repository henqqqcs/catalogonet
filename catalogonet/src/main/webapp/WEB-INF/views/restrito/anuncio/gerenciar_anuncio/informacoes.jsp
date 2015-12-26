<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>${anuncio.titulo} - Alterar informaçãoes - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

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

						<c:url var="atualizarAnuncio"
							value="/area-da-empresa/meus-anuncios/${anuncio.titulo}/${anuncio.id}/informacoes-handle" />
						<!-- ============================================================ -->


						<c:if test="${not empty errors}">
							<div class="alert alert-danger">Ops! Existem alguns erros no formulário.</div>
						</c:if>
						<c:if test="${not empty success}">
							<div class="alert alert-success">Pronto! As informações foram atualizadas com sucesso!</div>
						</c:if>

						<h3>
							<strong>Editar informações do anúncio</strong>
						</h3>
						<hr />

						<!-- inicio form -->
						<c:url var="info"
							value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/informacoes-handle" />
						<form:form id="anuncioForm" modelAttribute="anuncioUpdate" class="form-horizontal" action="${info}"
							method="POST">

							<!-- form-group -->
							<div class="form-group">
								<label for="titulo" class="col-sm-2 control-label">Título <span
									class="glyphicon glyphicon-asterisk"></span>
								</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="titulo" path="titulo"
										placeholder="Título do seu anúncio. Ex: PIZZARIA GORDEIXOS" />
									<form:errors path="titulo" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<!-- form-group -->
							<div class="form-group">
								<label for="descricao" class="col-sm-2 control-label">Descrição</label>
								<div class="col-sm-10">
									<form:textarea id="descricao" path="descricao" />
									<form:errors path="descricao" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->
							<h3>
								<strong>Contato</strong>
							</h3>
							<hr />

							<!-- form-group -->
							<div class="form-group">
								<label for="telefone1" class="col-sm-2 control-label">Telefone <span
									class="glyphicon glyphicon-asterisk"></span>
								</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="telefone1" path="telefone1"
										placeholder="(99) 9999-9999" />
									<form:errors path="telefone1" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<!-- form-group -->
							<div class="form-group">
								<label for="telefone2" class="col-sm-2 control-label">Telefone 2</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="telefone2" path="telefone2"
										placeholder="(99) 9999-9999" />
									<form:errors path="telefone2" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<hr />

							<!-- form-group -->
							<div class="form-group">
								<label for="site" class="col-sm-2 control-label">Site</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="site" path="site"
										placeholder="http://www.site.com.br" />
									<form:errors path="site" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->


							<!-- form-group -->
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">E-mail</label>
								<div class="col-sm-10">
									<form:input type="email" class="form-control" id="email" path="email"
										placeholder="email@email.com.br" />
									<form:errors path="email" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<!-- form-group -->
							<div class="form-group">
								<label for="facebook" class="col-sm-2 control-label">Facebook</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="facebook" path="facebook"
										placeholder="https://pt-br.facebook.com/seufacebook" />
									<form:errors path="facebook" cssStyle="color: red;" />
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