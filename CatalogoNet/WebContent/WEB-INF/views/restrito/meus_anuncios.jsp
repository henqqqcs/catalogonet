<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Minha Conta - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
<!-- dependencias -->
<c:import url="/WEB-INF/views/template/restrito/arquivos-css-js.jsp" />
</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />
	
  <!-- container -->
  <div class="container">


    <!-- row principal -->
    <div class="row">

      <!-- col-md-3 -->
      <div class="col-md-3">

		<!-- menu-esquerda -->
		<c:import url="/WEB-INF/views/template/restrito/menu-esquerda.jsp" />
		<!-- /menu-esquerda -->


      </div>
      <!-- ./ col-md-3 -->

      <!-- col-md-9 -->
      <div class="col-md-9">

        <!-- conteudo-pagina-restrito -->
        <div class="conteudo-pagina-restrito">

      	<!-- breadcrumb -->
      	<ol class="breadcrumb">
		  <li><a href="#">Home</a></li>
		  <li class="active">Meus Anúncios</li>
		</ol>
		<!-- fim breadvrumb -->

         <div class="page-header">
              <h2>Meus Anúncios</h2>
          </div>



<!--panel-group -->
 <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
 
 
 <c:forEach var="anuncio" items="${listaAnuncios}" varStatus="index">
  <!-- inicio panel-default -->
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">

        <a class="accordion-toggle" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${index.index}" aria-expanded="true" aria-controls="collapse${index.index}">
          ${anuncio.titulo}
        </a>
      </h4>
    </div>
    
    <c:choose>
    	<c:when test="${index.index == 0}">
    		<div id="collapse${index.index}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${index.index}">
    	</c:when>
    	<c:otherwise>
    		<div id="collapse${index.index}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${index.index}">
    	</c:otherwise>
    </c:choose>
      <div class="panel-body">

		<div class="row">
			<div class="col-md-6">
				<c:if test="${anuncio.ativo}">
					<strong><span style="color:#009900;">Ativado <span class="glyphicon glyphicon-ok"></span></span></strong>
				</c:if> 
				<c:if test="${!anuncio.ativo}">
					<strong><span style="color: #E60000;">Desativado <span class="glyphicon glyphicon-remove"></span></span></strong>
				</c:if>
				
				<c:choose>
					<c:when test="${(anuncio.prioridadeProduto == 0) || (anuncio.prioridadeProduto == 1)}">
						<p><label>Plano Contratado:</label> Plano Gratuito</p>
					</c:when>
					<c:when test="${anuncio.prioridadeProduto == 3}">
						<p><label>Plano Contratado:</label> Plano Profissional</p>
					</c:when>
					<c:when test="${anuncio.prioridadeProduto == 4}">
						<p><label>Plano Contratado:</label> Plano Ultimate</p>
					</c:when>
				</c:choose>
			</div>
			<div class="col-md-6">
				<p><strong>Editar informações do anúncio</strong></p>
				<c:url var="url" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}" />
				<p><a class="btn btn-black" href="${url}">Gerenciar <span class="glyphicon glyphicon-cog"></span></a></p>

			</div>
		</div>

      </div>
    </div>
    
  </div>
  <!-- fim panel-default -->
  </c:forEach>
  
</div>
<!-- fim panel-group -->

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

</body>
</html>