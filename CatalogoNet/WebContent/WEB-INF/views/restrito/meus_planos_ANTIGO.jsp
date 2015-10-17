<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  <div class="row">
    <div class="col-md-3">
    
	   	<!-- menu-esquerda -->
		<c:import url="/WEB-INF/views/template/restrito/menu-esquerda.jsp" />
		<!-- /menu-esquerda -->
      
    </div>
    
    <!-- conteudo -->
    <div class="col-md-9"> 
      
      <!--Breadcrumb -->
      <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Meus Planos</li>
      </ol>
      <!-- /breadcrumb --> 
      
      <!-- meus-planos -->
      <div class="meus-planos"> 
        <!-- page header -->
        <div class="page-header">
          <h1>Meus Planos <small>Planos contratados</small></h1>
        </div>
        <!-- /page-header --> 
        
        <c:if test="${empty listaPlanos}">
        <!-- erro -->
        <div class="alert alert-danger" role="alert">
          <p><strong class="textoMeioMedio">Você não ainda não contratou nenhum plano!</strong></p>
          <p>Caso você já tenha feito o pedido e o pagamento do plano, assim que nós confirmarmos o pagamento, ele estará disponível para criação do anúncio.</p>
          <p><span class="textoMeioMedio">Ainda não contratou um plano?</span><br/>
            <a class="btn btn-success" href="<c:url value='/areaDaEmpresa/contratarPlano' />">Contratar Plano</a></p>
        </div>
        <!-- /erro --> 
        </c:if>
        
        <c:if test="${not empty listaPlanos}">
        <!-- tabela planos -->
        <table class="table table-hover">
          <thead>
            <tr>
              <th>Plano Contratado</th>
              <th>N° do pedido</th>
              <th>Status</th>
              <th>Data de Ínicio</th>
              <th>Data de Finalização</th>
              <th>Aplicado ao Anúncio</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach items="${listaPlanos}" var="plano">
            <tr>
              <td>${plano.produto.nome}</td>
              <td>??</td>
              <td>
              
              <c:if test="${plano.ativo}">
              <strong>Ativado <span class="glyphicon glyphicon-ok" style="color:#00CC00"></span></strong>
              </c:if>
              <c:if test="${!plano.ativo}">
              <strong>Desativado <span class="glyphicon glyphicon-remove" style="color:#FF0000"></span></strong>
              </c:if>
              
              </td>
              <td>
             	<c:choose>
             		<c:when test="${not empty plano.dataInicio}">
             			<fmt:parseDate value="${plano.dataInicio}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
		             	<fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
             		</c:when>
             		<c:otherwise>Nunca foi ativado</c:otherwise>
             	</c:choose>
              <td>
	              <c:choose>
             		<c:when test="${not empty plano.dataFinalizacao}">
             			<fmt:parseDate value="${plano.dataFinalizacao}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
		             	<fmt:formatDate value="${parsedDateFinal}" pattern="dd/MM/yyyy" />
             		</c:when>
             		<c:otherwise>N/A</c:otherwise>
             	</c:choose>
              <td>
              	<c:if test="${plano.anuncio != null}">
              		<a href="<c:url value="/areaDaEmpresa/home"/>">${plano.anuncio.titulo}</a>
              	</c:if>
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
        <!-- /tabela plano --> 
        </c:if>
        
      </div>
      <!-- /meus-planos --> 
     
      
    </div>
    <!-- /conteudo --> 
    
  </div>
  <!-- /row --> 
  
</div>
<!-- /container -->

	<!-- Rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape.jsp" />

</body>
</html>