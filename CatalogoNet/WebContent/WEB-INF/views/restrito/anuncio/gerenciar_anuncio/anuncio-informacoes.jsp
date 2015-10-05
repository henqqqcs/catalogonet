<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<script type="text/javascript"
	src='<c:url value="/resources/todos/js/bootstrapValidator.min.js" />'></script>
<script type="text/javascript"
	src='<c:url value="/resources/todos/js/jquery.mask.min.js" />'></script>

<!-- text area -->
<script type="text/javascript"
	src='<c:url value="/resources/todos/js/tinymce/js/tinymce/tinymce.min.js" />'></script>

<script type="text/javascript">
	tinymce
			.init({
				selector : "textarea",
				plugins : [
						"advlist autolink lists link image charmap print preview anchor",
						"searchreplace visualblocks code fullscreen",
						"insertdatetime media table contextmenu paste" ],
				toolbar : "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
			});
</script>
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
								  <li role="presentation" class="active"><a href="${infoUrl}">Informações <span class="glyphicon glyphicon-info-sign"></span></a></li>
										<c:url var="localizacaoUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/localizacao"/>
								  <li role="presentation"><a href="${localizacaoUrl}">Localização <span class="glyphicon glyphicon-map-marker"></span></a></li>
										<c:url var="categoriaUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/categoria"/>
								  <li role="presentation"><a href="${categoriaUrl}">Categoria <span class="glyphicon glyphicon-tag"></span></a></li>
										<c:url var="palavrasUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/palavras-chave"/>
								  <li role="presentation"><a href="${palavrasUrl}">Tags <span class="glyphicon glyphicon-search"></span></a></li>
										<c:url var="imagensUrl" value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/imagens"/>
								  <li role="presentation"><a href="${imagensUrl}">Imagens <span class="glyphicon glyphicon-camera"></span></a></li>
								</ul>
								</div>
							</div>
							<!-- fim tabs -->

							<!-- meus-anuncios-body-estats -->
							<div class="meus-anuncios-body-estats">
							
								<c:if test="${not empty errors}">
									<div class="alert alert-danger">Ops! Existem alguns erros no formulário.</div>
								</c:if>
								<c:if test="${not empty success}">
									<div class="alert alert-success">Pornto! As informações foram atualizadas com sucesso!</div>
								</c:if>
								
								<h3>
									<strong>Editar Informações do Anúncio</strong>
								</h3>
								<hr />
								
								<!-- inicio form -->
								<c:url var="info"
									value="/area-da-empresa/meus-anuncios/${anuncio.tituloNaUrl}/${anuncio.id}/informacoes-handle" />
								<form:form id="anuncioForm" modelAttribute="anuncio"
									class="form-horizontal" action="${info}" method="POST">

									<!-- form-group -->
									<div class="form-group">
										<label for="titulo" class="col-sm-2 control-label">Título
											<span class="glyphicon glyphicon-asterisk"></span>
										</label>
										<div class="col-sm-10">
											<form:input type="text" class="form-control" id="titulo"
												path="titulo"
												placeholder="Título do seu anúncio. Ex: PIZZARIA GORDEIXOS" value="${anuncio.titulo}" />
											<form:errors path="titulo" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="descricao" class="col-sm-2 control-label">Descrição</label>
										<div class="col-sm-10">
											<form:textarea id="descricao" path="descricao" value="${anuncio.descricao}"/>
											<form:errors path="descricao" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->
									<h3>
										<strong>Contato</strong>
									</h3>
									<hr />

									<!-- form-group -->
									<div class="form-group">
										<label for="telefone1" class="col-sm-2 control-label">Telefone
											<span class="glyphicon glyphicon-asterisk"></span>
										</label>
										<div class="col-sm-10">
											<form:input type="text" class="form-control" id="telefone1"
												path="telefone1" placeholder="(99) 9999-9999"
												value="${anuncio.telefone1}" />
											<form:errors path="telefone1" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="telefone2" class="col-sm-2 control-label">Telefone
											2</label>
										<div class="col-sm-10">
											<form:input type="text" class="form-control" id="telefone2"
												path="telefone2" placeholder="(99) 9999-9999" value="${anuncio.telefone2}"/>
											<form:errors path="telefone2" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->

									<hr />

									<!-- form-group -->
									<div class="form-group">
										<label for="site" class="col-sm-2 control-label">Site</label>
										<div class="col-sm-10">
											<form:input type="text" class="form-control" id="site"
												path="site" placeholder="http://www.site.com.br" value="${anuncio.site}" />
											<form:errors path="site" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->


									<!-- form-group -->
									<div class="form-group">
										<label for="email" class="col-sm-2 control-label">E-mail</label>
										<div class="col-sm-10">
											<form:input type="email" class="form-control" id="email"
												path="email" placeholder="email@email.com.br" value="${anuncio.email}"/>
											<form:errors path="email" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->

									<!-- form-group -->
									<div class="form-group">
										<label for="facebook" class="col-sm-2 control-label">Facebook</label>
										<div class="col-sm-10">
											<form:input type="text" class="form-control" id="facebook"
												path="facebook"
												placeholder="https://pt-br.facebook.com/seufacebook" value="${anuncio.facebook}"/>
											<form:errors path="facebook" cssStyle="color: red;" />
										</div>
									</div>
									<!-- /. form-group -->

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
</body>
</html>