<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>

<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />


	<!-- row-pgr-tracker -->
	<div class="row">
  		<div class="col-md-12">
        <!-- progress bar -->
        <div class="progress-tracker">
          <div class="text-center hidden-sm hidden-xs">
            <ol class="progtrckr" data-progtrckr-steps="5">
              <li class="progtrckr-done">Informações</li><!--
              --><li class="progtrckr-done">Localização</li><!--
              --><li class="progtrckr-done">Palavras-chave</li><!--
              --><li class="progtrckr-done">Imagens</li><!-- 
              --><li class="progtrckr-done">Confirmar anúncio</li>
            </ol>
          </div>
        </div>
        <!-- /progress bar --> 
  </div>
</div>
<!-- fim row pgr-tracker -->


  <h1>Anuncio pago</h1>

	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />
</body>
</html>