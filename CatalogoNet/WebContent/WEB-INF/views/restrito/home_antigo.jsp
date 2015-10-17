<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


    <!-- row principal -->
    <div class="row">

      <!-- col-md-3 -->
      <div class="col-md-3">

	   	<!-- menu-esquerda -->
		<c:import url="/WEB-INF/views/template/restrito/menu-esquerda.jsp" />
		<!-- /menu-esquerda -->


      </div>
      <!-- ./ col-md-3 -->

      <!-- col-md-9 -->
      <div class="col-md-9">

        <!-- conteudo-pagina-restrito -->
        <div class="conteudo-pagina-restrito">

          <!-- inicio conteudo-meus-anuncios -->
          <div class="conteudo-meus-anuncios">

            <div class="page-header">
              <h2>Meus Anúncios</h2>
            </div>

            <!-- row -->
            <div class="row">

              <!-- meus anuncios esquerda -->
              <div class="col-md-6">
                <a href="" class="btn btn-black btn-lg">Criar Anúncio <span class="glyphicon glyphicon-plus"></span></a>
              </div>
              <!-- /meus anuncios  esquerda --> 

              <!-- meus anuncios direita -->
              <div class="col-md-6">
                <label>Gerencie seus anúncios</label>
                <p><a href="">Meus Anúncios</a></p>
              </div>
              <!-- meus anuncios direta --> 

            </div>
            <!-- fim row -->

          </div>
          <!-- fim conteudo-meus-anuncios -->


          <!-- inicio conteudo-meus-planos -->
          <div class="conteudo-meus-planos">

            <div class="page-header">
              <h2>Contratar Plano</h2>
            </div>

            <!-- row -->
            <div class="row">

              <!-- meus planos esquerda -->
              <div class="col-md-6">
                <a href="" class="btn btn-black btn-lg">Contratar Plano</a>
              </div>
              <!-- /meus planos  planos --> 

              <!-- meus planos direita -->
              <div class="col-md-6">
                <label>Gerencie seus planos</label>
                <p><a href="">Planos contratados</a></p>
                <p><a href="">Saiba mais</a></p>
              </div>
              <!-- meus planos direta --> 

            </div>
            <!-- fim row -->

          </div>
          <!-- fim conteudo-meus-planos -->


          <!-- inicio conteudo-meus-pedidos -->
          <div class="conteudo-meus-pedidos">

            <div class="page-header">
              <h2>Meus Pedidos</h2>
            </div>

            <!-- row -->
            <div class="row">

              <!-- meus pedidos esquerda -->
              <div class="col-md-6">
                <a href="" class="btn btn-primary">Meus Pedidos</a>
              </div>
              <!-- /meus pedidos esquerda --> 

              <!-- meus pedidos direita -->
              <div class="col-md-6">
                <label>Gerencie seus pedidos</label>
                <p><a href="">Últimos pedidos</a></p>
              </div>
              <!-- meus pedidos direta --> 

            </div>
            <!-- fim row -->

          </div>
          <!-- fim conteudo-meus-pedidos -->


          <!-- inicio conteudo-meus-dados -->
          <div class="conteudo-meus-dados">

            <div class="page-header">
              <h2>Meus Dados</h2>
            </div>

            <div class="row">
              <!-- meus dados esquerda -->
              <div class="col-md-6">
                <a href="" class="btn btn-primary">Meus Dados</a>
              </div>
              <!-- /meus dados esquerda --> 

              <!-- meus dados direita -->
              <div class="col-md-6">
                <label>Atualizar e-mail e senha</label>
                <p><a href="">Atualizar e-mail</a></p>
                <p><a href="">Alterar senha</a></p>
              </div>
              <!-- meus dados direta --> 

            </div>
            <!-- fim conteudo-meus-dados -->



          </div>
          <!-- fim conteudo-meus-anuncios -->

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

</body>
</html>