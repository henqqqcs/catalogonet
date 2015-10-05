<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- topo da pgina -->
<section id="topo-pagina">

	<!-- container -->
	<div class="container">

		<!-- logotipo -->
		<div id="logotipo">
			<a href="<c:url value="/" />">Catálogo<span class="logotipo-net">Net</span></a>
		</div>
		<!-- fim logotipo -->

		<!-- links direira -->
		<div id="topo-links-direita">
			<ul>
				<c:choose>
					<c:when test="${not empty pageContext.request.userPrincipal}">
						<c:url var="divulgue" value="/divulgue-seu-negocio"/>
						<li><a href="${divulgue}">Divulgue seu negócio</a></li>
						<c:url var="contato" value="/contato"/>
						<li><a href='${contato}'>Contato</a></li>
						<c:url var="minhaConta" value="/area-do-usuario"/>
						<li><a href='${minhaConta}'>Minha Conta</a></li>
						<c:url var="logout" value="/logout"/>
						<li><a href='${logout}'>Sair</a></li>
						
						
					</c:when>
					<c:otherwise>
						<c:url var="divulgue" value="/divulgue-seu-negocio"/>
						<li><a href="${divulgue}">Divulgue seu negócio</a></li>
						<c:url var="contato" value="/contato"/>
						<li><a href='${contato}'>Contato</a></li>
						<li><a href='<c:url value="/login" />'>Login / Cadastre-se</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- fim links direita -->

		<!-- mobile icon -->
		<div class="topo-mobile-icon">
			<a href="#" class="texto-grande"><span
				class="glyphicon glyphicon-list"></span></a>
		</div>
		<!-- mobile icon -->

		<div class="clear"></div>

	</div>
	<!-- fim container -->

</section>
<!-- fim topo -->