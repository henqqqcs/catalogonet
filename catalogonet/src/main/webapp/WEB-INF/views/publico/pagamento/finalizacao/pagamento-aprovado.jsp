<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<c:import url="/WEB-INF/views/template/publico/cabecalho_checkout.jsp" />

 	<!-- container -->
	<div class="container">

		<!-- row -->
		<div class="row">

			<div class="col-md-2"></div>

			<!-- col-md-8 -->
			<div class="col-md-8">
			
							     <!-- progress bar -->
			        <div class="progress-tracker">
			          <div class="text-center hidden-sm hidden-xs">
			            <ol class="progtrckr" data-progtrckr-steps="5">
			              <li class="progtrckr-done">Carrinho</li><!--
			              --><li class="progtrckr-done">Identificação</li><!--
			              --><li class="progtrckr-done">Pagamento</li><!--
			              --><li class="progtrckr-done">Finalização</li>
			            </ol>
			          </div>
			        </div>
			        <br/>
			        <!-- /progress bar --> 

				<h3><strong>Obrigado! O seu pagamento já foi aprovado!</strong></h3>
				<hr/>

				<div class="anuncio-criado-text">
					<p>Seu pedido para um ${pedido.produto.nomeCompleto} foi criado com sucesso, e estará disponível assim que o pagamento for aprovado.</p>
				</div>
				<div class="anuncio-criado-text">
					<p><strong>O número do seu pedido é #3423</strong></p>
					<p>Você pode acompanhar o andamento do seu pedido pela área da empresa.</p>
				</div>
				<div class="anuncio-criado-link">
					<a class="btn btn-black" href="">Meus Pedidos</a>
				</div>

				<hr/>
				<h4><strong>Já criou seu anúncio?</strong></h4>
				<div class="anuncio-criado-text">
					<p>Acesse a área da empresa e crie seu anúncio.</p>
				</div>

				<br/>
				<div class="anuncio-criado-link">
					<a class="btn btn-primary" href="">Criar anúncio</a>
				</div>
				<br/>

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

		<c:import url="/WEB-INF/views/template/publico/rodape_checkout.jsp" />
</body>
</html>