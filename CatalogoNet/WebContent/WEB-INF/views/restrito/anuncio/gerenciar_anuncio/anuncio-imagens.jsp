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
						<c:url var="homeUrl" value="/area-da-empresa"/>
						<li><a href="${homeUrl}">Home</a></li>
						<c:url var="meusAnunciosUrl" value="/area-da-empresa/meus-anuncios"/>
						<li><a href="${meusAnunciosUrl}">Meus Anúncios</a></li>
						<li class="active">${anuncio.titulo}</li>
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
								  <li role="presentation"><a href="${palavrasUrl}">Tags <span class="glyphicon glyphicon-search"></span></a></li>
										<c:url var="imagensUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/imagens"/>
								  <li role="presentation" class="active"><a href="${imagensUrl}">Imagens <span class="glyphicon glyphicon-camera"></span></a></li>
								</ul>
								</div>
							</div>
							<!-- fim tabs -->

							<!-- meus-anuncios-body-estats -->
							<div class="meus-anuncios-body-estats">

								<c:if test="${not empty errors}">
									<div class="alert alert-danger">Ops! Existe algum erro. A quantidade máxima de imagens é de 5, tente remover antes de adicionar uma nova imagem.</div>
								</c:if>
								<c:if test="${not empty success}">
									<div class="alert alert-success">Pronto! As informações foram atualizadas com sucesso!</div>
								</c:if>
								

								<!-- inicio form -->
								<c:url var="url"
									value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/imagens-handle" />
								<form action="${url}" method="POST"
									enctype="multipart/form-data">
									
									<h3>
										<strong>Escolha um logotipo para o seu anúncio</strong>
									</h3>
									<hr />
								<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="pull-right btn btn-primary">
											Atualizar <span class="glyphicon glyphicon-triangle-right"></span>
										</button>
									</div>									
									<div class="file-input-list">
										<ul>
											<li>
												<!-- inicio file-container-wrapper -->
												<div class="file-container-wrapper">
															<c:choose>
																<c:when test="${anuncio.logotipo != null}">
																	<div class="file-container" onclick="activeFileInput(this)">
																		<div style="display: none;" class="input-container">
																			<span class="input-container-msg">Adicionar...</span>
																		</div>
																		<div class="img-container">
																			<c:url var="logotipo" value="/servicos/imagens/logotipo/${anuncio.id}"/>
																			<img src="${logotipo}.jpg" />
																		</div>
																		<input type="file" name="logotipo" onchange="handleFiles(this)" accept="image/*">
																	</div>
																	<div class="img-controls">
																		<a class="btn btn-danger btn-xs" title="Remover imagem.."
																			onclick="removerLogotipo(${anuncio.id});remover(this);">Remover <span
																			class="glyphicon glyphicon-remove"></span></a>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="file-container" onclick="activeFileInput(this)">
																		<div class="input-container">
																			<span class="input-container-msg">Adicionar...</span>
																		</div>
																		<div style="display: none;" class="img-container">
																			<img src="">
																		</div>
																		<input type="file" name="logotipo"
																			onchange="handleFiles(this)" accept="image/*">
																	</div>
																	<div style="display: none;" class="img-controls">
																		<a class="btn btn-danger btn-xs" title="Remover imagem.."
																			onclick="remover(this)">Remover <span
																			class="glyphicon glyphicon-remove"></span></a>
																	</div>
																</c:otherwise>
															</c:choose>
												</div> 
												<!-- fim file-container-wrapper -->
											</li>
										</ul>
									</div>


									<h3>
										<strong>Fotos do seu negócio</strong> <small>Você pode
											adicionar até 5 fotos</small>
									</h3>
									<hr />

									<div class="file-input-list">
										<ul>
										
										
										
										
										
											<c:forEach var="imagem" items="${listaImagens}" varStatus="index">
												
												<li>
													<!-- inicio file-container-wrapper -->
													<div class="file-container-wrapper">
														<div class="file-container" onclick="activeFileInput(this)">
															<div style="display: none;" class="input-container">
																<span class="input-container-msg">Adicionar...</span>
															</div>
															<div class="img-container">
																<c:url var="logotipo" value="/servicos/imagens/thumbnail/${imagem.id}"/>
																<img id="img-${index.index}" src="${logotipo}" />
															</div>
															<input style="display: none;" type="file" name="file"
																onchange="handleFiles(this)" accept="image/*">
														</div>
														<div class="img-controls">
															<a class="btn btn-danger btn-xs" title="Remover imagem.."
																onclick="remover(this, ${imagem.id})">Remover <span
																class="glyphicon glyphicon-remove"></span></a>
														</div>
													</div> <!-- fim file-container-wrapper -->
												</li>
											</c:forEach>
											
											
											<c:forEach var="i" begin="${fn:length(listaImagens)}" end="4">
												<li>
													<!-- inicio file-container-wrapper -->
													<div class="file-container-wrapper">
														<div class="file-container" onclick="activeFileInput(this)">
															<div class="input-container">
																<span class="input-container-msg">Adicionar...</span>
															</div>
															<div style="display: none;" class="img-container">
																<img src="">
															</div>
															<input type="file" name="file"
																onchange="handleFiles(this)" accept="image/*">
														</div>
														<div style="display: none;" class="img-controls">
															<a class="btn btn-danger btn-xs" title="Remover imagem.."
																onclick="remover(this)">Remover <span
																class="glyphicon glyphicon-remove"></span></a>
														</div>
													</div> <!-- fim file-container-wrapper -->
												</li>
											</c:forEach>
										
										</ul>
									</div>


									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="pull-right btn btn-primary">
											Atualizar <span class="glyphicon glyphicon-triangle-right"></span>
										</button>
									</div>

								</form>
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


