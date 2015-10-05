<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Contratar Plano - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
<link rel="shortcut icon" href="<c:url value="/resources/imgs/favicon.gif" /> " type="image/ico" />

<link rel="stylesheet" href="<c:url value="/resources/css/reset.css" /> ">
<link rel="stylesheet" href="<c:url value="/resources/css/estilos.css" /> ">
<link rel="stylesheet" href="<c:url value="/resources/css/estilos_restrito.css" /> ">
<link rel="stylesheet" href="<c:url value="/resources/css/estilos_divulgue.css" /> ">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>

<c:url var="pegaAnunciosUsuario" value="/areaDaEmpresa/pegaAnunciosUsuario" />
<script>
    $(document).ready(function() {
        $('#showDetailsGratuito').click(function() {
            $('#infoGratuito').toggle();
            var visible = $('#infoGratuito').is(":visible");
if(visible){
  $('a',this).html('Menos detalhes');
}else{
    $('a',this).html('Mais detalhes');}
            
        });
    });
</script> 
<script>
    $(document).ready(function() {
        $('#showDetailsProfissional').click(function() {
            $('#infoProfissional').toggle();
            var visible = $('#infoProfissional').is(":visible");
if(visible){
  $('a',this).html('Menos detalhes');
}else{
    $('a',this).html('Mais detalhes');}
            
        });
    });
</script>   
<script>
    $(document).ready(function() {
        $('#showDetailsUltimate').click(function() {
            $('#infoUltimate').toggle();
            var visible = $('#infoUltimate').is(":visible");
if(visible){
  $('a',this).html('Menos detalhes');
}else{
    $('a',this).html('Mais detalhes');}
            
        });
    });
</script>    
</head>

