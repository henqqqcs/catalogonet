<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${tittle}-CatálogoNet| Guia Comercial Online do Distrito
	Federal</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="description" content="XXXXXXXX DESCRIPTION XXXXXXXX">
<meta name="keywords" content="YYYYYYY KEYWORDS YYYYYYYYYY">



<c:import
	url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/publico/css/swipe/photoswipe.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/publico/css/swipe/default-skin/default-skin.css" />">

<script type="text/javascript"
	src='<c:url value="/resources/publico/js/photoswipe.min.js" />'></script>
<script type="text/javascript"
	src='<c:url value="/resources/publico/js/photoswipe-ui-default.min.js" />'></script>


<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7b1K2j_emI8HuwUHd37RDp_vp7mZlHbc&signed_in=true&libraries=places&callback=initMap"
	async defer></script>

<script>
	var map;
	var infowindow;

	function initMap() {

		var existeLocalizacao = '${anuncio.mapLatitude}';

		var posicaoInicialMap;

		if (existeLocalizacao) {
			var latMString = '${anuncio.mapLatitude}';
			var lngMString = '${anuncio.mapLongitude}';

			var latM = +latMString;
			var lngM = +lngMString;
			posicaoInicialMap = {
				lat : latM,
				lng : lngM
			};
		} else {
			posicaoInicialMap = {
				lat : -15.793,
				lng : -47.883
			};
		}

		//cria o mapa
		map = new google.maps.Map(document.getElementById('map-canvas'), {
			center : posicaoInicialMap,
			zoom : 9
		});

		infowindow = new google.maps.InfoWindow();

		if (existeLocalizacao) {

			var marker = new google.maps.Marker({
				position : posicaoInicialMap,
				map : map,
				title : 'Hello askjhdskajdhkasjhdkjashkdjhasd!'
			});

		} else {

			var keywordsAnuncio = '${anuncio.titulo} ${anuncio.estado.nome} ${anuncio.cidade.nome} ${anuncio.bairro.nome}';
			var request = {
				location : posicaoInicialMap,
				radius : '150000',
				query : keywordsAnuncio
			};

			var service = new google.maps.places.PlacesService(map);
			service.textSearch(request, callback);

		}
	}

	function callback(results, status) {
		if (status === google.maps.places.PlacesServiceStatus.OK) {
			for (var i = 0; i < results.length; i++) {
				createMarker(results[i]);
			}
		}
	}

	function createMarker(place) {
		var placeLoc = place.geometry.location;
		var marker = new google.maps.Marker({
			map : map,
			position : place.geometry.location
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(place.name);
			infowindow.open(map, this);
		});
	}
</script>
</head>
<body>
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.5";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho-principal.jsp" />

	<!-- Cabeçalho principal -->
	<c:import url="/WEB-INF/views/template/publico/form-busca.jsp" />


	<style type="text/css">
