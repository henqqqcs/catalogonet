<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

<link rel="shortcut icon" href="<c:url value="/resources/imgs/favicon.gif" />" type="image/ico" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/restrito/css/catalogonet-bootstrap.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/restrito/css/catalogonet-bootstrap-style.css" />">


<script type="text/javascript" src='<c:url value="/resources/todos/js/jquery-1.11.3.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/resources/todos/js/bootstrap.min.js" />'></script>


</head>
<body>
  <!-- container -->
  <div class="container">

    <!-- row -->
    <div class="row">

      <div class="col-md-2"></div>

      <!-- col-md-8 -->
      <div class="col-md-8">


        <!-- inicio form -->
        <c:url var="url" value="/controller/upload-teste"/>
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
                    <input type="file" name="logotipo" onchange="handleFiles(this)">
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
                  <input type="file" name="file" onchange="handleFiles(this)">
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
                  <input type="file" name="file" onchange="handleFiles(this)">
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
                  <input type="file" name="file" onchange="handleFiles(this)">
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
                  <input type="file" name="file" onchange="handleFiles(this)">
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
                  <input type="file" name="file" onchange="handleFiles(this)">
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

</body>
</html>