<body>


	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/publico/topo_pagina.jsp" />

	<!-- Conteudo da pagina -->
	<section id="conteudoAlternativo"> 
	
		<div class="container">
	
			<div id="breadcrumb">
				<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" >
					 » 
					<a href="<c:url value="/areaDaEmpresa/home" />" itemprop="url" ><span itemprop="title">Home</span></a>
					 » Contratar Plano
				</div>
			</div>
			<!-- /breadcrumb -->
					<br />
					<p class="textoMedio negrito">Contratar Plano</p>
					<hr />
	
					<br />
					
					<c:if test="${empty listaAnunciosUsuario}">
						<p>Ops! Você ainda não tem nenhum anúncio.</p>
						<p>Nós precisamos que você crie seu anúncio primeiro, antes de contratar um plano.</p><br />
						<a class="botao" href="<c:url value="/areaDaEmpresa/novoAnuncioPasso1" />" >Criar um anúncio</a>
					</c:if>
					<c:if test="${not empty listaAnunciosUsuario}">
					<c:url var="pagamento" value="/areaDaEmpresa/pagamento" />
					<sf:form modelAttribute="pedido" action="${pagamento}" id="novoAnuncioForm">
		
					<p><span class="negrito">1° Passo:</span> Escolha para qual anúncio deseja contratar um plano.</p>
					<sf:select path="anuncio.id" items="${listaAnunciosUsuario}" class="inputBox"/>
					<br />
					
					<br />
					<p><span class="negrito">2° Passo:</span> Escolha seu plano.</p><br />
					
					    <!-- princing table -->
					    <div id="tabelaPlanos">
					    
					    	<div class="whole">
								<div class="type">
									<p>GRATUITO</p>
								</div>
								<div class="plan">
						
									<div class="header">
										<span>R$</span>00<sup>,00</sup>
										<p class="month">6 meses de teste</p>
										<p class="month">Aproveite!</p>
									</div>
									<div class="assineEspaco">
 										<button id="botaoAssinar" class="botaoAlteranativo" name="produto.id" type="submit" value="1">Assinar!</button><br />		 
										<span id="showDetailsGratuito" class="" style="text-decoration: underline">
											   <a class="fill-div maisDetalhes">Mais detalhes</a>
										</span>
									</div>
									<div id="infoGratuito" style="display:none">
								        <div class="content">
								          <ul>
								            <li>Pouca visibilidade</li>
								            <li>Menor prioridade na listagem de anúncios</li>
								            <li>Atualização do anúncio online!</li>
								            <li>
								            	<c:url var="iconefalso" value="/resources/imgs/false-icon.png" /> 
												<img src="${iconefalso}" alt="2342343" />
											</li>
								            <li>
								               	<c:url var="iconefalso" value="/resources/imgs/false-icon.png" /> 
												<img src="${iconefalso}" alt="2342343" />
								            </li>
								            <li>
								              	<c:url var="iconefalso" value="/resources/imgs/false-icon.png" /> 
												<img src="${iconefalso}" alt="2342343" />
								            </li>
								          </ul>
								        </div>
									</div>
								</div>
							</div>
							
							<div class="whole">
								<div class="type standard">
								<p>PROFISSIONAL</p>
								</div>
							<div class="plan">
						
								<div class="header">
									<span>R$</span>99<sup>,90</sup>
									<p class="month">por ano</p>
									<p class="month">Menos de 9 reais por mês!</p>
								</div>
									<div class="assineEspaco">
										<button id="botaoAssinar" class="botaoAlteranativo" name="produto.id" type="submit" value="3">Assinar!</button><br />
										
										<span id="showDetailsProfissional" class="" style="text-decoration: underline">
											   <a class="fill-div maisDetalhes">Mais detalhes</a>
										</span>
									</div>
									<div id="infoProfissional" style="display:none">
										<div class="content">
								          <ul>
								            <li class="negrito">Mais destaque em seu anúncio</li>
								            <li class="negrito">Prioridade na listagem de anúncios</li>
								            <li>Atualização do anúncio online!</li>
								            <li>Logotipo da sua empresa</li>
								            <li>
								              	<c:url var="iconefalso" value="/resources/imgs/false-icon.png" /> 
												<img src="${iconefalso}" alt="2342343" />
								            </li>
								            <li>
								                <c:url var="iconefalso" value="/resources/imgs/false-icon.png" /> 
												<img src="${iconefalso}" alt="2342343" />
								            </li>
								          </ul>
								        </div>
									</div>
						
							</div>
						</div>
						
							<div class="whole ">
								<div class="type ultimate">
								<p>ULTIMATE</p>
								</div>
							<div class="plan">
						
								<div class="header">
									<span>R$</span>149<sup>,90</sup>
									<p class="month">por ano</p>
									<p class="month">Apenas R$12,50 por mês!</p>
								</div>
									<div class="assineEspaco">
										<button id="botaoAssinar" class="botaoAlteranativo" name="produto.id" type="submit" value="4">Assinar!</button><br />
										
										<span id="showDetailsUltimate" class="" style="text-decoration: underline">
											   <a class="fill-div maisDetalhes">Mais detalhes</a>
										</span>
									</div>
									<div id="infoUltimate" style="display:none">
								        <div class="content">
								          <ul>
								            <li class="textoMeioMedio negrito">Maior destaque no anúncio</li>
								            <li class="negrito">Maior prioridade na listagem de anúncios</li>
								            <li>Atualização do anúncio online!</li>
								            <li>Logotipo da sua empresa</li>
								            <li>Compartilhamento em redes sociais</li>
								            <li>Link para seu site ou facebook</li>
								          </ul>
								        </div>
									</div>
							</div>
						</div>
					    
					    
					    </div>
					    <!-- /prcice table -->
					    
					    </sf:form>
					    
					    </c:if>
	
	
		</div>
		<!-- Fim do Container --> 
	
		<!-- checkout footer -->
	<br />
	<c:import url="/WEB-INF/views/template/publico/checkout_footer.jsp" />
	
	</section>

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	<!-- Sub-rodape -->
	<c:import url="/WEB-INF/views/template/publico/sub_rodape.jsp" />

</body>
</html>