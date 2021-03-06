<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${buscandoPorBuscaEmLocal}-Cat�logoNet|Guia Comercial
	Online do Distrito Federal</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="description" content="XXXXXXXX DESCRIPTION XXXXXXXX">
<meta name="keywords" content="YYYYYYY KEYWORDS YYYYYYYYYY">
<!-- dependencias -->
<c:import
	url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />


</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho-principal.jsp" />

	<!-- Cabe�alho principal -->
	<c:import url="/WEB-INF/views/template/publico/form-busca.jsp" />

	<!-- resultado-busca-wrapper -->
	<div id="resultado-busca-wrapper">

		<!-- container -->
		<div class="container">

			<!-- row -->
			<div class="row">

				<!-- col-md-10 col-md-offset-1 -->
				<div class="col-md-10 col-md-offset-1">

					<!-- resultado-info -->
					<div class="${cssId}">
						Buscando por
						<h1>${buscandoPorBuscaEmLocal}</h1>
						<br> <span class="resultado-mensagem">${mensagem}</span>
					</div>

					<!-- row2 -->
					<div class="row">


						<!-- <div class="col-md-8"> -->
						<div class="col-xs-12 col-sm-8 col-md-8">
							<!-- resultado-container-left -->
							<div class="resultado-container-left">
								<nav>
									<ul>
										<c:forEach items="${listaAnuncios}" var="anuncio">
											<li><c:choose>
													<c:when
														test="${(anuncio.prioridadeProduto == 0) || (anuncio.prioridadeProduto == 1)}">

														<!-- anuncio gratuito -->
														<div class="anuncio-wrapper anuncio-gratuito"
															onclick="javascript:location.href='<c:url value="/anuncio/${anuncio.tituloNaUrl}-${anuncio.subCategoria.nomeNaUrl}-${anuncio.bairro.nomeNaUrl}-${anuncio.cidade.nomeNaUrl}-${anuncio.estado.id}-${anuncio.id}"/>'">
															<div itemscope itemtype="http://schema.org/LocalBusiness">

																
																<c:if test="${not empty anuncio.logotipo}">
																<c:url var="logotipo"
																	value="/servicos/imagens/logotipo/${anuncio.tituloNaUrl}/${anuncio.id}.jpg" />
																<div class="logotipo">
																	<img src="${logotipo}" alt="${anuncio.titulo} logotipo" class="img-thumbnail">
																</div>
																
																</c:if>

																<h2>
																	<span itemprop="name"><a
																		href="<c:url value="/anuncio/${anuncio.tituloNaUrl}-${anuncio.subCategoria.nomeNaUrl}-${anuncio.bairro.nomeNaUrl}-${anuncio.cidade.nomeNaUrl}-${anuncio.estado.id}-${anuncio.id}"/>">${anuncio.titulo}</a></span>
																</h2>

																<div class="categoria">
																	Em <a
																		href="<c:url value="/busca/${anuncio.subCategoria.nomeNaUrl}" />">${anuncio.subCategoria.nome}</a>
																</div>
																<div class="address" itemprop="address" itemscope
																	itemtype="http://schema.org/PostalAddress">
																	<span itemprop="addressLocality">${anuncio.cidade.nome}</span>,
																	<span itemprop="addressRegion">${anuncio.estado.nome}</span>
																	<c:if test="${not empty anuncio.cep}"> | CEP: <span
																			itemprop="postalCode">${anuncio.cep}</span>
																	</c:if>
																	<br>
																	<c:if test="${not empty anuncio.bairro}">
																		<span class="district">${anuncio.bairro.nome}</span>
																		<c:if test="${not empty anuncio.endereco}">, <span
																				itemprop="streetAddress">${anuncio.endereco}</span>
																		</c:if>
																	</c:if>
																</div>
																<!-- butons area -->
																<div class="buttons-wrapper">
																	<!-- phone button -->
																	<div class="phone-wrapper">
																		<a class="btn-anuncio btn-phone"><span
																			itemprop="telephone">${anuncio.telefone1} </span><span
																			class="glyphicon glyphicon-earphone"></span></a>
																	</div>
																	<!-- fim phone button< -->

																	<!-- map button -->
																	<div class="map-wrapper">
																		<span itemscope itemprop="hasMap"
																			itemtype="http://schema.org/Map">
																			<link itemprop="mapType"
																				href="http://schema.org/VenueMap" /> <a
																			class="btn-anuncio btn-none" itemprop="url"
																			href="http://google.com">Como chegar <span
																				class="glyphicon glyphicon-map-marker"></span></a>
																		</span>
																	</div>
																	<!-- fim map button -->

																</div>
																<!-- fim buttons area -->
															</div>
														</div>
														<!-- fim anuncio gratuito -->

													</c:when>
													<c:when test="${anuncio.prioridadeProduto == 3}">

													</c:when>
													<c:when test="${anuncio.prioridadeProduto == 4}">


													</c:when>
												</c:choose></li>
										</c:forEach>
									</ul>
								</nav>
								<!-- fim nav -->

								<c:if test="${totalPages > 1}">
									<c:url var="prevUrl"
										value="/busca/${urlBusca}/pagina/${currentIndex - 1}/${BuscaID}" />
									<c:url var="nextUrl"
										value="/busca/${urlBusca}/pagina/${currentIndex + 1}/${BuscaID}" />

									<!-- pagination -->
									<div id="pagination-wrapper">
										<div class="resultado-pagination">
											<nav>
												<ul class="pagination pagination-md">
													<c:choose>
														<c:when test="${currentIndex == 1}">
														</c:when>
														<c:otherwise>
															<li><a href="${prevUrl}"><span
																	aria-hidden="true">&laquo; Anterior</span></a></li>
														</c:otherwise>
													</c:choose>
													<c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
														<c:url var="pageUrl"
															value="/busca/${urlBusca}/pagina/${i}/${BuscaID}" />
														<c:choose>
															<c:when test="${i == currentIndex}">
																<li class="active"><a href="${pageUrl}"><c:out
																			value="${i}" /></a></li>
															</c:when>
															<c:otherwise>
																<li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<c:choose>
														<c:when test="${currentIndex == totalPages}">
														</c:when>
														<c:otherwise>
															<li><a href="${nextUrl}"><span
																	aria-hidden="true">Pr�ximo &raquo;</span></a></li>
														</c:otherwise>
													</c:choose>
												</ul>
											</nav>

											<div class="clearfix"></div>
										</div>
									</div>
									<!-- fim pagination -->

								</c:if>
								<!-- fim pagination -->


								<!-- resultado-anuncie-aqui -->
								<div id="resultado-anuncie-aqui" class="well">
									<div class="row">
										<div class="col-sm-6">
											<div class="anuncie-aqui-texto">
												<p>Sentiu falta de alguma coisa?</p>
												<p class="texto-medio">
													<strong>Gostaria de ter sua empresa aqui?</strong>
												</p>
											</div>
										</div>
										<div class="col-sm-4 col-sm-offset-1">
											<a href="#" id="botao-anuncie" class="btn btn-black btn-lg">Anuncie
												Aqui</a>
										</div>
									</div>
								</div>
								<!-- fim resultado-anuncie-aqui -->

							</div>
							<!-- fim resultado-container-left -->


						</div>
						<!-- <div class="col-md-8"> -->

						<!-- resultado-container-right -->
						<div class="col-xs-4 col-md-4 hidden-xs">
							<div class="well">right</div>
						</div>
						<!-- fim resultado-container-right -->


					</div>
					<!-- fim row2 -->

				</div>
				<!-- fim col-md-10 col-md-offset-1 -->

			</div>
			<!-- fim row -->


		</div>
		<!-- fim container -->

	</div>
	<!-- fim resultado-busca-wrapper -->

	<!-- rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

</body>
</html>