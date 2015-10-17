<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Meus anúncios - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

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
								<li class="active">Meus anúncios</li>
							</ol>
						</div>
						<div class="col-md-12">
							<div class="painel-restrito-item item-anuncio-header">

								<div class="row">

									<div class="col-md-12">

										<div class="page-header">
											<h2>Meus anúncios</h2>
										</div>

										<div class="meus-anuncios-content">

											<ul>
												<c:forEach var="anuncio" items="${listaAnuncios}" varStatus="index">

													<li>
														<c:url var="urlAnuncio" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}" />
														<div class="meus-anuncios-wrapper" onclick="javascript:location.href='${urlAnuncio}'">

															<div itemscope itemtype="http://schema.org/LocalBusiness">

																<c:if test="${not empty anuncio.logotipo}">
																	<c:url var="logotipo"
																		value="/servicos/imagens/logotipo/${anuncio.tituloNaUrl}/${anuncio.id}.jpg" />
																	<div class="logotipo">
																		<img src="${logotipo}" alt="${anuncio.titulo} logotipo" class="img-thumbnail">
																	</div>

																</c:if>

																<h2>
																	<span itemprop="name"><a href="${urlAnuncio}">${anuncio.titulo}</a></span>
																</h2>

																<div class="categoria">
																	Em ${anuncio.subCategoria.nome}
																</div>
																<div class="address" itemprop="address" itemscope
																	itemtype="http://schema.org/PostalAddress">
																	<span itemprop="addressLocality">${anuncio.cidade.nome}</span>, <span
																		itemprop="addressRegion">${anuncio.estado.nome}</span>
																	<c:if test="${not empty anuncio.cep}"> | CEP: <span itemprop="postalCode">${anuncio.cep}</span>
																	</c:if>
																	<br>
																	<c:if test="${not empty anuncio.bairro}">
																		<span class="district">${anuncio.bairro.nome}</span>
																		<c:if test="${not empty anuncio.endereco}">, <span itemprop="streetAddress">${anuncio.endereco}</span>
																		</c:if>
																	</c:if>
																</div>
																<!-- butons area -->
																<div class="buttons-wrapper">
																	<!-- phone button -->
																	<div class="phone-wrapper">
																		<a class="btn-anuncio btn-phone"><span itemprop="telephone">${anuncio.telefone1}
																		</span><span class="glyphicon glyphicon-earphone"></span></a>
																	</div>
																	<!-- fim phone button< -->

																	<div class="botao-editar">
																		<a href="${urlAnuncio}" class="btn btn-success">Editar <span
																			class="glyphicon glyphicon-pencil"></span></a>
																	</div>
																</div>
																<!-- fim buttons area -->
															</div>

															<div class="clear"></div>

														</div>
													</li>

												</c:forEach>
											</ul>



										</div>


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