<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
  <title>Identificação - CatálogoNet | Guia Comercial Online do Distrito Federal</title>
  <meta name="description" content="XXXXXXXX DESCRIPTION XXXXXXXX">
  <meta name="keywords" content="YYYYYYY KEYWORDS YYYYYYYYYY">
  
<!-- dependencias -->
<c:import url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />
  
  <script type="text/javascript" src="<c:url value="/resources/todos/js/bootstrap-modal.min.js" />"></script>
<%--   <script type="text/javascript" src="<c:url value="/resources/todos/js/bootstrapValidator.min.js" />"></script> --%>
  <script type="text/javascript" src="<c:url value="/resources/todos/js/jquery.mask.min.js" />"></script>
</head>
<body>


	<!-- Cabeçalho Checkout -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_checkout.jsp" />

<!-- container -->
<div class="container">

  <!-- row -->
  <div class="row login-register-row">
  
       	<!-- progress bar -->
        <div class="progress-tracker">
          <div class="text-center hidden-sm hidden-xs">
            <ol class="progtrckr" data-progtrckr-steps="5">
              <li class="progtrckr-done">Carrinho</li><!--
              --><li class="progtrckr-todo">Identificação</li><!--
              --><li class="progtrckr-todo">Pagamento</li><!--
              --><li class="progtrckr-todo">Finalização</li>
            </ol>
          </div>
        </div>
        <br/>
        <!-- /progress bar --> 
        
        <!-- login register form -->
		<c:import url="/WEB-INF/views/template/publico/login/login-register.jsp" />

  </div>
  <!-- fim row -->

</div>
<!-- fim container -->

	<!-- modal -->
	<c:import url="/WEB-INF/views/template/publico/login/modal.jsp" />

	<!-- rodape -->
	<c:import url="/WEB-INF/views/template/publico/rodape_checkout.jsp" />

</body>
</html>