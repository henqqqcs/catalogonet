<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>${buscandoPorBuscaEmLocal} - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <meta name="description" content="XXXXXXXX DESCRIPTION XXXXXXXX">
  <meta name="keywords" content="YYYYYYY KEYWORDS YYYYYYYYYY">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/publico/css/style.css" /> ">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/publico/css/style_global_responsive.css" /> ">
</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/publico/topo_pagina.jsp" />

	<!-- Cabeçalho principal -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_principal.jsp" />
	
	
	   <!-- container-resultado -->
    <div class="container container-resultado-busca">

      <div id="info-resultado" class="${cssId}">
        Buscando por <h1>${buscandoPorBuscaEmLocal}</h1><br>
        <span class="resultado-mensagem">${mensagem}</span>
      </div>


      <!-- resultado-busca -->
      <div class="resultado-busca">

        <!-- box-left -->
        <div class="resultado-box-left">

          <!-- content-left -->
          <div class="resultado-content-left">


            <nav>
              <ul>
				<c:forEach items="${listaAnuncios}" var="anuncio">
	                <li>
	                	<c:choose>
					  		<c:when test="${(anuncio.prioridadeProduto == 0) || (anuncio.prioridadeProduto == 1)}">
					  		
					  		    <!-- anuncio gratuito -->
					            <div class="anuncio-wrapper anuncio-gratuito" onclick="javascript:location.href='<c:url value="/anuncio/${anuncio.tituloNaUrl}-${anuncio.subCategoria.nomeNaUrl}-${anuncio.bairro.nomeNaUrl}-${anuncio.cidade.nomeNaUrl}-${anuncio.estado.id}-${anuncio.id}"/>'">
					              <div itemscope itemtype="http://schema.org/LocalBusiness">
					           		
					           		<c:url var="logotipo" value="/servicos/imagens/thumbnail/876786"/>
					           		<div class="logotipo">
				                     <img src="${logotipo}" alt="..." class="img-thumbnail">
				                   </div>
				                   
					                <h2><span itemprop="name"><a href="<c:url value="/anuncio/${anuncio.tituloNaUrl}-${anuncio.subCategoria.nomeNaUrl}-${anuncio.bairro.nomeNaUrl}-${anuncio.cidade.nomeNaUrl}-${anuncio.estado.id}-${anuncio.id}"/>">${anuncio.titulo}</a></span></h2>
					
					                <div class="categoria">Em <a href="<c:url value="/busca/${anuncio.subCategoria.nomeNaUrl}" />">${anuncio.subCategoria.nome}</a></div>
					                <div class="address" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
					                  <span itemprop="addressLocality">${anuncio.cidade.nome}</span>,
					                  <span itemprop="addressRegion">${anuncio.estado.nome}</span><c:if test="${not empty anuncio.cep}"> | CEP: <span itemprop="postalCode">${anuncio.cep}</span></c:if><br>
					                  <c:if test="${not empty anuncio.bairro}"><span class="district">${anuncio.bairro.nome}</span><c:if test="${not empty anuncio.endereco}">, <span itemprop="streetAddress">${anuncio.endereco}</span></c:if></c:if>
					                </div>
					                <!-- butons area -->
					                <div class="buttons-wrapper">
					                  <!-- phone button -->
					                  <div class="phone-wrapper">
					                    <a class="btn-anuncio btn-phone"><span itemprop="telephone">${anuncio.telefone1} </span><span class="glyphicon glyphicon-earphone"></span></a>
					                  </div>
					                  <!-- fim phone button< -->
					
					                  <!-- map button -->
					                  <div class="map-wrapper">
					                    <span itemscope itemprop="hasMap" itemtype="http://schema.org/Map">
					                      <link itemprop="mapType" href="http://schema.org/VenueMap" />
					                      <a class="btn-anuncio btn-none" itemprop="url" href="http://google.com">Como chegar <span class="glyphicon glyphicon-map-marker"></span></a>
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
					  		
					  		    <!-- anuncio profissional -->
				                <div class="anuncio-wrapper anuncio-profissional" onclick="javascript:location.href='#'">
				                  <div itemscope itemtype="http://schema.org/LocalBusiness">
				
				                   <div class="logotipo">
				                     <img src="../../Imagens/logotipo.gif" alt="..." class="img-thumbnail">
				                   </div>
				                   <h2><span itemprop="name"><a href="#">PIZARRIA PIZZA A BESSA</a></span></h2>
				
				                   <div class="categoria">Em <a href="#">Pizzarias</a></div>
				                   <div class="address" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
				                    <span itemprop="addressLocality">Brasília</span>,
				                    <span itemprop="addressRegion">DF</span> | CEP: <span itemprop="postalCode">72110-800</span><br>
				                    <span class="district">Taguatinga</span>, <span itemprop="streetAddress">Quadra 15, bloco "c", loja 22</span>
				                  </div>
				                  <!-- butons area -->
				                  <div class="buttons-wrapper">
				                    <!-- phone button -->
				                    <div class="phone-wrapper">
				                      <a class="btn-anuncio btn-phone"><span itemprop="telephone">(61) 9999-9999 </span><span class="glyphicon glyphicon-earphone"></span></a>
				                    </div>
				                    <!-- fim phone button< -->
				
				                    <!-- map button -->
				                    <div class="map-wrapper">
				                      <span itemscope itemprop="hasMap" itemtype="http://schema.org/Map">
				                        <link itemprop="mapType" href="http://schema.org/VenueMap" />
				                        <a class="btn-anuncio btn-none" itemprop="url" href="http://google.com">Como chegar <span class="glyphicon glyphicon-map-marker"></span></a>
				                      </span>
				                    </div>
				                    <!-- fim map button -->
				
				                  </div>
				                  <!-- fim buttons area -->
				                </div>
				              </div>
				              <!-- fim anuncio profissional -->
              
					  		</c:when>
					  		<c:when test="${anuncio.prioridadeProduto == 4}">
					  		      <!-- anuncio ultimate -->
				                  <div class="anuncio-wrapper anuncio-ultimate" onclick="javascript:location.href='#'">
				                    <div itemscope itemtype="http://schema.org/LocalBusiness">
				
				                     <div class="logotipo">
				                       <img src="../../Imagens/logotipo.gif" alt="..." class="img-thumbnail">
				                     </div>
				                     <h2><span itemprop="name"><a href="#">PIZARRIA PIZZA A BESSA</a></span></h2>
				
				                     <div class="categoria">Em <a href="#">Pizzarias</a></div>
				                     <div class="address" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
				                      <span itemprop="addressLocality">Brasília</span>,
				                      <span itemprop="addressRegion">DF</span> | CEP: <span itemprop="postalCode">72110-800</span><br>
				                      <span class="district">Taguatinga</span>, <span itemprop="streetAddress">Quadra 15, bloco "c", loja 22</span>
				                    </div>
				                    <!-- butons area -->
				                    <div class="buttons-wrapper">
				                      <!-- phone button -->
				                      <div class="phone-wrapper">
				                        <a class="btn-anuncio btn-phone"><span itemprop="telephone">(61) 3547-1969 </span><span class="glyphicon glyphicon-earphone"></span></a>
				                      </div>
				                      <!-- fim phone button -->
				                      <!-- phone button -->
				                      <div  id="phone-dois" class="phone-wrapper">
				                        <a class="btn-anuncio btn-phone"><span itemprop="telephone">(61) 9999-9999 </span><span class="glyphicon glyphicon-earphone"></span></a>
				                      </div>
				                      <!-- fim phone button -->
				
				                      <!-- map button -->
				                      <div class="map-wrapper">
				                        <span itemscope itemprop="hasMap" itemtype="http://schema.org/Map">
				                          <link itemprop="mapType" href="http://schema.org/VenueMap" />
				                          <a class="btn-anuncio btn-none" itemprop="url" href="http://google.com">Como chegar <span class="glyphicon glyphicon-map-marker"></span></a>
				                        </span>
				                      </div>
				                      <!-- fim map button -->
				                    </div>
				                    <!-- fim buttons area -->
				
				                    <!-- ultimate bar -->
				                    <div class="anuncio-ultimate-bar">
				                      <!-- bar content -->
				                      <div class="bar-content">
				                        <span class="bar-item"><a href="#">Saiba <span class="glyphicon glyphicon-plus"></span></a></span>
				                        <span class="bar-item"><a href="#">Site <span class="glyphicon glyphicon-globe"></span></a></span>
				
				
				                      </div>
				                      <!-- fim bar content -->
				                    </div>
				                    <!-- fim ultimate bar -->
				                  </div>
				                </div>
				                <!-- fim anuncio ultimate -->
					  		</c:when>
					  	</c:choose>
					</li>
				</c:forEach>
     
        </ul>
      </nav>


