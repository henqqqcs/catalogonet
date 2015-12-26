<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>

<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />

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
              --><li class="progtrckr-done">Localização</li><!--
              --><li class="progtrckr-done">Palavras-chave</li><!--
              --><li class="progtrckr-done">Imagens</li><!-- 
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
	
	<c:if test="${not empty listaPlanos}">
	<h3 class="text-center"><strong>Identificamos que você já contratou um plano</strong></h3>
	<p class="text-center">Deseja aplicar alguns desses planos já contratados ao seu novo anúncio?</p>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			<table class="table table-hover">
		  		<tr>
		  			<th>Plano</th>
		  			<th>Status</th>
		  			<th>Data</th>
		  			<th>Aplicar</th>
		  		</tr>
		  		<c:forEach var="plano" items="${listaPlanos}" varStatus="status">
			  		<tr>
			  			<td>${plano.produto.nome }</td>
			  			<td>
			  			<c:choose>
			  				<c:when test="${plano.statusPlanoAnuncio == 'PLANO_PAGO_AGUARDANDO_APLICACAO'}">
			  					<span style="color:#009933;">Aguardando anúncio</span>
			  				</c:when>
			  				<c:when test="${plano.statusPlanoAnuncio == 'PLANO_TEMPORARIO'}">
			  					<span style="color:#FF9900;">Aguardando pagamento ou aprovação</span>
			  				</c:when>
			  			</c:choose>
			  			
			  			</td>
			  			<fmt:parseDate value="${plano.dataCriacao}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
			            <td><fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" /></td>
			  			<td>
			  				<c:url var="action"  value="/area-da-empresa/criar-anuncio/plano-existente-handle" />
			  				<form:form method="post" action="${action}">
			  				<button type="submit" name="idPlano" value="${plano.id}" class="btn btn-primary btn-sm">Aplicar no anúncio <span class="glyphicon glyphicon-play"></span></button>
			  				</form:form>
			  			</td>
			  		</tr>
		  		</c:forEach>
			</table>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="clear"></div>
	</c:if>

	<h3 class="text-center"><strong>Escolha um novo plano para o seu anúncio</strong></h3>
	<hr/>
	</div>
	<!-- fim row -->

</div>
<!-- fim container -->

<div class="container-fluid">

<section class="signup-section">
<section class="payment-container">
    
      <div class="icon-payment"></div>
    
    <div class="payment-cards featuring-cards">
          
        <div class="payment-card infinity-plus-card">
        <div class="plain-period">Gratuito</div>
        <div class="plain-card-body">

          <div class="plain-responsive-price">
            <span>12x de R$ 100 ou R$ 1.200 à vista</span>
          </div>

          <div class="plain-card-price">

            <div class="plain-times">
            </div><!--
            --><div class="plain-divided-price">Grátis</div>
            <div class="plain-total-price">Grátis</div>
          </div>

          <ul class="plain-product-info">
            <li class="plain-qty-exercises">
              <span>
                1x
              </span><!--
              --><span>Menor visibilidade</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Seu negócio online!</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Edição dos anúncios online</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Localização completa</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Google Maps link</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-remove-sign"></span><!-- --><span>Mais de 1 telefone</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-remove-sign"></span><!-- --><span>Logotipo da empresa</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-remove-sign"></span><!-- --><span>Até 5 fotos</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-remove-sign"></span><!-- --><span>Aparece nas buscas relacionadas</span>
            </li>
          </ul>
          <c:url var="pagamento"  value="/area-da-empresa/criar-anuncio/plano-novo-handle" />
          <a class="btn-signup btn signup-paypal" href="${pagamento}?idProduto=1" >Contratar</a>
        </div>
      </div>
      
      <div class="payment-card infinity-plus-card">
        <div class="plain-period">
          <p>Profissional</p>
          <span class="payment-banner"></span>
        </div>
        <div class="plain-card-body">

          <div class="plain-responsive-price">
            <span>12x de R$ 13 ou R$ 149,90 à vista</span>
          </div>

          <div class="plain-card-price">
            <div class="plain-times">
              <span>
                12x
              </span>
              </div><!--
            --><div class="plain-divided-price">R$ 8,50</div>
            <div class="plain-total-price">(valor à vista R$ 99,90)</div>
          </div>
          <ul class="plain-product-info">
            <li class="plain-qty-exercises">
              <span>
                3x
              </span><!--
              --><span>Mais visibilidade</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Seu negócio online!</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Edição dos anúncios online</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Localização completa</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Google Maps link</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Mais de 1 telefone</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Logotipo da empresa</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Até 5 fotos</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-remove-sign"></span><!-- --><span>Aparece nas buscas relacionadas</span>
            </li>
          </ul>
          <c:url var="pagamento"  value="/area-da-empresa/criar-anuncio/plano-novo-handle" />
          <a class="btn-signup btn signup-paypal" href="${pagamento}?idProduto=2" >Contratar</a>
        </div>
      </div>
      <div class="payment-card infinity-plus-card">
        <div class="plain-period">ULTIMATE</div>
        <div class="plain-card-body">

          <div class="plain-responsive-price">
            <span>12x de R$ 12,50 ou R$ 149,90 à vista</span>
          </div>

          <div class="plain-card-price">

            <div class="plain-times">
              <span>
                12x
              </span>
            </div><!--
            --><div class="plain-divided-price">R$ 12,50</div>
            <div class="plain-total-price">(valor à vista R$ 149,90)</div>
          </div>

          <ul class="plain-product-info">
            <li class="plain-qty-exercises">
              <span class="product-info-text">
                5x
              </span><!--
              --><span>Mais visibilidade</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Seu negócio online!</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Edição dos anúncios online</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Localização completa</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Google Maps link</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Mais de 1 telefone</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Logotipo da empresa</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Até 5 fotos</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Aparece nas buscas relacionadas</span>
            </li>
          </ul>
          <c:url var="pagamento"  value="/area-da-empresa/criar-anuncio/plano-novo-handle" />
          <a class="btn-signup btn signup-paypal" href="${pagamento}?idProduto=3" >Contratar</a>
        </div>
      </div>
      <div class="payment-card payment-card-responsive">
      
        <div class="plain-card-body">
          <div class="plain-responsive-price">
            <span>Todos os planos incluem</span>
          </div>

          <ul class="plain-product-info">

            <li class="full-access">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Seu negócio online!</span>
            </li>
            <li class="full-access">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Edição dos anúncios online</span>
            </li>
            <li class="certification">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Localização completa</span>
            </li>
            <li class="certification">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Google Maps link</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  </section>


  </div>
  <!-- container-fluid -->
  

	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />
</body>
</html>