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
              --><li class="progtrckr-done">Confirmar anúncio</li>
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

				<h3><strong>Obrigado! Estamos aguardando a confirmação do pagamento!</strong></h3>
				<hr/>

				<div class="anuncio-criado-text">
					<p>Seu anúncio foi criado com sucesso, e estará disponível assim que o pagamento for aprovado.</p>
				</div>

				<div class="anuncio-criado-text">
					<p>Para atualizar informações, gerenciar e ver estatísticas sobre seu anúncio clique no botão abaixo.</p>
				</div>

				<div class="anuncio-criado-link">
					<a class="btn btn-primary" href="">Meus Anúncios</a>
				</div>

				<div class="anuncio-criado-text">
					<p><strong>O número do seu pedido é #3423</strong></p>
					<p>Você pode acompanhar o andamento do seu pedido pela área da empresa.</p>
				</div>

				<div class="anuncio-criado-link">
					<a class="btn btn-black" href="">Meus Pedidos</a>
				</div>

				<div class="anuncio-criado-text">
					<p>Caso haja alguma dúvida entre em contato pelo e-mail  <strong>contato@catalogonet.com.br</strong></p>
				</div>

			</div>
			<!-- fim col-md8 -->

			<div class="col-md-2"></div>


		</div>
		<!-- fim row -->

	</div>
	<!-- fim container -->

  

	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />
</body>
</html>