<c:if test="${totalPages > 1}">
	<c:url var="prevUrl" value="/busca/${urlBusca}/pagina/${currentIndex - 1}/${BuscaID}" />
	<c:url var="nextUrl" value="/busca/${urlBusca}/pagina/${currentIndex + 1}/${BuscaID}" />
	
      <!-- pagination -->
      <div id="pagination-wrapper">
        <div class="resultado-pagination">
          <nav>
            <ul class="pagination pagination-md">
	            <c:choose>
					<c:when test="${currentIndex == 1}">
					</c:when>
					<c:otherwise>
	              		<li><a href="${prevUrl}"><span aria-hidden="true">&laquo; Anterior</span></a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
					<c:url var="pageUrl" value="/busca/${urlBusca}/pagina/${i}/${BuscaID}" />
					<c:choose>
						<c:when test="${i == currentIndex}">
							<li class="active"><a href="${pageUrl}"><c:out value="${i}" /></a></li>
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
						<li><a href="${nextUrl}"><span aria-hidden="true">Próximo &raquo;</span></a></li>
					</c:otherwise>
				</c:choose>
            </ul>
          </nav>

          <div class="clearfix"></div>
        </div>
      </div>
      <!-- fim pagination -->
      
      </c:if>

      <!-- resultado-anuncie-aqui -->
      <div id="resultado-anuncie-aqui" class="well">
        <div class="anuncie-aqui-texto">
          <p>Sentiu falta de alguma coisa?</p>
          <p class="texto-medio"><strong>Gostaria de ter sua empresa aqui?</strong></p>
        </div>
        <a href="#" id="botao-anuncie" class="btn btn-black btn-lg">Anuncie Aqui</a>
        <div class="clear"></div>
      </div>
      <!-- fim resultado-anuncie-aqui -->







    </div>
    <!-- fim content-left -->

  </div>
  <!-- fim box-left -->

  <!-- box-right -->
  <div class="resultado-box-right">

    <!-- content-right -->
    <div class="resultado-content-right">

    </div>
    <!-- fim content-right -->

  </div>
  <!-- fim box-right -->



</div>
<!-- fim resultado-busca -->

</div>
<!-- fim container-resultado -->
	
	<!-- rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />
	
</body>
</html>