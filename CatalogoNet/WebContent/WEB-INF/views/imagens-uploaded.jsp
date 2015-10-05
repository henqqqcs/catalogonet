<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

<link rel="shortcut icon"
	href="<c:url value="/resources/imgs/favicon.gif" />" type="image/ico" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/restrito/css/catalogonet-bootstrap.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/restrito/css/catalogonet-bootstrap-style.css" />">


<script type="text/javascript"
	src='<c:url value="/resources/todos/js/jquery-1.11.3.min.js" />'></script>
<script type="text/javascript"
	src='<c:url value="/resources/todos/js/bootstrap.min.js" />'></script>

<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/todos/js/fileupload/css/fileinput.min.css" />' />

<script type="text/javascript"
	src='<c:url value="/resources/todos/js/fileupload/js/fileinput.js" />'></script>

<script type="text/javascript"
	src='<c:url value="/resources/todos/js/fileupload/js/fileinput_locale_pt-BR.js" />'></script>


</head>
<body>




	<!-- container -->
	<div class="container">

		<c:forEach var="imagem" items="${listaImagens}">
		<img src="${imagem.imagem}.jpg" alt="${imagem.fileName}" class="img-thumbnail">
		<img src="${imagem.thumbnail}.jpg" alt="${imagem.fileName}" class="img-thumbnail">
		</c:forEach>

	</div>


</body>
</html>