<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- dependencias -->
<c:import url="/WEB-INF/views/template/publico/arquivos-css-js-publico.jsp" />

</head>
<body>

	<!-- Cabeçalho Checkout -->
	<c:import url="/WEB-INF/views/template/publico/cabecalho_checkout.jsp" />

	<!-- container -->
	<div class="container">

		<!-- row -->
		<div class="row login-register-row">

			<!-- login-register-form -->
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