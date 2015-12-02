<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<script type="text/javascript" src='<c:url value="/resources/todos/js/bootstrapValidator.min.js" />'></script>
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
									  <li role="presentation"><a href="${planoUrl}">Plano <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
											<c:url var="infoUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/informacoes"/>
									  <li role="presentation"><a href="${infoUrl}">Informações <span class="glyphicon glyphicon-info-sign"></span></a></li>
											<c:url var="localizacaoUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/localizacao"/>
									  <li role="presentation"><a href="${localizacaoUrl}">Localização <span class="glyphicon glyphicon-map-marker"></span></a></li>
											<c:url var="categoriaUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/categoria"/>
									  <li role="presentation"><a href="${categoriaUrl}">Categoria <span class="glyphicon glyphicon-tag"></span></a></li>
											<c:url var="palavrasUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/palavras-chave"/>
									  <li role="presentation" class="active"><a href="${palavrasUrl}">Tags <span class="glyphicon glyphicon-search"></span></a></li>
											<c:url var="imagensUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/imagens"/>
									  <li role="presentation"><a href="${imagensUrl}">Imagens <span class="glyphicon glyphicon-camera"></span></a></li>
									</ul>
								</div>
							</div>
							<!-- fim tabs -->

							<!-- meus-anuncios-body-estats -->
							<div class="meus-anuncios-body-estats">

								<c:if test="${not empty errors}">
									<div class="alert alert-danger">Ops! Existem alguns erros no formulário. As palavras-chave devem ter no minimo 3 e no máximo 20 caracteres.</div>
								</c:if>
								<c:if test="${not empty success}">
									<div class="alert alert-success">Pornto! As informações foram atualizadas com sucesso!</div>
								</c:if>
								
								<h3>
									<strong>Palavras-chave</strong>
								</h3>
								<p>Adicione palavras-chave que se ralacionam com o seu
									anúncio para que ele seja encontrado mais facilmente.</p>
								<hr>

								<!-- inicio form -->
								<c:url var="url"
									value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/palavras-chave-handle" />
								<form:form modelAttribute="anuncio" id="anuncioForm"
									class="form-horizontal" action="${url}" method="POST">

									<c:choose>
										<c:when test="${not empty anuncio.tags}">
											<c:forEach var="tags" items="${anuncio.tags}"
												varStatus="index">
												<!-- form-group -->
												<div class="form-group">
													<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
													<div id="tags-input-wrapper" class="col-sm-10">
														<form:input type="text" class="form-control"
															path="tags[${index.index}]" id="tagInput${index.index}"
															value="${anuncio.tags[index.index]}" />
														<form:errors path="tags[${index.index}]"
															cssStyle="color: red;" />
													</div>
												</div>
												<!-- /. form-group -->
											</c:forEach>


											<c:forEach var="i" begin="${fn:length(anuncio.tags)}" end="4">
												<!-- form-group -->
												<div class="form-group">
													<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
													<div id="tags-input-wrapper" class="col-sm-10">
														<form:input type="text" class="form-control"
															path="tags[${i}]" />
													</div>
												</div>
												<!-- /. form-group -->
											</c:forEach>

										</c:when>
										<c:otherwise>
											<!-- form-group -->
											<div class="form-group">
												<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
												<div id="tags-input-wrapper" class="col-sm-10">
													<form:input type="text" class="form-control" path="tags[0]" />
												</div>
											</div>
											<!-- /. form-group -->

											<!-- form-group -->
											<div class="form-group">
												<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
												<div id="tags-input-wrapper" class="col-sm-10">
													<form:input type="text" class="form-control" path="tags[1]" />
												</div>
											</div>
											<!-- /. form-group -->

											<!-- form-group -->
											<div class="form-group">
												<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
												<div id="tags-input-wrapper" class="col-sm-10">
													<form:input type="text" class="form-control" path="tags[2]" />
												</div>
											</div>
											<!-- /. form-group -->

											<!-- form-group -->
											<div class="form-group">
												<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
												<div id="tags-input-wrapper" class="col-sm-10">
													<form:input type="text" class="form-control" path="tags[3]" />
												</div>
											</div>
											<!-- /. form-group -->

											<!-- form-group -->
											<div class="form-group">
												<label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
												<div id="tags-input-wrapper" class="col-sm-10">
													<form:input type="text" class="form-control" path="tags[4]" />
												</div>
											</div>
											<!-- /. form-group -->
										</c:otherwise>
									</c:choose>

									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button id="botaoContinuar" type="submit"
												class="pull-right btn btn-primary">
												Atualizar <span class="glyphicon glyphicon-triangle-right"></span>
											</button>
										</div>
									</div>
								</form:form>
								<!-- fim form -->


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
<!-- validate script 2 --> 
<script type="text/javascript">
	$(document).ready(function() {
    $('#anuncioForm').bootstrapValidator({
        message: 'Esse valor não é válido.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            "tags[0]": {
                validators: {
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: 'As palavras chaves devem conter entre 3 e 20 caracteres.'
                    }
                }
            }, 
            "tags[1]": {
                validators: {
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: 'As palavras chaves devem conter entre 3 e 20 caracteres.'
                    }
                }
            }, 
            "tags[2]": {
                validators: {
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: 'As palavras chaves devem conter entre 3 e 20 caracteres.'
                    }
                }
            }, 
            "tags[3]": {
                validators: {
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: 'As palavras chaves devem conter entre 3 e 20 caracteres.'
                    }
                }
            }, 
            "tags[4]": {
                validators: {
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: 'As palavras chaves devem conter entre 3 e 20 caracteres.'
                    }
                }
            }

        }
    });

});
</script> 	
</body>
</html>