<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Meus pedidos - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/restrito/arquivos-css-js.jsp" />

</head>
<body>



	<!-- wrapper -->
	<div id="wrapper">

		<!-- cabecalho -->
		<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />
		<!-- cabecalho -->

		<!-- content-wrapper -->
		<div id="content-restrito-wrapper">

			<div id="pagina-restrito-conteudo">

				<div class="container">
					<div class="menu-responsivo">
						<div class="toggle-menu">
							<span class="menu-mensagem">Menu</span>
							<div class="pull-right">
								<span class="glyphicon glyphicon-menu-hamburger"></span>
							</div>
						</div>
						<ul class="nav-responsivo nav-responsivo-horizontal">
							<li><a href="<c:url value="/area-da-empresa"/>">Resumo</a></li>
							<li><a href="<c:url value="/area-da-empresa/criar-anuncio/informacoes"/>">Criar
									anúncio</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-anuncios"/>">Meus anúncios</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-planos"/>">Meus planos</a></li>
							<li class="active"><a href="<c:url value="/area-da-empresa/meus-pedidos"/>">Meus pedidos</a></li>
						</ul>
						<div class="clear"></div>
					</div>
				</div>

				<script type="text/javascript">
					$(document).ready(function() {
						$(".toggle-menu").click(function() {
							$(".nav-responsivo").toggle(500);
						});
					});
				</script>


				<div class="container">

					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb breadcrumb-white">
								<li><a href="#">Home</a></li>
								<li class="active">Meus pedidos</li>
							</ol>
						</div>
						<div class="col-md-12">
							<div class="painel-restrito-item item-anuncio-header">

								<div class="row">

									<div class="col-md-12">

										<div class="page-header">
											<h2>Meus pedidos</h2>
										</div>


										<c:if test="${empty listaPedidos}">
											<!-- erro -->
											<div class="alert alert-danger" role="alert">
												<p class="textoMeioMedio">
													<strong>Você não tem nenhum pedido</strong>
												</p>
												<p>Clique no link abaixo para contratar um plano.</p>
												<p>
													<a href="<c:url value='/areaDaEmpresa/contratarPlano' />" class="btn btn-success">Contratar
														Plano</a>
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
															<td><c:choose>
																	<c:when test="${pedido.metodoPagamento == 'PAG_SEGURO'}">
													PagSeguro
												</c:when>
																	<c:when test="${pedido.metodoPagamento == 'PAYPAL'}">
													PayPal
												</c:when>
																</c:choose></td>

															<fmt:parseDate value="${pedido.dataInicio}" pattern="yyyy-MM-dd" var="parsedDate"
																type="date" />
															<td><fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" /></td>
															<fmt:parseDate value="${pedido.dataFinalizacao}" pattern="yyyy-MM-dd"
																var="parsedDateFinal" type="date" />
															<td><fmt:formatDate value="${parsedDateFinal}" pattern="dd/MM/yyyy" /></td>
															<td><c:choose>
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
																</c:choose></td>
															<td><c:choose>
																	<c:when test="${pedido.pedidoStatus == 'AGUARDANDO_PAGAMENTO'}">
																		<a class="btn btn-primary" href="#">Pagar <span
																			class="glyphicon glyphicon-forward"></span></a>
																	</c:when>
																</c:choose></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<!-- /tabela-pedidos -->
										</c:if>

									</div>

								</div>
							</div>
						</div>
					</div>

				</div>


			</div>
			<!-- fim pagina restrito conteudo -->



		</div>
		<!-- fim content-wrapper -->

		<div class="clear"></div>
		<!-- Rodape -->
		<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	</div>
	<!-- fim wrapper -->



</body>
</html>