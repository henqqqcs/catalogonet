<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div id="anuncio">

	<c:if test="${not empty anuncio.logotipo}">
		<c:url var="imagem" value="/imagens/${anuncio.id}/${anuncio.tituloNaUrl}" />

		<img class="logotipoEmpresa" src="${imagem}.jpg" alt="${anuncio.titulo}" />
	</c:if>

	<h2>
		<a class="textoGrande linkAnuncio" href="<c:url value="/${anuncio.categoria.nomeNaUrl}-${anuncio.tituloNaUrl}-${anuncio.cidade.nomeNaUrl}-${anuncio.estado.id}-${anuncio.id}"/>">${anuncio.titulo}</a>
	</h2>

	<br /> <span class="textoPequeno"> Em <a class="linkPequeno" href="<c:url value="/busca/${anuncio.categoria.nomeNaUrl}" />">${anuncio.categoria.nome}</a>
	</span>

	<div class="anuncioTelefone">
		<span>
		${anuncio.telefone1} 
		<c:url var="iconeTelefone" value="/resources/imgs/icone-telefone.png" /> 
		<img src="${iconeTelefone}" alt="icone telefone" />
		</span>
		
		
		<c:choose>
			<c:when test="${not empty anuncio.telefone2}">
				<br /> <span>
					${anuncio.telefone2} 	
					<c:url var="iconeTelefone" value="/resources/imgs/icone-telefone.png" /> 
					<img src="${iconeTelefone}" alt="icone telefone" />
					</span>
			</c:when>
			<c:otherwise>
				<p>&nbsp;</p>
			</c:otherwise>	
		</c:choose>
		
	</div>

	<span class="textoPequeno negrito">Endereço:</span>
	<p class="textoPequeno">${anuncio.cidade.nome}, ${anuncio.estado.nome} <c:if test="${not empty anuncio.cep}"> | CEP: ${anuncio.cep} </c:if> </p>
	<span class="textoPequeno">${anuncio.bairro.nome}, ${anuncio.endereco},${anuncio.complemento}</span>


	<!-- fim anuncio -->
</div>