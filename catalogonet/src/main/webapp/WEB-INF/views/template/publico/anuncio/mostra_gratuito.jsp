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


		<div id="anuncio-gratuito-wrapper">
			<div class="anuncio">
				<h1 class="tituloAnuncio">${anuncio.titulo}</h1><br/>
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
				<a id="direction-link-como-chegar" target="_blank" href="http://maps.google.com/?q=${anuncio.estado.nome}+${anuncio.cidade.nome}+${anuncio.bairro.nome}+${anuncio.endereco}">
					<span id="directions-wrapper">
						<span class="directions-wrapper">Como chegar
							<c:url var="pathIcon" value="/resources/imgs/path-icon.gif" /> 
							<img src="${pathIcon}" alt="route icon" />
						</span>
					</span>
				</a>
							
			</div>
		</div>
		<div id="barraFerramentasGratuito">
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
		<div id="maisInfoGratuito">
			<p class="textoMeioMedio negrito"> Mais Informacoes </p> <br />
		
			
			<p class="negrito">Localização</p>
			<hr />
			
			<div class="imagemMapa">
				<c:url var="imagemMapaGoogle" value="/resources/imgs/google-maps-pic.gif" /> 
				<a class="textoMeioMedio" target="_blank" href="http://maps.google.com/?q=${anuncio.estado.nome}+${anuncio.cidade.nome}+${anuncio.bairro.nome}+${anuncio.endereco}"><img src="${imagemMapaGoogle}" alt="mapa google brasilia"/></a>
				<c:url var="mapicon" value="/resources/imgs/map-icon.gif" /> 
				<img class="iconeBarraFerramenta" src="${mapicon}"/><a class="textoMeioMedio" target="_blank" href="http://maps.google.com/?q=${anuncio.estado.nome}+${anuncio.cidade.nome}+${anuncio.bairro.nome}+${anuncio.endereco}">ver no mapa</a><br />
			</div>
			
			<br />
			<br />
			<span class="textoMeioMedio">Você conhece <span class="negrito">${anuncio.titulo}</span>?</span><br />
			<span class="textoPequeno">Deixe sua opnião</span>
			<br/>
			<br/>
		 	<div class="fb-comments" data-href="" data-width="600" data-numposts="5" data-colorscheme="light"></div>
			
					
		</div>
