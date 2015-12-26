<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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


<script type="text/javascript" src='<c:url value="/resources/todos/js/bootstrapValidator.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/resources/todos/js/jquery.mask.min.js" />'></script>

<!-- text area -->
<script type="text/javascript" src='<c:url value="/resources/todos/js/tinymce/js/tinymce/tinymce.min.js" />'></script>

  <script type="text/javascript">
  tinymce.init({
      selector: "textarea",
      plugins: [
          "advlist autolink lists link image charmap print preview anchor",
          "searchreplace visualblocks code fullscreen",
          "insertdatetime media table contextmenu paste"
      ],
      toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
  });
  </script>
</head>
<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/restrito/cabecalho-restrito.jsp" />

<div class="container">

<!-- row-pgr-tracker -->
<div class="row">
  <div class="col-md-12">
            <!-- progress bar -->
        <div class="progress-tracker">
          <div class="text-center hidden-sm hidden-xs">
            <ol class="progtrckr" data-progtrckr-steps="5">
              <li class="progtrckr-todo">Informações</li><!--
              --><li class="progtrckr-todo">Localização</li><!--
              --><li class="progtrckr-todo">Palavras-chave</li><!--
              --><li class="progtrckr-todo">Imagens</li><!-- 
              --><li class="progtrckr-todo">Confirmar anúncio</li>
            </ol>
          </div>
        </div>
        <!-- /progress bar --> 
  </div>
</div>
<!-- fim row pgr-tracker -->
  

<div class="row">

  <div class="col-md-2"></div>


<div class="col-md-8">

<h3><strong>Informações do Anúncio</strong></h3>
<hr/>

<c:if test="${not empty errors}">
	<div class="alert alert-danger">Ops! Existem alguns erros no formulário.</div>
</c:if>

<!-- inicio form -->
<c:url var="info" value="/area-da-empresa/criar-anuncio/informacoes-handle" />
<form:form id="anuncioForm" modelAttribute="anuncio" class="form-horizontal" action="${info}" method="POST">

  <!-- form-group -->
  <div class="form-group">
    <label for="titulo" class="col-sm-2 control-label">Título <span class="glyphicon glyphicon-asterisk"></span></label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" id="titulo" path="titulo" placeholder="Título do seu anúncio. Ex: PIZZARIA GORDEIXOS" />
      <form:errors path="titulo" cssStyle="color: red;"/>
    </div>
  </div>
  <!-- /. form-group -->

  <!-- form-group -->
  <div class="form-group">
    <label for="descricao" class="col-sm-2 control-label">Descrição</label>
    <div class="col-sm-10">
      <form:textarea id="descricao" path="descricao" />
      <form:errors path="descricao" cssStyle="color: red;"/>
    </div>
  </div>
  <!-- /. form-group -->
  <h3><strong>Contato</strong></h3>
  <hr/>

  <!-- form-group -->
  <div class="form-group">
    <label for="telefone1" class="col-sm-2 control-label">Telefone <span class="glyphicon glyphicon-asterisk"></span></label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" id="telefone1" path="telefone1" placeholder="(99) 9999-9999" value="${anuncio.telefone1}"/>
      <form:errors path="telefone1" cssStyle="color: red;"/>
    </div>
  </div>
  <!-- /. form-group -->

  <!-- form-group -->
  <div class="form-group">
    <label for="telefone2" class="col-sm-2 control-label">Telefone 2</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" id="telefone2" path="telefone2" placeholder="(99) 9999-9999" />
      <form:errors path="telefone2" cssStyle="color: red;"/>
    </div>
  </div>
  <!-- /. form-group -->

  <hr/>

  <!-- form-group -->
  <div class="form-group">
    <label for="site" class="col-sm-2 control-label">Site</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" id="site" path="site" placeholder="http://www.site.com.br" />
      <form:errors path="site" cssStyle="color: red;"/>
    </div>
  </div>
  <!-- /. form-group -->


    <!-- form-group -->
  <div class="form-group">
    <label for="email" class="col-sm-2 control-label">E-mail</label>
    <div class="col-sm-10">
      <form:input type="email" class="form-control" id="email" path="email" placeholder="email@email.com.br" />
      <form:errors path="email" cssStyle="color: red;"/>
    </div>
  </div>
  <!-- /. form-group -->

  <!-- form-group -->
  <div class="form-group">
    <label for="facebook" class="col-sm-2 control-label">Facebook</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" id="facebook" path="facebook" placeholder="https://pt-br.facebook.com/seufacebook" />
      <form:errors path="facebook" cssStyle="color: red;"/>
    </div>
  </div>
  <!-- /. form-group -->

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button id="botaoContinuar"type="submit" class="pull-right btn btn-primary">Próximo <span class="glyphicon glyphicon-triangle-right"></span></button>
    </div>
  </div>
