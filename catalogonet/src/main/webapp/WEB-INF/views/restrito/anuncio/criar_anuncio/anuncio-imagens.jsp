<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
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
  
  <!-- row-pgr-tracker -->
<div class="row">
  <div class="col-md-12">
            <!-- progress bar -->
        <div class="progress-tracker">
          <div class="text-center hidden-sm hidden-xs">
            <ol class="progtrckr" data-progtrckr-steps="5">
              <li class="progtrckr-done">Informações</li><!--
              --><li class="progtrckr-done">Localização</li><!--
              --><li class="progtrckr-done">Palavras-chave</li><!--
              --><li class="progtrckr-todo">Imagens</li><!-- 
              --><li class="progtrckr-todo">Confirmar anúncio</li>
            </ol>
          </div>
        </div>
        <!-- /progress bar --> 
  </div>
</div>
<!-- fim row pgr-tracker -->

    <!-- row -->
    <div class="row">

      <div class="col-md-2"></div>

      <!-- col-md-8 -->
      <div class="col-md-8">


        <!-- inicio form -->
        <c:url var="url" value="/area-da-empresa/criar-anuncio/imagens-handle"/>
		<form action="${url}" method="POST" enctype="multipart/form-data">


          <h3><strong>Escolha um logotipo para o seu anúncio</strong></h3>
          <hr/>

          <div class="file-input-list">
            <ul>
              <li>
                <!-- inicio file-container-wrapper -->
                <div class="file-container-wrapper">
                  <div class="file-container" onclick="activeFileInput(this)">
                    <div class="input-container">
                      <span class="input-container-msg">Adicionar...</span>
                    </div>
                    <div style="display:none;" class="img-container">
                      <img src="">
                    </div>
                    <input type="file" name="logotipo" onchange="handleFiles(this)" accept="image/*">
                  </div>
                  <div  style="display:none;" class="img-controls">
                    <a class="btn btn-danger btn-xs" title="Remover imagem.." onclick="remover(this)">Remover <span class="glyphicon glyphicon-remove"></span></a>
                  </div>
                </div>
                <!-- fim file-container-wrapper -->
              </li>
            </ul>
          </div>
  

          <h3><strong>Fotos do seu negócio</strong> <small>Você pode adicionar até 5 fotos</small> </h3>
          <hr/>

          <div class="file-input-list">
          <ul>
            <li>
              <!-- inicio file-container-wrapper -->
              <div class="file-container-wrapper">
                <div class="file-container" onclick="activeFileInput(this)">
                  <div class="input-container">
                    <span class="input-container-msg">Adicionar...</span>
                  </div>
                  <div style="display:none;" class="img-container">
                    <img src="">
                  </div>
                  <input type="file" name="file" onchange="handleFiles(this)" accept="image/*">
                </div>
                <div  style="display:none;" class="img-controls">
                  <a class="btn btn-danger btn-xs" title="Remover imagem.." onclick="remover(this)">Remover <span class="glyphicon glyphicon-remove"></span></a>
                </div>
              </div>
              <!-- fim file-container-wrapper -->
            </li>
            <li>
              <!-- inicio file-container-wrapper -->
              <div class="file-container-wrapper">
                <div class="file-container" onclick="activeFileInput(this)">
                  <div class="input-container">
                    <span class="input-container-msg">Adicionar...</span>
                  </div>
                  <div style="display:none;" class="img-container">
                    <img src="">
                  </div>
                  <input type="file" name="file" onchange="handleFiles(this)" accept="image/*">
                </div>
                <div  style="display:none;" class="img-controls">
                  <a class="btn btn-danger btn-xs" title="Remover imagem.." onclick="remover(this)">Remover <span class="glyphicon glyphicon-remove"></span></a>
                </div>
              </div>
              <!-- fim file-container-wrapper -->
            </li>
            <li>
              <!-- inicio file-container-wrapper -->
              <div class="file-container-wrapper">
                <div class="file-container" onclick="activeFileInput(this)">
                  <div class="input-container">
                    <span class="input-container-msg">Adicionar...</span>
                  </div>
                  <div style="display:none;" class="img-container">
                    <img src="">
                  </div>
                  <input type="file" name="file" onchange="handleFiles(this)" accept="image/*">
                </div>
                <div  style="display:none;" class="img-controls">
                  <a class="btn btn-danger btn-xs" title="Remover imagem.." onclick="remover(this)">Remover <span class="glyphicon glyphicon-remove"></span></a>
                </div>
              </div>
              <!-- fim file-container-wrapper -->
            </li>
            <li>
                            <!-- inicio file-container-wrapper -->
              <div class="file-container-wrapper">
                <div class="file-container" onclick="activeFileInput(this)">
                  <div class="input-container">
                    <span class="input-container-msg">Adicionar...</span>
                  </div>
                  <div style="display:none;" class="img-container">
                    <img src="">
                  </div>
                  <input type="file" name="file" onchange="handleFiles(this)" accept="image/*">
                </div>
                <div  style="display:none;" class="img-controls">
                  <a class="btn btn-danger btn-xs" title="Remover imagem.." onclick="remover(this)">Remover <span class="glyphicon glyphicon-remove"></span></a>
                </div>
              </div>
              <!-- fim file-container-wrapper -->
            </li>
            <li>
              <!-- inicio file-container-wrapper -->
              <div class="file-container-wrapper">
                <div class="file-container" onclick="activeFileInput(this)">
                  <div class="input-container">
                    <span class="input-container-msg">Adicionar...</span>
                  </div>
                  <div style="display:none;" class="img-container">
                    <img src="">
                  </div>
                  <input type="file" name="file" onchange="handleFiles(this)" accept="image/*">
                </div>
                <div  style="display:none;" class="img-controls">
                  <a class="btn btn-danger btn-xs" title="Remover imagem.." onclick="remover(this)">Remover <span class="glyphicon glyphicon-remove"></span></a>
                </div>
              </div>
              <!-- fim file-container-wrapper -->
            </li>
          </ul>
          </div>


          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="pull-right btn btn-primary">Próximo <span class="glyphicon glyphicon-triangle-right"></span></button>
          </div>

    </form>
    <!-- fim form -->


</div>
<!-- fim col-md-8 -->

<div class="col-md-2"></div>


</div>
<!-- fim row -->


</div>
<!-- fim container -->


<script type="text/javascript">
  function remover(button) {

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

	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />
</body>
</html>