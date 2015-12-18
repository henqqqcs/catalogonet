<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Minha Conta - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

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
							<li class="active"><a href="<c:url value="/area-da-empresa"/>">Resumo</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-anuncios"/>">Meus anúncios</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-planos"/>">Meus planos</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-pedidos"/>">Meus pedidos</a></li>
							<li><a href="<c:url value="/area-da-empresa/meus-dados/perfil"/>">Perfil</a></li>
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

						<div class="col-md-6">
							<div class="painel-restrito-item item-meus-planos">
								<h2>Meus planos</h2>
								<p>Meus planos e produtos contratados</p>
								<br />
								<c:if test="${not empty listaPlano}">
									<div class="table-responsive">
										<table class="table table-condensed table-hover">
																						<tr>
																							<th>Produto</th>
																							<th>Status</th>
																							<th class="text-right">Detalhes</th>
																						</tr>
											<c:forEach items="${listaPlano}" var="plano">
												<tr>
													<td>${plano.nomePlano}</td>
														<c:choose>
															<c:when test="${plano.status == 'AGUARDANDO_CRIACAO_ANUNCIO'}">
																<td>
																	Desativado <span class="glyphicon glyphicon-remove" style="color: #FF0000"></span>
																</td>
																<td class="text-right">
																	<a class="btn btn-success btn-sm" href="<c:url value="/area-da-empresa/meus-planos/comecar-plano/${plano.id}"/>">Comece
																	agora!</a>
																</td>
															</c:when>
															<c:when test="${plano.status == 'AGUARDANDO_PUBLICACAO'}">
																<td>
																	Aguardando publicação do anúncio
																</td>
																<td class="text-right">
																	<a href="<c:url value="/area-da-empresa/meus-anuncios/${plano.anuncio.tituloNaUrl}/${plano.anuncio.id}"/>">${plano.anuncio.titulo}</a>
																</td>
															</c:when>
															<c:when test="${plano.status == 'ATIVO'}">
																<td>
																	Ativado <span class="glyphicon glyphicon-ok" style="color: #00CC00"></span>
																</td>
																<td class="text-right">
																	<a href="<c:url value="/area-da-empresa/meus-anuncios/${plano.anuncio.tituloNaUrl}/${plano.anuncio.id}"/>">${plano.anuncio.titulo}</a>
																</td>
															</c:when>
															<c:when test="${plano.status == 'AGREGADO'}">
																<td>
																	Renovação
																</td>
																<td class="text-right">
																</td>
															</c:when>
															<c:when test="${plano.status == 'SUSPENSO'}">
																<td>
																	Desativado <span class="glyphicon glyphicon-remove" style="color: #FF0000"></span>
																</td>
																<td class="text-right">
																	<a href="<c:url value="/area-da-empresa/meus-anuncios/${plano.anuncio.tituloNaUrl}/${plano.anuncio.id}"/>">${plano.anuncio.titulo}</a>
																</td>
															</c:when>
															<c:when test="${plano.status == 'FINALIZADO'}">
																<td>
																	Finalizado <span class="glyphicon glyphicon-remove" style="color: #FF0000"></span>
																</td>
																<td class="text-right">
																	<a href="<c:url value="/area-da-empresa/meus-anuncios/${plano.anuncio.tituloNaUrl}/${plano.anuncio.id}"/>">${plano.anuncio.titulo}</a>
																</td>
															</c:when>
														</c:choose>
												</tr>
											</c:forEach>
										</table>
									</div>
									<p class="text-center">
										<a href="<c:url value="/area-da-empresa/meus-planos"/>">Exibir todos</a>
									</p>
								</c:if>
								<c:if test="${empty listaPlano}">
									<p>Você ainda não contratou nenhum plano</p>
									<p>
										<a href="<c:url value="/divulgue-seu-negocio"/>" class="btn btn-black btn-lg">Contratar plano</a>
									</p>
								</c:if>

							</div>
							<div class="painel-restrito-item item-meus-pedidos">
								<h2>Meus pedidos</h2>
								<p>Últimos pedidos realizados em nossa loja</p>
								<br />
								<c:if test="${not empty listaPedidos}">
									<div class="table-responsive">
										<table class="table table-condensed table-hover">

											<tr>
												<th>Produto</th>
												<th>Status</th>
												<th class="text-right">Detalhes</th>
											</tr>
											<c:forEach items="${listaPedidos}" var="pedido">
												<tr>
													<td>${pedido.produto.nome}</td>
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
													<td class="text-right"><a href="">Detalhes</a></td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<p class="text-center">
										<a href="<c:url value="/area-da-empresa/meus-pedidos"/>">Exibir todos</a>
									</p>
								</c:if>
								<c:if test="${empty listaPedidos}">
									<p>Você ainda não tem nehum pedido</p>
								</c:if>
							</div>
						</div>
						<div class="col-md-6">
							<div class="painel-restrito-item item-meus-anuncios">
								<h2>Meus anúncios</h2>

								<c:if test="${not empty listaAnuncios}">
									<p>Gerencie seus anúncios</p>
									<br />
									<div class="table-responsive">
										<table class="table table-condensed table-hover">

											<c:forEach var="anuncio" items="${listaAnuncios}" varStatus="index">
												<tr>
													<td>${anuncio.titulo}</td>
													<c:url var="urlAnuncioEditar"
														value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}" />
													<td class="text-right"><a href="${urlAnuncioEditar}">Editar</a></td>
												</tr>
											</c:forEach>

										</table>
									</div>

									<p class="text-center">
										<a href="<c:url value="/area-da-empresa/meus-anuncios"/>">Exibir todos</a>
									</p>
								</c:if>
								<c:if test="${empty listaAnuncios}">
									<p>Você ainda não criou nenhum anúncio</p>
									<p>
										<a href="">Criar anúncio</a>
									</p>
								</c:if>

							</div>
							<div class="painel-restrito-item item-meus-dados">
								<div class="pull-right">
									<a href="<c:url value="/area-da-empresa/meus-dados/alterar-perfil"/>">Editar</a>
								</div>
								<h2>Perfil</h2>
								<p>Atualize seus dados de cadastro</p>
								<p>
									${usuario.nome}<br /> 
									${usuario.email }
									
									<c:if test="${not empty usuario.telefone1}">
										<br /> ${usuario.telefone1}
									</c:if>
									<c:if test="${not empty usuario.telefone2}">
										<br /> ${usuario.telefone2}
									</c:if>
									<c:if test="${not empty usuario.cpf}">
										<br /> ${usuario.cpf}
									</c:if>
								</p>
								<br />
								<div class="table-responsive">
									<table class="table table-condensed table-hover">

										<tr>
											<td>${usuario.email}</td>
											<td class="text-right"><a href="<c:url value="/area-da-empresa/meus-dados/alterar-email"/>">Alterar e-mail</a></td>
										</tr>
										<tr>
											<td>*******</td>
											<td class="text-right"><a href="<c:url value="/area-da-empresa/meus-dados/alterar-senha"/>">Alterar senha</a></td>
										</tr>
									</table>
								</div>
							</div>
							<div class="painel-restrito-item item-endereco">
								<div class="pull-right">
									<a href="<c:url value="/area-da-empresa/meus-dados/alterar-perfil"/>">Editar</a>
								</div>
								<h2>Endereço</h2>
								<p>Atualize seu endereço</p>
								<p>
									<c:if test="${not empty usuario.endereco.estado}">
										${usuario.endereco.estado}
									</c:if>
									<c:if test="${not empty usuario.endereco.cidade}">
										<br/>${usuario.endereco.cidade}
									</c:if>
									<c:if test="${not empty usuario.endereco.bairro}">
										<br/>${usuario.endereco.bairro}
									</c:if>
									<c:if test="${not empty usuario.endereco.endereco}">
										<br/>${usuario.endereco.endereco}
									</c:if>
									<c:if test="${not empty usuario.endereco.complemento}">
										<br/>${usuario.endereco.complemento}
									</c:if>
									<c:if test="${not empty usuario.endereco.cep}">
										<br/>${usuario.endereco.cep}
									</c:if>
								</p>
								
							</div>

						</div>

					</div>


				</div>

			</div>




		</div>
		<!-- fim content-wrapper -->

		<div class="clear"></div>
		<!-- Rodape -->
		<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	</div>
	<!-- fim wrapper -->



</body>
</html>