html, body, #map-canvas {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>

	<!-- anuncio-view-pagina -->
	<div id="anuncio-view-pagina">

		<!-- container -->
		<div class="container">

			<!-- row principal-->
			<div class="row">

				<!-- col-md-10 col-md-offset-1 -->
				<div class="col-md-10 col-md-offset-1">

					<!-- row -->
					<div class="row row-eq-height">
						<!-- col-xs-12 col-sm-8 col-md-8 -->
						<div class="col-xs-12 col-sm-8 col-md-8 nopadding-right">
							<!-- anuncio-header-left -->
							<div class="anuncio-header-left">

								<div class="anuncio-view-wrapper">

									<!-- local-bussiness -->
									<div itemscope itemtype="http://schema.org/LocalBusiness">
										<c:if test="${not empty anuncio.logotipo}">
											<c:url var="logotipo"
												value="/servicos/imagens/logotipo/${anuncio.tituloNaUrl}/${anuncio.id}.jpg" />
											<div class="logotipo">
												<img src="${logotipo}" alt="${anuncio.titulo} logotipo"
													class="img-thumbnail">
											</div>

										</c:if>

										<h1>
											<span itemprop="name"><a
												href="<c:url value="/anuncio/${anuncio.tituloNaUrl}-${anuncio.subCategoria.nomeNaUrl}-${anuncio.bairro.nomeNaUrl}-${anuncio.cidade.nomeNaUrl}-${anuncio.estado.id}-${anuncio.id}"/>">${anuncio.titulo}</a></span>
										</h1>

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
													<link itemprop="mapType" href="http://schema.org/VenueMap" />
													<a class="btn-anuncio btn-none" itemprop="url"
													href="http://google.com">Como chegar <span
														class="glyphicon glyphicon-map-marker"></span></a>
												</span>
											</div>
											<!-- fim map button -->

										</div>
										<!-- fim buttons area -->

										<!-- links-bar-wrapper -->
										<div class="links-bar-wrapper">
											<ul>
												<li><a href="#saiba-mais-id">Saiba +</a></li>
												<c:if test="${not empty anuncio.site}">
													<li><a href="${anuncio.site}" target="_blank">Web Site</a></li>
												</c:if>
												<li><a href="#saiba-mais-id">Comentários</a></li>
											</ul>
										</div>
										<!-- fim links-bar-wrapper -->
									</div>
									<!-- fim local bussines -->

								</div>




							</div>
							<!-- fim anuncio-header-left -->

						</div>
						<!-- fim col-xs-12 col-sm-8 col-md-8 -->

						<!-- col-xs-12 col-sm-4 col-md-4 -->
						<div class="col-xs-12 col-sm-4 col-md-4 nopadding-left">

							<div class="anuncio-header-right">
								<div id="map-canvas"></div>
							</div>

						</div>
						<!-- fim col-xs-12 col-sm-4 col-md-4 -->

					</div>
					<!-- fim row -->

					<!-- row -->
					<div class="row">
						<!-- col-xs-12 col-sm-8 col-md-8 -->
						<div class="col-xs-12 col-sm-8 col-md-8 nopadding-right">

							<div class="anuncio-body-left">

								<div class="anuncio-view-wrapper">

									<div class="anuncio-info-item clear">
										<h3>
											<span class="glyphicon glyphicon-picture"></span> Fotos
										</h3>
										<hr>
									</div>





									<!-- anuncio-info-image-wrapper -->
									<div class="anuncio-info-image-wrapper">

										<div class="my-gallery" itemscope
											itemtype="http://schema.org/ImageGallery">

											<c:forEach items="${listaImagens}" var="imagem">
												<div class="anuncio-figure-wrapper">
													<c:url var="imagemHighResolution"
														value="/servicos/imagens/${anuncio.tituloNaUrl}/${imagem.id}.jpg" />
													<c:url var="imagemThumbnail"
														value="/servicos/imagens/thumbnail/${anuncio.tituloNaUrl}/${imagem.id}.jpg" />
													<figure itemprop="associatedMedia" itemscope
														itemtype="http://schema.org/ImageObject">
														<a href="${imagemHighResolution}" itemprop="contentUrl"
															data-size="1024x1024"> <img
															class="anuncio-img-thumbnail" src="${imagemThumbnail}"
															itemprop="thumbnail" alt="${anuncio.titulo} foto" />
														</a>
													</figure>
												</div>
											</c:forEach>
										</div>

										<!-- anuncio-info-image-wrapper -->
										<div id="saiba-mais-id" class="anuncio-info-image-wrapper">

											<div class="anuncio-figure-wrapper">
												<figure>
													<a href="">
														<div class="anuncio-img-thumbnail">
															<div class="anuncio-add-photo">
																Adicionar foto<br />
																<c:url var="cameraPng"
																	value="/resources/publico/imagens/img_camera_low.png" />
																<img src="${cameraPng}" />
															</div>
														</div>
													</a>
												</figure>
											</div>

										</div>
										<!-- fim anuncio-info-image-wrapper -->

									</div>
									<!-- fim anuncio-info-image-wrapper -->


									<div class="clear"></div>
									<div class="anuncio-info-item clear">
										<h3>
											<span class="glyphicon glyphicon-phone-alt"></span> Contato
										</h3>
										<hr>
										<div>
											<label>Telefone: </label>(61) 2343-2342
										</div>
										<c:if test="${not empty anuncio.telefone2}">
											<div>
												<label>Telefone 2: </label>${anuncio.telefone2}
											</div>
										</c:if>
										<c:if test="${not empty anuncio.email}">
											<div>
												<label>E-mail: </label>${anuncio.email}
											</div>
										</c:if>
										<c:if test="${not empty anuncio.site}">
											<div>
												<label>Site: </label><a href="${anuncio.site}" target="_blank">${anuncio.site}</a> 
											</div>
										</c:if>
										<c:if test="${not empty anuncio.facebook}">
											<div>
												<label>Facebook: </label><a href="${anuncio.facebook}" target="_blank">${anuncio.facebook}</a> 
											</div>
										</c:if>
										<c:if test="${not empty anuncio.twitter}">
											<div>
												<label>Twitter: </label>${anuncio.twitter}
											</div>
										</c:if>
									</div>

									<c:if test="${not empty anuncio.twitter}">
										<div class="anuncio-info-item">
											<h3>
												<span class="glyphicon glyphicon-plus"></span> Saiba Mais
											</h3>
											<hr>

											<div>${anuncio.descricao}</div>
										</div>
									</c:if>
									
									<div class="anuncio-info-item">
										<h3>
											<span id="comentarios-id" class="glyphicon glyphicon-comment"></span> Você
											conhece PIZZARIA PIZZA A BESSA?
										</h3>
										<small>Deixe seu comentário</small>
										<div class="anuncio-info-comments"><div class="fb-comments" data-href="http://developers.facebook.com/docs/plugins/comments/" data-numposts="3"></div></div>
									</div>


								</div>

							</div>

						</div>
						<!-- fim col-xs-12 col-sm-8 col-md-8 -->

						<!-- col-xs-12 col-sm-4 col-md-4 -->
						<div class="col-xs-12 col-sm-4 col-md-4 hidden-xs nopadding-left">

							<div class="anuncio-body-right">
								<!--                 <div class="anuncio-view-wrapper">
                  
                </div> -->
							</div>

						</div>
						<!-- fim col-xs-12 col-sm-4 col-md-4 -->

					</div>
					<!-- fim row -->









				</div>
				<!-- fim col-md-10 col-md-offset-1 -->

			</div>
			<!-- fim row principal -->

		</div>
		<!-- fim container -->

	</div>
	<!-- fim anuncio-view-pagina -->
















	<!-- image swipe -->
	<!-- Root element of PhotoSwipe. Must have class pswp. -->
	<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

		<!-- Background of PhotoSwipe. 
    It's a separate element as animating opacity is faster than rgba(). -->
		<div class="pswp__bg"></div>

		<!-- Slides wrapper with overflow:hidden. -->
		<div class="pswp__scroll-wrap">

			<!-- Container that holds slides. 
            PhotoSwipe keeps only 3 of them in the DOM to save memory.
            Don't modify these 3 pswp__item elements, data is added later on. -->
			<div class="pswp__container">
				<div class="pswp__item"></div>
				<div class="pswp__item"></div>
				<div class="pswp__item"></div>
			</div>

			<!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
			<div class="pswp__ui pswp__ui--hidden">

				<div class="pswp__top-bar">

					<!--  Controls are self-explanatory. Order can be changed. -->

					<div class="pswp__counter"></div>

					<button class="pswp__button pswp__button--close"
						title="Close (Esc)"></button>

					<button class="pswp__button pswp__button--share" title="Share"></button>

					<button class="pswp__button pswp__button--fs"
						title="Toggle fullscreen"></button>

					<button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

					<!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
					<!-- element will get class pswp__preloader--active when preloader is running -->
					<div class="pswp__preloader">
						<div class="pswp__preloader__icn">
							<div class="pswp__preloader__cut">
								<div class="pswp__preloader__donut"></div>
							</div>
						</div>
					</div>
				</div>

				<div
					class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
					<div class="pswp__share-tooltip"></div>
				</div>

				<button class="pswp__button pswp__button--arrow--left"
					title="Previous (arrow left)"></button>

				<button class="pswp__button pswp__button--arrow--right"
					title="Next (arrow right)"></button>

				<div class="pswp__caption">
					<div class="pswp__caption__center"></div>
				</div>

			</div>

		</div>

	</div>

	<script type="text/javascript">
		var initPhotoSwipeFromDOM = function(gallerySelector) {

			// parse slide data (url, title, size ...) from DOM elements 
			// (children of gallerySelector)
			var parseThumbnailElements = function(el) {
				var thumbElements = el.childNodes, numNodes = thumbElements.length, items = [], figureEl, linkEl, size, item;

				for (var i = 0; i < numNodes; i++) {

					figureEl = thumbElements[i]; // <figure> element

					// include only element nodes 
					if (figureEl.nodeType !== 1) {
						continue;
					}

					linkEl = figureEl.children[0]; // <a> element

					size = linkEl.getAttribute('data-size').split('x');

					// create slide object
					item = {
						src : linkEl.getAttribute('href'),
						w : parseInt(size[0], 10),
						h : parseInt(size[1], 10)
					};

					if (figureEl.children.length > 1) {
						// <figcaption> content
						item.title = figureEl.children[1].innerHTML;
					}

					if (linkEl.children.length > 0) {
						// <img> thumbnail element, retrieving thumbnail url
						item.msrc = linkEl.children[0].getAttribute('src');
					}

					item.el = figureEl; // save link to element for getThumbBoundsFn
					items.push(item);
				}

				return items;
			};

			// find nearest parent element
			var closest = function closest(el, fn) {
				return el && (fn(el) ? el : closest(el.parentNode, fn));
			};

			// triggers when user clicks on thumbnail
			var onThumbnailsClick = function(e) {
				e = e || window.event;
				e.preventDefault ? e.preventDefault() : e.returnValue = false;

				var eTarget = e.target || e.srcElement;

				// find root element of slide
				var clickedListItem = closest(
						eTarget,
						function(el) {
							return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
						});

				if (!clickedListItem) {
					return;
				}

				// find index of clicked item by looping through all child nodes
				// alternatively, you may define index via data- attribute
				var clickedGallery = clickedListItem.parentNode, childNodes = clickedListItem.parentNode.childNodes, numChildNodes = childNodes.length, nodeIndex = 0, index;

				for (var i = 0; i < numChildNodes; i++) {
					if (childNodes[i].nodeType !== 1) {
						continue;
					}

					if (childNodes[i] === clickedListItem) {
						index = nodeIndex;
						break;
					}
					nodeIndex++;
				}

				if (index >= 0) {
					// open PhotoSwipe if valid index found
					openPhotoSwipe(index, clickedGallery);
				}
				return false;
			};

			// parse picture index and gallery index from URL (#&pid=1&gid=2)
			var photoswipeParseHash = function() {
				var hash = window.location.hash.substring(1), params = {};

				if (hash.length < 5) {
					return params;
				}

				var vars = hash.split('&');
				for (var i = 0; i < vars.length; i++) {
					if (!vars[i]) {
						continue;
					}
					var pair = vars[i].split('=');
					if (pair.length < 2) {
						continue;
					}
					params[pair[0]] = pair[1];
				}

				if (params.gid) {
					params.gid = parseInt(params.gid, 10);
				}

				return params;
			};

			var openPhotoSwipe = function(index, galleryElement,
					disableAnimation, fromURL) {
				var pswpElement = document.querySelectorAll('.pswp')[0], gallery, options, items;

				items = parseThumbnailElements(galleryElement);

				// define options (if needed)
				options = {

					// define gallery index (for URL)
					galleryUID : galleryElement.getAttribute('data-pswp-uid'),

					getThumbBoundsFn : function(index) {
						// See Options -> getThumbBoundsFn section of documentation for more info
						var thumbnail = items[index].el
								.getElementsByTagName('img')[0], // find thumbnail
						pageYScroll = window.pageYOffset
								|| document.documentElement.scrollTop, rect = thumbnail
								.getBoundingClientRect();

						return {
							x : rect.left,
							y : rect.top + pageYScroll,
							w : rect.width
						};
					}

				};

				// PhotoSwipe opened from URL
				if (fromURL) {
					if (options.galleryPIDs) {
						// parse real index when custom PIDs are used 
						// http://photoswipe.com/documentation/faq.html#custom-pid-in-url
						for (var j = 0; j < items.length; j++) {
							if (items[j].pid == index) {
								options.index = j;
								break;
							}
						}
					} else {
						// in URL indexes start from 1
						options.index = parseInt(index, 10) - 1;
					}
				} else {
					options.index = parseInt(index, 10);
				}

				// exit if index not found
				if (isNaN(options.index)) {
					return;
				}

				if (disableAnimation) {
					options.showAnimationDuration = 0;
				}

				// Pass data to PhotoSwipe and initialize it
				gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default,
						items, options);
				gallery.init();
			};

			// loop through all gallery elements and bind events
			var galleryElements = document.querySelectorAll(gallerySelector);

			for (var i = 0, l = galleryElements.length; i < l; i++) {
				galleryElements[i].setAttribute('data-pswp-uid', i + 1);
				galleryElements[i].onclick = onThumbnailsClick;
			}

			// Parse URL and open gallery if it contains #&pid=3&gid=1
			var hashData = photoswipeParseHash();
			if (hashData.pid && hashData.gid) {
				openPhotoSwipe(hashData.pid, galleryElements[hashData.gid - 1],
						true, true);
			}
		};

		// execute above function
		initPhotoSwipeFromDOM('.my-gallery');
	</script>


	<!-- rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

</body>
</html>