<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

      <div class="col-md-8">

        <!-- pagamento-pagamento -->
        <div class="pagamento-pagamento">

          <div class="panel panel-default">
            <div class="panel-heading">
              <span class="carrinho-item">Anuncio - Guia Comercial - Plano Profissional / Anual</span>
              <span class="carrinho-valor-total">TOTAL: R$ 399,90</span>
            </div>
            <div class="panel-body">
              
              <h3> <span class="glyphicon glyphicon-credit-card"></span> Pagamento</h3>
              <hr>

              <label>Informaçãoes do cliente</label>
              <p>
                ${usuario.nome}<br>
                ${usuario.cpf}<br>
                ${usuario.telefone1}<br>
                ${usuario.email}<br>
              </p>

              <h4>Formas de pagamento</h4>
              <hr>

              <!-- form-pagamento-metodo -->
              <div class="form-pagamento-metodo">
                
                <!-- form -->
                <c:url var="action"  value="/pagamento/confirmar-pedido-handle" />
			  	<form:form method="post" action="${action}">

                <ul class="list-group">
                  <li onclick="changeBorder(this)" id="pagamento-list-active" class="list-group-item">
                     <input type="radio" name="metodoPagamento" id="pagseguro" value="pagseguro" checked>
                     <c:url var="pagseguro" value="/resources/publico/imagens/pagseguro.png" /> 
                      <label for="pagseguro"><img src="${pagseguro}"> </label>
                  </li>
                  <li onclick="changeBorder(this)" class="list-group-item">
                     	<c:url var="paypal" value="/resources/publico/imagens/paypal.png" /> 
                      <input type="radio" name="metodoPagamento" id="paypal" value="paypal">
                      <label for="paypal"><img src="${paypal}"></label>
                  </li>
                </ul>
                                    


                    <div class="form-pagamento-botao">
                      <button id="pagamento-botao-pagar" class="btn btn-primary btn-lg"type="submit">Pagar <span class="glyphicon glyphicon-play"></span></button>
                      <p>(Você será redirecionado para<br/> a página de pagamento)</p>
                    </div>
                </form:form>
                <!-- fim form -->
              </div>
              <!-- form-pagamento-metodo -->


            </div>

        <!-- pagamento-carringo-safe -->
        <div class="pagamento-ambiente-seguro clear">
          <span class="glyphicon glyphicon-lock"></span>
          <span>Ambiente Seguro</span>
        </div>
        <!-- /pagamento-carrinho-safe --> 

          </div>
          <!-- fim panel -->

        </div>
        <!-- pagamento-pagamento -->


      </div>

      <div class="col-md-4">
        <div class="pagamento-resumo well">
          <div class="pagamento-resumo-tittle">Resumo do pedido</div>
          <ul class="list-group">
            <li class="list-group-item">
              Anúncio - Guia Comercial - Plano Profissional
            </li>
            <li class="list-group-item">
              <span class="pull-left">Período: </span> <span class="pull-right">Anual</span>
              <div class="clearfix"></div>
            </li>
            <li class="list-group-item">
              <span class="pull-left">Valor em 12x: </span> <span class="pull-right">R$ 8,50</span>
              <div class="clearfix"></div>
            </li>
            <li class="list-group-item">
              <span class="pull-left">Valor: </span> <span class="pull-right">R$ 149,90</span>
              <div class="clearfix"></div>
            </li>
<!--             <li class="list-group-item">
              <span class="pull-left">Cupom:</span> <span class="pull-right"><input class="form-control"/></span>
              <div class="clear-both"></div>
            </li> -->
          </ul>

        </div>
      </div>


    </div>
    <!-- fim row -->


  </div>
  <!-- fim container -->


<script type="text/javascript">
  function changeBorder(teste) {
    $('#pagamento-list-active').removeAttr('id');
    teste.setAttribute("id", "pagamento-list-active");

    inputRadio = teste.firstElementChild;
    inputRadio.checked = true; 
  }
</script>

		<c:import url="/WEB-INF/views/template/publico/rodape_checkout.jsp" />
</body>
</html>