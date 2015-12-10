<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Minha Conta - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

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
								<li class="active">PIZZARIA</li>
							</ol>
						</div>
						<div class="col-md-12">
							<div class="painel-restrito-item item-anuncio-header">

								<div class="row">

									<div class="col-md-6">


										<c:if test="${empty anuncio.titulo}">
											<h2>SEM TÍTULO</h2>
										</c:if>
										<c:if test="${not empty anuncio.titulo}">
											<h2>${anuncio.titulo}</h2>
										</c:if>

										<c:if test="${not empty anuncio.cidade && not empty anuncio.estado}">
											<p>${anuncio.cidade.nome}, ${anuncio.estado.nome}</p>
										</c:if>
										<c:if test="${not empty anuncio.cidade && empty anuncio.estado}">
											<p>${anuncio.cidade.nome}</p>
										</c:if>
										<c:if test="${empty anuncio.cidade && not empty anuncio.estado}">
											<p>${anuncio.estado.nome}</p>
										</c:if>

										<c:if test="${empty anuncio.endereco}">
											<p>SEM ENDEREÇO</p>
										</c:if>
										<c:if test="${not empty anuncio.endereco}">
											<p>${anuncio.endereco}</p>
										</c:if>
										<c:if test="${empty anuncio.telefone1}">
											<p>(00) 0000-0000</p>
										</c:if>
										<c:if test="${not empty anuncio.telefone1}">
											<p>${anuncio.telefone1}</p>
										</c:if>

									</div>
									<div class="col-md-6">
										<div class="row">

											<div class="col-md-6">
												<p>
													<c:url var="publicarUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/publicar" />
													<form:form id="anuncioForm" modelAttribute="anuncio" action="${publicarUrl}" method="POST">
														<button class="btn btn-success btn-lg" type="submit" title="Publicar seu anúncio">Publicar</button>
													</form:form>
												</p>
												<p>
													<a href="#" class="btn btn-warning btn-lg" title="Visualizar anúncio">Visualizar</a>
												</p>
												<p>
													<a href="#" class="btn btn-info btn-lg" title="Clique aqui para editar seu anúncio passo a passo">Passo a passo</a>
												</p>




											</div>
											<div class="col-md-6">
															    <c:choose>
																	<c:when test="${plano.statusPlanoAnuncio == 'PLANO_ATIVO'}">
																		<div class="alert alert-success">
																			<p>
																				<strong>Status</strong> <br /> Ativado <span class="glyphicon glyphicon glyphicon-ok"></span>
																			</p>
						
																			<p>
																				<strong>Plano</strong> <br /> ${plano.produto.nome}
																			</p>
																			
																			<c:if test="${not empty plano.dataFinalizacao}">
																				<fmt:parseDate value="${plano.dataFinalizacao}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
																				<p>
																					<strong>Data finalização</strong> <br /> <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
																				</p>
																			</c:if>
																			<c:if test="${empty plano.dataFinalizacao}">
																				<p>
																					<strong>Data finalização</strong> <br /> N/A
																				</p>
																			</c:if>
																			
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="alert alert-danger">
																			<p>
																				<strong>Status</strong> <br /> Desativado <span class="glyphicon glyphicon glyphicon-remove"></span>
																			</p>
						
																			<p>
																				<strong>Plano</strong> <br /> ${plano.produto.nome}
																			</p>
																			
																			<c:if test="${not empty plano.dataFinalizacao}">
																				<fmt:parseDate value="${plano.dataFinalizacao}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
																				<p>
																					<strong>Data finalização</strong> <br /> <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
																				</p>
																			</c:if>
																			<c:if test="${empty plano.dataFinalizacao}">
																				<p>
																					<strong>Data finalização</strong> <br /> Não ativado
																				</p>
																			</c:if>
																		</div>					
																	</c:otherwise>
																</c:choose>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">

						<div class="col-md-6">
							<!-- 						<div class="painel-restrito-item item-estatisticas">
							<h2>Estatísticas</h2>
							<p>Veja aqui a quantidade de vizualizações do seu anúncio</p>
						</div> -->
							<div class="painel-restrito-item item-informacoes">
								<div class="pull-right">
									<a
										href="<c:url value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/informacoes" />">Editar</a>
								</div>

								<h2>Informações</h2>
								<p>Atualize as informações do seu anúncio</p>
								<br />
								<ul>
									<li class="row">
										<p class="col-xs-3 painel-item-label">Título</p>
										<p class="col-xs-9">${anuncio.titulo}</p>
									</li>
									<li class="row">
										<p class="col-xs-3 painel-item-label">Telefone</p>
										<p class="col-xs-9">${anuncio.telefone1}</p>
									</li>

									<li class="row">
										<p class="col-xs-3 painel-item-label">Telefone</p>
										<p class="col-xs-9">${anuncio.telefone2}</p>
									</li>
									<li class="row">
										<p class="col-xs-3 painel-item-label">Facebook</p>
										<p class="col-xs-9">${anuncio.facebook }</p>
									</li>
									<li class="row">
										<p class="col-xs-3 painel-item-label">Site</p>
										<p class="col-xs-9">${anuncio.site }</p>
									</li>
									<li class="row">
										<p class="col-xs-3 painel-item-label">E-mail</p>
										<p class="col-xs-9">${anuncio.email }</p>
									</li>
								</ul>
							</div>
							<div class="painel-restrito-item item-categorias">
								<div class="pull-right">
									<a
										href="<c:url value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/categoria" />">Editar</a>
								</div>
								<h2>Categoria</h2>
								<p>Altere a categoria do seu anúncio</p>
								<br />
								<ul>
									<li class="row">
										<p class="col-sm-5 painel-item-label">Categoria</p>
										<p class="col-sm-7">${anuncio.categoria.nome }</p>
									</li>
									<li class="row">
										<p class="col-sm-5 painel-item-label">Subcategoria</p>
										<p class="col-sm-7">${anuncio.subCategoria.nome }</p>
									</li>
								</ul>

							</div>
							<div class="painel-restrito-item item-palavras-chave">
								<div class="pull-right">
									<a
										href="<c:url value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/palavras-chave" />">Editar</a>
								</div>
								<h2>Palavras-chave</h2>
								<p>Atualize as palavras-chave de busca no sistema</p>
								<br />
								<ul>
									<li class="row">
										<p class="col-xs-5 painel-item-label">Palavra-chave</p>
										<p class="col-xs-7">${anuncio.tags[0]}</p>
									</li>
									<li class="row">
										<p class="col-xs-5 painel-item-label">Palavra-chave</p>
										<p class="col-xs-7">${anuncio.tags[1]}</p>
									</li>
									<li class="row">
										<p class="col-xs-5 painel-item-label">Palavra-chave</p>
										<p class="col-xs-7">${anuncio.tags[2]}</p>
									</li>
									<li class="row">
										<p class="col-xs-5 painel-item-label">Palavra-chave</p>
										<p class="col-xs-7">${anuncio.tags[3]}</p>
									</li>
									<li class="row">
										<p class="col-xs-5 painel-item-label">Palavra-chave</p>
										<p class="col-xs-7">${anuncio.tags[4]}</p>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-md-6">
							<div class="painel-restrito-item item-localizacao">
								<div class="pull-right">
									<a
										href="<c:url value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/localizacao" />">Editar</a>
								</div>
								<h2>Localização</h2>
								<p>Atualize a localização do seu anúncio</p>
								<br />
								<ul>
									<li class="row">
										<p class="col-xs-3 painel-item-label">Estado</p>
										<p class="col-xs-9">${anuncio.estado.nome}</p>
									</li>
									<li class="row">
										<p class="col-xs-3 painel-item-label">Cidade</p>
										<p class="col-xs-9">${anuncio.cidade.nome}</p>
									</li>

									<li class="row">
										<p class="col-xs-3 painel-item-label">Bairro</p>
										<p class="col-xs-9">${anuncio.bairro.nome}</p>
									</li>
									<li class="row">
										<p class="col-xs-3 painel-item-label">Endereço</p>
										<p class="col-xs-9">${anuncio.endereco}</p>
									</li>
									<li class="row">
										<p class="col-xs-3 painel-item-label">CEP</p>
										<p class="col-xs-9">${anuncio.cep}</p>
									</li>
									<li class="row">
										<p class="col-xs-3 painel-item-label">Mapa</p>
										<p class="col-xs-9">
											<a href="">Google maps</a>
										</p>
									</li>
								</ul>
							</div>
							<div class="painel-restrito-item item-imagens">
								<div class="pull-right">
									<a
										href="<c:url value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/imagens" />">Editar</a>
								</div>
								<h2>Imagens</h2>
								<p>Adicione imagens ao seu anúncio</p>
								<p>
									<strong>Logotipo</strong>
								</p>
								<c:import url="/servicos/imagens/logotipo/${anuncio.tituloNaUrl}/${anuncio.id}.jpg"
									var="imageData" />
								<c:if test="${imageData!=null && not empty imageData}">
									<img
										src="<c:url value="/servicos/imagens/logotipo/${anuncio.tituloNaUrl}/${anuncio.id}.jpg" />" />
								</c:if>
								<c:if test="${imageData != null && empty imageData}">
									<img class="thumbnail"
										src="<c:url value="/resources/publico/imagens/img_camera_low.png" />" />
								</c:if>
								<br />
								<p>
									<strong>Imagens</strong>
								</p>
								<ul>
									<c:forEach items="${listaImagens}" var="imagem">
										<li><img class="thumbnail"
											src="<c:url value="/servicos/imagens/thumbnail/${anuncio.tituloNaUrl}/${imagem.id}.jpg" />">
										</li>
									</c:forEach>
								</ul>

							</div>

						</div>

					</div>


				</div>


			</div>
			<!-- fim pagina-restrito-conteudo -->




		</div>
		<!-- fim content-wrapper -->

		<div class="clear"></div>
		<!-- Rodape -->
		<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	</div>
	<!-- fim wrapper -->



</body>
</html>