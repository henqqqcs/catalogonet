<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Minha Conta - CatálogoNet | Guia Comercial Online do
	Distrito Federal</title>
<!-- dependencias -->
<c:import url="/WEB-INF/views/template/restrito/arquivos-css-js.jsp" />

<script type="text/javascript"
	src='<c:url value="/resources/todos/js/bootstrapValidator.min.js" />'></script>
<script type="text/javascript"
	src='<c:url value="/resources/todos/js/jquery.mask.min.js" />'></script>
	

<c:url var="pegaBairros" value="/servicos/lista-bairros" />
<script type="text/javascript">
	$(document).ready(function() {
				
				$.getJSON('${pegaBairros}', {
					ajax : 'true'
				}, function(data) {
					var html = "<option value='${anuncio.bairro.id}'>${anuncio.bairro.nome}</option>";
					var len = data.length;
					for (var i = 0; i < len; i++) {
						html += '<option value="' + data[i].id + '">'
								+ data[i].nome + '</option>';
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

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />

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
			
			var lat1 = '${anuncio.mapLatitude}';
			var lng2 = '${anuncio.mapLongitude}';
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

	<!-- container -->
	<div class="container">
		<!-- row principal -->
		<div class="row">


			<!-- col-md-12 -->
			<div class="col-md-12">

				<!-- conteudo-pagina-restrito -->
				<div class="conteudo-pagina-restrito">

					<ol class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li><a href="#">Meus Anúncios</a></li>
						<li class="active">Bar do Alemão</li>
					</ol>


					<!-- row -->
					<div class="row">

						<!-- meus-anuncios-header -->
						<c:import
							url="/WEB-INF/views/template/restrito/meus-anuncios-header.jsp" />

					</div>
					<!-- fim row -->

					<!-- row -->
					<div class="row">

						<!-- meus-anuncios-body-estats -->
						<div class="meus-anuncios-body">

							<!-- tabs -->
							<div class="row">
								<div class="col-md-12">
									<ul class="nav nav-pills nav-justified">
										<c:url var="estats" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}"/>
									  <li role="presentation"><a href="${estats}">Estatísticas <span class="glyphicon glyphicon-stats"></span></a></li>
											<c:url var="planoUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/plano"/>
									  <li role="presentation"><a href="${planoUrl}">Plano <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
											<c:url var="infoUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/informacoes"/>
									  <li role="presentation"><a href="${infoUrl}">Informações <span class="glyphicon glyphicon-info-sign"></span></a></li>
											<c:url var="localizacaoUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/localizacao"/>
									  <li role="presentation" class="active"><a href="${localizacaoUrl}">Localização <span class="glyphicon glyphicon-map-marker"></span></a></li>
											<c:url var="categoriaUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/categoria"/>
									  <li role="presentation"><a href="${categoriaUrl}">Categoria <span class="glyphicon glyphicon-tag"></span></a></li>
											<c:url var="palavrasUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/palavras-chave"/>
									  <li role="presentation"><a href="${palavrasUrl}">Tags <span class="glyphicon glyphicon-search"></span></a></li>
											<c:url var="imagensUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/imagens"/>
									  <li role="presentation"><a href="${imagensUrl}">Imagens <span class="glyphicon glyphicon-camera"></span></a></li>
									</ul>
								</div>
							</div>
							<!-- fim tabs -->

							<!-- meus-anuncios-body-estats -->
							<div class="meus-anuncios-body-estats">
							
								<c:if test="${not empty errors}">
									<div class="alert alert-danger">Ops! Existem alguns erros no formulário.</div>
								</c:if>
								<c:if test="${not empty success}">
									<div class="alert alert-success">Pornto! As informações foram atualizadas com sucesso!</div>
								</c:if>

								<h3>
									<strong>Localização do seu negócio</strong>
								</h3>
								<hr />

								<c:if test="${not empty errors}">
									<div class="alert alert-danger">Ops! Existem alguns erros
										no formulário.</div>
								</c:if>

								<!-- inicio form -->
								<c:url var="local"
									value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/localizacao-handle" />
								<form:form id="anuncioForm" modelAttribute="anuncio"
									class="form-horizontal" action="${local}" method="POST">

									<!-- form-group -->
									<div class="form-group">
										<label for="estado" class="col-sm-2 control-label">Estado
											<span class="glyphicon glyphicon-asterisk"></span>
										</label>
										<div class="col-sm-10">
											<form:select class="form-control" path="estado.id"
												readonly="true">
												<option value="DF" selected>Distrito Federal</option>
											</form:select>
											<form:errors path="estado" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="estado" class="col-sm-2 control-label">Cidade
											<span class="glyphicon glyphicon-asterisk"></span>
										</label>
										<div class="col-sm-10">
											<form:select class="form-control" path="cidade.id"
												readonly="true">
												<option value="1" selected>Brasília</option>
											</form:select>
											<form:errors path="cidade" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="bairros" class="col-sm-2 control-label">Bairro
											<span class="glyphicon glyphicon-asterisk"></span>
										</label>
										<div class="col-sm-10">
											<form:select id="bairros" path="bairro.id"
												class="form-control" title="Escolha um bairro">
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
											<form:input type="text" class="form-control" id="endereco"
												path="endereco" placeholder="Digite aqui seu endereço" value="${anuncio.endereco}"/>
											<form:errors path="endereco" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="cep" class="col-sm-2 control-label">CEP</label>
										<div class="col-sm-10">
											<form:input type="text" class="form-control" id="cep"
												path="cep" placeholder="99999-999" value="${anuncio.cep}"/>
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

									<form:input type="hidden" class="form-control"
										path="mapLatitude" id="map-latitude" />
									<form:input type="hidden" class="form-control"
										path="mapLongitude" id="map-longitude" />


									<!-- form-group -->
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button id="botaoContinuar" type="submit"
												class="pull-right btn btn-primary">
												Atualizar <span class="glyphicon glyphicon-triangle-right"></span>
											</button>
										</div>
									</div>
									<!-- form-group -->

								</form:form>
								<!-- fim form -->


							</div>
							<!-- fim meus-anuncios-body-estats -->


						</div>
						<!-- fim meus-anuncios-body -->

					</div>
					<!-- fim row -->



				</div>
				<!-- /. conteudo-pagina-restrito -->



			</div>
			<!-- fim col-md-9a -->


		</div>
		<!-- fim row principal -->

	</div>
	<!-- fim container -->




	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />


	<!-- validate script 2 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#anuncioForm').bootstrapValidator({
				message : 'Esse valor não é válido.',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					"bairros" : {
						validators : {
							notEmpty : {
								message : 'Esse campo é obrigatório.'
							}
						}
					},
					endereco : {
						validators : {
							stringLength : {
								min : 5,
								max : 50,
								message : 'O endereço é muito pequeno.'
							}
						}
					},
					cep : {
						validators : {
							stringLength : {
								min : 8,
								max : 9,
								message : 'Este cep é inválido.'
							}
						}
					}

				}
			});

		});
	</script>
	<!-- validate script 2 -->

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />
	<!-- mask input -->
	<script>
		$(document).ready(function() {
			$('#cep').mask('00000-000');
		});
	</script>
	<!-- mask input -->
</body>
</html>