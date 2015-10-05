<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${tittle}- CatálogoNet | Guia Comercial Online do
	Distrito Federal</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="description" content="XXXXXXXX DESCRIPTION XXXXXXXX">
<meta name="keywords" content="YYYYYYY KEYWORDS YYYYYYYYYY">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style_global_responsive.css" /> ">
</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/publico/topo_pagina.jsp" />

	<!-- Cabeçalho principal -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_principal.jsp" />



	<!-- container-anuncio -->
	<div class="container container-anuncio">

		<!-- box-left -->
		<div class="anuncio-box-left">
	
			<!-- content-left -->
			<div class="anuncio-content-left <c:choose>
				<c:when test="${(anuncio.prioridade == 0) || (anuncio.prioridade == 1)}">
				<c:out value="anuncio-view-gratuito" />
				</c:when>
				<c:when test="${anuncio.prioridade == 3}">
				<c:out value="anuncio-view-profissional" />
				</c:when>
				<c:when test="${anuncio.prioridade == 4}">
				<c:out value="anuncio-view-ultimate" />
				</c:when>
				</c:choose>">

				<!-- anuncio header -->
				<div class="anuncio-header">
					<!-- itemscope -->
					<div itemscope itemtype="http://schema.org/LocalBusiness">

						<c:if test="${not empty anuncio.logotipo}">
							<c:url var="imagem" value="/imagens/${anuncio.id}/${anuncio.tituloNaUrl}" />
							<div class="logotipo">
								<img src="${imagem}.jpg" alt="${anuncio.titulo}"
									class="img-thumbnail">
							</div>
						</c:if>
						<h1>
							<span itemprop="name">${anuncio.titulo}</span>
						</h1>

						<div class="categoria">
							Em <a href="<c:url value="/busca/${anuncio.subCategoria.nomeNaUrl}" />">${anuncio.subCategoria.nome}</a>
						</div>
						<div class="address" itemprop="address" itemscope
							itemtype="http://schema.org/PostalAddress">
							<span itemprop="addressLocality">${anuncio.cidade.nome}</span>, 
							<span itemprop="addressRegion">${anuncio.estado.nome}</span><c:if test="${not empty anuncio.cep}"> | CEP: <span itemprop="postalCode">${anuncio.cep}</span></c:if><br>
					                  <c:if test="${not empty anuncio.bairro}"><span class="district">${anuncio.bairro.nome}</span><c:if test="${not empty anuncio.endereco}">, <span itemprop="streetAddress">${anuncio.endereco}</span></c:if></c:if>
						</div>
						<!-- butons area -->
						<div class="buttons-wrapper">
							<!-- phone button -->
							<div class="phone-wrapper">
								<a class="btn-anuncio btn-phone"><span itemprop="telephone">(61)
										9999-9999 </span><span class="glyphicon glyphicon-earphone"></span></a>
							</div>
							<!-- fim phone button< -->

							<!-- map button -->
							<div class="map-wrapper">
								<span itemscope itemprop="hasMap"
									itemtype="http://schema.org/Map">
									<link itemprop="mapType" href="http://schema.org/VenueMap" />
									<a class="btn-anuncio btn-none" itemprop="url"
									href="http://google.com" target="_blank">Como chegar <span
										class="glyphicon glyphicon-map-marker"></span></a>
								</span>
							</div>
							<!-- fim map button -->

						</div>
						<!-- fim buttons area -->

					</div>
					<!-- fim itemscope -->
				</div>
				<!-- fim anuncio header -->

				<!-- anuncio-social-bar -->
				<div class="anuncio-social-bar"></div>
				<!-- fim anuncio-social-bar -->

				<!-- anuncio-info -->
				<div class="anuncio-info clearfix">

					<div class="anuncio-info-item">
						<h3>
							<span class="glyphicon glyphicon-map-marker"></span> Localização
						</h3>
						<hr>
						<div class="anuncio-info-map-wrapper"></div>
					</div>

					<div class="anuncio-info-item">
						<h3>
							<span class="glyphicon glyphicon-phone-alt"></span> Contato
						</h3>
						<hr>
						<div>
							<label>Telefone 1:</label>(61) 2343-2342
						</div>
						<div>
							<label>Telefone 2:</label>(61) 2343-2342
						</div>
						<div>
							<label>Email:</label>contato@contato.com.br
						</div>
						<div>
							<label>Site:</label>http://www.exemplo.com.br
						</div>
						<div>
							<label>FaceBook:</label>contato@contato.com.br
						</div>
						<div>
							<label>Twitter:</label>twitter@contato.com.br
						</div>
						<div>
							<label>Google+:</label>contato@contato.com.br
						</div>
					</div>

					<div class="anuncio-info-item">
						<h3>
							<span class="glyphicon glyphicon-plus"></span> Saiba Mais
						</h3>
						<hr>
						Sed ut perspiciatis unde omnis iste natus error sit voluptatem
						accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
						quae ab illo inventore veritatis et quasi architecto beatae vitae
						dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit
						aspernatur aut odit aut fugit, sed quia consequuntur magni dolores
						eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam
						est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci
						velit, sed quia non numquam eius modi tempora incidunt ut labore
						et dolore magna
					</div>

					<div class="anuncio-info-item">
						<h3>
							<span class="glyphicon glyphicon-comment"></span> Você conhece
							PIZZARIA PIZZA A BESSA?
						</h3>
						<small>Deixe seu comentário</small>
						<div class="anuncio-info-comments"></div>
					</div>


				</div>
				<!-- fim anuncio-info -->



			</div>
			<!-- fim content-left -->
		</div>
		<!-- fim box-left -->

		<!-- anuncio-box-right -->
		<div class="anuncio-box-right">
			<!-- anuncio-content-left -->
			<div class="anuncio-content-right"></div>
			<!-- anuncio-content-left -->
		</div>
		<!-- fim anuncio-box-right -->

	</div>
	<!-- fim container-anuncio -->

	<!-- rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

</body>
</html>