</form:form>
<!-- fim form -->

</div>

  <div class="col-md-2"></div>


</div>


</div>

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
            "titulo": {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    stringLength: {
                        min: 3,
                        max: 55,
                        message: 'O título é muito pequeno.'
                    }
                }
            },
            telefone1: {
                validators: {
                    notEmpty: {
                        message: 'Esse campo é obrigatório.'
                    },
                    stringLength: {
                        min: 13,
                        max: 19,
                        message: 'Esse telefone não parece válido.'
                    }
                }
            },
            telefone2: {
                validators: {
                    stringLength: {
                        min: 13,
                        max: 19,
                        message: 'Esse telefone não parece válido.'
                    }
                }
            },
            site: {
                validators: {
                        uri: {
                            message: 'Não parece um link válido. Coloque o http://'
                        }
                    }
                },    
            email: {
                validators: {
                    emailAddress: {
                        message: 'Esse email não é válido.'
                    }
                }
            }, 
            "tags[0]": {
                validators: {
                    stringLength: {
                        min: 3,
                        max: 50,
                        message: 'As palavras chaves devem conter entre 3 e 20 caracteres.'
                    }
                }
            }, 
		            "tags[1]": {
		                validators: {
		                    stringLength: {
		                        min: 3,
		                        max: 50,
		                        message: 'As palavras chaves devem conter entre 3 e 20 caracteres.'
		                    }
		                }
		            }, 
            tagInput1: {
                validators: {
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: 'As palavras chaves devem conter entre 3 e 20 caracteres.'
                    }
                }
            }, 
            facebook: {
              validators: {
                    uri: {
                      message: 'Não parece um link válido. Coloque o http://'
                      }
                  }
              }
            

        }
    });

    // Validate the form manually
    $('#botaoContinuar').click(function() {
        $('#anuncioForm').bootstrapValidator('validate');
    });
});
</script> 
<!-- validate script 2 --> 
<script type="text/javascript">
function add_fields() {
  var tags = ["pizza", "restaurante", "restaurantes", "alimentação"];
  var inputCount = document.getElementById('tags-wrapper').getElementsByTagName('input').length;
  if (inputCount < 5) {

    //cria form-gorup
    var formGroup = document.createElement("div");
    formGroup.className = "form-group";
    var formGroupId = "tags-wrapper-form-" + inputCount;
    formGroup.setAttribute("id", formGroupId);


    //cria label
    var labelTest = document.createElement("LABEL");
    labelTest.className = "col-sm-2 control-label";
    labelTest.innerHTML = "Palavra-chave";

    
    //cria div
    var div = document.createElement("div");
    div.className = "col-sm-10";
    var divId = "tags-input-wrapper-" + inputCount;
    div.setAttribute("id", divId);

    //cria input
    var input = document.createElement("input");
    input.type = "text";
    input.className = "form-control";
    input.name = "tags[" + inputCount + "]";
    input.placeholder = tags[inputCount - 1];
	var inputId = "tagInput" + inputCount;
	input.setAttribute("id", inputId);

    //coloca form group
    document.getElementById('tags-wrapper').appendChild(formGroup);

    //coloca a label no form group
    document.getElementById(formGroupId).appendChild(labelTest);

    //coloca a div no formGroupId
    document.getElementById(formGroupId).appendChild(div);

    //pega a div e coloca o input dentro da div nova
    document.getElementById(divId).appendChild(input).focus();

  }
}
</script>
<!-- mask input --> 
<script>
$(document).ready(function(){
  $('#telefone1').mask('(00) 0000-0000');
  $('#telefone2').mask('(00) 0000-0000');
  $('#cep').mask('00000-000');
});
</script> 
<!-- mask input -->

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

</body>
</html>