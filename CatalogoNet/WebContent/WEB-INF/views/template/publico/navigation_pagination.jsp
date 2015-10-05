<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${totalPages > 1}">
	<c:url var="firstUrl" value="/busca/${urlBusca}/pagina/${1}/${BuscaID}" />
	<c:url var="lastUrl" value="/busca/${urlBusca}/pagina/${totalPages}/${BuscaID}" />
	<c:url var="prevUrl" value="/busca/${urlBusca}/pagina/${currentIndex - 1}/${BuscaID}" />
	<c:url var="nextUrl" value="/busca/${urlBusca}/pagina/${currentIndex + 1}/${BuscaID}" />

	<div id="pagination">
		<ul class="pagination-block">

			
	            <c:choose>
					<c:when test="${currentIndex == 1}">
					</c:when>
					<c:otherwise>
	              		<li><a href="#"><span aria-hidden="true">&laquo; Anterior</span></a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
					<c:url var="pageUrl" value="/busca/${urlBusca}/pagina/${i}/${BuscaID}" />
					<c:choose>
						<c:when test="${i == currentIndex}">
							<li class="active"><a href="${pageUrl}"><c:out value="${i}" /></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${currentIndex == totalPages}">
					</c:when>
					<c:otherwise>
						<li><a href="${nextUrl}"><span aria-hidden="true">Próximo &raquo;</span></a></li>
					</c:otherwise>
				</c:choose>
            </ul>

<!-- ------------------------------------------------ -->
			<c:choose>
				<c:when test="${currentIndex == 1}">
				</c:when>
				<c:otherwise>
					<li><a href="${firstUrl}">&lt;&lt;</a></li>
					<li><a href="${prevUrl}">&lt;</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
				<c:url var="pageUrl" value="/busca/${urlBusca}/pagina/${i}/${BuscaID}" />
				<c:choose>
					<c:when test="${i == currentIndex}">
						<li><a class="ativo" href="${pageUrl}"><c:out value="${i}" /></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${currentIndex == totalPages}">
					<!-- 				<li class="disabled"><a href="#">&gt;</a></li> -->
					<!-- 				<li class="disabled"><a href="#">&gt;&gt;</a></li> -->
				</c:when>
				<c:otherwise>
					<li><a href="${nextUrl}">&gt;</a></li>
					<li><a href="${lastUrl}">&gt;&gt;</a></li>
				</c:otherwise>
			</c:choose>
	</div>
</c:if>
