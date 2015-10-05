<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="description" content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Minha Conta - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/restrito/arquivos-css-js.jsp" />


<script type="text/javascript" src='<c:url value="/resources/todos/js/bootstrapValidator.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/resources/todos/js/jquery.mask.min.js" />'></script>

  <script type="text/javascript"
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7b1K2j_emI8HuwUHd37RDp_vp7mZlHbc">
</script>


<c:url var="pegaBairros" value="/servicos/lista-bairros" />
<script type="text/javascript">
	$(document).ready(function() {
				
				$.getJSON('${pegaBairros}', {
					ajax : 'true'
				}, function(data) {
					var html = "<option value=''>-- Escolha o bairro --</option>";
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

</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />
	
  <style type="text/css">
    html, body, #map-canvas { height: 100%; margin: 0; padding: 0;}
  </style>

        <script>
            var map;
            var marker = null;

            function initialize() {

                var mapOptions = {
                  center: { lat: -15.793, lng: -47.883},
                  zoom: 11
                };

                map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

                
                google.maps.event.addListener(map, 'click', function(event) {


                    var inputLatitude = document.getElementById("map-latitude");
                    inputLatitude.value = event.latLng.lat();

                    var inputLongitude = document.getElementById("map-longitude");
                    inputLongitude.value = event.latLng.lng();

                    if (marker) { marker.setMap(null); }

                     marker = new google.maps.Marker({ position: event.latLng, map: map});

                });

            }  

            google.maps.event.addDomListener(window, 'load', initialize);
            
        </script>




<!-- container -->
<div class="container">

<!-- row-pgr-tracker -->
<div class="row">
  <div class="col-md-12">
            <!-- progress bar -->
        <div class="progress-tracker">
          <div class="text-center hidden-sm hidden-xs">
            <ol class="progtrckr" data-progtrckr-steps="5">
              <li class="progtrckr-done">Informações</li><!--
              --><li class="progtrckr-todo">Localização</li><!--
              --><li class="progtrckr-todo">Palavras-chave</li><!--
              --><li class="progtrckr-todo">Imagens</li><!-- 
              --><li class="progtrckr-todo">Confirmar anúncio</li>
            </ol>
          </div>
        </div>
        <!-- /progress bar --> 
  </div>
</div>
<!-- fim row pgr-tracker -->

  <!-- row -->
  <div class="row">

    <div class="col-md-2"></div>

    <!-- col-md-8 -->
    <div class="col-md-8">

      <h3><strong>Localização do seu negócio</strong></h3>
      <hr/>
      
      <c:if test="${not empty errors}">
		<div class="alert alert-danger">Ops! Existem alguns erros no formulário.</div>
	  </c:if>

      <!-- inicio form -->
      <c:url var="local" value="/area-da-empresa/criar-anuncio/localizacao-handle" />
	  <form:form id="anuncioForm" modelAttribute="anuncio" class="form-horizontal" action="${local}" method="POST">

        <!-- form-group -->
        <div class="form-group">
          <label for="estado" class="col-sm-2 control-label">Estado <span class="glyphicon glyphicon-asterisk"></span></label>
          <div class="col-sm-10">
            <form:select class="form-control" path="estado.id" readonly="true">
              <option value="DF" selected>Distrito Federal</option>
            </form:select>
            <form:errors path="estado" cssStyle="color: red;"/>
          </div>
        </div>
        <!-- /. form-group -->

        <!-- form-group -->
        <div class="form-group">
          <label for="estado" class="col-sm-2 control-label">Cidade <span class="glyphicon glyphicon-asterisk"></span></label>
          <div class="col-sm-10">
            <form:select class="form-control" path="cidade.id" readonly="true">
              <option value="1" selected>Brasília</option>
            </form:select>
           <form:errors path="cidade" cssStyle="color: red;"/>
          </div>
        </div>
        <!-- /. form-group -->

        <!-- form-group -->
        <div class="form-group">
          <label for="bairros" class="col-sm-2 control-label">Bairro <span class="glyphicon glyphicon-asterisk"></span></label>
          <div class="col-sm-10">
            <form:select id="bairros" path="bairro.id" class="form-control" title="Escolha um bairro">
            </form:select>
            <form:errors path="bairro" cssStyle="color: red;"/>
          </div>
        </div>
        <!-- /. form-group -->

        <!-- form-group -->
        <div class="form-group">
          <label for="endereco" class="col-sm-2 control-label">Endereço</label>
          <div class="col-sm-10">
            <form:input type="text" class="form-control" id="endereco" path="endereco" placeholder="Digite aqui seu endereço" />
            <form:errors path="endereco" cssStyle="color: red;"/>
          </div>
        </div>
        <!-- /. form-group -->

        <!-- form-group -->
        <div class="form-group">
          <label for="cep" class="col-sm-2 control-label">CEP</label>
          <div class="col-sm-10">
            <form:input type="text" class="form-control" id="cep" path="cep" placeholder="99999-999" />
            <form:errors path="cep" cssStyle="color: red;"/>
          </div>
        </div>
        <!-- /. form-group -->


        <h3><strong>Indique a localização no mapa</strong></h3> 
        <p>Clique no mapa para colocar um marcador.</p>
        <hr/>
        <div class="cria-anuncio-map-wrapper">
          <div id="map-canvas"></div>
        </div>

        <form:input type="hidden" class="form-control" path="mapLatitude" id="map-latitude" />
        <form:input type="hidden" class="form-control" path="mapLongitude" id="map-longitude" />


        <!-- form-group -->
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button id="botaoContinuar" type="submit" class="pull-right btn btn-primary">Próximo <span class="glyphicon glyphicon-triangle-right"></span></button>
          </div>
        </div>
        <!-- form-group -->

      </form:form>
      <!-- fim form -->


    </div>
    <!-- fim col-md-8 -->

    <div class="col-md-2"></div>


  </div>
  <!-- fim row -->


</div>
<!-- fim container -->


<!-- validate script 2 --> 
<script type="text/javascript">
$(document).ready(function() {
    $('#anuncioForm').bootstrapValidator({
        message: 'Esse valor não é válido.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            "bairros": {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    }
                }
            },
            endereco: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 50,
                        message: 'O endereço é muito pequeno.'
                    }
                }
            },
            cep: {
                validators: {
                    stringLength: {
                        min: 8,
                        max: 9,
                        message: 'Este cep é inválido.'
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
$(document).ready(function(){
  $('#cep').mask('00000-000');
});
</script> 
<!-- mask input -->
</body>
</html>