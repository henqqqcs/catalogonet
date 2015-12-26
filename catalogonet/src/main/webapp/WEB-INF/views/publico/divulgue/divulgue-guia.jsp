<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  	<!-- dependencias -->
	<c:import url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/todos/css/catalogonet-bootstrap.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/todos/css/catalogonet-style-todos.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/publico/css/catalogonet-style-publico.css" />">
		
</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_checkout.jsp" />
	
	
<!-- divulgue-menu -->
<div class="divulgue-menu">

<ul>
	<li class="active">
		<!-- divulgue-menu-item -->
		<div class="divulgue-menu-item">
			<div class="divulgue-menu-icon">
				<img src="../../img/guia-comercial-map.gif">
			</div>
			<h3 class="divulgue-menu-tittle">Guia Comercial</h3>
		</div>
		<!-- fim divulgue-menu-item -->
	</li>

	<li>
		<!-- divulgue-menu-item -->
		<div class="divulgue-menu-item">
			<div class="divulgue-menu-icon">
				<img src="../../img/marketing-digital.gif">
			</div>
			<h3 class="divulgue-menu-tittle">Marketing Digital</h3>
		</div>
		<!-- fim divulgue-menu-item -->
	</li>

	<li>
		<!-- divulgue-menu-item -->
		<div class="divulgue-menu-item">
			<div class="divulgue-menu-icon">
				<img src="../../img/criacao-sites-icon.gif">
			</div>
			<h3 class="divulgue-menu-tittle">Criação de sites</h3>
		</div>
		<!-- fim divulgue-menu-item -->
	</li>
</ul>



</div>
<!-- fim divulgue-menu -->


	<!-- divulgue-wrapper -->
	<div class="divulgue-wrapper">
		<!-- row -->
		<div class="row">

			<!-- inicio container -->
			<div class="container">

				<!-- col-md-6 -->
				<div class="col-md-5">
					<h1 class="divulgue-anuncio-header">
						Anuncie o seu negócio na internet
					</h1>
					<p class="divulgue-anuncio-detalhe">Seus clientes conseguem te achar? Garanta sua presença na internet e atraia mais clientes para o seu negócio. Confira nossos planos!
					</p>
					<a class="btn btn-black" href="#tabela-plano">Confira os planos</a>
				</div>
				<!-- fim col-md-6 -->
				<!-- col-md-6 -->
				<div class="col-md-7">
					<div class="google-img-wrapper">
						<img src="../../img/google.gif">
					</div>
				</div>
				<!-- fim col-md-6 -->

			</div>
			<!-- fim container -->

		</div>
		<!-- fim row -->
	</div>
	<!-- fim divulgue-wrapper -->


		<!-- divulgue-wrapper -->
	<div class="divulgue-wrapper">
		<!-- row -->
		<div class="row row-gray-divulgue">

			<!-- inicio container -->
			<div class="container">

			<div class="col-md-12">
				<h2 class="divulgue-anuncio-tittle">Por que o Catálogo<span class="bold italic">Net</span>?</h2>
			</div>


			<!-- col-md-6 -->
			<div class="col-md-6">
				<h3 class="divulgue-anuncio-beneficios-header"><span class="glyphicon glyphicon-search"></span> Atraia mais clientes</h3>
				<p class="divulgue-anuncio-beneficios-detalhes">
					Se você deseja atrair novos visitantes para sua página na internet, aumentar suas vendas, receber mais ligações ou fazer com que seus clientes interajam mais com sua marca, o Google AdWords pode ajudar.
				</p>

				<h3 class="divulgue-anuncio-beneficios-header"><span class="glyphicon glyphicon-usd"></span> Publicidade de baixo custo</h3>
				<p class="divulgue-anuncio-beneficios-detalhes">
					Se você deseja atrair novos visitantes para sua página na internet, aumentar suas vendas, receber mais ligações ou fazer com que seus clientes interajam mais com sua marca, o Google AdWords pode ajudar.
				</p>
			</div>
			<!-- fim col-md-6 -->
			<!-- col-md-6 -->
			<div class="col-md-6">
				<h3 class="divulgue-anuncio-beneficios-header">
					<span class="glyphicon glyphicon-phone"></span>
					E-mail profissional e muito mais</h3>
					<p class="divulgue-anuncio-beneficios-detalhes">
						Faça com que sua empresa seja encontrada no Google quando potenciais clientes estiverem pesquisando sobre o que você oferece.
					</p>

					<h3 class="divulgue-anuncio-beneficios-header"><span class="glyphicon glyphicon-stats"></span> Atraia mais clientes</h3>
					<p class="divulgue-anuncio-beneficios-detalhes">
						Se você deseja atrair novos visitantes para sua página na internet, aumentar suas vendas, receber mais ligações ou fazer com que seus clientes interajam mais com sua marca, o Google AdWords pode ajudar.
					</p>
				</div>
				<!-- fim col-md-6 -->

			</div>
			<!-- fim container -->

		</div>
		<!-- fim row -->
	</div>
	<!-- fim divulgue-wrapper -->


	<!-- divulgue-wrapper -->
	<div class="divulgue-wrapper">
		<!-- row -->
		<div class="row">

			<!-- inicio container -->
			<div class="container">

				<!-- col-md-6 -->
				<div class="col-md-4 divulgue-imagens-icones">
					<img src="../../img/celular.gif">
					<h3>Sua empresa online</h3>
					<p>Estar online em qualquer tipo de dispositivo é alcançar pessoas que ainda não conhecem sua empresa.</p>
				</div>
				<!-- fim col-md-6 -->

				<!-- col-md-6 -->
				<div class="col-md-4 divulgue-imagens-icones">
					<img src="../../img/get-found.gif">
					<h3>Seja encontrado</h3>
					<p>Os seus clientes conseguem te achar? Coloque sua empresa no mapa.</p>
				</div>
				<!-- fim col-md-6 -->

				<!-- col-md-6 -->
				<div class="col-md-4 divulgue-imagens-icones">
					<img src="../../img/stats.gif">
					<h3>Gerencie seus anúncios</h3>
					<p>Acompanhe estatísticas e informações sobre seu anúncio pelo painel de controle do sistema.</p>
				</div>
				<!-- fim col-md-6 -->

			</div>
			<!-- fim container -->

		</div>
		<!-- fim row -->
	</div>
	<!-- fim divulgue-wrapper -->



