<script type="text/javascript">
	function removerLogotipo(idAnun) {
		 	if (idAnun) {
				 $.get("remover-logotipo/");
			}
	}

</script>

<script type="text/javascript">
  function remover(button, idDaImagem) {
	 
	 if (idDaImagem) {
	 	$.get("remover-imagem/" + idDaImagem);
	 }
	 
    //get imgControls
    var imgControls = button.parentElement;

    //get fileContainerWrapper
    var fileContainerWrapper = imgControls.parentElement;

    //get fileContainer
    var fileContainer = fileContainerWrapper.getElementsByClassName("file-container")[0];

    //get imgContainer
    var imgContainer = fileContainer.getElementsByClassName("img-container")[0];

    //get inputContainer
    var inputContainer = fileContainer.getElementsByClassName("input-container")[0];

    //get img
    var imagem = imgContainer.getElementsByTagName("img")[0];

    //remove
    imgContainer.removeChild(imagem);

    //create img
    var imgNova = document.createElement("img");

    //apend new img
    imgContainer.appendChild(imgNova);  

        //hide input-container
        inputContainer.style.display = 'inline-block';

        //show img-contaoiner
        imgContainer.style.display = 'none';

        //show img-coltrols
        imgControls.style.display = 'none';

    
  }
</script>

<script type="text/javascript">
  function activeFileInput(fileContainer) {
    var fileInputClick = fileContainer.getElementsByTagName("input")[0];
    fileInputClick.click(); 
  }
</script>

<script type="text/javascript">
  function handleFiles(input)
{
    var filesToUpload = input.files;
    var file = filesToUpload[0];

    // Create an image
    var img = document.createElement("img");
    // Create a file reader
    var reader = new FileReader();
    // Set the image once loaded into file reader
    reader.onload = function(e)
    {
        img.src = e.target.result;

        var canvas = document.createElement("canvas");
        //var canvas = $("<canvas>", {"id":"testing"})[0];
        var ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0);

        var MAX_WIDTH = 140;
        var MAX_HEIGHT = 140;
        var width = img.width;
        var height = img.height;

        if (width > height) {
          if (width > MAX_WIDTH) {
            height *= MAX_WIDTH / width;
            width = MAX_WIDTH;
          }
        } else {
          if (height > MAX_HEIGHT) {
            width *= MAX_HEIGHT / height;
            height = MAX_HEIGHT;
          }
        }
        canvas.width = width;
        canvas.height = height;
        var ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0, width, height);


        //get fileContainer
        var fileContainer = input.parentElement;

        //get file-container-wrapper
        var fileContainerWrapper = fileContainer.parentElement;

        //get imgContainer
        var inputContainer = fileContainer.getElementsByClassName("input-container")[0];

        //get imgContainer
        var imgContainer = fileContainer.getElementsByClassName("img-container")[0];

        //get imgControls
        var imgControls = fileContainerWrapper.getElementsByClassName("img-controls")[0];

        //hide input-container
        inputContainer.style.display = 'none';

        //show img-contaoiner
        imgContainer.style.display = 'inline-block';

        //show img-coltrols
        imgControls.style.display = 'inline-block';

        //get img 
        var imagem = fileContainer.getElementsByTagName("img")[0];

        var dataurl = canvas.toDataURL("image/png");
        imagem.src = dataurl;     
    }
    // Load files into file reader
    reader.readAsDataURL(file);

}

</script>


	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />
</body>
</html>