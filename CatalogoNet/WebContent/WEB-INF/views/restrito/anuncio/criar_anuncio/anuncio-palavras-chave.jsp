<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
              <li class="progtrckr-done">Informações</li><!--
              --><li class="progtrckr-done">Localização</li><!--
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

 <h3><strong>Palavras-chave</strong></h3>
  <p>Adicione palavras-chave que se ralacionam com o seu anúncio para que ele seja encontrado mais facilmente.</p>
  <hr>

<!-- inicio form -->
<c:url var="url" value="/area-da-empresa/criar-anuncio/palavras-chave-handle"/>
<form:form modelAttribute="anuncio" id="anuncioForm" class="form-horizontal" action="${url}" method="POST">

    <c:choose>
    	<c:when test="${not empty anuncio.tags}">
    		<c:forEach var="tags" items="${anuncio.tags}" varStatus="index">
    			    <!-- form-group -->
				    <div class="form-group">
				      <label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
				      <div id="tags-input-wrapper" class="col-sm-10">
				        <form:input type="text" class="form-control" path="tags[${index.index}]" id="tagInput${index.index}" value="${anuncio.tags[index.index]}" />
				        <form:errors path="tags[${index.index}]" cssStyle="color: red;"/>
				      </div>
				    </div>
				    <!-- /. form-group -->
    		</c:forEach>
    		
    		
    		<c:forEach var="i" begin="${fn:length(anuncio.tags)}" end="4">
			       <!-- form-group -->
				    <div class="form-group">
				      <label for="tag" class="col-sm-2 control-label">Palavra-chave</label>
				      <div id="tags-input-wrapper" class="col-sm-10">
				        <form:input type="text" class="form-control" path="tags[${i}]" />
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
        <form:input type="text" class="form-control" path="tags[0]"  />
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
      <button id="botaoContinuar" type="submit" class="pull-right btn btn-primary">Próximo <span class="glyphicon glyphicon-triangle-right"></span></button>
    </div>
  </div>
</form:form>
<!-- fim form -->

</div>

  <div class="col-md-2"></div>


</div>

</div>

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