<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>${anuncio.titulo}-Imagens - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/restrito/arquivos-css-js.jsp" />


<c:url var="pegaBairros" value="/servicos/lista-bairros" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$
								.getJSON(
										'${pegaBairros}',
										{
											ajax : 'true'
										},
										function(data) {
											var html = "<option value='${anuncio.bairro.id}'>${anuncio.bairro.nome}</option>";
											var len = data.length;
											for (var i = 0; i < len; i++) {
												html += '<option value="' + data[i].id + '">'
														+ data[i].nome
														+ '</option>';
											}
											html += '</option>';
											$('#bairros').html(html);
										});
					});
</script>

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
						<div class="col-md-12">
							<ol class="breadcrumb breadcrumb-white">
								<li><a href="#">Home</a></li>
								<li><a href="#">Meus anúncios</a></li>
								<li class="active">${anuncio.titulo}</li>
							</ol>
						</div>
					</div>


					<!-- atualizar anuncio -->
					<div class="atualizar-anuncio-wrapper painel-restrito-item">

						<!-- ============================================================ -->


						<c:if test="${not empty errors}">
							<div class="alert alert-danger">Ops! Existe algum erro. A quantidade máxima de imagens
								é de 5, tente remover antes de adicionar uma nova imagem.</div>
						</c:if>
						<c:if test="${not empty success}">
							<div class="alert alert-success">Pronto! As informações foram atualizadas com sucesso!</div>
						</c:if>


						<!-- inicio form -->
						<c:url var="url"
							value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/imagens-handle" />
						<form action="${url}" method="POST" enctype="multipart/form-data">

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
															<c:url var="logotipo"
																value="/servicos/imagens/logotipo/${anuncio.tituloNaUrl}/${anuncio.id}.jpg" />
															<img src="${logotipo}" />
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
														<input type="file" name="logotipo" onchange="handleFiles(this)" accept="image/*">
													</div>
													<div style="display: none;" class="img-controls">
														<a class="btn btn-danger btn-xs" title="Remover imagem.." onclick="remover(this)">Remover
															<span class="glyphicon glyphicon-remove"></span>
														</a>
													</div>
												</c:otherwise>
											</c:choose>
										</div> <!-- fim file-container-wrapper -->
									</li>
								</ul>
							</div>


							<h3>
								<strong>Fotos do seu negócio</strong> <small>Você pode adicionar até 5 fotos</small>
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
														<c:url var="logotipo"
															value="/servicos/imagens/thumbnail/${anuncio.tituloNaUrl}/${imagem.id}.jpg" />
														<img id="img-${index.index}" src="${logotipo}" />
													</div>
													<input style="display: none;" type="file" name="file" onchange="handleFiles(this)"
														accept="image/*">
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
													<input type="file" name="file" onchange="handleFiles(this)" accept="image/*">
												</div>
												<div style="display: none;" class="img-controls">
													<a class="btn btn-danger btn-xs" title="Remover imagem.." onclick="remover(this)">Remover
														<span class="glyphicon glyphicon-remove"></span>
													</a>
												</div>
											</div> <!-- fim file-container-wrapper -->
										</li>
									</c:forEach>

								</ul>
							</div>


							<div class="col-sm-offset-2 col-sm-10">

								<button type="submit" class="pull-right btn btn-primary">Atualizar</button>
							</div>

						</form>
						<!-- fim form -->


						<!-- ============================================================ -->


					</div>
					<!-- fim atualizar-anuncio -->

				</div>
				<!-- fim container -->


			</div>

		</div>
		<!-- fim content-wrapper -->

		<div class="clear"></div>
		<!-- Rodape -->
		<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

	</div>
	<!-- fim wrapper -->

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

</body>
</html>