<div class="container-fluid">

<h3 id="tabela-plano" class="divulgue-anuncio-tabela-tittle text-center">Escolha o melhor plano para você e sua empresa</h3><hr>
<section class="signup-section">
<section class="payment-container">
    
      <div class="icon-payment"></div>
    
    <div class="payment-cards featuring-cards">
          
        <div class="payment-card infinity-plus-card">
        <div class="plain-period">Gratuito</div>
        <div class="plain-card-body">

          <div class="plain-responsive-price">
            <span>Grátis</span>
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
              <span class="glyphicon glyphicon-remove-sign"></span><!-- --><span>Até 10 fotos</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-remove-sign"></span><!-- --><span>Aparece nas buscas relacionadas</span>
            </li>
          </ul>
          <a class="btn-signup btn signup-paypal" href="<c:url value="/pagamento/carrinho?idProduto=1"/>" >Contratar</a>
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
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Até 10 fotos</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-remove-sign"></span><!-- --><span>Aparece nas buscas relacionadas</span>
            </li>
          </ul>
          <a class="btn btn-signup btn-featured" href="<c:url value="/pagamento/carrinho?idProduto=2"/>">contratar</a>
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
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Até 10 fotos</span>
            </li>
            <li class="">
              <span class="glyphicon glyphicon-ok-sign"></span><!-- --><span>Aparece nas buscas relacionadas</span>
            </li>
          </ul>
          <a class="btn-signup btn signup-paypal" href="<c:url value="/pagamento/carrinho?idProduto=3"/>" >contratar</a>
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








	<script type="text/javascript">
		$(function() {
			$('a[href*=#]:not([href=#])').click(function() {
				if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
					var target = $(this.hash);
					target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
					if (target.length) {
						$('html,body').animate({
							scrollTop: target.offset().top
						}, 1000);
						return false;
					}
				}
			});
		});	
	</script>

</body>
</html>