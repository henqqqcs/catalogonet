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
<title>${anuncio.titulo} - Localização - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/restrito/arquivos-css-js.jsp" />


<c:url var="pegaBairros" value="/servicos/lista-bairros" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$
								.getJSON(
										'${pegaBairros}',
										{
											ajax : 'true'
										},
										function(data) {
											var html = "<option value='${anuncio.bairro.id}'>${anuncio.bairro.nome}</option>";
											var len = data.length;
											for (var i = 0; i < len; i++) {
												html += '<option value="' + data[i].id + '">'
														+ data[i].nome
														+ '</option>';
											}
											html += '</option>';
											$('#bairros').html(html);
										});
					});
</script>

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7b1K2j_emI8HuwUHd37RDp_vp7mZlHbc">
	
</script>
</head>
<body>
	<style type="text/css">
html, body, #map-canvas {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>

	<script>
		var map;
		var marker = null;
		
		function initialize() {
			
			var lat1 = '${anuncioUpdate.mapLatitude}';
			var lng2 = '${anuncioUpdate.mapLongitude}';
			var myLatLng = new google.maps.LatLng(lat1, lng2);

			var mapOptions = {
				center : {
					lat : -15.793,
					lng : -47.883
				},
				zoom : 11
			};

			map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions);
			
			var markerPosition = new google.maps.Marker({
			    position: myLatLng,
			    map: map,
			    title: 'Minha localização atual'
			  });

			google.maps.event.addListener(map, 'click', function(event) {

				var inputLatitude = document.getElementById("map-latitude");
				inputLatitude.value = event.latLng.lat();

				var inputLongitude = document.getElementById("map-longitude");
				inputLongitude.value = event.latLng.lng();

				
				markerPosition.setMap(null);
				
				if (marker) {
					marker.setMap(null);
				}

				marker = new google.maps.Marker({
					position : event.latLng,
					map : map
				});
				
			});

		}

		google.maps.event.addDomListener(window, 'load', initialize);
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
							<div class="alert alert-danger">Ops! Existem alguns erros no formulário.</div>
						</c:if>
						<h2>
							<strong>Localização do seu negócio</strong>
						</h2>
						<hr />

						<c:if test="${not empty errors}">
							<div class="alert alert-danger">Ops! Existem alguns erros no formulário.</div>
						</c:if>

						<!-- inicio form -->
						<c:url var="local"
							value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/localizacao-handle" />
						<form:form id="anuncioForm" modelAttribute="anuncioUpdate" class="form-horizontal" action="${local}"
							method="POST">

							<!-- form-group -->
							<div class="form-group">
								<label for="estado" class="col-sm-2 control-label">Estado <span
									class="glyphicon glyphicon-asterisk"></span>
								</label>
								<div class="col-sm-10">
									<form:select class="form-control" path="estado.id" readonly="true">
										<option value="DF" selected>Distrito Federal</option>
									</form:select>
									<form:errors path="estado" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<!-- form-group -->
							<div class="form-group">
								<label for="estado" class="col-sm-2 control-label">Cidade <span
									class="glyphicon glyphicon-asterisk"></span>
								</label>
								<div class="col-sm-10">
									<form:select class="form-control" path="cidade.id" readonly="true">
										<option value="1" selected>Brasília</option>
									</form:select>
									<form:errors path="cidade" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<!-- form-group -->
							<div class="form-group">
								<label for="bairros" class="col-sm-2 control-label">Bairro <span
									class="glyphicon glyphicon-asterisk"></span>
								</label>
								<div class="col-sm-10">
									<form:select id="bairros" path="bairro.id" class="form-control" title="Escolha um bairro">
										<option value="${anuncio.bairro.id}" selected>${anuncio.bairro.nome}</option>
									</form:select>
									<form:errors path="bairro" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<!-- form-group -->
							<div class="form-group">
								<label for="endereco" class="col-sm-2 control-label">Endereço</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="endereco" path="endereco"
										placeholder="Digite aqui seu endereço" />
									<form:errors path="endereco" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->

							<!-- form-group -->
							<div class="form-group">
								<label for="cep" class="col-sm-2 control-label">CEP</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control" id="cep" path="cep" placeholder="99999-999"
										value="${anuncio.cep}" />
									<form:errors path="cep" cssStyle="color: red;" />
								</div>
							</div>
							<!-- /. form-group -->


							<h3>
								<strong>Indique a localização no mapa</strong>
							</h3>
							<p>Clique no mapa para colocar um marcador.</p>
							<hr />
							<div class="cria-anuncio-map-wrapper">
								<div id="map-canvas"></div>
							</div>

							<form:input type="hidden" class="form-control" path="mapLatitude" id="map-latitude" />
							<form:input type="hidden" class="form-control" path="mapLongitude" id="map-longitude" />


							<!-- form-group -->
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button id="botaoContinuar" type="submit" class="pull-right btn btn-primary">
										Atualizar <span class="glyphicon glyphicon-triangle-right"></span>
									</button>
								</div>
							</div>
							<!-- form-group -->

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