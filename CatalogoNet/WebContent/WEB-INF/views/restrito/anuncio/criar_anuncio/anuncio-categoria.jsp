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



<c:url var="pegaCategorias" value="/servicos/lista-categorias" />
<script type="text/javascript">
	$(document).ready(function() {
				
				$.getJSON('${pegaCategorias}', {
					ajax : 'true'
				}, function(data) {
					var html = "";
					var len = data.length;
					for (var i = 0; i < len; i++) {
						html += '<option value="' + data[i].id + '">'
								+ data[i].nome + '</option>';
					}
					html += '</option>';
					$('#box-select-categoria').html(html);
				});
			});
</script>

<c:url var="pegaCidades" value="/servicos/lista-sub-categorias" />
 
<script type="text/javascript">
$(document).ready(function() { 
	$('#box-select-categoria').change(
		function() {
			$("#categoria-loading").show();
			$.getJSON('${pegaCidades}', { idCategoria : $(this).val(), ajax : 'true'}, function(data) {
				var html = "";
				var len = data.length;
				for ( var i = 0; i < len; i++) {
					html += '<option value="' + data[i].id + '">' + data[i].nome + '</option>';
				}
				html += '</option>';
				$('#box-select-sub-categoria').html(html);
				 $("#categoria-loading").hide();
			     $("#subcategoria-box").show();
			});
		});
});
</script>

</head>

<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />

<!-- container -->
<div class="container">
  
<!-- row -->
<div class="row">

  <div class="col-md-2"></div>

<!-- col-md-8 -->
<div class="col-md-8">

<h3><strong>Escolha uma categoria para o seu anúncio</strong></h3>
<hr/>

  <!-- row -->
  <div class="row">
  
  <!-- form -->
  <c:url var="categoria" value="/area-da-empresa/criar-anuncio/categoria-handle" />
  <form:form modelAttribute="anuncio" action="${categoria}" method="POST">
    


  <!-- col-md-4-1 -->
  <div class="col-md-6">
  <div class="categoria-box-select box-categoria">
    <form:select  id="box-select-categoria" path="categoria.id" title="Escolha uma categoria" size="20" required="required">
    </form:select>
    
  </div>
  </div>
  <!-- fim col-md-4-1 -->

  <!-- col-md-4-1 -->
  <div class="col-md-6">
  <div class="subcategoria-box-wrapper">
  	<c:url var="url" value="/resources/restrito/imagens/ajax-loader.gif"/>
    <img id="categoria-loading" src="${url}" style="display:none;">

    <div id="subcategoria-box" class="categoria-box-select box-sub" style="display:none;">
        <form:select id="box-select-sub-categoria" path="subCategoria.id" title="Escolha uma sub categoria" size="20" required="required">
      </form:select>
    </div>

  </div>


  </div>

  <!-- fim col-md-4-1 -->


    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="pull-right btn btn-primary">Próximo <span class="glyphicon glyphicon-triangle-right"></span></button>
      </div>
    </div>


  </form:form>
  <!-- fim form -->

  </div>
  <!--fim row  -->


</div>
<!-- fim col-md-8 -->

  <div class="col-md-2"></div>


</div>
<!-- fim row -->


</div>
<!-- fim container -->

	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />
</body>
</html>