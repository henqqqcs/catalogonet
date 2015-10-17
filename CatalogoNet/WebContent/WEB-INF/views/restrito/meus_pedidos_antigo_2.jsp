<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div class="row">
			<div class="col-md-3">

	   	<!-- menu-esquerda -->
		<c:import url="/WEB-INF/views/template/restrito/menu-esquerda.jsp" />
		<!-- /menu-esquerda -->

			</div>

			<!-- conteudo -->
			<div class="col-md-9">

				<!--Breadcrumb -->
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Meus Pedidos</li>
				</ol>
				<!-- /breadcrumb -->

				<!-- meus pedidos -->
				<div class="criar-anuncio-form-publicacao">

					<!-- page header -->
					<div class="page-header">
						<h1>Meus Pedidos</h1>
					</div>
					<!-- /page-header -->

					<c:if test="${empty listaPedidos}">
						<!-- erro -->
						<div class="alert alert-danger" role="alert">
							<p class="textoMeioMedio">
								<strong>Você não tem nenhum pedido</strong>
							</p>
							<p>Clique no link abaixo para contratar um plano.</p>
							<p>
								<a href="<c:url value='/areaDaEmpresa/contratarPlano' />" class="btn btn-success">Contratar Plano</a>
							</p>
						</div>
						<!-- /erro -->
					</c:if>

					<c:if test="${not empty listaPedidos}">
						<!-- tabela pedidos -->
						<table class="table table-striped">
							<thead>
								<tr>
									<th>N° do Pedido</th>
									<th>Plano Contratado</th>
									<th>Valor</th>
									<th>Método de Pagamento</th>
									<th>Data</th>
									<th>Vencimento</th>
									<th>Status</th>
									<th>Pagar</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listaPedidos}" var="pedido">
									<tr>
										<td>${pedido.id}</td>
										<td>${pedido.produto.nome}</td>
										<td><fmt:formatNumber type="currency" value="${pedido.valor}" /></td>
										<td>
											<c:choose>
												<c:when test="${pedido.metodoPagamento == 'PAG_SEGURO'}">
													PagSeguro
												</c:when>
												<c:when test="${pedido.metodoPagamento == 'PAYPAL'}">
													PayPal
												</c:when>
											</c:choose>
										
										
										</td>
										
										<fmt:parseDate value="${pedido.dataInicio}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
										<td><fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" /></td>
										<fmt:parseDate value="${pedido.dataFinalizacao}" pattern="yyyy-MM-dd" var="parsedDateFinal" type="date" />
										<td><fmt:formatDate value="${parsedDateFinal}" pattern="dd/MM/yyyy" /></td>
										<td>
											<c:choose>
												<c:when test="${pedido.pedidoStatus == 'PAGO'}">
													<span style="color: #009933">Pago</span>
												</c:when>
												<c:when test="${pedido.pedidoStatus == 'AGUARDANDO_PAGAMENTO'}">
													<span style="color: #FF9900">Aguardando o pagamento</span>
												</c:when>
												<c:when test="${pedido.pedidoStatus == 'CANCELADO'}">
													<span style="color: #FF0000">Cancelado</span>
												</c:when>
												<c:when test="${pedido.pedidoStatus == 'EM_ANALISE'}">
													<span style="color: #FF0000">Cancelado</span>
												</c:when>
												<c:when test="${pedido.pedidoStatus == 'DEVOLVIDO'}">
													<span style="color: #000000">Cancelado</span>
												</c:when>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${pedido.pedidoStatus == 'AGUARDANDO_PAGAMENTO'}">
													<a class="btn btn-primary" href="#">Pagar <span class="glyphicon glyphicon-forward"></span></a>
												</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- /tabela-pedidos -->
					</c:if>


				</div>
				<!-- /meus pedidos -->

			</div>
			<!-- /conteudo -->

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

</body>
</html>