<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />


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
									  <li role="presentation" class="active"><a href="${planoUrl}">Plano <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
											<c:url var="infoUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/informacoes"/>
									  <li role="presentation"><a href="${infoUrl}">Informações <span class="glyphicon glyphicon-info-sign"></span></a></li>
											<c:url var="localizacaoUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/localizacao"/>
									  <li role="presentation"><a href="${localizacaoUrl}">Localização <span class="glyphicon glyphicon-map-marker"></span></a></li>
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

								<div class="row">
									<div class="col-md-6">
										<p>
										<c:if test="${anuncio.ativo}">
											<strong><span style="color:#009900;">Ativado <span class="glyphicon glyphicon-ok"></span></span></strong>
										</c:if> 
										<c:if test="${!anuncio.ativo}">
											<strong><span style="color: #E60000;">Desativado <span class="glyphicon glyphicon-remove"></span></span></strong>
										</c:if>
										</p>
										
										
										<p>
											<label>Plano Contratado:</label> ${plano.produto.nome}
										</p>
										<p>
											<label>Status do plano: </label> ${plano.statusPlanoAnuncio}
										</p>
										<p>
											<label>Dias restantes: </label> ${plano.diasRestantes}
										</p>
									</div>
									<div class="col-md-6">
										<p>
											<strong>Contratar Planos</strong>
										</p>
										<p>
											<a class="btn btn-link" href="">Fazer Upgrade <span
												class="glyphicon glyphicon-play"></span></a>
										</p>
										<p>
											<a class="btn btn-link" href="">Renovar Plano Atual <span
												class="glyphicon glyphicon-play"></span></a>
										</p>

									</div>
								</div>


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

</body>
</html>