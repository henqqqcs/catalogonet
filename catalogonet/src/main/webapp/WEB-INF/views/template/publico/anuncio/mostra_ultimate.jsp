<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script>
$(document).ready(function() {
    //jquery
    $(location).attr('href');
    $(".fb-comments").attr("data-href", $(location).attr('href'))
});
</script>

					<div id="anuncio3-wrapper">
						<div id="anuncioUltimate">
							<c:if test="${not empty anuncio.logotipo}">
								<c:url var="imagem" value="/imagens/${anuncio.id}/${anuncio.tituloNaUrl}" />
								<img class="anuncioLogotipo" src="${imagem}.jpg" alt="${anuncio.titulo}" />
							</c:if>
							<h1 class="tituloAnuncio">${anuncio.titulo}</h1>
							<br/>
							<span class="anuncioCategoria"> Em <a href="<c:url value="/busca/${anuncio.subCategoria.nomeNaUrl}" />">${anuncio.subCategoria.nome}</a>	</span><br />
							
							<div class="anuncioLocalizacao">
								<p>${anuncio.cidade.nome}, ${anuncio.estado.nome} <c:if test="${not empty anuncio.cep}"> | CEP: ${anuncio.cep} </c:if> </p>
								<span>${anuncio.bairro.nome}, ${anuncio.endereco} <c:if test="${not empty anuncio.complemento}">${anuncio.complemento}</c:if></span>
							</div>
							<span id="phone-wrapper">
								<a href="tel:${anuncio.telefone1}">${anuncio.telefone1}</a>
								<c:url var="iconeTelefone" value="/resources/imgs/icone-telefone.png" /> 
								<img src="${iconeTelefone}" alt="icone telefone" />
							</span>
							<c:if test="${not empty anuncio.telefone2}">
								<span id="phone2-wrapper">
									<a href="tel:${anuncio.telefone2}">${anuncio.telefone2}</a>
									<c:url var="iconeTelefone" value="/resources/imgs/icone-telefone.png" /> 
									<img src="${iconeTelefone}" alt="icone telefone" />
								</span>
							</c:if>
							<a id="direction-link-como-chegar" target="_blank" href="http://maps.google.com/?q=${anuncio.estado.nome}+${anuncio.cidade.nome}+${anuncio.bairro.nome}+${anuncio.endereco}">
								<span id="directions-wrapper">
									<span class="directions-wrapper">Como chegar
										<c:url var="pathIcon" value="/resources/imgs/path-icon.gif" /> 
										<img src="${pathIcon}" alt="route icon" />
									</span>
								</span>
							</a>
						</div>
		
					<div id="barraFerramentasMostraUltimate">
						&nbsp;
						<div class="social-share esquerda">
							<c:choose>
								<c:when test="${not empty anuncio.facebook}">
									<div class="fb-like itemBarra" data-href="${anuncio.facebook}" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
								</c:when>
								<c:otherwise>
									<div class="fb-like itemBarra" data-href="https://www.facebook.com/GuiaCatalogoNet" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
								</c:otherwise>
							</c:choose>
							<span>
								<a href="https://twitter.com/share" class="twitter-share-button itemBarra" data-url="${requestScope['javax.servlet.forward.request_uri']}" >Tweet</a>
								<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
							</span>
						</div>
					</div>
				</div>
		<div id="maisInfoUltimate">
			<p class="textoMeioMedio negrito"> Mais Informa��es </p> <br />
		
			
			<p class="negrito">Localiza��o</p>
			<hr />
			
			<div class="imagemMapa">
				<c:url var="imagemMapaGoogle" value="/resources/imgs/google-maps-pic.gif" /> 
				<a class="textoMeioMedio" target="_blank" href="http://maps.google.com/?q=${anuncio.estado.nome}+${anuncio.cidade.nome}+${anuncio.bairro.nome}+${anuncio.endereco}"><img src="${imagemMapaGoogle}" alt="mapa google brasilia"/></a>
				<c:url var="mapicon" value="/resources/imgs/map-icon.gif" /> 
				<img class="iconeBarraFerramenta" src="${mapicon}"/><a class="textoMeioMedio" target="_blank" href="http://maps.google.com/?q=${anuncio.estado.nome}+${anuncio.cidade.nome}+${anuncio.bairro.nome}+${anuncio.endereco}">ver no mapa</a><br />
			</div>
			
			<br />
			<c:if test="${not empty anuncio.site}">
				<p class="negrito">Site</p>
				<p><a target="_blank" href="${anuncio.site}">${anuncio.site}</a></p>
			</c:if>
			
			<c:if test="${not empty anuncio.facebook}">
				<br />
				<p class="negrito">Facebook</p>
				<p><a target="_blank" href="${anuncio.facebook}">${anuncio.facebook}</a></p>
			</c:if>	
					
			<c:if test="${not empty anuncio.email}">
				<br />
				<p class="negrito">E-mail</p>
				<p>${anuncio.email}</p>
			</c:if>		
			
			<c:if test="${not empty anuncio.descricaoHtml}">
				<br />
				<div id="anuncioSaibaMais">
					<p class="textoPequeno negrito">Saiba Mais</p>
					<hr />
					<p>${anuncio.descricaoHtml}</p>
				</div>
			</c:if>
			
			<br />
			<br />
			<span class="textoMeioMedio">Voc� conhece <span class="negrito">${anuncio.titulo}</span>?</span><br />
			<span class="textoPequeno">Deixe sua opni�o</span>
			<br/>
			<br/>
		 	<div class="fb-comments" data-href="" data-width="600" data-numposts="5" data-colorscheme="light"></div>

			

		</div>