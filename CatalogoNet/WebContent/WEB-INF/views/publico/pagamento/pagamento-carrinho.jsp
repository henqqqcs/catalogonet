<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="description" content="Aqui na página Minha Conta, você cria e gerencia anúncios, contrata planos, altera dados cadastrais">
<meta name="keywords" content="criar anuncios, gerenciar, alterar dados">
<title>Minha Conta - CatálogoNet | Guia Comercial Online do Distrito Federal</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />
</head>

<body>

	<!-- Topo da pagina -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_checkout.jsp" />

 
  <!-- container -->
  <div class="container">

    <!-- row -->
    <div class="row">

      <div class="col-md-1"></div>

      <!-- col-md-8 -->
      <div class="col-md-10">

        <!-- content-wrapper -->
        <div class="panel panel-default"> 

          <!-- pagamento-container -->
          <div class="pagamento-container"> 


          <h3> <span class="glyphicon glyphicon-shopping-cart"></span> Carrinho</h3>
          <hr>

          <!-- carrinho-tabela -->
          
            <table class="table table-striped">
              <tr>
                <th>Produto escolhido</th>
                <th>Período</th>
                <th>Valor Total</th>
              </tr>
              <tr>
                <tr>
                  <td>${produto.nome}</td>
                  <td>${produto.duracaoMeses} meses</td>
                  <td>R$ <fmt:formatNumber type="currency" value="${produto.valor}"/></td>
                </tr>
              </tbody>
            </table>
   
          <!-- /carrinho-tabela --> 

          <!-- pagamento-botoes -->
          <div class="pagamento-carrinho-botoes"> 
            <a class="btn btn-link pull-left" href="#"><span class="glyphicon glyphicon-chevron-left"></span> Voltar </a>
            
            <c:url var="action"  value="/pagamento/carrinho-handle" />
            <a href="${action}" class="btn btn-default pull-right">Continuar <span class="glyphicon glyphicon-play"></span></a> 
            <!-- /pagament-botoes --> 
          </div>

          <!-- pagamento-carringo-safe -->
          <div class="pagamento-ambiente-seguro clear">
            <span class="glyphicon glyphicon-lock"></span>
            <span>Ambiente Seguro</span>
          </div>
          <!-- /pagamento-carrinho-safe --> 

            </div>
            <!-- /pagamento-container --> 

        </div>
        <!-- /content-wrapper --> 

      </div>
      <!-- fim col-md-8 -->

      <div class="col-md-1"></div>


    </div>
    <!-- fim row -->


  </div>
  <!-- fim container -->

	<c:import url="/WEB-INF/views/template/publico/rodape_checkout.jsp" />
</body>
</html>